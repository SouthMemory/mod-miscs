
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
UPDATE item_instance SET itemEntry = 58014 WHERE itemEntry = 60076;
UPDATE item_instance SET itemEntry = 58013 WHERE itemEntry = 60075;
UPDATE item_instance SET itemEntry = 58012 WHERE itemEntry = 60074;
UPDATE item_instance SET itemEntry = 58011 WHERE itemEntry = 60073;
UPDATE item_instance SET itemEntry = 58010 WHERE itemEntry = 60072;
UPDATE item_instance SET itemEntry = 58009 WHERE itemEntry = 60071;
UPDATE item_instance SET itemEntry = 58008 WHERE itemEntry = 60070;
UPDATE item_instance SET itemEntry = 58007 WHERE itemEntry = 60069;
UPDATE item_instance SET itemEntry = 58006 WHERE itemEntry = 60068;
UPDATE item_instance SET itemEntry = 58005 WHERE itemEntry = 60067;
UPDATE item_instance SET itemEntry = 58004 WHERE itemEntry = 60066;
UPDATE item_instance SET itemEntry = 58003 WHERE itemEntry = 60065;
UPDATE item_instance SET itemEntry = 58002 WHERE itemEntry = 60064;
UPDATE item_instance SET itemEntry = 58001 WHERE itemEntry = 60063;

-- delete all fusion forge spell from character_spell
delete from character_spell where spell >= 90003 AND spell <= 90023;