-- delete trainer spell for fusion forge
delete from npc_trainer where SpellID >= 90003 AND SpellID <= 90023;

-- add new fusion forge spell to npc_trainer

-- 锻造
SET @Blacksmithing := 164;
Set @BlacksmithingTrainer := 17245;
Set @BlacksmithingTrainerSpellID := 201004;
-- 附魔
SET @Enchanting := 333;
SET @EnchantingTrainer := 16160;
SET @EnchantingTrainerSpellID := 201009;
-- 工程学
SET @Engineering := 202;
SET @EngineeringTrainer := 17222;
SET @EngineeringTrainerSpellID := 201012;


-- 添加锻造相关的法术
DELETE FROM `npc_trainer` WHERE `ID` = 201004 AND `SpellID` IN (80902, 80909, 80913, 80906, 80903, 80907, 80910);
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `ReqSpell`) VALUES
(201004, 80902, 50, 164, 1, 0, 0),  -- Axe
(201004, 80909, 50, 164, 1, 0, 0),  -- Sword
(201004, 80913, 50, 164, 1, 0, 0),  -- Dagger
(201004, 80906, 50, 164, 1, 0, 0),  -- Mace
(201004, 80903, 50, 164, 1, 0, 0),  -- Two-Handed Axe
(201004, 80907, 50, 164, 1, 0, 0),  -- Two-Handed Mace
(201004, 80910, 50, 164, 1, 0, 0);  -- Two-Handed Sword

-- 添加工程学相关的法术
DELETE FROM `npc_trainer` WHERE `ID` = 201012 AND `SpellID` IN (80904, 80905, 80915, 80914);
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `ReqSpell`) VALUES
(201012, 80904, 50, 202, 1, 0, 0),  -- Bow
(201012, 80905, 50, 202, 1, 0, 0),  -- Gun
(201012, 80915, 50, 202, 1, 0, 0),  -- Crossbow
(201012, 80914, 50, 202, 1, 0, 0);  -- Thrown

-- 添加附魔相关的法术
DELETE FROM `npc_trainer` WHERE `ID` = 201009 AND `SpellID` IN (80911, 80916);
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `ReqSpell`) VALUES
(201009, 80911, 50, 333, 1, 0, 0),  -- Staff
(201009, 80916, 50, 333, 1, 0, 0);  -- Wand

-- Spell|esp-project:RecipeFusionForge-Axe|80902|80902|
-- Spell|esp-project:RecipeFusionForge-Bow|80904|80904|
-- Spell|esp-project:RecipeFusionForge-Crossbow|80915|80915|
-- Spell|esp-project:RecipeFusionForge-Dagger|80913|80913|
-- Spell|esp-project:RecipeFusionForge-FistWeapon|80912|80912|
-- Spell|esp-project:RecipeFusionForge-Gun|80905|80905|
-- Spell|esp-project:RecipeFusionForge-Mace|80906|80906|
-- Spell|esp-project:RecipeFusionForge-Polearm|80908|80908|
-- Spell|esp-project:RecipeFusionForge-Staff|80911|80911|
-- Spell|esp-project:RecipeFusionForge-Sword|80909|80909|
-- Spell|esp-project:RecipeFusionForge-Thrown|80914|80914|
-- Spell|esp-project:RecipeFusionForge-Two-HandedAxe|80903|80903|
-- Spell|esp-project:RecipeFusionForge-Two-HandedMace|80907|80907|
-- Spell|esp-project:RecipeFusionForge-Two-HandedSword|80910|80910|
-- Spell|esp-project:RecipeFusionForge-Wand|80916|80916|