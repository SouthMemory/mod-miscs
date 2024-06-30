SET @ENTRY:=60001;
DELETE FROM `item_template` WHERE `entry`=@ENTRY;
DELETE FROM `item_template_locale` WHERE `ID`=@ENTRY AND `locale`='zhCN';

INSERT INTO `item_template` (`entry`, `class`, `subclass`, `SoundOverrideSubclass`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `StatsCount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`, `ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`, `ArmorDamageModifier`, `duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `flagsCustom`, `VerifiedBuild`) VALUES (@ENTRY, 10, 0, -1, 'Medal of Contribution', 45453, 4, 2048, 0, 1, 0, 0, 0, 262143, 32767, 80, 10, 0, 0, 0, 0, 0, 0, 0, 0, 2147483647, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 'A prestigious medal awarded for exemplary service. Required for learning spells and other advancements.', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 12340);
INSERT INTO `item_template_locale` (`ID`, `locale`, `Name`, `Description`, `VerifiedBuild`) VALUES (@ENTRY, 'zhCN', '贡献奖章', '因卓越服务而授予的奖章，可用于学习法术和其他进阶用途。', 15050);


-- add this line to item.dbc
-- 60001	10	0	-1	-1	45453	0	0

-- add item.dbc to patch-z.mpq
SET @ENTRY:=60002;
SET @page_text_id:=6001;
DELETE FROM `item_template` WHERE `entry`=@ENTRY;
INSERT INTO `item_template` (`entry`, `class`, `subclass`, `SoundOverrideSubclass`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `StatsCount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`, `ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`, `ArmorDamageModifier`, `duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `flagsCustom`, `VerifiedBuild`) VALUES (@ENTRY, 15, 0, -1, 'The Game Feature Exploration Manual', 67003, 4, 0, 0, 1, 3900, 975, 0, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, "a compilation of the latest introductions to our game's features", @page_text_id, 0, 1, 0, 0, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 11159);
DELETE FROM `item_template_locale` WHERE `ID`=@ENTRY AND `locale`='zhCN';
INSERT INTO `item_template_locale` (`ID`, `locale`, `Name`, `Description`, `VerifiedBuild`) VALUES (@ENTRY, 'zhCN', '游戏特色探索手册', '这是我们游戏特色的最新介绍', 11159);

SET @page_text_id:=6001;
-- Page 0
-- 删除现有的记录
DELETE FROM `page_text` WHERE `ID`=@page_text_id;
DELETE FROM `page_text_locale` WHERE `ID`=@page_text_id AND `locale`='zhCN';

-- 插入文本内容
-- Preface (English)
INSERT INTO `page_text` (`ID`, `Text`, `NextPageID`, `VerifiedBuild`) VALUES (@page_text_id, "The Game Feature Exploration Manual$B$BWelcome to the wondrous and magical realm of our virtual world, where we continuously delve into innovation and exploration to enrich the player experience. `The Game Feature Exploration Manual` is a compilation of the latest introductions to our game's features, showcasing not only our passion for the game world and attention to detail but also our deep understanding of player experience.$B$BFrom the intricate design of the Flight Stamina System to the ingenious fusion of Equipment Upgrade and Fusion Systems, and the precise adjustment of Monster Strength, each new feature represents an expansion of the depth and breadth of our game. We hope these new mechanics will ignite players' desire for exploration, challenge their combat skills, and provide ample room for growth and advancement.$B$BWithin the pages of this book, you will gain a comprehensive understanding of the design philosophy, operation, and impact of each new system on various aspects of the game. We believe these features will breathe new life into the game world, offering endless possibilities for players' adventures.$B$BLet our exploration begin here, and together, we soar to new heights.$B$B—— The Game Development Team", 0, 11723);

-- Introduction to the Flight Stamina System (Chinese)
INSERT INTO `page_text_locale` (`ID`, `locale`, `Text`, `VerifiedBuild`) VALUES (@page_text_id, 'zhCN', "游戏特色探索手册$B$B在这个充满魔法与冒险的虚拟世界中,我们不断地探索、创新,以期为玩家带来更丰富、更真实的游戏体验。《游戏特色探索手册》是一本汇集了我们最新游戏特色介绍的书籍,它不仅展示了我们对游戏世界的热爱和对细节的追求,也反映了我们对玩家体验的深刻期盼。$B$B从飞行气力系统的精心设计,到装备升级与熔铸的巧妙融合,再到怪物强度的精准调整,每一个新特性的引入都是我们对游戏深度和广度的拓展。我们希望通过这些新机制,激发玩家的探索欲望,挑战他们的战斗技巧,同时也提供给他们成长和进步的空间。$B$B在这本书中,你将深入了解每个新系统的设计理念、运作方式以及它们如何影响游戏的各个方面。我们相信,这些特色将为游戏世界带来新的活力,为玩家的冒险之旅增添无限可能。$B$B让我们的探索从这里开始,一起飞向新的天际。$B$B—— The Game Development Team", 11723);


