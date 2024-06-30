/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license: https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3
 */

#include "ScriptMgr.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "Config.h"
#include "Chat.h"
#include "Log.h"
#include <vector>
#include <random>
#include <iostream>
#include <numeric>  // 对于 std::accumulate
// #include "csv.h"

enum MyPlayerAcoreString
{
    HELLO_WORLD = 35410
};

struct HerblismObject {
    int id;
    std::string chineseName;
    std::string englishName;
    int skill;
};

// 学习技能需要额外消耗
class SpellLearningScript : public PlayerScript
{
public:
    SpellLearningScript() : PlayerScript("SpellLearningScript") { }

    void OnLogin(Player* player) override
    {
        if (sConfigMgr->GetOption<bool>("MyModule.Enable", false))
        {
            ChatHandler(player->GetSession()).PSendSysMessage("Hello from module SpellLearningScript");
        }
    }


    // give player item 60002 x 1 and 60001 x 10 when first login
    void OnFirstLogin(Player* player) override
    {
        player->AddItem(60002, 1);
        player->AddItem(60001, 10);
    }
};

// 随机采集功能：随机生成矿点
// class RandomMiningScript : public ZoneScript
// {
// public:
//     RandomMiningScript() : ZoneScript("RandomMiningScript") { }

//     uint32 GetGameObjectEntry(ObjectGuid::LowType /*guidlow*/, uint32 entry) { return entry; }
// };

// 记录GameObjectUpdate的信息
class GameObjectUpdateScript : public GameObjectScript
{
public:
    GameObjectUpdateScript() : GameObjectScript("GameObjectUpdateScript") { }

    void OnGameObjectDestroyed(GameObject* go, Player* player) {
        LOG_ERROR("GameObjectUpdateScript", "A");
        if (player)
            ChatHandler(player->GetSession()).PSendSysMessage("GameObject destroyed: %s", go->GetName().c_str());
    }

    void OnGameObjectDamaged(GameObject* go, Player* player) {
        LOG_ERROR("GameObjectUpdateScript", "B");
        if (player)
            ChatHandler(player->GetSession()).PSendSysMessage("GameObject damaged: %s", go->GetName().c_str());
    }

    void OnGameObjectLootStateChanged(GameObject* go, uint32 state, Unit* unit) {
        LOG_ERROR("GameObjectUpdateScript", "C");
        if (Player* player = unit->ToPlayer())
            ChatHandler(player->GetSession()).PSendSysMessage("GameObject loot state changed: %s", go->GetName().c_str());
    }

    void OnGameObjectStateChanged(GameObject* go, uint32 state) {
        LOG_ERROR("GameObjectUpdateScript", "D");
        BroadcastToPlayers(go, "GameObject state changed: %s", go->GetName().c_str());
    }

    void OnGameObjectUpdate(GameObject* go, uint32 diff) {
        LOG_ERROR("GameObjectUpdateScript", "E");
        BroadcastToPlayers(go, "GameObject updated: %s", go->GetName().c_str());
    }

    void OnGameObjectAddWorld(GameObject* go) {
        LOG_ERROR("GameObjectUpdateScript", "F");
        BroadcastToPlayers(go, "GameObject added to world: %s", go->GetName().c_str());
    }

    void OnGameObjectRemoveWorld(GameObject* go) {
        LOG_ERROR("GameObjectUpdateScript", "G");
        BroadcastToPlayers(go, "GameObject removed from world: %s", go->GetName().c_str());
    }

private:
    void BroadcastToPlayers(GameObject* go, const char* format, ...) {
        va_list args;
        va_start(args, format);

        // 遍历当前地图上的所有玩家并发送消息
        Map::PlayerList const& players = go->GetMap()->GetPlayers();
        for (auto const& playerPair : players) {
            if (Player* player = playerPair.GetSource()) {
                va_list argsCopy;
                va_copy(argsCopy, args);
                ChatHandler(player->GetSession()).PSendSysMessage(format, argsCopy);
                va_end(argsCopy);
            }
        }

        va_end(args);
    }
};

class UpdateGameObjectIDScript : public DatabaseScript
{
public:
    UpdateGameObjectIDScript() : DatabaseScript("UpdateGameObjectIDScript") { }

