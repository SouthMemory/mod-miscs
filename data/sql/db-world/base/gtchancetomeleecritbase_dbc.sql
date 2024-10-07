/*
 Navicat Premium Data Transfer

 Source Server         : 8036_3386
 Source Server Type    : MySQL
 Source Server Version : 80037 (8.0.37)
 Source Host           : localhost:3386
 Source Schema         : acore_world

 Target Server Type    : MySQL
 Target Server Version : 80037 (8.0.37)
 File Encoding         : 65001

 Date: 28/09/2024 16:12:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gtchancetomeleecritbase_dbc
-- ----------------------------
DROP TABLE IF EXISTS `gtchancetomeleecritbase_dbc`;
CREATE TABLE `gtchancetomeleecritbase_dbc`  (
  `ID` int NOT NULL DEFAULT 0,
  `Data` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gtchancetomeleecritbase_dbc
-- ----------------------------
INSERT INTO `gtchancetomeleecritbase_dbc` VALUES (0, 0);
INSERT INTO `gtchancetomeleecritbase_dbc` VALUES (1, 0);
INSERT INTO `gtchancetomeleecritbase_dbc` VALUES (2, 0);
INSERT INTO `gtchancetomeleecritbase_dbc` VALUES (3, 0);
INSERT INTO `gtchancetomeleecritbase_dbc` VALUES (4, 0);
INSERT INTO `gtchancetomeleecritbase_dbc` VALUES (5, 0);
INSERT INTO `gtchancetomeleecritbase_dbc` VALUES (6, 0);
INSERT INTO `gtchancetomeleecritbase_dbc` VALUES (7, 0);
INSERT INTO `gtchancetomeleecritbase_dbc` VALUES (8, 0);
INSERT INTO `gtchancetomeleecritbase_dbc` VALUES (9, 0);
INSERT INTO `gtchancetomeleecritbase_dbc` VALUES (10, 0);

SET FOREIGN_KEY_CHECKS = 1;