-- Page 1
-- 增加ID
SET @page_text_id_parent = @page_text_id;
SET @page_text_id = @page_text_id + 1;
-- 赋值NextPageID
UPDATE `page_text` SET `NextPageID`=@page_text_id WHERE `ID`=@page_text_id_parent;
-- 删除现有的记录
DELETE FROM `page_text` WHERE `ID`=@page_text_id;
DELETE FROM `page_text_locale` WHERE `ID`=@page_text_id AND `locale`='zhCN';

-- 插入文本内容
-- Introduction to the Flight Stamina System (English)
-- Introduction to the Flight Stamina System (English)
INSERT INTO page_text (ID, Text, NextPageID, VerifiedBuild) VALUES (@page_text_id, "Mount System$B$B1. As a character flies, their stamina depletes based on several factors. The most critical of these is the distance from the ground.$B$BIn practice, the flight stamina system ensures that players must manage their flying carefully. Low altitudes require less stamina, encouraging tactical flying close to the terrain. Higher altitudes, while offering strategic advantages, will deplete stamina more quickly, pushing players to make calculated decisions.$B$B2. We have limited the speed of flying mounts to be the same as riding mounts, so you will no longer be able to move too quickly.$B$B3. Now, any damage taken will cancel your riding or flying state.$B$BThe primary purpose of these changes is to make flying an expensive action, thereby reducing its disruptive impact on PvP activities while enhancing the player's deep engagement with the game content.", 0, 11723);

-- Introduction to the Flight Stamina System (Chinese)
INSERT INTO `page_text_locale` (`ID`, `locale`, `Text`, `VerifiedBuild`) VALUES (@page_text_id, 'zhCN', "坐骑系统$B$B1.角色在飞行时,气力会根据多个因素逐渐消耗。其中最关键的因素就是与地面的距离。$B$B实际上,飞行气力系统确保玩家必须谨慎管理他们的飞行。低空飞行消耗较少的气力,鼓励玩家贴近地形进行战术飞行。而高空飞行则提供战略优势,但会更快地消耗气力,迫使玩家做出更为慎重的决策。$B$B2.我们将飞行坐骑的速度限制到和骑行坐骑一样,你将不再能够过于快速的移动了.$B$B3.现在当你受到任意伤害时,你都会取消骑行或者飞行状态.$B$B以上改动的初衷在于将飞行变为一项昂贵的行为,从而减轻其对PVP活动的破坏性影响,同时增强玩家对游戏内容的深度体验。", 11723);

-- Page 2
-- 增加ID
SET @page_text_id_parent = @page_text_id;
SET @page_text_id = @page_text_id + 1;
-- 赋值NextPageID
UPDATE `page_text` SET `NextPageID`=@page_text_id WHERE `ID`=@page_text_id_parent;
-- 删除现有的记录
DELETE FROM `page_text` WHERE `ID`=@page_text_id;
DELETE FROM `page_text_locale` WHERE `ID`=@page_text_id AND `locale`='zhCN';

-- Quest Medal Introduction (English)
INSERT INTO `page_text` (`ID`, `Text`, `NextPageID`, `VerifiedBuild`) VALUES (@page_text_id, "Medal of Contribution$B$BThe Medal is a treasured token of valor, earned through remarkable feats of bravery. You can obtain this prestigious medal by taking on various challenges, such as slaying elite monsters, defeating awakeners, completing difficult quests, and achieving victories on the battlefield.$B$BThe more difficult or honorable the task, the greater the reward. This system ensures that your most daring and skilled actions are properly recognized. The Quest Medal is not just a symbol of honor; it is also a valuable asset that can be used in many situations.$B$BUse your Quest Medals to learn new skills, gain access to exclusive items, and unlock special content. Face the challenges, collect your Quest Medals, and become a legendary hero in Azeroth!", 0, 11723);

-- Quest Medal Introduction (Chinese)
INSERT INTO `page_text_locale` (`ID`, `locale`, `Text`, `VerifiedBuild`) VALUES (@page_text_id, 'zhCN', "贡献奖章$B$B贡献奖章是勇气的珍贵象征,你可以通过完成各种挑战来获得这枚尊贵的奖章,比如击杀精英怪物、击败觉醒者、完成艰难任务以及在战场上取得胜利。$B$B任务越艰巨或越荣誉,奖励就越丰厚。这个系统确保了你的英勇行为和高超技能能够得到应有的认可。任务奖章不仅是荣誉的象征,它在许多场景中也是一项宝贵的资产。$B$B使用你的任务奖章来学习新技能、获取独家物品和解锁特殊内容。面对挑战,收集你的任务奖章,成为艾泽拉斯的传奇英雄吧！", 11723);

