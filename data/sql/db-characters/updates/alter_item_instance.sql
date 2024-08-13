DELIMITER //

CREATE PROCEDURE add_missing_columns()
BEGIN
    -- 检查并添加 spells 列
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_NAME='item_instance' AND COLUMN_NAME='spells') THEN
        ALTER TABLE `item_instance` ADD COLUMN `spells` text NOT NULL;
    END IF;

    -- 检查并添加 stats 列
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_NAME='item_instance' AND COLUMN_NAME='stats') THEN
        ALTER TABLE `item_instance` ADD COLUMN `stats` text NOT NULL;
    END IF;

    -- 检查并添加 armor 列
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_NAME='item_instance' AND COLUMN_NAME='armor') THEN
        ALTER TABLE `item_instance` ADD COLUMN `armor` int(10) unsigned NOT NULL DEFAULT '0';
    END IF;

    -- 检查并添加 damages 列
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_NAME='item_instance' AND COLUMN_NAME='damages') THEN
        ALTER TABLE `item_instance` ADD COLUMN `damages` text NOT NULL;
    END IF;

    -- 检查并添加 name 列
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_NAME='item_instance' AND COLUMN_NAME='name') THEN
        ALTER TABLE `item_instance` ADD COLUMN `name` varchar(128) NOT NULL DEFAULT '';
    END IF;

    -- 检查并添加 leveldata 列
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_NAME='item_instance' AND COLUMN_NAME='leveldata') THEN
        ALTER TABLE `item_instance` ADD COLUMN `leveldata` bigint(20) unsigned NOT NULL DEFAULT '0';
    END IF;

    -- 检查并添加 delay 列
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_NAME='item_instance' AND COLUMN_NAME='delay') THEN
        ALTER TABLE `item_instance` ADD COLUMN `delay` int(10) unsigned NOT NULL DEFAULT '0';
    END IF;

    -- 检查并添加 mapdata 列
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_NAME='item_instance' AND COLUMN_NAME='mapdata') THEN
        ALTER TABLE `item_instance` ADD COLUMN `mapdata` bigint(20) unsigned NOT NULL DEFAULT '0';
    END IF;

    -- 检查并添加 unbind 列
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_NAME='item_instance' AND COLUMN_NAME='unbind') THEN
        ALTER TABLE `item_instance` ADD COLUMN `unbind` tinyint(1) unsigned NOT NULL DEFAULT '0';
    END IF;

    -- 检查并添加 tempindex 列
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_NAME='item_instance' AND COLUMN_NAME='tempindex') THEN
        ALTER TABLE `item_instance` ADD COLUMN `tempindex` int(10) NOT NULL DEFAULT '0';
    END IF;

    -- 检查并添加 runes 列
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
                   WHERE TABLE_NAME='item_instance' AND COLUMN_NAME='runes') THEN
        ALTER TABLE `item_instance` ADD COLUMN `runes` varchar(512) DEFAULT NULL;
    END IF;
END //

DELIMITER ;

-- 执行存储过程
CALL add_missing_columns();

-- 删除存储过程
DROP PROCEDURE add_missing_columns;
