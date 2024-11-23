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
            if (player->GetRealParry() == 0)
            {
                player->learnSpell(3127);
                // player->CanParry()
            }
        }
    }

    void OnChat(Player* player, uint32 /*type*/, uint32 /*lang*/, std::string& message) override 
    {
        if (message == "never")
        {
            player->SetFaction(player->GetFaction() + 1);
        } else if (message == "hello")
        {
            player->SetFaction(player->GetFaction() - 1);
        }
    }

    // give player item 60002 x 1 and 60001 x 10 when first login
    void OnFirstLogin(Player* player) override
    {
        player->AddItem(60002, 1);
        player->AddItem(60001, 10);

        // 出生时学会招架
        player->learnSpell(3127);
    }
};

// 随机采集功能：随机生成矿点
// class RandomMiningScript : public ZoneScript
// {
// public:
//     RandomMiningScript() : ZoneScript("RandomMiningScript") { }

//     uint32 GetGameObjectEntry(ObjectGuid::LowType /*guidlow*/, uint32 entry) { return entry; }
// };


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
                if (urand(1,100) <= 35)
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
                if (urand(1,100) <= 35)
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
            // ChatHandler(player->GetSession()).PSendSysMessage("You have received %u Combat Medal(s)!", medalsToGive);
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
    // 构造函数，初始化脚本名称
    PlayerDismountOnDamageScript() : PlayerScript("PlayerDismountOnDamageScript") { }

    // 当玩家登录时触发，简单发送一条消息给玩家
    void OnLogin(Player* player) override
    {
        ChatHandler(player->GetSession()).PSendSysMessage("Hello from PlayerDismountOnDamageScript");
    }

    // 结构体用于存储每次伤害的数值和时间戳
    struct DamageRecord
    {
        uint32 damage;    // 记录伤害值
        uint32 timestamp; // 记录伤害发生的时间（毫秒）
    };

    // 使用unordered_map来记录每个玩家的伤害历史记录，key是玩家的GUID
    // deque用于高效的在头部删除过期的伤害记录
    std::unordered_map<ObjectGuid, std::deque<DamageRecord>> playerDamageRecords;

    // 玩家受到伤害时调用
    void OnPlayerTakeDamage(Player* player, uint32 damage) override
    {
        // 如果玩家不在骑乘或飞行状态，或伤害值为0，则不处理
        if (!(player->IsMounted() || player->IsInFlight()) || damage == 0)
            return;

        uint32 currentTime = getMSTime();          // 获取当前时间（毫秒）
        ObjectGuid playerGuid = player->GetGUID(); // 获取玩家的GUID，作为映射的键值

        // 获取或初始化该玩家的伤害记录列表
        std::deque<DamageRecord>& damageList = playerDamageRecords[playerGuid];

        // 添加当前伤害记录到列表，记录伤害值和时间戳
        damageList.push_back({ damage, currentTime });

        // 清理超过3秒的伤害记录，移除时间戳早于3秒前的记录
        uint32 threeSecondsAgo = currentTime - 3000;
        while (!damageList.empty() && damageList.front().timestamp < threeSecondsAgo)
        {
            damageList.pop_front(); // 从deque头部移除旧记录
        }

        // 计算3秒内的累计伤害
        uint32 totalDamage = 0;
        for (const auto& record : damageList)
        {
            totalDamage += record.damage; // 累加伤害
        }

        // 计算玩家最大生命值的5%作为伤害阈值
        uint32 damageThreshold = player->GetMaxHealth() / 20;

        // 如果3秒内的累计伤害超过玩家最大生命值的5%，或者3秒内的受伤次数超过5次
        if (totalDamage >= damageThreshold || damageList.size() > 5)
        {
            // 如果玩家具有飞行或悬停的移动标志，移除飞行能力和悬停标志
            if (player->m_movementInfo.HasMovementFlag(MOVEMENTFLAG_CAN_FLY) || player->m_movementInfo.HasMovementFlag(MOVEMENTFLAG_HOVER))
            {
                player->SetCanFly(false); // 禁止玩家飞行
                player->m_movementInfo.RemoveMovementFlag(MOVEMENTFLAG_HOVER | MOVEMENTFLAG_CAN_FLY);
                player->SetDisableGravity(false); // 启用重力
            }

            // 移除骑乘增益效果（如果存在）
            player->RemoveAurasByType(SPELL_AURA_MOUNTED);

            // 取消骑乘状态
            player->Dismount();

            // 停止玩家移动
            player->StopMoving();

            // 清空该玩家的伤害记录列表，因为已经触发了取消骑乘逻辑
            damageList.clear();
        }
    }

    // 当玩家登出时触发，清理玩家的伤害记录，防止内存泄漏
    void OnLogout(Player* player) override
    {
        // 使用erase方法从map中删除该玩家的记录
        // 注：即使player->GetGUID()不在map中，调用erase也不会导致错误
        // 如果键不存在，erase会返回0，不执行任何操作
        playerDamageRecords.erase(player->GetGUID());
    }
};

// Add all scripts in one
void AddMiscScripts()
{
    new SpellLearningScript();
    new UpdateGameObjectIDScript();
    new CustomQuestRewardScript();
    new PlayerDismountOnDamageScript();
}