-- Page 3
-- 增加ID
SET @page_text_id_parent = @page_text_id;
SET @page_text_id = @page_text_id + 1;
-- 赋值NextPageID
UPDATE `page_text` SET `NextPageID`=@page_text_id WHERE `ID`=@page_text_id_parent;
-- 删除现有的记录
DELETE FROM `page_text` WHERE `ID`=@page_text_id;
DELETE FROM `page_text_locale` WHERE `ID`=@page_text_id AND `locale`='zhCN';

-- Random Resource Respawn System (English)
INSERT INTO `page_text` (`ID`, `Text`, `NextPageID`, `VerifiedBuild`) VALUES (@page_text_id, "Random Resource Respawn System$B$BWe have implemented a random respawn system for mining nodes and herbs, which takes effect only upon server restart. This feature ensures that certain resources are no longer confined to specific maps.$B$BBy introducing random respawn points, we aim to create a more dynamic and unpredictable game environment. Players will need to explore different areas rather than repeatedly visiting known locations, thus adding an element of surprise and encouraging broader exploration of the game world.$B$BThis system also promotes a fairer distribution of resources, as it prevents any single player or group from monopolizing specific resource locations. Overall, the random resource respawn system enhances the gameplay experience by making resource gathering more exciting and equitable.", 0, 11723);

-- Random Resource Respawn System (Chinese)
INSERT INTO `page_text_locale` (`ID`, `locale`, `Text`, `VerifiedBuild`) VALUES (@page_text_id, 'zhCN', "资源随机刷新系统$B$B我们实现了矿点和草药随机刷新的功能,这种随机将在每一次服务器重启的时候生效。这样一来,某种资源不再只出现在特定的地图上。$B$B通过引入随机刷新点,我们旨在创造一个更加动态和不可预测的游戏环境。玩家需要探索不同的区域,而不是反复访问已知的位置,从而增加了游戏的惊喜元素,并鼓励更广泛地探索游戏世界。$B$B这个系统也促进了资源的公平分配,防止任何单个玩家或团队垄断特定的资源点。总体而言,资源随机刷新系统通过使资源收集变得更加刺激和公平,提升了游戏体验。", 11723);

-- Page 4
-- 增加ID
SET @page_text_id_parent = @page_text_id;
SET @page_text_id = @page_text_id + 1;
-- 赋值NextPageID
UPDATE `page_text` SET `NextPageID`=@page_text_id WHERE `ID`=@page_text_id_parent;
-- 删除现有的记录
DELETE FROM `page_text` WHERE `ID`=@page_text_id;
DELETE FROM `page_text_locale` WHERE `ID`=@page_text_id AND `locale`='zhCN';

-- Dynamic Creature Level Adjustment (English)
INSERT INTO `page_text` (`ID`, `Text`, `NextPageID`, `VerifiedBuild`) VALUES (@page_text_id, "Dynamic Creature Level Adjustment$B$BWe have implemented a dynamic level adjustment system for creatures. This system adjusts the level, health, damage, and drop quality of creatures to match the highest level of players within a certain vicinity.$B$BThis feature ensures that encounters remain challenging and engaging, regardless of the players' levels. By dynamically scaling the creatures' attributes, players will always find the gameplay stimulating and rewarding.$B$BAdditionally, this system prevents low-level areas from becoming deserted as players level up. It ensures that high-level players still find these regions attractive and worth exploring, keeping the entire game world lively and populated.$B$BWith this mechanism, high-level players will no longer be able to easily overpower creatures, thus preventing them from providing undue assistance to lower-level players. This maintains the challenge and balance of the game, ensuring that every player must engage with the content appropriate to their level.$B$BOverall, the dynamic creature level adjustment enhances the gameplay experience by providing a consistent and fair challenge for all players, while maintaining the integrity and excitement of each game region.", 0, 11723);

