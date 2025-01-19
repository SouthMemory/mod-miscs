-- 野兽控制与猎人宠物技能加成系数更新
-- 根据2024年1月1日更新规则调整

-- 法术强度加成调整
-- 仅调整注释以"Pet Skills - "开头的记录
-- 情况1：dot_bonus为0且direct_bonus不为0且低于1（一次性伤害）
UPDATE `spell_bonus_data`
SET `direct_bonus` = 1
WHERE `comments` LIKE 'Pet Skills - %'
  AND `dot_bonus` = 0 
  AND `direct_bonus` != 0 
  AND `direct_bonus` < 1;

-- 情况2：dot_bonus不为0且direct_bonus不为0且低于1（一次性伤害+持续伤害）
UPDATE `spell_bonus_data`
SET `direct_bonus` = 0.67
WHERE `comments` LIKE 'Pet Skills - %'
  AND `dot_bonus` != 0 
  AND `direct_bonus` != 0 
  AND `direct_bonus` < 1;

-- 情况3：dot_bonus不为0且低于0.175（一次性伤害+持续伤害）
UPDATE `spell_bonus_data`
SET `dot_bonus` = 0.175
WHERE `comments` LIKE 'Pet Skills - %'
  AND `dot_bonus` != 0 
  AND `dot_bonus` < 0.175;

-- 攻击强度加成调整
-- 情况1：ap_dot_bonus为0且ap_bonus不为0且低于1（一次性伤害）
UPDATE `spell_bonus_data`
SET `ap_bonus` = 0.175
WHERE `comments` LIKE 'Pet Skills - %'
  AND `ap_dot_bonus` = 0 
  AND `ap_bonus` != 0 
  AND `ap_bonus` < 1;

-- 情况2：ap_dot_bonus不为0且ap_bonus不为0且低于1（一次性伤害+持续伤害）
UPDATE `spell_bonus_data`
SET `ap_bonus` = 0.07
WHERE `comments` LIKE 'Pet Skills - %'
  AND `ap_dot_bonus` != 0 
  AND `ap_bonus` != 0 
  AND `ap_bonus` < 1;

-- 情况3：ap_dot_bonus不为0且低于0.175（一次性伤害+持续伤害）
UPDATE `spell_bonus_data`
SET `ap_dot_bonus` = 0.175
WHERE `comments` LIKE 'Pet Skills - %'
  AND `ap_dot_bonus` != 0 
  AND `ap_dot_bonus` < 0.175;

-- 添加更新注释
UPDATE `spell_bonus_data`
SET `comments` = CONCAT(`comments`, ' | 2024-01-01 技能加成系数调整')
WHERE `comments` LIKE 'Pet Skills - %'
  AND (`direct_bonus` != 0 OR `dot_bonus` != 0 OR `ap_bonus` != 0 OR `ap_dot_bonus` != 0);