    // 初始化 vein_pools
    std::vector<uint32_t> vein_pools = {324, 1731, 1732, 1733, 1734, 1735, 2040, 2047, 2054, 2055,
                                         3763, 3764, 19903, 73939, 73940, 73941, 103711, 103713, 105569, 
                                         123309, 123310, 123848, 150079, 150080, 150081, 150082, 165658, 175404, 
                                         176643, 176645, 177388, 180215, 181108, 181109, 181248, 181249, 181555, 
                                         181556, 181557, 181569, 181570, 185557, 185877, 189978, 189979, 189980, 
                                         189981, 191133, 195036};

    std::vector<uint32_t> herb_pools = {1618, 3724, 181166, 1617, 3725, 1619, 3726, 1620, 3727, 1621, 3729, 2045, 1622,
                                        3730, 1623, 1628, 1624, 2041, 2042, 2046, 2043, 2044, 2866, 142140, 180165, 142141, 
                                        176642, 142142, 176636, 180164, 142143, 183046, 142144, 142145, 176637, 176583, 
                                        176638, 180167, 176584, 176639, 180168, 176586, 176640, 180166, 176587, 176641, 
                                        176588, 190174, 176589, 181270, 183044, 181271, 183045, 181277, 181275, 183043, 
                                        181276, 181278, 189973, 185881, 181279, 191303, 181280, 181281, 190169, 190170, 
                                        190173, 191019, 190175, 190171, 190172, 190176};

    std::vector<int> weights;
    std::minstd_rand gen = std::minstd_rand(std::random_device{}());
    std::discrete_distribution<> distrib;

    bool IsMineralVein(uint32 id)
    {
        return std::find(vein_pools.begin(), vein_pools.end(), id) != vein_pools.end();
    }

    bool IsHerbLism(uint32 id)
    {
        return std::find(herb_pools.begin(), herb_pools.end(), id) != herb_pools.end();
    }

    void CalculateWeights(const std::vector<uint32_t>& pools)
    {
        weights.clear();
        for (uint32 id : pools)
        {
            auto result = WorldDatabase.Query(
                "SELECT g.name, l.Item, i.ItemLevel, i.Quality FROM gameobject_template g "
                "LEFT JOIN gameobject_loot_template l ON g.Data1 = l.Entry AND l.Chance = 100 "
                "LEFT JOIN item_template i ON l.Item = i.entry WHERE g.entry = {}", id);

            if (!result)
            {
                weights.push_back(0);
                continue;
            }

            std::string objName = (*result)[0].Get<std::string>();
            int itemEntry = (*result)[1].Get<int>();
            int level = (*result)[2].Get<int>();
            int rarity = (*result)[3].Get<int>();

            if (itemEntry == 0 || level == 0 || rarity == 0)
            {
                weights.push_back(0);
                continue;
            }

            int weight = std::max(1, 10 - rarity - level / 10);
            weights.push_back(weight);

            LOG_DEBUG("entities.unit.rsai", "GameObject ID: {}, Name: {}, Item ID: {}, Item Name: {}, Item Level: {}, Item Rarity: {}, Weight: {}", id, objName, itemEntry, sObjectMgr->GetItemTemplate(itemEntry)->Name1, level, rarity, weight);
        }

        distrib = std::discrete_distribution<>(weights.begin(), weights.end());
    }

    void OnAfterDatabaseLoadGameObjectDatas(GameObjectDataContainer* gameObjectDataStore) override
    {
        LOG_DEBUG("entities.unit.rsai", "OnAfterDatabaseLoadGameObjectDatas calling ...");

        // 处理矿脉
        CalculateWeights(vein_pools);

        for (auto& [guidlow, gameObjectData] : *gameObjectDataStore)
        {
            if (IsMineralVein(gameObjectData.id))
            {
                gameObjectData.id = vein_pools[distrib(gen)];
                // LOG_DEBUG("entities.unit.rsai", "Updated MineralVein id for guid {} to {} '{}'", guidlow, gameObjectData.id, sObjectMgr->GetGameObjectTemplate(gameObjectData.id)->name);
            }
        }

        // 处理草药
        CalculateWeights(herb_pools);

        for (auto& [guidlow, gameObjectData] : *gameObjectDataStore)
        {
            if (IsHerbLism(gameObjectData.id))
            {
                gameObjectData.id = herb_pools[distrib(gen)];
                // LOG_DEBUG("entities.unit.rsai", "Updated HerbLism id for guid {} to {} '{}'", guidlow, gameObjectData.id, sObjectMgr->GetGameObjectTemplate(gameObjectData.id)->name);
            }
        }
    }
};