-- Dynamic Creature Level Adjustment (Chinese)
INSERT INTO `page_text_locale` (`ID`, `locale`, `Text`, `VerifiedBuild`) VALUES (@page_text_id, 'zhCN', "怪物动态等级调整$B$B我们实现了怪物的动态等级调整系统。该系统会根据附近一定范围内玩家的最高等级来调整怪物的等级、生命值、伤害以及掉落物品的等级。$B$B这一功能确保了无论玩家等级如何,遭遇战都保持具有挑战性和吸引力。通过动态调整怪物属性,我们尝试避免玩家等级升高以后低等级区域变得无人问津,确保高等级玩家依然会对这些区域感兴趣,从而保持整个游戏世界的活力和人气。$B$B同时,通过这一机制,高等级玩家将不再能轻易凌驾于野怪之上,他们将更难对低等级玩家提供不当的帮助。这样可以保持游戏的挑战性和平衡性,确保每个玩家都需要面对与自己等级相适应的内容。$B$B总体而言,怪物动态等级调整通过为所有玩家提供一致且公平的挑战,提升了整体游戏体验,同时维护了每个游戏区域的完整性和趣味性。", 11723);

-- Page 5
-- 增加ID
SET @page_text_id_parent = @page_text_id;
SET @page_text_id = @page_text_id + 1;
-- 赋值NextPageID
UPDATE `page_text` SET `NextPageID`=@page_text_id WHERE `ID`=@page_text_id_parent;
-- 删除现有的记录
DELETE FROM `page_text` WHERE `ID`=@page_text_id;
DELETE FROM `page_text_locale` WHERE `ID`=@page_text_id AND `locale`='zhCN';

-- Monster Awakening System (English)
INSERT INTO `page_text` (`ID`, `Text`, `NextPageID`, `VerifiedBuild`) VALUES (@page_text_id, "Monster Awakening System$B$BWe have introduced a Monster Awakening System, where creatures have a certain probability of being enhanced (awakened) when they spawn. Awakened monsters will possess skills and equipment, allowing them to fight much like players.$B$BThese awakened monsters are equipped with a variety of combat abilities and gear, making encounters with them significantly more challenging and engaging. They can use these skills and equipment effectively in battle, providing a richer and more dynamic combat experience.$B$BIn addition to their enhanced combat capabilities, awakened monsters will have more elaborate combat declarations and death remarks, adding depth and personality to your encounters. When defeated, these monsters may drop the equipment they were using, offering valuable rewards to those who can overcome them.$B$BThe Monster Awakening System adds an exciting layer of unpredictability and challenge to the game, ensuring that players remain on their toes and are rewarded for their skill and perseverance.", 0, 11723);

-- Monster Awakening System (Chinese)
INSERT INTO `page_text_locale` (`ID`, `locale`, `Text`, `VerifiedBuild`) VALUES (@page_text_id, 'zhCN', "怪物觉醒系统$B$B我们引入了怪物觉醒系统,怪物有一定概率觉醒(被强化）。觉醒后的怪物将配备各种战斗技能和装备,并能够在战斗中有效地使用这些技能和装备,提供更丰富和动态的战斗体验。$B$B除了增强的战斗能力外,觉醒的怪物还将有更丰富的战斗宣言和战斗遗言,让你能够更深入的理解他们的命运。击败这些怪物后,它们可能会掉落身上的装备,给那些能够战胜它们的玩家提供宝贵的奖励。$B$B怪物觉醒系统为游戏增加了一层令人兴奋的不可预测性和挑战性,确保玩家始终保持警觉,并因其技能和毅力而获得回报。", 11723);

-- Page 6
-- 增加ID
SET @page_text_id_parent = @page_text_id;
SET @page_text_id = @page_text_id + 1;
-- 赋值NextPageID
UPDATE `page_text` SET `NextPageID`=@page_text_id WHERE `ID`=@page_text_id_parent;
-- 删除现有的记录
DELETE FROM `page_text` WHERE `ID`=@page_text_id;
DELETE FROM `page_text_locale` WHERE `ID`=@page_text_id AND `locale`='zhCN';

-- Weapon Damage Calculation Adjustment (English)
INSERT INTO `page_text` (`ID`, `Text`, `NextPageID`, `VerifiedBuild`) VALUES (@page_text_id, "Weapon Damage Calculation Adjustment$B$BWe have adjusted the weapon damage calculation formula to revert it to its pre-level 60 state. This means that weapon attack speed will once again be used as a coefficient in the damage calculation, rather than a fixed value.$B$BBy incorporating weapon attack speed into the damage formula, we ensure that each weapon's unique characteristics are more impactful in combat. Faster weapons will deal less damage per hit but strike more frequently, while slower weapons will deliver more powerful blows less often.$B$BThis change brings back the strategic element of choosing weapons based on their speed and damage potential, allowing for more personalized and tactical combat styles.$B$BOverall, this adjustment aims to enhance the depth and authenticity of combat, providing a more engaging and nostalgic experience for all players.", 0, 11723);

