-- Drop the table if it exists
DROP TABLE IF EXISTS `gathering_shards`;

-- Create table for Shards to Ore and Mining Levels with item_type and Name
CREATE TABLE `gathering_shards` (
  `target_item_id` int unsigned NOT NULL,
  `shards_item_id` int unsigned NOT NULL,
  `skill_level_required` int unsigned NOT NULL,
  `skill_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'mining',
  `target_item_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`target_item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert data into the table
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (765, 60018, 0, 'herblism', 'Fragments of Silverleaf');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (2447, 60019, 0, 'herblism', 'Fragments of Peacebloom');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (2449, 60020, 15, 'herblism', 'Fragments of Earthroot');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (785, 60021, 50, 'herblism', 'Fragments of Mageroyal');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (2450, 60022, 70, 'herblism', 'Fragments of Briarthorn');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (2453, 60023, 100, 'herblism', 'Fragments of Bruiseweed');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (3355, 60024, 115, 'herblism', 'Fragments of Wild Steelbloom');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (3356, 60025, 125, 'herblism', 'Fragments of Kingsblood');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (3369, 60026, 120, 'herblism', 'Fragments of Grave Moss');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (3357, 60027, 150, 'herblism', 'Fragments of Liferoot');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (3818, 60028, 160, 'herblism', 'Fragments of Fadeleaf');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (3358, 60029, 185, 'herblism', 'Fragments of Khadgar Whisker');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (3819, 60030, 195, 'herblism', 'Fragments of Wintersbite');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (3820, 60031, 85, 'herblism', 'Fragments of Stranglekelp');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (3821, 60032, 170, 'herblism', 'Fragments of Goldthorn');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (4625, 60033, 205, 'herblism', 'Fragments of Firebloom');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (8831, 60034, 210, 'herblism', 'Fragments of Purple Lotus');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (8836, 60035, 220, 'herblism', 'Fragments of Arthas Tears');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (8838, 60036, 230, 'herblism', 'Fragments of Sungrass');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (8839, 60037, 235, 'herblism', 'Fragments of Blindweed');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (8845, 60038, 245, 'herblism', 'Fragments of Ghost Mushroom');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (8846, 60039, 250, 'herblism', 'Fragments of Gromsblood');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (13464, 60040, 260, 'herblism', 'Fragments of Golden Sansam');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (13463, 60041, 270, 'herblism', 'Fragments of Dreamfoil');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (13465, 60042, 280, 'herblism', 'Fragments of Mountain Silversage');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (13466, 60043, 285, 'herblism', 'Fragments of Plaguebloom');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (13467, 60044, 290, 'herblism', 'Fragments of Icecap');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (13468, 60045, 300, 'herblism', 'Fragments of Black Lotus');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (22710, 60046, 0, 'herblism', 'Fragments of Bloodthistle');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (22785, 60047, 300, 'herblism', 'Fragments of Felweed');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (22786, 60048, 315, 'herblism', 'Fragments of Dreaming Glory');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (22787, 60049, 325, 'herblism', 'Fragments of Ragveil');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (22788, 60050, 335, 'herblism', 'Fragments of Flame Cap');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (22789, 60051, 325, 'herblism', 'Fragments of Terocone');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (22790, 60052, 340, 'herblism', 'Fragments of Ancient Lichen');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (22791, 60053, 350, 'herblism', 'Fragments of Netherbloom');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (22792, 60054, 365, 'herblism', 'Fragments of Nightmare Vine');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (22793, 60055, 375, 'herblism', 'Fragments of Mana Thistle');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (36901, 60056, 350, 'herblism', 'Fragments of Goldclover');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (36904, 60057, 375, 'herblism', 'Fragments of Tiger Lily');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (36907, 60058, 385, 'herblism', 'Fragments of Talandra Rose');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (36905, 60059, 425, 'herblism', 'Fragments of Lichbloom');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (36906, 60060, 435, 'herblism', 'Fragments of Icethorn');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (36908, 60061, 450, 'herblism', 'Fragments of Frost Lotus');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (36903, 60062, 400, 'herblism', 'Fragments of Adder Tongue');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (2770, 60063, 1, 'mining', 'Copper Ore');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (2771, 60064, 65, 'mining', 'Tin Ore');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (2775, 60065, 75, 'mining', 'Silver Ore');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (2772, 60066, 125, 'mining', 'Iron Ore');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (2776, 60067, 155, 'mining', 'Gold Ore');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (3858, 60068, 175, 'mining', 'Mithril Ore');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (7911, 60069, 230, 'mining', 'Truesilver Ore');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (10620, 60070, 245, 'mining', 'Thorium Ore');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (23424, 60071, 275, 'mining', 'Fel Iron Ore');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (23425, 60072, 325, 'mining', 'Adamantite Ore');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (36909, 60073, 350, 'mining', 'Cobalt Ore');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (23426, 60074, 375, 'mining', 'Khorium Ore');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (36912, 60075, 400, 'mining', 'Saronite Ore');
INSERT INTO `npcbots_acore_world`.`gathering_shards` (`target_item_id`, `shards_item_id`, `skill_level_required`, `skill_type`, `target_item_name`) VALUES (36910, 60076, 450, 'mining', 'Titanium Ore');