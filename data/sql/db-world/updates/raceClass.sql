-- 删除德莱尼不能选择萨满、血精灵不能选择圣骑士，以及所有种族不能选择死亡骑士的组合
DELETE FROM `playercreateinfo` WHERE `race` = 11 AND `class` = 7;

DELETE FROM `playercreateinfo` WHERE `race` = 10 AND `class` = 2;

DELETE FROM `playercreateinfo` WHERE `class` = 6;