-- Weapon Damage Calculation Adjustment (Chinese)
INSERT INTO `page_text_locale` (`ID`, `locale`, `Text`, `VerifiedBuild`) VALUES (@page_text_id, 'zhCN', "武器伤害计算调整$B$B我们调整了武器伤害计算公式,使其恢复到60级之前的状态。即使用武器攻速作为系数,而不是固定值。$B$B通过将武器攻速纳入伤害公式,我们确保每种武器的独特特性在战斗中更具影响力。速度更快的武器每次打击造成的伤害较少,但攻击频率更高；而速度较慢的武器则会造成更强大的打击,但攻击频率较低。$B$B这一改变带回了根据武器速度和伤害潜力选择武器的策略元素,使战斗风格更加个性化和战术化。$B$B总体而言,这一调整旨在增强战斗的深度和真实性,为所有玩家提供更具吸引力和怀旧感的体验。", 11723);

-- Page 7
-- 增加ID
SET @page_text_id_parent = @page_text_id;
SET @page_text_id = @page_text_id + 1;
-- 赋值NextPageID
UPDATE `page_text` SET `NextPageID`=@page_text_id WHERE `ID`=@page_text_id_parent;
-- 删除现有的记录
DELETE FROM `page_text` WHERE `ID`=@page_text_id;
DELETE FROM `page_text_locale` WHERE `ID`=@page_text_id AND `locale`='zhCN';

-- Equipment Upgrade System (English)
INSERT INTO `page_text` (`ID`, `Text`, `NextPageID`, `VerifiedBuild`) VALUES (@page_text_id, "Equipment Upgrade System$B$BWe have introduced an Equipment Upgrade System that allows lower-level gear to be progressively upgraded into higher-level gear.$B$BWith this system, players can invest time and resources into their favorite pieces of equipment, enhancing their attributes and capabilities over time. This ensures that even gear acquired early in your adventures can remain powerful as you progress.$B$BUpgrading equipment involves a series of enhancements that improve its stats, making it more effective in combat and better suited to higher-level challenges.$This system keeps lower-level areas, dungeons, and monsters appealing, preventing them from becoming obsolete. Players can revisit these areas to obtain and upgrade equipment, maintaining the vibrancy and engagement of the entire game world.$B$BOverall, the Equipment Upgrade System enriches the gameplay experience by offering meaningful ways to enhance and customize your gear, ensuring that every piece of equipment has the potential to grow with you on your journey.", 0, 11723);

-- Equipment Upgrade System (Chinese)
INSERT INTO `page_text_locale` (`ID`, `locale`, `Text`, `VerifiedBuild`) VALUES (@page_text_id, 'zhCN', "装备升级系统(In Progress)$B$B我们引入了装备升级系统,低等级的装备可以通过不断升级,成长为高等级的装备。$B$B通过这个系统,玩家可以投入时间和资源到自己喜欢的装备上,逐步增强其属性和能力。这确保了即使是冒险初期获得的装备,也能随着你的进步保持强大。$B$B升级装备涉及一系列的强化,提升其属性,使其在战斗中更具效力,更好地应对高等级的挑战。$B$B这个系统确保了低等级区域、副本和怪物对玩家依然具有吸引力,避免它们变得过时。玩家可以重新访问这些区域以获取和升级装备,保持整个游戏世界的活力和趣味性。$B$B总体而言,装备升级系统通过提供有意义的方式来增强和定制你的装备,丰富了游戏体验,确保每件装备都有潜力随着你的旅程一起成长。", 11723);

-- Page 8
-- 增加ID
SET @page_text_id_parent = @page_text_id;
SET @page_text_id = @page_text_id + 1;
-- 赋值NextPageID
UPDATE `page_text` SET `NextPageID`=@page_text_id WHERE `ID`=@page_text_id_parent;
-- 删除现有的记录
DELETE FROM `page_text` WHERE `ID`=@page_text_id;
DELETE FROM `page_text_locale` WHERE `ID`=@page_text_id AND `locale`='zhCN';

-- Equipment Fusion System (English)
INSERT INTO `page_text` (`ID`, `Text`, `NextPageID`, `VerifiedBuild`) VALUES (@page_text_id, "Equipment Fusion System$B$BWe have introduced an Equipment Fusion System that allows two pieces of the same type of equipment to be fused into one. The new equipment will inherit attributes from the original pieces in a random manner.$B$BFusion requires the appropriate professional skills. For example, a Weaponsmith with the Blacksmithing profession can fuse weapons, while a Jewelcrafter can fuse rings and necklaces.$B$BAdditionally, the fusion process consumes extra materials, making it a valuable and strategic choice for players looking to optimize their gear.$B$BThis system provides players with greater flexibility in customizing their equipment, enabling them to create powerful and unique items. It also adds a layer of depth to the game, as players must consider which items to fuse and how to best utilize their professional skills and resources.$B$BOverall, the Equipment Fusion System enriches the gameplay experience by offering innovative ways to enhance and personalize gear, ensuring that players can continually refine and improve their equipment.", 0, 11723);

