DROP PROCEDURE IF EXISTS AddShardsAndSpells;

DELIMITER //

CREATE PROCEDURE AddShardsAndSpells()
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE shards_entry INT DEFAULT 58000;
    DECLARE spell_id INT DEFAULT 91000;
    DECLARE ore_entry INT DEFAULT 2770;

    -- 名称变量
    DECLARE shards_name VARCHAR(255);
    DECLARE shards_name_zhCN VARCHAR(255);
    DECLARE ore_name VARCHAR(255);
    DECLARE ore_name_zhCN VARCHAR(255);
    DECLARE display_id INT;

    WHILE i < 14 DO
        SET shards_entry = shards_entry + 1;
        SET spell_id = spell_id + 1;
        
        -- 根据shards_id设置矿石名称、名称中文、DisplayID和对应的条目ID
        CASE shards_entry
            WHEN 58001 THEN
                SET shards_name = 'Copper Shards';
                SET shards_name_zhCN = '铜矿碎片';
                SET ore_entry = 2770;
                SET ore_name = 'Copper Ore';
                SET ore_name_zhCN = '铜矿石';
                SET display_id = 4681;
            WHEN 58002 THEN
                SET shards_name = 'Tin Shards';
                SET shards_name_zhCN = '锡矿碎片';
                SET ore_entry = 2771;
                SET ore_name = 'Tin Ore';
                SET ore_name_zhCN = '锡矿石';
                SET display_id = 4690;
            WHEN 58003 THEN
                SET shards_name = 'Silver Shards';
                SET shards_name_zhCN = '银矿碎片';
                SET ore_entry = 2775;
                SET ore_name = 'Silver Ore';
                SET ore_name_zhCN = '银矿石';
                SET display_id = 18107;
            WHEN 58004 THEN
                SET shards_name = 'Iron Shards';
                SET shards_name_zhCN = '铁矿碎片';
                SET ore_entry = 2772;
                SET ore_name = 'Iron Ore';
                SET ore_name_zhCN = '铁矿石';
                SET display_id = 4689;
            WHEN 58005 THEN
                SET shards_name = 'Gold Shards';
                SET shards_name_zhCN = '金矿矿碎片';
                SET ore_entry = 2776;
                SET ore_name = 'Gold Ore';
                SET ore_name_zhCN = '金矿石';
                SET display_id = 41755;
            WHEN 58006 THEN
                SET shards_name = 'Mithril Shards';
                SET shards_name_zhCN = '秘银矿碎片';
                SET ore_entry = 3858;
                SET ore_name = 'Mithril Ore';
                SET ore_name_zhCN = '秘银矿石';
                SET display_id = 20661;
            WHEN 58007 THEN
                SET shards_name = 'Truesilver Shards';
                SET shards_name_zhCN = '真银矿碎片';
                SET ore_entry = 7911;
                SET ore_name = 'Truesilver Ore';
                SET ore_name_zhCN = '真银矿石';
                SET display_id = 20657;
            WHEN 58008 THEN
                SET shards_name = 'Thorium Shards';
                SET shards_name_zhCN = '瑟银矿碎片';
                SET ore_entry = 10620;
                SET ore_name = 'Thorium Ore';
                SET ore_name_zhCN = '瑟银矿石';
                SET display_id = 20658;
            WHEN 58009 THEN
                SET shards_name = 'Fel Iron Shards';
                SET shards_name_zhCN = '魔铁矿碎片';
                SET ore_entry = 23424;
                SET ore_name = 'Fel Iron Ore';
                SET ore_name_zhCN = '魔铁矿石';
                SET display_id = 38645;
            WHEN 58010 THEN
                SET shards_name = 'Adamantite Shards';
                SET shards_name_zhCN = '精金矿碎片';
                SET ore_entry = 23425;
                SET ore_name = 'Adamantite Ore';
                SET ore_name_zhCN = '精金矿石';
                SET display_id = 38648;
            WHEN 58011 THEN
                SET shards_name = 'Cobalt Shards';
                SET shards_name_zhCN = '钴矿碎片';
                SET ore_entry = 36909;
                SET ore_name = 'Cobalt Ore';
                SET ore_name_zhCN = '钴矿石';
                SET display_id = 50593;
            WHEN 58012 THEN
                SET shards_name = 'Khorium Shards';
                SET shards_name_zhCN = '氪金矿碎片';
                SET ore_entry = 23426;
                SET ore_name = 'Khorium Ore';
                SET ore_name_zhCN = '氪金矿石';
                SET display_id = 38647;
            WHEN 58013 THEN
                SET shards_name = 'Saronite Shards';
                SET shards_name_zhCN = '萨隆邪铁矿碎片';
                SET ore_entry = 36912;
                SET ore_name = 'Saronite Ore';
                SET ore_name_zhCN = '萨隆邪铁矿石';
                SET display_id = 57335;
            WHEN 58014 THEN
                SET shards_name = 'Titanium Shards';
                SET shards_name_zhCN = '泰坦神铁矿碎片';
                SET ore_entry = 36910;
                SET ore_name = 'Titanium Ore';
                SET ore_name_zhCN = '泰坦神铁矿石';
                SET display_id = 52908;
        END CASE;


        -- 矿石碎片
        DELETE FROM `item_template` WHERE `entry` = shards_entry;
        INSERT INTO `item_template` (`entry`, `class`, `subclass`, `SoundOverrideSubclass`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `StatsCount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`, `ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`, `ArmorDamageModifier`, `duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `flagsCustom`, `VerifiedBuild`) VALUES (shards_entry, 7, 10, -1, 'Mote of Life', 41683, 1, 1024, 0, 1, 1600, 400, 0, -1, -1, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28106, 0, -1, -1, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, '', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 232, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 12340);

        UPDATE `item_template` SET 
            `class` = 7, 
            `subclass` = 7, 
            `name` = shards_name, 
            `displayid` = display_id, 
            `Quality` = 1, 
            `BuyPrice` = 160, 
            `SellPrice` = 40, 
            `InventoryType` = 0, 
            `maxcount` = 0, 
            `stackable` = 50,
            `spellid_1` = spell_id
        WHERE `entry` = shards_entry;

        DELETE FROM `item_template_locale` WHERE `ID` = shards_entry AND `locale` = 'zhCN';
        INSERT INTO `item_template_locale` (`ID`, `locale`, `Name`, `Description`, `VerifiedBuild`) VALUES (shards_entry, 'zhCN', shards_name_zhCN, '', 15595);

        -- 矿石碎片对应的合成技能
        DELETE FROM `spell_dbc` WHERE (`ID` = spell_id);
        INSERT INTO `spell_dbc` (`ID`, `Category`, `DispelType`, `Mechanic`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `AttributesEx6`, `AttributesEx7`, `ShapeshiftMask`, `unk_320_2`, `ShapeshiftExclude`, `unk_320_3`, `Targets`, `TargetCreatureType`, `RequiresSpellFocus`, `FacingCasterFlags`, `CasterAuraState`, `TargetAuraState`, `ExcludeCasterAuraState`, `ExcludeTargetAuraState`, `CasterAuraSpell`, `TargetAuraSpell`, `ExcludeCasterAuraSpell`, `ExcludeTargetAuraSpell`, `CastingTimeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `ProcTypeMask`, `ProcChance`, `ProcCharges`, `MaxLevel`, `BaseLevel`, `SpellLevel`, `DurationIndex`, `PowerType`, `ManaCost`, `ManaCostPerLevel`, `ManaPerSecond`, `ManaPerSecondPerLevel`, `RangeIndex`, `Speed`, `ModalNextSpell`, `CumulativeAura`, `Totem_1`, `Totem_2`, `Reagent_1`, `Reagent_2`, `Reagent_3`, `Reagent_4`, `Reagent_5`, `Reagent_6`, `Reagent_7`, `Reagent_8`, `ReagentCount_1`, `ReagentCount_2`, `ReagentCount_3`, `ReagentCount_4`, `ReagentCount_5`, `ReagentCount_6`, `ReagentCount_7`, `ReagentCount_8`, `EquippedItemClass`, `EquippedItemSubclass`, `EquippedItemInvTypes`, `Effect_1`, `Effect_2`, `Effect_3`, `EffectDieSides_1`, `EffectDieSides_2`, `EffectDieSides_3`, `EffectRealPointsPerLevel_1`, `EffectRealPointsPerLevel_2`, `EffectRealPointsPerLevel_3`, `EffectBasePoints_1`, `EffectBasePoints_2`, `EffectBasePoints_3`, `EffectMechanic_1`, `EffectMechanic_2`, `EffectMechanic_3`, `ImplicitTargetA_1`, `ImplicitTargetA_2`, `ImplicitTargetA_3`, `ImplicitTargetB_1`, `ImplicitTargetB_2`, `ImplicitTargetB_3`, `EffectRadiusIndex_1`, `EffectRadiusIndex_2`, `EffectRadiusIndex_3`, `EffectAura_1`, `EffectAura_2`, `EffectAura_3`, `EffectAuraPeriod_1`, `EffectAuraPeriod_2`, `EffectAuraPeriod_3`, `EffectMultipleValue_1`, `EffectMultipleValue_2`, `EffectMultipleValue_3`, `EffectChainTargets_1`, `EffectChainTargets_2`, `EffectChainTargets_3`, `EffectItemType_1`, `EffectItemType_2`, `EffectItemType_3`, `EffectMiscValue_1`, `EffectMiscValue_2`, `EffectMiscValue_3`, `EffectMiscValueB_1`, `EffectMiscValueB_2`, `EffectMiscValueB_3`, `EffectTriggerSpell_1`, `EffectTriggerSpell_2`, `EffectTriggerSpell_3`, `EffectPointsPerCombo_1`, `EffectPointsPerCombo_2`, `EffectPointsPerCombo_3`, `EffectSpellClassMaskA_1`, `EffectSpellClassMaskA_2`, `EffectSpellClassMaskA_3`, `EffectSpellClassMaskB_1`, `EffectSpellClassMaskB_2`, `EffectSpellClassMaskB_3`, `EffectSpellClassMaskC_1`, `EffectSpellClassMaskC_2`, `EffectSpellClassMaskC_3`, `SpellVisualID_1`, `SpellVisualID_2`, `SpellIconID`, `ActiveIconID`, `SpellPriority`, `Name_Lang_enUS`, `Name_Lang_enGB`, `Name_Lang_koKR`, `Name_Lang_frFR`, `Name_Lang_deDE`, `Name_Lang_enCN`, `Name_Lang_zhCN`, `Name_Lang_enTW`, `Name_Lang_zhTW`, `Name_Lang_esES`, `Name_Lang_esMX`, `Name_Lang_ruRU`, `Name_Lang_ptPT`, `Name_Lang_ptBR`, `Name_Lang_itIT`, `Name_Lang_Unk`, `Name_Lang_Mask`, `NameSubtext_Lang_enUS`, `NameSubtext_Lang_enGB`, `NameSubtext_Lang_koKR`, `NameSubtext_Lang_frFR`, `NameSubtext_Lang_deDE`, `NameSubtext_Lang_enCN`, `NameSubtext_Lang_zhCN`, `NameSubtext_Lang_enTW`, `NameSubtext_Lang_zhTW`, `NameSubtext_Lang_esES`, `NameSubtext_Lang_esMX`, `NameSubtext_Lang_ruRU`, `NameSubtext_Lang_ptPT`, `NameSubtext_Lang_ptBR`, `NameSubtext_Lang_itIT`, `NameSubtext_Lang_Unk`, `NameSubtext_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_enGB`, `Description_Lang_koKR`, `Description_Lang_frFR`, `Description_Lang_deDE`, `Description_Lang_enCN`, `Description_Lang_zhCN`, `Description_Lang_enTW`, `Description_Lang_zhTW`, `Description_Lang_esES`, `Description_Lang_esMX`, `Description_Lang_ruRU`, `Description_Lang_ptPT`, `Description_Lang_ptBR`, `Description_Lang_itIT`, `Description_Lang_Unk`, `Description_Lang_Mask`, `AuraDescription_Lang_enUS`, `AuraDescription_Lang_enGB`, `AuraDescription_Lang_koKR`, `AuraDescription_Lang_frFR`, `AuraDescription_Lang_deDE`, `AuraDescription_Lang_enCN`, `AuraDescription_Lang_zhCN`, `AuraDescription_Lang_enTW`, `AuraDescription_Lang_zhTW`, `AuraDescription_Lang_esES`, `AuraDescription_Lang_esMX`, `AuraDescription_Lang_ruRU`, `AuraDescription_Lang_ptPT`, `AuraDescription_Lang_ptBR`, `AuraDescription_Lang_itIT`, `AuraDescription_Lang_Unk`, `AuraDescription_Lang_Mask`, `ManaCostPct`, `StartRecoveryCategory`, `StartRecoveryTime`, `MaxTargetLevel`, `SpellClassSet`, `SpellClassMask_1`, `SpellClassMask_2`, `SpellClassMask_3`, `MaxTargets`, `DefenseType`, `PreventionType`, `StanceBarOrder`, `EffectChainAmplitude_1`, `EffectChainAmplitude_2`, `EffectChainAmplitude_3`, `MinFactionID`, `MinReputation`, `RequiredAuraVision`, `RequiredTotemCategoryID_1`, `RequiredTotemCategoryID_2`, `RequiredAreasID`, `SchoolMask`, `RuneCostID`, `SpellMissileID`, `PowerDisplayID`, `EffectBonusMultiplier_1`, `EffectBonusMultiplier_2`, `EffectBonusMultiplier_3`, `SpellDescriptionVariableID`, `SpellDifficultyID`) VALUES (spell_id, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 15, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 22575, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 24, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21886, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 140, 0, 0, 'Create Primal Life', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712188, 'Turn ten Motes of Life into Primal Life.', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712188, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0);

        UPDATE `spell_dbc` SET 
            `Name_Lang_enUS` = CONCAT('Create ', ore_name),
            `Name_Lang_zhCN` = CONCAT('合成', ore_name_zhCN),
            `Description_Lang_enUS` = 'Turn five shards into a Ore.',
            `Description_Lang_zhCN` = '将5块矿石碎片合成为一块矿石。',
            `EffectItemType_1` = ore_entry, 
            `Reagent_1` = shards_entry, 
            `ReagentCount_1` = 4,
            `CastingTimeIndex` = 5,
            `SpellVisualID_1` = 2641 
        WHERE `ID` = spell_id;

        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;

CALL AddShardsAndSpells();