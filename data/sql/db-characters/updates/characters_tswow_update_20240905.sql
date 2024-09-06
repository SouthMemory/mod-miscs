
-- Item	ItemIdOld	ItemIdNew
-- Titanium Shards	58014	60076
-- Saronite Shards	58013	60075
-- Khorium Shards	58012	60074
-- Cobalt Shards	58011	60073
-- Adamantite Shards	58010	60072
-- Fel Iron Shards	58009	60071
-- Thorium Shards	58008	60070
-- Truesilver Shards	58007	60069
-- Mithril Shards	58006	60068
-- Gold Shards	58005	60067
-- Iron Shards	58004	60066
-- Silver Shards	58003	60065
-- Tin Shards	58002	60064
-- Copper Shards	58001	60063

-- update shardsId for  item_instance
UPDATE item_instance SET itemEntry = 60076 WHERE itemEntry = 58014;
UPDATE item_instance SET itemEntry = 60075 WHERE itemEntry = 58013;
UPDATE item_instance SET itemEntry = 60074 WHERE itemEntry = 58012;
UPDATE item_instance SET itemEntry = 60073 WHERE itemEntry = 58011;
UPDATE item_instance SET itemEntry = 60072 WHERE itemEntry = 58010;
UPDATE item_instance SET itemEntry = 60071 WHERE itemEntry = 58009;
UPDATE item_instance SET itemEntry = 60070 WHERE itemEntry = 58008;
UPDATE item_instance SET itemEntry = 60069 WHERE itemEntry = 58007;
UPDATE item_instance SET itemEntry = 60068 WHERE itemEntry = 58006;
UPDATE item_instance SET itemEntry = 60067 WHERE itemEntry = 58005;
UPDATE item_instance SET itemEntry = 60066 WHERE itemEntry = 58004;
UPDATE item_instance SET itemEntry = 60065 WHERE itemEntry = 58003;
UPDATE item_instance SET itemEntry = 60064 WHERE itemEntry = 58002;
UPDATE item_instance SET itemEntry = 60063 WHERE itemEntry = 58001;

-- delete all fusion forge spell from character_spell
delete from character_spell where spell >= 90003 AND spell <= 90023;