-- Equipment Fusion System (Chinese)
INSERT INTO `page_text_locale` (`ID`, `locale`, `Text`, `VerifiedBuild`) VALUES (@page_text_id, 'zhCN', "装备熔铸系统$B$B我们引入了装备熔铸系统,两件同类型装备可以经过熔铸变为一件。新的装备将以随机方式继承原有装备的属性。$B$B熔铸需要有相应的专业技能支持。例如,拥有锻造专业的武器大师可以熔铸板甲和武器,珠宝大师可以熔铸戒指和项链,而附魔专业将可以让你重铸法杖和魔杖，等等。$B$B此外,熔铸过程需要消耗额外的材料,使其成为玩家优化装备的宝贵策略选择。$B$B这一系统为玩家提供了更大的灵活性来定制他们的装备,使他们能够创造出强大而独特的物品。它还增加了游戏的深度,因为玩家必须考虑哪些物品进行熔铸,以及如何最好地利用他们的专业技能和资源。$B$B总体而言,装备熔铸系统通过提供创新的方法来增强和个性化装备,丰富了游戏体验,确保玩家能够不断优化和提升他们的装备。", 11723);


-- Page 9
-- 增加ID
SET @page_text_id_parent = @page_text_id;
SET @page_text_id = @page_text_id + 1;
-- 赋值NextPageID
UPDATE `page_text` SET `NextPageID`=@page_text_id WHERE `ID`=@page_text_id_parent;
-- 删除现有的记录
DELETE FROM `page_text` WHERE `ID`=@page_text_id;
DELETE FROM `page_text_locale` WHERE `ID`=@page_text_id AND `locale`='zhCN';

-- Monster Strength Adjustment (English)
INSERT INTO `page_text` (`ID`, `Text`, `NextPageID`, `VerifiedBuild`) VALUES (@page_text_id, "Monster Strength Adjustment$B$BWe have adjusted the strength of monsters to align with the classic (level 60) version of the game. This includes restoring the original elite status, health, and damage of monsters.$B$BAdditionally, the health and damage of normal monsters have been increased to more closely match the combat capabilities of players of the same level, especially those monsters between level 61-80.$B$BThe purpose of these adjustments is to provide a more authentic and challenging experience reminiscent of the classic era. By enhancing the strength of monsters, players will find encounters more engaging and requiring greater strategy and skill.$B$BThis system aims to create a more balanced and immersive gameplay environment, where every encounter feels significant and rewarding. Whether you are facing an elite monster or a regular one, you will need to employ careful planning and tactics to emerge victorious.$B$BOverall, the Monster Strength Adjustment enriches the gameplay experience by bringing back the thrill and difficulty of classic battles, ensuring that players are consistently challenged and rewarded for their efforts.", 0, 11723);

-- Monster Strength Adjustment (Chinese)
INSERT INTO `page_text_locale` (`ID`, `locale`, `Text`, `VerifiedBuild`) VALUES (@page_text_id, 'zhCN', "怪物强度调整$B$B我们调整了怪物的强度,使其至少不低于经典旧世(60级)版本,包括恢复怪物的原始等级、精英状态、生命值和伤害。$B$B此外,普通怪物的生命值和伤害也得到了额外增强,特别是61-80级怪物将获得更接近于同等级玩家的战斗能力。$B$B这些调整的目的是提供一种更为真实和具有挑战性的经典游戏体验。通过增强怪物的强度,玩家将发现战斗更加引人入胜,并需要更多的策略和技巧。$B$B这一系统旨在创造一个更为平衡和沉浸的游戏环境,每一次遭遇都显得意义重大且富有回报。无论是面对精英怪物还是普通怪物,玩家都需要仔细的规划和战术才能取得胜利。$B$B总体而言,怪物强度调整通过恢复经典战斗的刺激和难度,丰富了游戏体验,确保玩家不断受到挑战并因其努力而获得奖励。", 11723);


-- Page Last
-- 增加ID
SET @page_text_id_parent = @page_text_id;
SET @page_text_id = @page_text_id + 1;
-- 赋值NextPageID
UPDATE `page_text` SET `NextPageID`=@page_text_id WHERE `ID`=@page_text_id_parent;
-- 删除现有的记录
DELETE FROM `page_text` WHERE `ID`=@page_text_id;
DELETE FROM `page_text_locale` WHERE `ID`=@page_text_id AND `locale`='zhCN';