// player在完成任务时，根据任务难度获取一定数量的Combat Medal（entry=60001）
class CustomQuestRewardScript : public PlayerScript
{
public:
    CustomQuestRewardScript() : PlayerScript("CustomQuestRewardScript") { }

    // 设定不同难度任务对应的勋章数量
    uint32 easyQuestMedals = 2;
    uint32 mediumQuestMedals = 3;
    uint32 hardQuestMedals = 5;


    // 奖励物品稀有程度的权重映射
    std::map<uint8, int> qualityWeights = {
        {ITEM_QUALITY_NORMAL, 1},
        {ITEM_QUALITY_UNCOMMON, 1},
        {ITEM_QUALITY_RARE, 2},
        {ITEM_QUALITY_EPIC, 3},
        {ITEM_QUALITY_LEGENDARY, 4}
    };

    void OnPlayerCompleteQuest(Player* player, Quest const* quest) override
    {
        ChatHandler(player->GetSession()).PSendSysMessage("OnPlayerCompleteQuest Hello from CustomQuestRewardScript!");
        // 根据任务ID或者其他条件来判断任务难度
        uint32 questId = quest->GetQuestId();

        int difficultyLevel = CalculateQuestDifficultyLevel(quest);

        // 根据难度级别设置奖励数量
        uint32 medalsToGive = difficultyLevel;

        if (medalsToGive > 0)
        {
            // 发放勋章给玩家
            player->AddItem(60001, medalsToGive);
            ChatHandler(player->GetSession()).PSendSysMessage("You have received %u Combat Medal(s)!", medalsToGive);
        }
    }

private:
    int CalculateQuestDifficultyLevel(const Quest* quest)
    {
        int difficultyLevel = 1;

        // 检查是否是系列任务的最后一个任务
        if (quest->GetNextQuestInChain() == 0) // 没有后续任务
        {
            difficultyLevel += 1;
        }

        // 检查是否是副本关联任务
        if (quest->GetType() >= QUEST_TYPE_ELITE)
        {
            difficultyLevel += 1;
        }

        // 检查是否是组队或团队任务
        if (quest->GetSuggestedPlayers() > 1)
        {
            difficultyLevel += 1;
        }


        uint32 maxQuality = 0;
        // 检查任务奖励物品的稀有程度
        auto calculateItemDifficulty = [&](uint32 itemId) {
            if (itemId != 0)
            {
                const ItemTemplate* itemTemplate = sObjectMgr->GetItemTemplate(itemId);
                if (itemTemplate)
                {
                    maxQuality = std::max(maxQuality, itemTemplate->Quality);
                }
            }
        };

        for (int i = 0; i < QUEST_REWARDS_COUNT; ++i)
        {
            calculateItemDifficulty(quest->RewardItemId[i]);
        }

        // 检查可选奖励物品的稀有程度
        for (int i = 0; i < QUEST_REWARD_CHOICES_COUNT; ++i)
        {
            calculateItemDifficulty(quest->RewardChoiceItemId[i]);
        }

        difficultyLevel += qualityWeights[maxQuality];

        return difficultyLevel;
    }

};


// 新功能：当玩家收到伤害时，如果在骑行或者飞行状态，则推出该状态
class PlayerDismountOnDamageScript : public PlayerScript
{
public:
    PlayerDismountOnDamageScript() : PlayerScript("PlayerDismountOnDamageScript") { }

    void OnLogin(Player* player) override
    {
        ChatHandler(player->GetSession()).PSendSysMessage("Hello from PlayerDismountOnDamageScript");
    }

    void OnPlayerTakeDamage(Player* player, uint32 damage) override
    {
        if (player->IsMounted() || player->IsInFlight())
        {
            // 确保玩家的移动状态正确更新
            player->SetCanFly(false);
            player->m_movementInfo.RemoveMovementFlag(MOVEMENTFLAG_HOVER | MOVEMENTFLAG_CAN_FLY);
            player->SetDisableGravity(false);
            
            // 移除与骑乘相关的增益效果
            player->RemoveAurasByType(SPELL_AURA_MOUNTED);
            
            // 取消骑乘
            player->Dismount();
            
            // 停止玩家移动
            player->StopMoving();
        }
    }
};




// Add all scripts in one
void AddMiscScripts()
{
    new SpellLearningScript();
    // new GameObjectUpdateScript();
    new UpdateGameObjectIDScript();
    new CustomQuestRewardScript();
    new PlayerDismountOnDamageScript();
}