-- Conclusion (English)
INSERT INTO `page_text` (`ID`, `Text`, `NextPageID`, `VerifiedBuild`) VALUES (@page_text_id, "Conclusion$B$BWe have initially implemented the ideas described earlier, and we believe these changes will make the game more exciting and the world more immersive. If it turns out that we are wrong, we will make corrections.$B$BLimited by our abilities and resources, some implementations are not 100% complete, and some may still be imperfect or unreasonable. However, in the spirit of 'done is better than perfect,' we have included these features in the game. We will gradually improve them in future updates.$B$BWe have many many more ideas, and we will gradually bring them to life.$B$BFinally, We hope you enjoy this world.$B$B—— The Game Development Team", 0, 11723);

-- Conclusion (Chinese)
INSERT INTO `page_text_locale` (`ID`, `locale`, `Text`, `VerifiedBuild`) VALUES (@page_text_id, 'zhCN', "结语$B$B我们初步实现了前面所描述的想法,并且我们相信这些改动将让游戏变得更加激动人心,让这个世界变得更加真实。如果事实证明我们错了,我们将进行改正。$B$B受能力和精力的限制,有些实现的完成度没有达到100%,有些实现仍然可能存在不完善或不合理的地方,但秉持着“完成比完美更好”的想法,我们将这些实现放入了游戏中。我们将在后续的工作中,逐步完善他们。$B$B另外,我们还有非常非常多的想法来不及去实现,我们将投入更多的时间,逐步使它们成为现实。$B$B最后,希望你能喜欢这个世界。$B$B—— The Game Development Team", 11723);




-- INSERT INTO `npcbots_acore_world`.`spell_dbc` (`ID`, `Category`, `DispelType`, `Mechanic`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `AttributesEx6`, `AttributesEx7`, `ShapeshiftMask`, `unk_320_2`, `ShapeshiftExclude`, `unk_320_3`, `Targets`, `TargetCreatureType`, `RequiresSpellFocus`, `FacingCasterFlags`, `CasterAuraState`, `TargetAuraState`, `ExcludeCasterAuraState`, `ExcludeTargetAuraState`, `CasterAuraSpell`, `TargetAuraSpell`, `ExcludeCasterAuraSpell`, `ExcludeTargetAuraSpell`, `CastingTimeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `ProcTypeMask`, `ProcChance`, `ProcCharges`, `MaxLevel`, `BaseLevel`, `SpellLevel`, `DurationIndex`, `PowerType`, `ManaCost`, `ManaCostPerLevel`, `ManaPerSecond`, `ManaPerSecondPerLevel`, `RangeIndex`, `Speed`, `ModalNextSpell`, `CumulativeAura`, `Totem_1`, `Totem_2`, `Reagent_1`, `Reagent_2`, `Reagent_3`, `Reagent_4`, `Reagent_5`, `Reagent_6`, `Reagent_7`, `Reagent_8`, `ReagentCount_1`, `ReagentCount_2`, `ReagentCount_3`, `ReagentCount_4`, `ReagentCount_5`, `ReagentCount_6`, `ReagentCount_7`, `ReagentCount_8`, `EquippedItemClass`, `EquippedItemSubclass`, `EquippedItemInvTypes`, `Effect_1`, `Effect_2`, `Effect_3`, `EffectDieSides_1`, `EffectDieSides_2`, `EffectDieSides_3`, `EffectRealPointsPerLevel_1`, `EffectRealPointsPerLevel_2`, `EffectRealPointsPerLevel_3`, `EffectBasePoints_1`, `EffectBasePoints_2`, `EffectBasePoints_3`, `EffectMechanic_1`, `EffectMechanic_2`, `EffectMechanic_3`, `ImplicitTargetA_1`, `ImplicitTargetA_2`, `ImplicitTargetA_3`, `ImplicitTargetB_1`, `ImplicitTargetB_2`, `ImplicitTargetB_3`, `EffectRadiusIndex_1`, `EffectRadiusIndex_2`, `EffectRadiusIndex_3`, `EffectAura_1`, `EffectAura_2`, `EffectAura_3`, `EffectAuraPeriod_1`, `EffectAuraPeriod_2`, `EffectAuraPeriod_3`, `EffectMultipleValue_1`, `EffectMultipleValue_2`, `EffectMultipleValue_3`, `EffectChainTargets_1`, `EffectChainTargets_2`, `EffectChainTargets_3`, `EffectItemType_1`, `EffectItemType_2`, `EffectItemType_3`, `EffectMiscValue_1`, `EffectMiscValue_2`, `EffectMiscValue_3`, `EffectMiscValueB_1`, `EffectMiscValueB_2`, `EffectMiscValueB_3`, `EffectTriggerSpell_1`, `EffectTriggerSpell_2`, `EffectTriggerSpell_3`, `EffectPointsPerCombo_1`, `EffectPointsPerCombo_2`, `EffectPointsPerCombo_3`, `EffectSpellClassMaskA_1`, `EffectSpellClassMaskA_2`, `EffectSpellClassMaskA_3`, `EffectSpellClassMaskB_1`, `EffectSpellClassMaskB_2`, `EffectSpellClassMaskB_3`, `EffectSpellClassMaskC_1`, `EffectSpellClassMaskC_2`, `EffectSpellClassMaskC_3`, `SpellVisualID_1`, `SpellVisualID_2`, `SpellIconID`, `ActiveIconID`, `SpellPriority`, `Name_Lang_enUS`, `Name_Lang_enGB`, `Name_Lang_koKR`, `Name_Lang_frFR`, `Name_Lang_deDE`, `Name_Lang_enCN`, `Name_Lang_zhCN`, `Name_Lang_enTW`, `Name_Lang_zhTW`, `Name_Lang_esES`, `Name_Lang_esMX`, `Name_Lang_ruRU`, `Name_Lang_ptPT`, `Name_Lang_ptBR`, `Name_Lang_itIT`, `Name_Lang_Unk`, `Name_Lang_Mask`, `NameSubtext_Lang_enUS`, `NameSubtext_Lang_enGB`, `NameSubtext_Lang_koKR`, `NameSubtext_Lang_frFR`, `NameSubtext_Lang_deDE`, `NameSubtext_Lang_enCN`, `NameSubtext_Lang_zhCN`, `NameSubtext_Lang_enTW`, `NameSubtext_Lang_zhTW`, `NameSubtext_Lang_esES`, `NameSubtext_Lang_esMX`, `NameSubtext_Lang_ruRU`, `NameSubtext_Lang_ptPT`, `NameSubtext_Lang_ptBR`, `NameSubtext_Lang_itIT`, `NameSubtext_Lang_Unk`, `NameSubtext_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_enGB`, `Description_Lang_koKR`, `Description_Lang_frFR`, `Description_Lang_deDE`, `Description_Lang_enCN`, `Description_Lang_zhCN`, `Description_Lang_enTW`, `Description_Lang_zhTW`, `Description_Lang_esES`, `Description_Lang_esMX`, `Description_Lang_ruRU`, `Description_Lang_ptPT`, `Description_Lang_ptBR`, `Description_Lang_itIT`, `Description_Lang_Unk`, `Description_Lang_Mask`, `AuraDescription_Lang_enUS`, `AuraDescription_Lang_enGB`, `AuraDescription_Lang_koKR`, `AuraDescription_Lang_frFR`, `AuraDescription_Lang_deDE`, `AuraDescription_Lang_enCN`, `AuraDescription_Lang_zhCN`, `AuraDescription_Lang_enTW`, `AuraDescription_Lang_zhTW`, `AuraDescription_Lang_esES`, `AuraDescription_Lang_esMX`, `AuraDescription_Lang_ruRU`, `AuraDescription_Lang_ptPT`, `AuraDescription_Lang_ptBR`, `AuraDescription_Lang_itIT`, `AuraDescription_Lang_Unk`, `AuraDescription_Lang_Mask`, `ManaCostPct`, `StartRecoveryCategory`, `StartRecoveryTime`, `MaxTargetLevel`, `SpellClassSet`, `SpellClassMask_1`, `SpellClassMask_2`, `SpellClassMask_3`, `MaxTargets`, `DefenseType`, `PreventionType`, `StanceBarOrder`, `EffectChainAmplitude_1`, `EffectChainAmplitude_2`, `EffectChainAmplitude_3`, `MinFactionID`, `MinReputation`, `RequiredAuraVision`, `RequiredTotemCategoryID_1`, `RequiredTotemCategoryID_2`, `RequiredAreasID`, `SchoolMask`, `RuneCostID`, `SpellMissileID`, `PowerDisplayID`, `EffectBonusMultiplier_1`, `EffectBonusMultiplier_2`, `EffectBonusMultiplier_3`, `SpellDescriptionVariableID`, `SpellDifficultyID`) VALUES (102656, 0, 0, 0, 16842768, 0, 0, 0, 0, 0, 4096, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 394, 0, 34, 0, 0, 'Fusion', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712188, 'Allows the miner to turn ore into metal bars.  This skill requires a forge.', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712188, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0);