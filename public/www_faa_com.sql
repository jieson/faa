/*
 Navicat MySQL Data Transfer

 Source Server         : faa测试连接
 Source Server Type    : MySQL
 Source Server Version : 80029 (8.0.29)
 Source Host           : localhost:3306
 Source Schema         : www_faa_com

 Target Server Type    : MySQL
 Target Server Version : 80029 (8.0.29)
 File Encoding         : 65001

 Date: 26/05/2024 18:19:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fa_admin
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin`;
CREATE TABLE `fa_admin`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `loginfailure` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `logintime` bigint NULL DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录IP',
  `createtime` bigint NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint NULL DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_admin
-- ----------------------------
INSERT INTO `fa_admin` VALUES (1, 'admin', '管理员boss', '9c40546c6a0d42cf20cd745d68875015', '44e047', 'http://www.faa.com/assets/img/avatar.png', 'admin@admin.com', '', 0, 1716649211, '127.0.0.1', 1491635035, 1716649211, '90c5d7e2-a411-4fe6-a47f-edae83cf5ef7', 'normal');
INSERT INTO `fa_admin` VALUES (2, 'xiaoming', '二级管理', '06e2470177cd9f2afce810d46fb7c852', 'dvP89K', '/assets/img/avatar.png', 'test@qq.com', '13136310009', 0, 1716547917, '127.0.0.1', 1716542886, 1716547917, '69ce8f4d-9be3-4067-b1c1-ccf6dc5f3ffd', 'normal');
INSERT INTO `fa_admin` VALUES (3, 'xiaoming2', '鄞州悦动方舟俱乐部', 'bdf89bb6784d0f361fb3483529d52efa', 'NshS10', '/assets/img/avatar.png', 'jj@kk.com', '13136310010', 0, 1716547812, '127.0.0.1', 1716547521, 1716547812, '39f61329-39c7-45f2-8fce-b68ea1bc29fc', 'normal');

-- ----------------------------
-- Table structure for fa_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin_log`;
CREATE TABLE `fa_admin_log`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '日志标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` bigint NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 460 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_admin_log
-- ----------------------------
INSERT INTO `fa_admin_log` VALUES (1, 1, 'admin', '/ZHqYpmsotr.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"WGST\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1715343383);
INSERT INTO `fa_admin_log` VALUES (2, 1, 'admin', '/ZHqYpmsotr.php/addon/install', '插件管理', '{\"name\":\"command\",\"force\":\"0\",\"uid\":\"85636\",\"token\":\"***\",\"version\":\"1.1.2\",\"faversion\":\"1.5.0.20240328\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1715343509);
INSERT INTO `fa_admin_log` VALUES (3, 1, 'admin', '/ZHqYpmsotr.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"command\",\"action\":\"enable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1715343509);
INSERT INTO `fa_admin_log` VALUES (4, 0, 'Unknown', '/ZHqYpmsotr.php/index/login', '', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"VuAR\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715452393);
INSERT INTO `fa_admin_log` VALUES (5, 0, 'Unknown', '/ZHqYpmsotr.php/index/login', '', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"Byyl\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715452408);
INSERT INTO `fa_admin_log` VALUES (6, 0, 'Unknown', '/ZHqYpmsotr.php/index/login', '', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"FJJ3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715452425);
INSERT INTO `fa_admin_log` VALUES (7, 0, 'Unknown', '/ZHqYpmsotr.php/index/login', '', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"xolj\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715452432);
INSERT INTO `fa_admin_log` VALUES (8, 1, 'admin', '/ZHqYpmsotr.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"MTKX\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715452444);
INSERT INTO `fa_admin_log` VALUES (9, 1, 'admin', '/ZHqYpmsotr.php/addon/install', '插件管理', '{\"name\":\"ygame\",\"force\":\"0\",\"uid\":\"85636\",\"token\":\"***\",\"version\":\"1.1.3\",\"faversion\":\"1.5.0.20240328\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715452650);
INSERT INTO `fa_admin_log` VALUES (10, 1, 'admin', '/ZHqYpmsotr.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"ygame\",\"action\":\"enable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715452651);
INSERT INTO `fa_admin_log` VALUES (11, 1, 'admin', '/ZHqYpmsotr.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"H6LF\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1715509045);
INSERT INTO `fa_admin_log` VALUES (12, 1, 'admin', '/ZHqYpmsotr.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"KPLA\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715687956);
INSERT INTO `fa_admin_log` VALUES (13, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715688414);
INSERT INTO `fa_admin_log` VALUES (14, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_test\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715688419);
INSERT INTO `fa_admin_log` VALUES (15, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_test\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715688446);
INSERT INTO `fa_admin_log` VALUES (16, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_test\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715688451);
INSERT INTO `fa_admin_log` VALUES (17, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715688914);
INSERT INTO `fa_admin_log` VALUES (18, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_test\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715688923);
INSERT INTO `fa_admin_log` VALUES (19, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_test\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715688938);
INSERT INTO `fa_admin_log` VALUES (20, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_test\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715688940);
INSERT INTO `fa_admin_log` VALUES (21, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_test\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715688954);
INSERT INTO `fa_admin_log` VALUES (22, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_test\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715688956);
INSERT INTO `fa_admin_log` VALUES (23, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715689343);
INSERT INTO `fa_admin_log` VALUES (24, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715689808);
INSERT INTO `fa_admin_log` VALUES (25, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_test\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715689814);
INSERT INTO `fa_admin_log` VALUES (26, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_test\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715689816);
INSERT INTO `fa_admin_log` VALUES (27, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_test\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715689819);
INSERT INTO `fa_admin_log` VALUES (28, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715689898);
INSERT INTO `fa_admin_log` VALUES (29, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715690191);
INSERT INTO `fa_admin_log` VALUES (30, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715690208);
INSERT INTO `fa_admin_log` VALUES (31, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715690236);
INSERT INTO `fa_admin_log` VALUES (32, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715690245);
INSERT INTO `fa_admin_log` VALUES (33, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715690247);
INSERT INTO `fa_admin_log` VALUES (34, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715690254);
INSERT INTO `fa_admin_log` VALUES (35, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Test.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715690258);
INSERT INTO `fa_admin_log` VALUES (36, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Test.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715690262);
INSERT INTO `fa_admin_log` VALUES (37, 1, 'admin', '/ZHqYpmsotr.php/test/multi', '测试管理 / 批量更新', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"switch=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715690733);
INSERT INTO `fa_admin_log` VALUES (38, 1, 'admin', '/ZHqYpmsotr.php/test/multi', '测试管理 / 批量更新', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"switch=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715690735);
INSERT INTO `fa_admin_log` VALUES (39, 1, 'admin', '/ZHqYpmsotr.php/test/multi', '测试管理 / 批量更新', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"switch=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715690739);
INSERT INTO `fa_admin_log` VALUES (40, 1, 'admin', '/ZHqYpmsotr.php/test/multi', '测试管理 / 批量更新', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"switch=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715690741);
INSERT INTO `fa_admin_log` VALUES (41, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715690796);
INSERT INTO `fa_admin_log` VALUES (42, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715690802);
INSERT INTO `fa_admin_log` VALUES (43, 1, 'admin', '/ZHqYpmsotr.php/general.profile/update', '常规管理 / 个人资料 / 更新个人信息', '{\"__token__\":\"***\",\"row\":{\"avatar\":\"http:\\/\\/www.faa.com\\/assets\\/img\\/avatar.png\",\"email\":\"admin@admin.com\",\"nickname\":\"管理员boss\",\"password\":\"***\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715707634);
INSERT INTO `fa_admin_log` VALUES (44, 1, 'admin', '/ZHqYpmsotr.php/general.profile/update', '常规管理 / 个人资料 / 更新个人信息', '{\"__token__\":\"***\",\"row\":{\"avatar\":\"http:\\/\\/www.faa.com\\/assets\\/img\\/avatar.png\",\"email\":\"admin@admin.com\",\"nickname\":\"管理员boss\",\"password\":\"***\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715707671);
INSERT INTO `fa_admin_log` VALUES (45, 1, 'admin', '/ZHqYpmsotr.php/ajax/upload', '', '{\"category\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715773190);
INSERT INTO `fa_admin_log` VALUES (46, 1, 'admin', '/ZHqYpmsotr.php/ygame/project/add?dialog=1', '报名系统 / 赛事管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"project_name\":\"第一个测试赛事\",\"start_time\":\"2024-05-15 19:38:51\",\"end_time\":\"2024-05-19 19:38:54\",\"game_time\":\"2024-05-30 19:39:00\",\"game_address\":\"南天门\",\"min_team_num\":\"1\",\"image\":\"\\/uploads\\/20240515\\/9467fad63608835514ad8de19753499d.png\",\"agreement\":\"赛事协议，需要确认\",\"content\":\"赛事介绍\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715773227);
INSERT INTO `fa_admin_log` VALUES (47, 1, 'admin', '/ZHqYpmsotr.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"Lt5P\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1715889658);
INSERT INTO `fa_admin_log` VALUES (48, 1, 'admin', '/ZHqYpmsotr.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"VBPm\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716023830);
INSERT INTO `fa_admin_log` VALUES (49, 1, 'admin', '/ZHqYpmsotr.php/index/login?url=/ZHqYpmsotr.php/Test/test1', '登录', '{\"url\":\"\\/ZHqYpmsotr.php\\/Test\\/test1\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"34MT\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716036696);
INSERT INTO `fa_admin_log` VALUES (50, 1, 'admin', '/ZHqYpmsotr.php/auth/group/roletree', '权限管理 / 角色组', '{\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716037115);
INSERT INTO `fa_admin_log` VALUES (51, 1, 'admin', '/ZHqYpmsotr.php/auth/group/roletree', '权限管理 / 角色组', '{\"pid\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716037125);
INSERT INTO `fa_admin_log` VALUES (52, 1, 'admin', '/ZHqYpmsotr.php/auth/group/roletree', '权限管理 / 角色组', '{\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716037140);
INSERT INTO `fa_admin_log` VALUES (53, 1, 'admin', '/ZHqYpmsotr.php/command/execute/ids/2', '在线命令管理 / 再次执行命令', '{\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716037282);
INSERT INTO `fa_admin_log` VALUES (54, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716037331);
INSERT INTO `fa_admin_log` VALUES (55, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716037346);
INSERT INTO `fa_admin_log` VALUES (56, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716037357);
INSERT INTO `fa_admin_log` VALUES (57, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716037359);
INSERT INTO `fa_admin_log` VALUES (58, 1, 'admin', '/ZHqYpmsotr.php/command/del', '在线命令管理 / 删除', '{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716037369);
INSERT INTO `fa_admin_log` VALUES (59, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716037381);
INSERT INTO `fa_admin_log` VALUES (60, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716037383);
INSERT INTO `fa_admin_log` VALUES (61, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716037387);
INSERT INTO `fa_admin_log` VALUES (62, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716037388);
INSERT INTO `fa_admin_log` VALUES (63, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716037390);
INSERT INTO `fa_admin_log` VALUES (64, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716037392);
INSERT INTO `fa_admin_log` VALUES (65, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Test.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716037396);
INSERT INTO `fa_admin_log` VALUES (66, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Test.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716037398);
INSERT INTO `fa_admin_log` VALUES (67, 1, 'admin', '/ZHqYpmsotr.php/addon/config?name=ygame&dialog=1', '插件管理 / 配置', '{\"name\":\"ygame\",\"dialog\":\"1\",\"row\":{\"mp\":\"{&quot;app_id&quot;:&quot;&quot;,&quot;app_secret&quot;:&quot;&quot;}\",\"mini\":\"{&quot;app_id&quot;:&quot;wx23096791898f1652&quot;,&quot;app_secret&quot;:&quot;fa98ded3593567059ec6b9e67c726098&quot;}\",\"order_expire\":\"10\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716115107);
INSERT INTO `fa_admin_log` VALUES (68, 1, 'admin', '/ZHqYpmsotr.php/addon/config?name=ygame&dialog=1', '插件管理 / 配置', '{\"name\":\"ygame\",\"dialog\":\"1\",\"row\":{\"mp\":\"{&quot;app_id&quot;:&quot;&quot;,&quot;app_secret&quot;:&quot;&quot;}\",\"mini\":\"{&quot;app_id&quot;:&quot;wxc0f2a184911d1572&quot;,&quot;app_secret&quot;:&quot;4548c5353d2a96d4ff72e20dbdb5aa63&quot;}\",\"order_expire\":\"10\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716117790);
INSERT INTO `fa_admin_log` VALUES (69, 1, 'admin', '/zHqYpmsotr.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"SFDU\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716464368);
INSERT INTO `fa_admin_log` VALUES (70, 1, 'admin', '/zHqYpmsotr.php/ygame/project/add?dialog=1', '报名系统 / 赛事管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"project_name\":\"第二个测试赛事\",\"start_time\":\"2024-05-22 19:40:38\",\"end_time\":\"2024-05-24 19:40:47\",\"game_time\":\"2024-05-25 19:40:57\",\"game_address\":\"待定\",\"min_team_num\":\"1\",\"image\":\"\\/uploads\\/20240512\\/171edc4efdf16e402c191f6087808f0f.png\",\"agreement\":\"赛事协议\",\"content\":\"赛事介绍\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716464500);
INSERT INTO `fa_admin_log` VALUES (71, 1, 'admin', '/zHqYpmsotr.php/ygame/project/edit/ids/2?dialog=1', '报名系统 / 赛事管理 / 编辑', '{\"dialog\":\"1\",\"row\":{\"project_name\":\"第二个测试赛事\",\"start_time\":\"2024-05-22 19:40:38\",\"end_time\":\"2024-05-24 19:40:47\",\"game_time\":\"2024-05-25 19:40:57\",\"game_address\":\"待定\",\"min_team_num\":\"1\",\"image\":\"\\/uploads\\/20240515\\/9467fad63608835514ad8de19753499d.png\",\"agreement\":\"赛事协议\",\"content\":\"赛事介绍\",\"status\":\"1\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716464531);
INSERT INTO `fa_admin_log` VALUES (72, 1, 'admin', '/zHqYpmsotr.php/ygame/group/add?project_id=2&dialog=1', '报名系统 / 组别管理 / 添加', '{\"project_id\":\"2\",\"dialog\":\"1\",\"row\":{\"project_id\":\"2\",\"group_name\":\"少儿男子组\",\"sign\":\"说明\",\"price\":\"0\",\"num\":\"1000\",\"allow_team\":\"1\",\"team_price\":\"0\",\"weigh\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716464701);
INSERT INTO `fa_admin_log` VALUES (73, 1, 'admin', '/zHqYpmsotr.php/ygame/group/add?project_id=2&dialog=1', '报名系统 / 组别管理 / 添加', '{\"project_id\":\"2\",\"dialog\":\"1\",\"row\":{\"project_id\":\"2\",\"group_name\":\"少儿女子组\",\"sign\":\"说明\",\"price\":\"0\",\"num\":\"2000\",\"allow_team\":\"1\",\"team_price\":\"0\",\"weigh\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716464720);
INSERT INTO `fa_admin_log` VALUES (74, 1, 'admin', '/ZHqYpmsotr.php/auth/group/roletree', '权限管理 / 角色组', '{\"id\":\"2\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716538825);
INSERT INTO `fa_admin_log` VALUES (75, 1, 'admin', '/ZHqYpmsotr.php/user/group/add?dialog=1', '会员管理 / 会员分组 / 添加', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"rules\":\"2,4,11,10,9,12,1,3,7,6,5,8\",\"name\":\"机构账户组\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716538991);
INSERT INTO `fa_admin_log` VALUES (76, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716541282);
INSERT INTO `fa_admin_log` VALUES (77, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716541287);
INSERT INTO `fa_admin_log` VALUES (78, 1, 'admin', '/ZHqYpmsotr.php/command/execute/ids/4', '在线命令管理 / 再次执行命令', '{\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716541291);
INSERT INTO `fa_admin_log` VALUES (79, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716541490);
INSERT INTO `fa_admin_log` VALUES (80, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716541493);
INSERT INTO `fa_admin_log` VALUES (81, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716541499);
INSERT INTO `fa_admin_log` VALUES (82, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716541505);
INSERT INTO `fa_admin_log` VALUES (83, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716541510);
INSERT INTO `fa_admin_log` VALUES (84, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716541521);
INSERT INTO `fa_admin_log` VALUES (85, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Test.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716541525);
INSERT INTO `fa_admin_log` VALUES (86, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716541642);
INSERT INTO `fa_admin_log` VALUES (87, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_test\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716541666);
INSERT INTO `fa_admin_log` VALUES (88, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716541728);
INSERT INTO `fa_admin_log` VALUES (89, 1, 'admin', '/ZHqYpmsotr.php/index/login?url=/ZHqYpmsotr.php/test/test1', '登录', '{\"url\":\"\\/ZHqYpmsotr.php\\/test\\/test1\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"YJYI\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716542610);
INSERT INTO `fa_admin_log` VALUES (90, 1, 'admin', '/ZHqYpmsotr.php/auth/admin/add?dialog=1', '权限管理 / 管理员管理 / 添加', '{\"dialog\":\"1\",\"__token__\":\"***\",\"group\":[\"2\"],\"row\":{\"username\":\"xiaoming\",\"email\":\"test@qq.com\",\"mobile\":\"13136310009\",\"nickname\":\"二级管理\",\"password\":\"***\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716542886);
INSERT INTO `fa_admin_log` VALUES (91, 0, 'Unknown', '/ZHqYpmsotr.php/index/login?url=/ZHqYpmsotr.php/test/test1', '登录', '{\"url\":\"\\/ZHqYpmsotr.php\\/test\\/test1\",\"__token__\":\"***\",\"username\":\"huiyuan1\",\"password\":\"***\",\"captcha\":\"XYL8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716542996);
INSERT INTO `fa_admin_log` VALUES (92, 0, 'Unknown', '/ZHqYpmsotr.php/index/login?url=/ZHqYpmsotr.php/test/test1', '', '{\"url\":\"\\/ZHqYpmsotr.php\\/test\\/test1\",\"__token__\":\"***\",\"username\":\"huiyuan\",\"password\":\"***\",\"captcha\":\"WK6W\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716543016);
INSERT INTO `fa_admin_log` VALUES (93, 0, 'Unknown', '/ZHqYpmsotr.php/index/login?url=/ZHqYpmsotr.php/test/test1', '登录', '{\"url\":\"\\/ZHqYpmsotr.php\\/test\\/test1\",\"__token__\":\"***\",\"username\":\"huiyuan\",\"password\":\"***\",\"captcha\":\"aVVy\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716543026);
INSERT INTO `fa_admin_log` VALUES (94, 0, 'Unknown', '/ZHqYpmsotr.php/index/login?url=/ZHqYpmsotr.php/test/test1', '登录', '{\"url\":\"\\/ZHqYpmsotr.php\\/test\\/test1\",\"__token__\":\"***\",\"username\":\"huiyuan2\",\"password\":\"***\",\"captcha\":\"thBR\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716543044);
INSERT INTO `fa_admin_log` VALUES (95, 2, 'xiaoming', '/ZHqYpmsotr.php/index/login?url=/ZHqYpmsotr.php/test/test1', '登录', '{\"url\":\"\\/ZHqYpmsotr.php\\/test\\/test1\",\"__token__\":\"***\",\"username\":\"xiaoming\",\"password\":\"***\",\"captcha\":\"TYXV\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716543105);
INSERT INTO `fa_admin_log` VALUES (96, 1, 'admin', '/ZHqYpmsotr.php/auth/group/roletree', '权限管理 / 角色组', '{\"id\":\"2\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716543179);
INSERT INTO `fa_admin_log` VALUES (97, 1, 'admin', '/ZHqYpmsotr.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"138\",\"params\":\"ismenu=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716543311);
INSERT INTO `fa_admin_log` VALUES (98, 1, 'admin', '/ZHqYpmsotr.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"137\",\"params\":\"ismenu=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716543322);
INSERT INTO `fa_admin_log` VALUES (99, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716543452);
INSERT INTO `fa_admin_log` VALUES (100, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716543459);
INSERT INTO `fa_admin_log` VALUES (101, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716543462);
INSERT INTO `fa_admin_log` VALUES (102, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716543465);
INSERT INTO `fa_admin_log` VALUES (103, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Test.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716543468);
INSERT INTO `fa_admin_log` VALUES (104, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Test.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716543471);
INSERT INTO `fa_admin_log` VALUES (105, 1, 'admin', '/ZHqYpmsotr.php/auth/group/roletree', '权限管理 / 角色组', '{\"id\":\"2\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716543495);
INSERT INTO `fa_admin_log` VALUES (106, 1, 'admin', '/ZHqYpmsotr.php/auth/group/roletree', '权限管理 / 角色组', '{\"id\":\"2\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716543501);
INSERT INTO `fa_admin_log` VALUES (107, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716543611);
INSERT INTO `fa_admin_log` VALUES (108, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716543614);
INSERT INTO `fa_admin_log` VALUES (109, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716543621);
INSERT INTO `fa_admin_log` VALUES (110, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716543623);
INSERT INTO `fa_admin_log` VALUES (111, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Test.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716543626);
INSERT INTO `fa_admin_log` VALUES (112, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"Test.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716543630);
INSERT INTO `fa_admin_log` VALUES (113, 1, 'admin', '/ZHqYpmsotr.php/auth/group/roletree', '权限管理 / 角色组', '{\"id\":\"2\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716543651);
INSERT INTO `fa_admin_log` VALUES (114, 1, 'admin', '/ZHqYpmsotr.php/auth/group/edit/ids/2?dialog=1', '权限管理 / 角色组 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"rules\":\"1,2,4,6,7,8,9,10,11,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,63,64,65,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,5\",\"pid\":\"1\",\"name\":\"二级管理组\",\"status\":\"normal\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716543680);
INSERT INTO `fa_admin_log` VALUES (115, 1, 'admin', '/ZHqYpmsotr.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"137\",\"params\":\"ismenu=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716543899);
INSERT INTO `fa_admin_log` VALUES (116, 1, 'admin', '/ZHqYpmsotr.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"138\",\"params\":\"ismenu=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716543906);
INSERT INTO `fa_admin_log` VALUES (117, 0, 'Unknown', '/ZHqYpmsotr.php/index/login?url=/ZHqYpmsotr.php/test/test1', '', '{\"url\":\"\\/ZHqYpmsotr.php\\/test\\/test1\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"PNBB\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716545134);
INSERT INTO `fa_admin_log` VALUES (118, 1, 'admin', '/ZHqYpmsotr.php/index/login?url=/ZHqYpmsotr.php/test/test1', '登录', '{\"url\":\"\\/ZHqYpmsotr.php\\/test\\/test1\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"SGfV\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716545142);
INSERT INTO `fa_admin_log` VALUES (119, 2, 'xiaoming', '/ZHqYpmsotr.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"xiaoming\",\"password\":\"***\",\"captcha\":\"e5bq\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716545329);
INSERT INTO `fa_admin_log` VALUES (120, 0, 'Unknown', '/ZHqYpmsotr.php/index/login?url=/ZHqYpmsotr.php/general/profile?ref=addtabs', '', '{\"url\":\"\\/ZHqYpmsotr.php\\/general\\/profile?ref=addtabs\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"XBWI\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716545530);
INSERT INTO `fa_admin_log` VALUES (121, 1, 'admin', '/ZHqYpmsotr.php/index/login?url=/ZHqYpmsotr.php/general/profile?ref=addtabs', '登录', '{\"url\":\"\\/ZHqYpmsotr.php\\/general\\/profile?ref=addtabs\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"K4DV\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716545545);
INSERT INTO `fa_admin_log` VALUES (122, 1, 'admin', '/ZHqYpmsotr.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"129\",\"params\":\"ismenu=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716545571);
INSERT INTO `fa_admin_log` VALUES (123, 1, 'admin', '/ZHqYpmsotr.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"136\",\"params\":\"ismenu=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716545585);
INSERT INTO `fa_admin_log` VALUES (124, 1, 'admin', '/ZHqYpmsotr.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"130\",\"params\":\"ismenu=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716545593);
INSERT INTO `fa_admin_log` VALUES (125, 1, 'admin', '/ZHqYpmsotr.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"131\",\"params\":\"ismenu=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716545598);
INSERT INTO `fa_admin_log` VALUES (126, 1, 'admin', '/ZHqYpmsotr.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"132\",\"params\":\"ismenu=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716545603);
INSERT INTO `fa_admin_log` VALUES (127, 1, 'admin', '/ZHqYpmsotr.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"133\",\"params\":\"ismenu=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716545607);
INSERT INTO `fa_admin_log` VALUES (128, 1, 'admin', '/ZHqYpmsotr.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"134\",\"params\":\"ismenu=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716545610);
INSERT INTO `fa_admin_log` VALUES (129, 1, 'admin', '/ZHqYpmsotr.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"135\",\"params\":\"ismenu=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716545613);
INSERT INTO `fa_admin_log` VALUES (130, 1, 'admin', '/ZHqYpmsotr.php/auth/group/roletree', '权限管理 / 角色组', '{\"id\":\"2\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716545644);
INSERT INTO `fa_admin_log` VALUES (131, 1, 'admin', '/ZHqYpmsotr.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"129\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716545659);
INSERT INTO `fa_admin_log` VALUES (132, 1, 'admin', '/ZHqYpmsotr.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"130\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716545664);
INSERT INTO `fa_admin_log` VALUES (133, 1, 'admin', '/ZHqYpmsotr.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"131\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716545671);
INSERT INTO `fa_admin_log` VALUES (134, 1, 'admin', '/ZHqYpmsotr.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"132\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716545685);
INSERT INTO `fa_admin_log` VALUES (135, 1, 'admin', '/ZHqYpmsotr.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"133\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716545723);
INSERT INTO `fa_admin_log` VALUES (136, 1, 'admin', '/ZHqYpmsotr.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"134\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716545728);
INSERT INTO `fa_admin_log` VALUES (137, 1, 'admin', '/ZHqYpmsotr.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"135\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716545733);
INSERT INTO `fa_admin_log` VALUES (138, 1, 'admin', '/ZHqYpmsotr.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"136\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716545737);
INSERT INTO `fa_admin_log` VALUES (139, 1, 'admin', '/ZHqYpmsotr.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"129\",\"params\":\"ismenu=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716545791);
INSERT INTO `fa_admin_log` VALUES (140, 1, 'admin', '/ZHqYpmsotr.php/test/add?dialog=1', '测试管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"user_id\":\"3\",\"category_id\":\"12\",\"category_ids\":\"12,13\",\"tags\":\"hehe\",\"week\":\"monday\",\"flag\":[\"index\"],\"genderdata\":\"male\",\"hobbydata\":[\"music\"],\"title\":\"kkk\",\"content\":\"ddd\",\"image\":\"\",\"images\":\"\",\"attachfile\":\"\",\"keywords\":\"\",\"description\":\"\",\"city\":\"\",\"array\":\"\",\"json\":\"\",\"multiplejson\":\"\",\"price\":\"0.00\",\"views\":\"0\",\"workrange\":\"\",\"startdate\":\"2024-05-24\",\"activitytime\":\"2024-05-24 18:17:42\",\"year\":\"2024\",\"times\":\"18:17:42\",\"refreshtime\":\"2024-05-24 18:17:42\",\"weigh\":\"0\",\"switch\":\"0\",\"status\":\"normal\",\"state\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716546008);
INSERT INTO `fa_admin_log` VALUES (141, 2, 'xiaoming', '/ZHqYpmsotr.php/index/login?url=/ZHqYpmsotr.php/test/index?ref=addtabs', '登录', '{\"url\":\"\\/ZHqYpmsotr.php\\/test\\/index?ref=addtabs\",\"__token__\":\"***\",\"username\":\"xiaoming\",\"password\":\"***\",\"captcha\":\"NEAJ\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716546100);
INSERT INTO `fa_admin_log` VALUES (142, 2, 'xiaoming', '/ZHqYpmsotr.php/index/login?url=/ZHqYpmsotr.php/test/index?ref=addtabs', '登录', '{\"url\":\"\\/ZHqYpmsotr.php\\/test\\/index?ref=addtabs\",\"__token__\":\"***\",\"username\":\"xiaoming\",\"password\":\"***\",\"captcha\":\"qKjC\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716546369);
INSERT INTO `fa_admin_log` VALUES (143, 1, 'admin', '/ZHqYpmsotr.php/index/login?url=/ZHqYpmsotr.php/general/attachment?ref=addtabs', '登录', '{\"url\":\"\\/ZHqYpmsotr.php\\/general\\/attachment?ref=addtabs\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"JKQA\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716546600);
INSERT INTO `fa_admin_log` VALUES (144, 1, 'admin', '/ZHqYpmsotr.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"3\",\"params\":\"ismenu=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716546662);
INSERT INTO `fa_admin_log` VALUES (145, 1, 'admin', '/ZHqYpmsotr.php/auth/group/roletree', '权限管理 / 角色组', '{\"id\":\"2\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716546702);
INSERT INTO `fa_admin_log` VALUES (146, 1, 'admin', '/ZHqYpmsotr.php/auth/group/edit/ids/2?dialog=1', '权限管理 / 角色组 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"rules\":\"1,2,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138\",\"pid\":\"1\",\"name\":\"二级管理组\",\"status\":\"normal\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716546793);
INSERT INTO `fa_admin_log` VALUES (147, 0, 'Unknown', '/ZHqYpmsotr.php/index/login?url=/ZHqYpmsotr.php/auth/group?ref=addtabs', '', '{\"url\":\"\\/ZHqYpmsotr.php\\/auth\\/group?ref=addtabs\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"Y4IB\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716546830);
INSERT INTO `fa_admin_log` VALUES (148, 1, 'admin', '/ZHqYpmsotr.php/index/login?url=/ZHqYpmsotr.php/auth/group?ref=addtabs', '登录', '{\"url\":\"\\/ZHqYpmsotr.php\\/auth\\/group?ref=addtabs\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"IBHA\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716546844);
INSERT INTO `fa_admin_log` VALUES (149, 1, 'admin', '/ZHqYpmsotr.php/auth/group/roletree', '权限管理 / 角色组', '{\"id\":\"2\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716546877);
INSERT INTO `fa_admin_log` VALUES (150, 1, 'admin', '/ZHqYpmsotr.php/test/add?dialog=1', '测试管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"user_id\":\"3\",\"category_id\":\"12\",\"category_ids\":\"13\",\"tags\":\"感到翻跟斗,范德萨\",\"week\":\"monday\",\"flag\":[\"recommend\"],\"genderdata\":\"male\",\"hobbydata\":[\"reading\"],\"title\":\"kkk\",\"content\":\"hhh\",\"image\":\"\",\"images\":\"\",\"attachfile\":\"\",\"keywords\":\"\",\"description\":\"\",\"city\":\"\",\"array\":\"\",\"json\":\"\",\"multiplejson\":\"\",\"price\":\"0.00\",\"views\":\"0\",\"workrange\":\"\",\"startdate\":\"2024-05-24\",\"activitytime\":\"2024-05-24 18:34:51\",\"year\":\"2024\",\"times\":\"18:34:51\",\"refreshtime\":\"2024-05-24 18:34:51\",\"weigh\":\"0\",\"switch\":\"0\",\"status\":\"normal\",\"state\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716546944);
INSERT INTO `fa_admin_log` VALUES (151, 0, 'Unknown', '/ZHqYpmsotr.php/index/login?url=/ZHqYpmsotr.php/test/index?ref=addtabs', '', '{\"url\":\"\\/ZHqYpmsotr.php\\/test\\/index?ref=addtabs\",\"__token__\":\"***\",\"username\":\"xiaoming\",\"password\":\"***\",\"captcha\":\"AXbB\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716547112);
INSERT INTO `fa_admin_log` VALUES (152, 2, 'xiaoming', '/ZHqYpmsotr.php/index/login?url=/ZHqYpmsotr.php/test/index?ref=addtabs', '登录', '{\"url\":\"\\/ZHqYpmsotr.php\\/test\\/index?ref=addtabs\",\"__token__\":\"***\",\"username\":\"xiaoming\",\"password\":\"***\",\"captcha\":\"BXHW\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716547123);
INSERT INTO `fa_admin_log` VALUES (153, 2, 'xiaoming', '/ZHqYpmsotr.php/test/add?dialog=1', '测试管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"user_id\":\"3\",\"category_id\":\"13\",\"category_ids\":\"13,12\",\"tags\":\"j,l\",\"week\":\"tuesday\",\"flag\":[\"index\"],\"genderdata\":\"male\",\"title\":\"\",\"content\":\"\",\"image\":\"\",\"images\":\"\",\"attachfile\":\"\",\"keywords\":\"\",\"description\":\"\",\"city\":\"\",\"array\":\"\",\"json\":\"\",\"multiplejson\":\"\",\"price\":\"0.00\",\"views\":\"0\",\"workrange\":\"\",\"startdate\":\"2024-05-24\",\"activitytime\":\"2024-05-24 18:38:51\",\"year\":\"2024\",\"times\":\"18:38:51\",\"refreshtime\":\"2024-05-24 18:38:51\",\"weigh\":\"0\",\"switch\":\"0\",\"status\":\"normal\",\"state\":\"1\",\"hobbydata\":[\"\"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716547158);
INSERT INTO `fa_admin_log` VALUES (154, 2, 'xiaoming', '/ZHqYpmsotr.php/auth/group/roletree', '权限管理 / 角色组', '{\"id\":\"3\",\"pid\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716547315);
INSERT INTO `fa_admin_log` VALUES (155, 2, 'xiaoming', '/ZHqYpmsotr.php/auth/group/edit/ids/3?dialog=1', '权限管理 / 角色组 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"rules\":\"66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138\",\"pid\":\"2\",\"name\":\"机构管理组\",\"status\":\"normal\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716547396);
INSERT INTO `fa_admin_log` VALUES (156, 2, 'xiaoming', '/ZHqYpmsotr.php/auth/admin/add?dialog=1', '权限管理 / 管理员管理 / 添加', '{\"dialog\":\"1\",\"__token__\":\"***\",\"group\":[\"3\"],\"row\":{\"username\":\"xiaoming2\",\"email\":\"jj@kk.com\",\"mobile\":\"13136310010\",\"nickname\":\"鄞州悦动方舟俱乐部\",\"password\":\"***\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716547521);
INSERT INTO `fa_admin_log` VALUES (157, 3, 'xiaoming2', '/ZHqYpmsotr.php/index/login?url=/ZHqYpmsotr.php/auth/admin?ref=addtabs', '登录', '{\"url\":\"\\/ZHqYpmsotr.php\\/auth\\/admin?ref=addtabs\",\"__token__\":\"***\",\"username\":\"xiaoming2\",\"password\":\"***\",\"captcha\":\"C6BY\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716547812);
INSERT INTO `fa_admin_log` VALUES (158, 3, 'xiaoming2', '/ZHqYpmsotr.php/test/add?dialog=1', '测试管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"user_id\":\"3\",\"category_id\":\"13\",\"category_ids\":\"13,12\",\"tags\":\"s\",\"week\":\"monday\",\"genderdata\":\"male\",\"title\":\"悦动方舟学员（悦动添加）\",\"content\":\"\",\"image\":\"\",\"images\":\"\",\"attachfile\":\"\",\"keywords\":\"\",\"description\":\"\",\"city\":\"\",\"array\":\"\",\"json\":\"\",\"multiplejson\":\"\",\"price\":\"0.00\",\"views\":\"0\",\"workrange\":\"\",\"startdate\":\"2024-05-24\",\"activitytime\":\"2024-05-24 18:50:34\",\"year\":\"2024\",\"times\":\"18:50:34\",\"refreshtime\":\"2024-05-24 18:50:34\",\"weigh\":\"0\",\"switch\":\"0\",\"status\":\"normal\",\"state\":\"1\",\"flag\":[\"\"],\"hobbydata\":[\"\"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716547879);
INSERT INTO `fa_admin_log` VALUES (159, 2, 'xiaoming', '/ZHqYpmsotr.php/index/login?url=/ZHqYpmsotr.php/test/index?ref=addtabs', '登录', '{\"url\":\"\\/ZHqYpmsotr.php\\/test\\/index?ref=addtabs\",\"__token__\":\"***\",\"username\":\"xiaoming\",\"password\":\"***\",\"captcha\":\"YUQV\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716547917);
INSERT INTO `fa_admin_log` VALUES (160, 2, 'xiaoming', '/ZHqYpmsotr.php/addon/install', '插件管理', '{\"name\":\"qrcode\",\"force\":\"0\",\"uid\":\"85636\",\"token\":\"***\",\"version\":\"1.0.7\",\"faversion\":\"1.5.0.20240328\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716588789);
INSERT INTO `fa_admin_log` VALUES (161, 1, 'admin', '/ZHqYpmsotr.php/index/login?url=/ZHqYpmsotr.php/ygame/project?ref=addtabs', '登录', '{\"url\":\"\\/ZHqYpmsotr.php\\/ygame\\/project?ref=addtabs\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"V5BK\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716589139);
INSERT INTO `fa_admin_log` VALUES (162, 1, 'admin', '/ZHqYpmsotr.php/addon/install', '插件管理', '{\"name\":\"invite\",\"force\":\"0\",\"uid\":\"85636\",\"token\":\"***\",\"version\":\"1.0.1\",\"faversion\":\"1.5.0.20240328\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716589287);
INSERT INTO `fa_admin_log` VALUES (163, 1, 'admin', '/ZHqYpmsotr.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"invite\",\"action\":\"enable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716589288);
INSERT INTO `fa_admin_log` VALUES (164, 1, 'admin', '/ZHqYpmsotr.php/index/login?url=/ZHqYpmsotr.php/addon?ref=addtabs', '登录', '{\"url\":\"\\/ZHqYpmsotr.php\\/addon?ref=addtabs\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"abKK\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716589614);
INSERT INTO `fa_admin_log` VALUES (165, 1, 'admin', '/ZHqYpmsotr.php/addon/config?name=invite&dialog=1', '插件管理 / 配置', '{\"name\":\"invite\",\"dialog\":\"1\",\"row\":{\"rewardscore\":\"10\",\"invitedscore\":\"10\",\"dailymaxinvite\":\"0\",\"filtermode\":\"basic\",\"rewrite\":\"{&quot;index\\\\\\/index&quot;:&quot;\\\\\\/invite\\\\\\/[:id]$&quot;}\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716589640);
INSERT INTO `fa_admin_log` VALUES (166, 1, 'admin', '/ZHqYpmsotr.php/addon/install', '插件管理', '{\"name\":\"qrcode\",\"force\":\"0\",\"uid\":\"85636\",\"token\":\"***\",\"version\":\"1.0.7\",\"faversion\":\"1.5.0.20240328\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716589871);
INSERT INTO `fa_admin_log` VALUES (167, 1, 'admin', '/ZHqYpmsotr.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"qrcode\",\"action\":\"enable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716589871);
INSERT INTO `fa_admin_log` VALUES (168, 1, 'admin', '/ZHqYpmsotr.php/index/login?url=/ZHqYpmsotr.php/addon?ref=addtabs', '登录', '{\"url\":\"\\/ZHqYpmsotr.php\\/addon?ref=addtabs\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"SQWa\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716589955);
INSERT INTO `fa_admin_log` VALUES (169, 1, 'admin', '/ZHqYpmsotr.php/auth/group/roletree', '权限管理 / 角色组', '{\"id\":\"2\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716590005);
INSERT INTO `fa_admin_log` VALUES (170, 1, 'admin', '/ZHqYpmsotr.php/addon/config?name=qrcode&dialog=1', '插件管理 / 配置', '{\"name\":\"qrcode\",\"dialog\":\"1\",\"row\":{\"text\":\"Hello world!\",\"size\":\"300\",\"padding\":\"15\",\"format\":\"png\",\"errorlevel\":\"medium\",\"foreground\":\"#000000\",\"background\":\"#ffffff\",\"label\":\"\",\"labelfontsize\":\"14\",\"labelfontpath\":\"\\/assets\\/fonts\\/SourceHanSansK-Regular.ttf\",\"labelalignment\":\"center\",\"logo\":\"0\",\"logopath\":\"\\/assets\\/img\\/qrcode.png\",\"logosize\":\"50\",\"writefile\":\"0\",\"limitreferer\":\"0\",\"allowemptyreferer\":\"0\",\"allowrefererlist\":\"\",\"rewrite\":\"{&quot;index\\\\\\/index&quot;:&quot;\\\\\\/qrcode$&quot;,&quot;index\\\\\\/build&quot;:&quot;\\\\\\/qrcode\\\\\\/build$&quot;}\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716590217);
INSERT INTO `fa_admin_log` VALUES (171, 1, 'admin', '/ZHqYpmsotr.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"qrcode\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716590436);
INSERT INTO `fa_admin_log` VALUES (172, 1, 'admin', '/ZHqYpmsotr.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"qrcode\",\"action\":\"enable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.289 Safari/537.36', 1716590438);
INSERT INTO `fa_admin_log` VALUES (173, 1, 'admin', '/ZHqYpmsotr.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"qrcode\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716591179);
INSERT INTO `fa_admin_log` VALUES (174, 1, 'admin', '/ZHqYpmsotr.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"qrcode\",\"action\":\"enable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716591181);
INSERT INTO `fa_admin_log` VALUES (175, 1, 'admin', '/ZHqYpmsotr.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"invite\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716591184);
INSERT INTO `fa_admin_log` VALUES (176, 1, 'admin', '/ZHqYpmsotr.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"invite\",\"action\":\"enable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716591186);
INSERT INTO `fa_admin_log` VALUES (177, 1, 'admin', '/ZHqYpmsotr.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"command\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716591189);
INSERT INTO `fa_admin_log` VALUES (178, 1, 'admin', '/ZHqYpmsotr.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"command\",\"action\":\"enable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716591191);
INSERT INTO `fa_admin_log` VALUES (179, 1, 'admin', '/ZHqYpmsotr.php/user/group/edit/ids/2?dialog=1', '会员管理 / 会员分组 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"rules\":\"11,10,9,12,7,6,5,8,4,2,3,1\",\"name\":\"领队组\",\"status\":\"normal\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716626836);
INSERT INTO `fa_admin_log` VALUES (180, 1, 'admin', '/ZHqYpmsotr.php/user/group/add?dialog=1', '会员管理 / 会员分组 / 添加', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"rules\":\"2,4,11,10,9,12,1,3,7,6,5,8\",\"name\":\"教练组\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716626859);
INSERT INTO `fa_admin_log` VALUES (181, 1, 'admin', '/ZHqYpmsotr.php/user/group/add?dialog=1', '会员管理 / 会员分组 / 添加', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"rules\":\"2,4,11,10,9,12,1,3,7,6,5,8\",\"name\":\"家长组\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716626896);
INSERT INTO `fa_admin_log` VALUES (182, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716627150);
INSERT INTO `fa_admin_log` VALUES (183, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_team\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716627188);
INSERT INTO `fa_admin_log` VALUES (184, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_ygame_team\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716627199);
INSERT INTO `fa_admin_log` VALUES (185, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_ygame_team\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716627202);
INSERT INTO `fa_admin_log` VALUES (186, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716627219);
INSERT INTO `fa_admin_log` VALUES (187, 1, 'admin', '/ZHqYpmsotr.php/command/execute/ids/8', '在线命令管理 / 再次执行命令', '{\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716627294);
INSERT INTO `fa_admin_log` VALUES (188, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716627301);
INSERT INTO `fa_admin_log` VALUES (189, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_team\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716627309);
INSERT INTO `fa_admin_log` VALUES (190, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_ygame_team\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716627316);
INSERT INTO `fa_admin_log` VALUES (191, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_ygame_team\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716627318);
INSERT INTO `fa_admin_log` VALUES (192, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716627398);
INSERT INTO `fa_admin_log` VALUES (193, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716627411);
INSERT INTO `fa_admin_log` VALUES (194, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716627417);
INSERT INTO `fa_admin_log` VALUES (195, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716627424);
INSERT INTO `fa_admin_log` VALUES (196, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716627426);
INSERT INTO `fa_admin_log` VALUES (197, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"ygame\\/Team.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716627429);
INSERT INTO `fa_admin_log` VALUES (198, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"ygame\\/Team.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716627432);
INSERT INTO `fa_admin_log` VALUES (199, 1, 'admin', '/ZHqYpmsotr.php/user/group/add?dialog=1', '会员管理 / 会员分组 / 添加', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"rules\":\"2,4,11,10,9,12,1,3,7,6,5,8\",\"name\":\"裁判组\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716628194);
INSERT INTO `fa_admin_log` VALUES (200, 1, 'admin', '/ZHqYpmsotr.php/user/group/add?dialog=1', '会员管理 / 会员分组 / 添加', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"rules\":\"2,4,11,10,9,12,1,3,7,6,5,8\",\"name\":\"编排长\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716628327);
INSERT INTO `fa_admin_log` VALUES (201, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716630837);
INSERT INTO `fa_admin_log` VALUES (202, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_project\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716630862);
INSERT INTO `fa_admin_log` VALUES (203, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716630898);
INSERT INTO `fa_admin_log` VALUES (204, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"api\",\"force\":\"1\",\"url\":\"\",\"output\":\"\",\"template\":\"\",\"language\":\"\",\"title\":\"\",\"author\":\"\",\"module\":\"\",\"addon\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716630922);
INSERT INTO `fa_admin_log` VALUES (205, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"api\",\"force\":\"1\",\"url\":\"\",\"output\":\"\",\"template\":\"\",\"language\":\"\",\"title\":\"\",\"author\":\"\",\"module\":\"\",\"addon\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716630940);
INSERT INTO `fa_admin_log` VALUES (206, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716631558);
INSERT INTO `fa_admin_log` VALUES (207, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716635327);
INSERT INTO `fa_admin_log` VALUES (208, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_mjtest\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716635340);
INSERT INTO `fa_admin_log` VALUES (209, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_mjtest\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716635356);
INSERT INTO `fa_admin_log` VALUES (210, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_mjtest\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716635358);
INSERT INTO `fa_admin_log` VALUES (211, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716635379);
INSERT INTO `fa_admin_log` VALUES (212, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716635382);
INSERT INTO `fa_admin_log` VALUES (213, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716635386);
INSERT INTO `fa_admin_log` VALUES (214, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716635387);
INSERT INTO `fa_admin_log` VALUES (215, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716635389);
INSERT INTO `fa_admin_log` VALUES (216, 1, 'admin', '/ZHqYpmsotr.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716635394);
INSERT INTO `fa_admin_log` VALUES (217, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Mjtest.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716635397);
INSERT INTO `fa_admin_log` VALUES (218, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Mjtest.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716635398);
INSERT INTO `fa_admin_log` VALUES (219, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"api\",\"force\":\"1\",\"url\":\"\",\"output\":\"\",\"template\":\"\",\"language\":\"\",\"title\":\"\",\"author\":\"\",\"module\":\"\",\"addon\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716635425);
INSERT INTO `fa_admin_log` VALUES (220, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"api\",\"force\":\"1\",\"url\":\"\",\"output\":\"\",\"template\":\"\",\"language\":\"\",\"title\":\"\",\"author\":\"\",\"module\":\"\",\"addon\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716635427);
INSERT INTO `fa_admin_log` VALUES (221, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_mjtest\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716635488);
INSERT INTO `fa_admin_log` VALUES (222, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716635503);
INSERT INTO `fa_admin_log` VALUES (223, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716635503);
INSERT INTO `fa_admin_log` VALUES (224, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716635504);
INSERT INTO `fa_admin_log` VALUES (225, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716635504);
INSERT INTO `fa_admin_log` VALUES (226, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716635510);
INSERT INTO `fa_admin_log` VALUES (227, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716635511);
INSERT INTO `fa_admin_log` VALUES (228, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716636751);
INSERT INTO `fa_admin_log` VALUES (229, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_mjtest\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716636764);
INSERT INTO `fa_admin_log` VALUES (230, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_mjtest\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716636770);
INSERT INTO `fa_admin_log` VALUES (231, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716636787);
INSERT INTO `fa_admin_log` VALUES (232, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716636787);
INSERT INTO `fa_admin_log` VALUES (233, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716636788);
INSERT INTO `fa_admin_log` VALUES (234, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716636788);
INSERT INTO `fa_admin_log` VALUES (235, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716636925);
INSERT INTO `fa_admin_log` VALUES (236, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716636925);
INSERT INTO `fa_admin_log` VALUES (237, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716636935);
INSERT INTO `fa_admin_log` VALUES (238, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_mjtest\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"fa_user\",\"relationmode\":\"hasone\",\"relationforeignkey\":\"id\",\"relationprimarykey\":\"leader_id\"}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637003);
INSERT INTO `fa_admin_log` VALUES (239, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_mjtest\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"fa_user\",\"relationmode\":\"hasone\",\"relationforeignkey\":\"id\",\"relationprimarykey\":\"leader_id\"}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637007);
INSERT INTO `fa_admin_log` VALUES (240, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637211);
INSERT INTO `fa_admin_log` VALUES (241, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637251);
INSERT INTO `fa_admin_log` VALUES (242, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_mjtest\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637264);
INSERT INTO `fa_admin_log` VALUES (243, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637272);
INSERT INTO `fa_admin_log` VALUES (244, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637272);
INSERT INTO `fa_admin_log` VALUES (245, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637272);
INSERT INTO `fa_admin_log` VALUES (246, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637272);
INSERT INTO `fa_admin_log` VALUES (247, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637280);
INSERT INTO `fa_admin_log` VALUES (248, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637280);
INSERT INTO `fa_admin_log` VALUES (249, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637281);
INSERT INTO `fa_admin_log` VALUES (250, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637281);
INSERT INTO `fa_admin_log` VALUES (251, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637288);
INSERT INTO `fa_admin_log` VALUES (252, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637289);
INSERT INTO `fa_admin_log` VALUES (253, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637292);
INSERT INTO `fa_admin_log` VALUES (254, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637346);
INSERT INTO `fa_admin_log` VALUES (255, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637352);
INSERT INTO `fa_admin_log` VALUES (256, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637355);
INSERT INTO `fa_admin_log` VALUES (257, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637361);
INSERT INTO `fa_admin_log` VALUES (258, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637375);
INSERT INTO `fa_admin_log` VALUES (259, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_mjtest\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"3\":{\"relation\":\"fa_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"leader_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"username\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637441);
INSERT INTO `fa_admin_log` VALUES (260, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_mjtest\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"3\":{\"relation\":\"fa_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"leader_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"username\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637443);
INSERT INTO `fa_admin_log` VALUES (261, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637619);
INSERT INTO `fa_admin_log` VALUES (262, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_mjtest\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637625);
INSERT INTO `fa_admin_log` VALUES (263, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637628);
INSERT INTO `fa_admin_log` VALUES (264, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637628);
INSERT INTO `fa_admin_log` VALUES (265, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637628);
INSERT INTO `fa_admin_log` VALUES (266, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637628);
INSERT INTO `fa_admin_log` VALUES (267, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637633);
INSERT INTO `fa_admin_log` VALUES (268, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637633);
INSERT INTO `fa_admin_log` VALUES (269, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_mjtest\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"fa_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"leader_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"nickname\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637749);
INSERT INTO `fa_admin_log` VALUES (270, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_mjtest\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"fa_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"leader_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"nickname\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637750);
INSERT INTO `fa_admin_log` VALUES (271, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637771);
INSERT INTO `fa_admin_log` VALUES (272, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_mjtest\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637776);
INSERT INTO `fa_admin_log` VALUES (273, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637783);
INSERT INTO `fa_admin_log` VALUES (274, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637783);
INSERT INTO `fa_admin_log` VALUES (275, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637783);
INSERT INTO `fa_admin_log` VALUES (276, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637783);
INSERT INTO `fa_admin_log` VALUES (277, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637787);
INSERT INTO `fa_admin_log` VALUES (278, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637788);
INSERT INTO `fa_admin_log` VALUES (279, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_mjtest\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"fa_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"leader_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"nickname\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637799);
INSERT INTO `fa_admin_log` VALUES (280, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_mjtest\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"fa_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"leader_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"nickname\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637800);
INSERT INTO `fa_admin_log` VALUES (281, 1, 'admin', '/ZHqYpmsotr.php/command/del', '在线命令管理 / 删除', '{\"action\":\"del\",\"ids\":\"18\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637827);
INSERT INTO `fa_admin_log` VALUES (282, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637832);
INSERT INTO `fa_admin_log` VALUES (283, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_mjtest\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637838);
INSERT INTO `fa_admin_log` VALUES (284, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637842);
INSERT INTO `fa_admin_log` VALUES (285, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637842);
INSERT INTO `fa_admin_log` VALUES (286, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637843);
INSERT INTO `fa_admin_log` VALUES (287, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637843);
INSERT INTO `fa_admin_log` VALUES (288, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637848);
INSERT INTO `fa_admin_log` VALUES (289, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637849);
INSERT INTO `fa_admin_log` VALUES (290, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_mjtest\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"fa_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"leader_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"group_id\",\"username\",\"nickname\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637871);
INSERT INTO `fa_admin_log` VALUES (291, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_mjtest\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"fa_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"leader_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"group_id\",\"username\",\"nickname\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637873);
INSERT INTO `fa_admin_log` VALUES (292, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_mjtest\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"user_id\",\"leader_id\",\"user_name\",\"leader_name\"],\"relation\":{\"2\":{\"relation\":\"fa_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"leader_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"group_id\",\"username\",\"nickname\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637930);
INSERT INTO `fa_admin_log` VALUES (293, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_mjtest\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"user_id\",\"leader_id\",\"user_name\",\"leader_name\"],\"relation\":{\"2\":{\"relation\":\"fa_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"leader_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"group_id\",\"username\",\"nickname\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716637938);
INSERT INTO `fa_admin_log` VALUES (294, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716638014);
INSERT INTO `fa_admin_log` VALUES (295, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716638059);
INSERT INTO `fa_admin_log` VALUES (296, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_mjtest\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716638064);
INSERT INTO `fa_admin_log` VALUES (297, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716638067);
INSERT INTO `fa_admin_log` VALUES (298, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716638068);
INSERT INTO `fa_admin_log` VALUES (299, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716638068);
INSERT INTO `fa_admin_log` VALUES (300, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716638068);
INSERT INTO `fa_admin_log` VALUES (301, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716638072);
INSERT INTO `fa_admin_log` VALUES (302, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716638073);
INSERT INTO `fa_admin_log` VALUES (303, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_mjtest\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"fa_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"leader_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"username\",\"nickname\",\"mobile\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716638089);
INSERT INTO `fa_admin_log` VALUES (304, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_mjtest\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"fa_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"leader_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"username\",\"nickname\",\"mobile\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716638095);
INSERT INTO `fa_admin_log` VALUES (305, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716638494);
INSERT INTO `fa_admin_log` VALUES (306, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_team\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716638498);
INSERT INTO `fa_admin_log` VALUES (307, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716638504);
INSERT INTO `fa_admin_log` VALUES (308, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716638504);
INSERT INTO `fa_admin_log` VALUES (309, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716638505);
INSERT INTO `fa_admin_log` VALUES (310, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716638505);
INSERT INTO `fa_admin_log` VALUES (311, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_project\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716638519);
INSERT INTO `fa_admin_log` VALUES (312, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_project\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716638519);
INSERT INTO `fa_admin_log` VALUES (313, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716638570);
INSERT INTO `fa_admin_log` VALUES (314, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716638570);
INSERT INTO `fa_admin_log` VALUES (315, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716638570);
INSERT INTO `fa_admin_log` VALUES (316, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716638570);
INSERT INTO `fa_admin_log` VALUES (317, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716638577);
INSERT INTO `fa_admin_log` VALUES (318, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716638578);
INSERT INTO `fa_admin_log` VALUES (319, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716639153);
INSERT INTO `fa_admin_log` VALUES (320, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_team\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716639159);
INSERT INTO `fa_admin_log` VALUES (321, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716639167);
INSERT INTO `fa_admin_log` VALUES (322, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716639167);
INSERT INTO `fa_admin_log` VALUES (323, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716639167);
INSERT INTO `fa_admin_log` VALUES (324, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716639168);
INSERT INTO `fa_admin_log` VALUES (325, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_project\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716639184);
INSERT INTO `fa_admin_log` VALUES (326, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_project\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716639185);
INSERT INTO `fa_admin_log` VALUES (327, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716639195);
INSERT INTO `fa_admin_log` VALUES (328, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716639195);
INSERT INTO `fa_admin_log` VALUES (329, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716639195);
INSERT INTO `fa_admin_log` VALUES (330, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716639196);
INSERT INTO `fa_admin_log` VALUES (331, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716639202);
INSERT INTO `fa_admin_log` VALUES (332, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716639202);
INSERT INTO `fa_admin_log` VALUES (333, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716639339);
INSERT INTO `fa_admin_log` VALUES (334, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716639339);
INSERT INTO `fa_admin_log` VALUES (335, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716639340);
INSERT INTO `fa_admin_log` VALUES (336, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716639340);
INSERT INTO `fa_admin_log` VALUES (337, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_ygame_team\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"fa_ygame_project\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"project_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"project_name\"]},\"3\":{\"relation\":\"fa_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"trainer_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"nickname\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716639638);
INSERT INTO `fa_admin_log` VALUES (338, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_ygame_team\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"fa_ygame_project\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"project_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"project_name\"]},\"3\":{\"relation\":\"fa_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"trainer_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"nickname\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716639641);
INSERT INTO `fa_admin_log` VALUES (339, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641048);
INSERT INTO `fa_admin_log` VALUES (340, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_team\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641053);
INSERT INTO `fa_admin_log` VALUES (341, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641056);
INSERT INTO `fa_admin_log` VALUES (342, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641056);
INSERT INTO `fa_admin_log` VALUES (343, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641056);
INSERT INTO `fa_admin_log` VALUES (344, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641057);
INSERT INTO `fa_admin_log` VALUES (345, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_project\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641066);
INSERT INTO `fa_admin_log` VALUES (346, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_project\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641067);
INSERT INTO `fa_admin_log` VALUES (347, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_ygame_team\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"fa_ygame_project\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"project_id\",\"relationprimarykey\":\"id\"}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641141);
INSERT INTO `fa_admin_log` VALUES (348, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_ygame_team\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"fa_ygame_project\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"project_id\",\"relationprimarykey\":\"id\"}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641146);
INSERT INTO `fa_admin_log` VALUES (349, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641598);
INSERT INTO `fa_admin_log` VALUES (350, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_team\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641606);
INSERT INTO `fa_admin_log` VALUES (351, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641607);
INSERT INTO `fa_admin_log` VALUES (352, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641608);
INSERT INTO `fa_admin_log` VALUES (353, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641608);
INSERT INTO `fa_admin_log` VALUES (354, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641608);
INSERT INTO `fa_admin_log` VALUES (355, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_project\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641613);
INSERT INTO `fa_admin_log` VALUES (356, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_project\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641613);
INSERT INTO `fa_admin_log` VALUES (357, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641619);
INSERT INTO `fa_admin_log` VALUES (358, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641619);
INSERT INTO `fa_admin_log` VALUES (359, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641620);
INSERT INTO `fa_admin_log` VALUES (360, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641620);
INSERT INTO `fa_admin_log` VALUES (361, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641632);
INSERT INTO `fa_admin_log` VALUES (362, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641633);
INSERT INTO `fa_admin_log` VALUES (363, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_ygame_team\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"fa_ygame_project\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"project_id\",\"relationprimarykey\":\"id\"},\"3\":{\"relation\":\"fa_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"trainer_id\",\"relationprimarykey\":\"id\"}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641684);
INSERT INTO `fa_admin_log` VALUES (364, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_ygame_team\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"fa_ygame_project\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"project_id\",\"relationprimarykey\":\"id\"},\"3\":{\"relation\":\"fa_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"trainer_id\",\"relationprimarykey\":\"id\"}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716641690);
INSERT INTO `fa_admin_log` VALUES (365, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642032);
INSERT INTO `fa_admin_log` VALUES (366, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_mjtest\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642039);
INSERT INTO `fa_admin_log` VALUES (367, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_team\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642045);
INSERT INTO `fa_admin_log` VALUES (368, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642047);
INSERT INTO `fa_admin_log` VALUES (369, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642047);
INSERT INTO `fa_admin_log` VALUES (370, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642047);
INSERT INTO `fa_admin_log` VALUES (371, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642047);
INSERT INTO `fa_admin_log` VALUES (372, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_project\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642068);
INSERT INTO `fa_admin_log` VALUES (373, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_project\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642068);
INSERT INTO `fa_admin_log` VALUES (374, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642080);
INSERT INTO `fa_admin_log` VALUES (375, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642081);
INSERT INTO `fa_admin_log` VALUES (376, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642081);
INSERT INTO `fa_admin_log` VALUES (377, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642081);
INSERT INTO `fa_admin_log` VALUES (378, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642086);
INSERT INTO `fa_admin_log` VALUES (379, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642087);
INSERT INTO `fa_admin_log` VALUES (380, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642113);
INSERT INTO `fa_admin_log` VALUES (381, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642113);
INSERT INTO `fa_admin_log` VALUES (382, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642113);
INSERT INTO `fa_admin_log` VALUES (383, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642114);
INSERT INTO `fa_admin_log` VALUES (384, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_ygame_team\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"fa_ygame_project\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"project_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"project_name\"]},\"3\":{\"relation\":\"fa_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"trainer_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"nickname\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642118);
INSERT INTO `fa_admin_log` VALUES (385, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_ygame_team\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"fa_ygame_project\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"project_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"project_name\"]},\"3\":{\"relation\":\"fa_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"trainer_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"nickname\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642120);
INSERT INTO `fa_admin_log` VALUES (386, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642536);
INSERT INTO `fa_admin_log` VALUES (387, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_team\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642543);
INSERT INTO `fa_admin_log` VALUES (388, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642550);
INSERT INTO `fa_admin_log` VALUES (389, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642550);
INSERT INTO `fa_admin_log` VALUES (390, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642550);
INSERT INTO `fa_admin_log` VALUES (391, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642550);
INSERT INTO `fa_admin_log` VALUES (392, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin_log\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642551);
INSERT INTO `fa_admin_log` VALUES (393, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin_log\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642551);
INSERT INTO `fa_admin_log` VALUES (394, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin_log\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642551);
INSERT INTO `fa_admin_log` VALUES (395, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin_log\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642552);
INSERT INTO `fa_admin_log` VALUES (396, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_project\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642578);
INSERT INTO `fa_admin_log` VALUES (397, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_project\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642578);
INSERT INTO `fa_admin_log` VALUES (398, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642605);
INSERT INTO `fa_admin_log` VALUES (399, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642606);
INSERT INTO `fa_admin_log` VALUES (400, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642617);
INSERT INTO `fa_admin_log` VALUES (401, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642618);
INSERT INTO `fa_admin_log` VALUES (402, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642618);
INSERT INTO `fa_admin_log` VALUES (403, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642618);
INSERT INTO `fa_admin_log` VALUES (404, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_ygame_team\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"fa_ygame_project\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"project_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"project_name\"]},\"3\":{\"relation\":\"fa_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"user_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"nickname\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642634);
INSERT INTO `fa_admin_log` VALUES (405, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_ygame_team\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"fa_ygame_project\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"project_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"project_name\"]},\"3\":{\"relation\":\"fa_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"user_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"nickname\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716642636);
INSERT INTO `fa_admin_log` VALUES (406, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643147);
INSERT INTO `fa_admin_log` VALUES (407, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_team\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643152);
INSERT INTO `fa_admin_log` VALUES (408, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643157);
INSERT INTO `fa_admin_log` VALUES (409, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643157);
INSERT INTO `fa_admin_log` VALUES (410, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643157);
INSERT INTO `fa_admin_log` VALUES (411, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643157);
INSERT INTO `fa_admin_log` VALUES (412, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_project\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643166);
INSERT INTO `fa_admin_log` VALUES (413, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_project\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643167);
INSERT INTO `fa_admin_log` VALUES (414, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643170);
INSERT INTO `fa_admin_log` VALUES (415, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643170);
INSERT INTO `fa_admin_log` VALUES (416, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643171);
INSERT INTO `fa_admin_log` VALUES (417, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643171);
INSERT INTO `fa_admin_log` VALUES (418, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643177);
INSERT INTO `fa_admin_log` VALUES (419, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643177);
INSERT INTO `fa_admin_log` VALUES (420, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643219);
INSERT INTO `fa_admin_log` VALUES (421, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643219);
INSERT INTO `fa_admin_log` VALUES (422, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643219);
INSERT INTO `fa_admin_log` VALUES (423, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643219);
INSERT INTO `fa_admin_log` VALUES (424, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643324);
INSERT INTO `fa_admin_log` VALUES (425, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643328);
INSERT INTO `fa_admin_log` VALUES (426, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_team\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643333);
INSERT INTO `fa_admin_log` VALUES (427, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643337);
INSERT INTO `fa_admin_log` VALUES (428, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643338);
INSERT INTO `fa_admin_log` VALUES (429, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643338);
INSERT INTO `fa_admin_log` VALUES (430, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643338);
INSERT INTO `fa_admin_log` VALUES (431, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_project\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643345);
INSERT INTO `fa_admin_log` VALUES (432, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_project\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643346);
INSERT INTO `fa_admin_log` VALUES (433, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643359);
INSERT INTO `fa_admin_log` VALUES (434, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643359);
INSERT INTO `fa_admin_log` VALUES (435, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643359);
INSERT INTO `fa_admin_log` VALUES (436, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643359);
INSERT INTO `fa_admin_log` VALUES (437, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643367);
INSERT INTO `fa_admin_log` VALUES (438, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643367);
INSERT INTO `fa_admin_log` VALUES (439, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643400);
INSERT INTO `fa_admin_log` VALUES (440, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643401);
INSERT INTO `fa_admin_log` VALUES (441, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643401);
INSERT INTO `fa_admin_log` VALUES (442, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643401);
INSERT INTO `fa_admin_log` VALUES (443, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_ygame_team\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"fa_ygame_project\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"project_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"project_name\"]},\"3\":{\"relation\":\"fa_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"trainer_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"nickname\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643403);
INSERT INTO `fa_admin_log` VALUES (444, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_ygame_team\",\"controller\":\"\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"fa_ygame_project\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"project_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"project_name\"]},\"3\":{\"relation\":\"fa_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"trainer_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"nickname\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643406);
INSERT INTO `fa_admin_log` VALUES (445, 1, 'admin', '/ZHqYpmsotr.php/ygame/team/add?dialog=1', '报名系统 / Team / 添加', '{\"dialog\":\"1\",\"row\":{\"user_id\":\"2\",\"project_id\":\"1\",\"team_name\":\"某某代表队\",\"leader\":\"某某\",\"mobile\":\"111\",\"trainer_id\":\"2\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643645);
INSERT INTO `fa_admin_log` VALUES (446, 1, 'admin', '/ZHqYpmsotr.php/ygame/team/edit/ids/2?dialog=1', '报名系统 / Team / 编辑', '{\"dialog\":\"1\",\"row\":{\"user_id\":\"3\",\"project_id\":\"1\",\"team_name\":\"某某代表队\",\"leader\":\"某某\",\"mobile\":\"111\",\"trainer_id\":\"2\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716643700);
INSERT INTO `fa_admin_log` VALUES (447, 1, 'admin', '/ZHqYpmsotr.php/user/user/edit/ids/2?dialog=1', '会员管理 / 会员管理 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"id\":\"2\",\"group_id\":\"2\",\"username\":\"huiyuan\",\"nickname\":\"huiyuan\",\"password\":\"***\",\"email\":\"317572877@qq.com\",\"mobile\":\"13136310001\",\"avatar\":\"\",\"level\":\"1\",\"gender\":\"0\",\"birthday\":\"\",\"bio\":\"\",\"money\":\"0.00\",\"score\":\"0\",\"successions\":\"1\",\"maxsuccessions\":\"1\",\"prevtime\":\"2024-05-15 01:24:28\",\"logintime\":\"2024-05-23 16:41:48\",\"loginip\":\"127.0.0.1\",\"loginfailure\":\"0\",\"joinip\":\"127.0.0.1\",\"jointime\":\"2024-05-15 01:24:28\",\"status\":\"normal\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716644315);
INSERT INTO `fa_admin_log` VALUES (448, 1, 'admin', '/ZHqYpmsotr.php/user/user/edit/ids/2?dialog=1', '会员管理 / 会员管理 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"id\":\"2\",\"group_id\":\"2\",\"username\":\"huiyuan\",\"nickname\":\"肖领队\",\"password\":\"***\",\"email\":\"317572877@qq.com\",\"mobile\":\"13136310001\",\"avatar\":\"\",\"level\":\"1\",\"gender\":\"0\",\"birthday\":\"\",\"bio\":\"\",\"money\":\"0.00\",\"score\":\"0\",\"successions\":\"1\",\"maxsuccessions\":\"1\",\"prevtime\":\"2024-05-15 01:24:28\",\"logintime\":\"2024-05-23 16:41:48\",\"loginip\":\"127.0.0.1\",\"loginfailure\":\"0\",\"joinip\":\"127.0.0.1\",\"jointime\":\"2024-05-15 01:24:28\",\"status\":\"normal\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716644339);
INSERT INTO `fa_admin_log` VALUES (449, 1, 'admin', '/ZHqYpmsotr.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"SMCZ\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716649211);
INSERT INTO `fa_admin_log` VALUES (450, 1, 'admin', '/ZHqYpmsotr.php/ajax/upload', '', '{\"category\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716649275);
INSERT INTO `fa_admin_log` VALUES (451, 1, 'admin', '/ZHqYpmsotr.php/ygame/project/add?dialog=1', '报名系统 / 赛事管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"project_name\":\"第3个测试赛事\",\"start_time\":\"2024-05-25 23:00:37\",\"end_time\":\"2024-05-31 23:00:37\",\"game_time\":\"2024-05-31 23:00:51\",\"game_address\":\"南天门\",\"min_team_num\":\"1\",\"image\":\"\\/uploads\\/20240525\\/9c420183d3721ad869bc980cc7c43102.png\",\"agreement\":\"协议\",\"content\":\"介绍\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716649287);
INSERT INTO `fa_admin_log` VALUES (452, 1, 'admin', '/ZHqYpmsotr.php/ygame/project/edit/ids/2?dialog=1', '报名系统 / 赛事管理 / 编辑', '{\"dialog\":\"1\",\"row\":{\"project_name\":\"第二个测试赛事\",\"start_time\":\"2024-05-22 19:40:38\",\"end_time\":\"2024-05-23 19:40:47\",\"game_time\":\"2024-05-28 19:40:57\",\"game_address\":\"待定\",\"min_team_num\":\"1\",\"image\":\"\\/uploads\\/20240515\\/9467fad63608835514ad8de19753499d.png\",\"agreement\":\"赛事协议\",\"content\":\"赛事介绍\",\"status\":\"1\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716660620);
INSERT INTO `fa_admin_log` VALUES (453, 1, 'admin', '/ZHqYpmsotr.php/ygame/project/edit/ids/2?dialog=1', '报名系统 / 赛事管理 / 编辑', '{\"dialog\":\"1\",\"row\":{\"project_name\":\"第二个测试赛事\",\"start_time\":\"2024-05-22 19:40:38\",\"end_time\":\"2024-05-27 19:40:47\",\"game_time\":\"2024-05-28 19:40:57\",\"game_address\":\"待定\",\"min_team_num\":\"1\",\"image\":\"\\/uploads\\/20240515\\/9467fad63608835514ad8de19753499d.png\",\"agreement\":\"赛事协议\",\"content\":\"赛事介绍\",\"status\":\"1\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716660653);
INSERT INTO `fa_admin_log` VALUES (454, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716669097);
INSERT INTO `fa_admin_log` VALUES (455, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_person\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716669110);
INSERT INTO `fa_admin_log` VALUES (456, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716671798);
INSERT INTO `fa_admin_log` VALUES (457, 1, 'admin', '/ZHqYpmsotr.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_ygame_record\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716671804);
INSERT INTO `fa_admin_log` VALUES (458, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_ygame_record\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716671819);
INSERT INTO `fa_admin_log` VALUES (459, 1, 'admin', '/ZHqYpmsotr.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_ygame_record\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"tagsuffix\":\"\",\"jsonsuffix\":\"\",\"fixedcolumns\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1716671824);

-- ----------------------------
-- Table structure for fa_area
-- ----------------------------
DROP TABLE IF EXISTS `fa_area`;
CREATE TABLE `fa_area`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int NULL DEFAULT NULL COMMENT '父id',
  `shortname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简称',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `mergename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '全称',
  `level` tinyint NULL DEFAULT NULL COMMENT '层级:1=省,2=市,3=区/县',
  `pinyin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拼音',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '长途区号',
  `zip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `first` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '首字母',
  `lng` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经度',
  `lat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '地区表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_area
-- ----------------------------

-- ----------------------------
-- Table structure for fa_attachment
-- ----------------------------
DROP TABLE IF EXISTS `fa_attachment`;
CREATE TABLE `fa_attachment`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '类别',
  `admin_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '图片帧数',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件名称',
  `filesize` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `mimetype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '透传数据',
  `createtime` bigint NULL DEFAULT NULL COMMENT '创建日期',
  `updatetime` bigint NULL DEFAULT NULL COMMENT '更新时间',
  `uploadtime` bigint NULL DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_attachment
-- ----------------------------
INSERT INTO `fa_attachment` VALUES (1, '', 1, 0, '/assets/img/qrcode.png', '150', '150', 'png', 0, 'qrcode.png', 21859, 'image/png', '', 1491635035, 1491635035, 1491635035, 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');
INSERT INTO `fa_attachment` VALUES (2, '', 1, 0, '/uploads/20240515/9467fad63608835514ad8de19753499d.png', '1024', '1536', 'png', 0, '00009-587031355-ultra detailed 8k cg, kimono, perfect face, beautiful face, mature female,   chest,p', 2168506, 'image/png', '', 1715773190, 1715773190, 1715773190, 'local', 'a075cb2a101260974a0c6740f6f3d7beb80a8576');
INSERT INTO `fa_attachment` VALUES (3, '', 1, 0, '/uploads/20240525/9c420183d3721ad869bc980cc7c43102.png', '500', '500', 'png', 0, '48.png', 96807, 'image/png', '', 1716649275, 1716649275, 1716649275, 'local', '7fc75e165d627039ebac929d0e0e45cf726370bb');

-- ----------------------------
-- Table structure for fa_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group`;
CREATE TABLE `fa_auth_group`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '父组别',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规则ID',
  `createtime` bigint NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint NULL DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_auth_group
-- ----------------------------
INSERT INTO `fa_auth_group` VALUES (1, 0, 'Admin group', '*', 1491635035, 1491635035, 'normal');
INSERT INTO `fa_auth_group` VALUES (2, 1, '二级管理组', '1,2,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138', 1491635035, 1716546793, 'normal');
INSERT INTO `fa_auth_group` VALUES (3, 2, '机构管理组', '66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138', 1491635035, 1716547396, 'normal');
INSERT INTO `fa_auth_group` VALUES (4, 1, 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', 1491635035, 1491635035, 'normal');
INSERT INTO `fa_auth_group` VALUES (5, 2, 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', 1491635035, 1716546793, 'normal');

-- ----------------------------
-- Table structure for fa_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group_access`;
CREATE TABLE `fa_auth_group_access`  (
  `uid` int UNSIGNED NOT NULL COMMENT '会员ID',
  `group_id` int UNSIGNED NOT NULL COMMENT '级别ID',
  UNIQUE INDEX `uid_group_id`(`uid` ASC, `group_id` ASC) USING BTREE,
  INDEX `uid`(`uid` ASC) USING BTREE,
  INDEX `group_id`(`group_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_auth_group_access
-- ----------------------------
INSERT INTO `fa_auth_group_access` VALUES (1, 1);
INSERT INTO `fa_auth_group_access` VALUES (2, 2);
INSERT INTO `fa_auth_group_access` VALUES (3, 3);

-- ----------------------------
-- Table structure for fa_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_rule`;
CREATE TABLE `fa_auth_rule`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '图标',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '规则URL',
  `condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为菜单',
  `menutype` enum('addtabs','blank','dialog','ajax') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单类型',
  `extend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '扩展属性',
  `py` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '拼音首字母',
  `pinyin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '拼音',
  `createtime` bigint NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE,
  INDEX `pid`(`pid` ASC) USING BTREE,
  INDEX `weigh`(`weigh` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 151 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '节点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_auth_rule
-- ----------------------------
INSERT INTO `fa_auth_rule` VALUES (1, 'file', 0, 'dashboard', 'Dashboard', 'fa fa-dashboard', '', '', 'Dashboard tips', 1, NULL, '', 'kzt', 'kongzhitai', 1491635035, 1491635035, 143, 'normal');
INSERT INTO `fa_auth_rule` VALUES (2, 'file', 0, 'general', 'General', 'fa fa-cogs', '', '', '', 1, NULL, '', 'cggl', 'changguiguanli', 1491635035, 1491635035, 137, 'normal');
INSERT INTO `fa_auth_rule` VALUES (3, 'file', 0, 'category', 'Category', 'fa fa-leaf', '', '', 'Category tips', 1, NULL, '', 'flgl', 'fenleiguanli', 1491635035, 1716546662, 119, 'normal');
INSERT INTO `fa_auth_rule` VALUES (4, 'file', 0, 'addon', 'Addon', 'fa fa-rocket', '', '', 'Addon tips', 1, NULL, '', 'cjgl', 'chajianguanli', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (5, 'file', 0, 'auth', 'Auth', 'fa fa-group', '', '', '', 1, NULL, '', 'qxgl', 'quanxianguanli', 1491635035, 1491635035, 99, 'normal');
INSERT INTO `fa_auth_rule` VALUES (6, 'file', 2, 'general/config', 'Config', 'fa fa-cog', '', '', 'Config tips', 1, NULL, '', 'xtpz', 'xitongpeizhi', 1491635035, 1491635035, 60, 'normal');
INSERT INTO `fa_auth_rule` VALUES (7, 'file', 2, 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', '', 'Attachment tips', 1, NULL, '', 'fjgl', 'fujianguanli', 1491635035, 1491635035, 53, 'normal');
INSERT INTO `fa_auth_rule` VALUES (8, 'file', 2, 'general/profile', 'Profile', 'fa fa-user', '', '', '', 1, NULL, '', 'grzl', 'gerenziliao', 1491635035, 1491635035, 34, 'normal');
INSERT INTO `fa_auth_rule` VALUES (9, 'file', 5, 'auth/admin', 'Admin', 'fa fa-user', '', '', 'Admin tips', 1, NULL, '', 'glygl', 'guanliyuanguanli', 1491635035, 1491635035, 118, 'normal');
INSERT INTO `fa_auth_rule` VALUES (10, 'file', 5, 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', '', 'Admin log tips', 1, NULL, '', 'glyrz', 'guanliyuanrizhi', 1491635035, 1491635035, 113, 'normal');
INSERT INTO `fa_auth_rule` VALUES (11, 'file', 5, 'auth/group', 'Group', 'fa fa-group', '', '', 'Group tips', 1, NULL, '', 'jsz', 'juesezu', 1491635035, 1491635035, 109, 'normal');
INSERT INTO `fa_auth_rule` VALUES (12, 'file', 5, 'auth/rule', 'Rule', 'fa fa-bars', '', '', 'Rule tips', 1, NULL, '', 'cdgz', 'caidanguize', 1491635035, 1491635035, 104, 'normal');
INSERT INTO `fa_auth_rule` VALUES (13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 136, 'normal');
INSERT INTO `fa_auth_rule` VALUES (14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 135, 'normal');
INSERT INTO `fa_auth_rule` VALUES (15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 133, 'normal');
INSERT INTO `fa_auth_rule` VALUES (16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 134, 'normal');
INSERT INTO `fa_auth_rule` VALUES (17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 132, 'normal');
INSERT INTO `fa_auth_rule` VALUES (18, 'file', 6, 'general/config/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 52, 'normal');
INSERT INTO `fa_auth_rule` VALUES (19, 'file', 6, 'general/config/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 51, 'normal');
INSERT INTO `fa_auth_rule` VALUES (20, 'file', 6, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 50, 'normal');
INSERT INTO `fa_auth_rule` VALUES (21, 'file', 6, 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 49, 'normal');
INSERT INTO `fa_auth_rule` VALUES (22, 'file', 6, 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 48, 'normal');
INSERT INTO `fa_auth_rule` VALUES (23, 'file', 7, 'general/attachment/index', 'View', 'fa fa-circle-o', '', '', 'Attachment tips', 0, NULL, '', '', '', 1491635035, 1491635035, 59, 'normal');
INSERT INTO `fa_auth_rule` VALUES (24, 'file', 7, 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 58, 'normal');
INSERT INTO `fa_auth_rule` VALUES (25, 'file', 7, 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 57, 'normal');
INSERT INTO `fa_auth_rule` VALUES (26, 'file', 7, 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 56, 'normal');
INSERT INTO `fa_auth_rule` VALUES (27, 'file', 7, 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 55, 'normal');
INSERT INTO `fa_auth_rule` VALUES (28, 'file', 7, 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 54, 'normal');
INSERT INTO `fa_auth_rule` VALUES (29, 'file', 8, 'general/profile/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 33, 'normal');
INSERT INTO `fa_auth_rule` VALUES (30, 'file', 8, 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 32, 'normal');
INSERT INTO `fa_auth_rule` VALUES (31, 'file', 8, 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 31, 'normal');
INSERT INTO `fa_auth_rule` VALUES (32, 'file', 8, 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 30, 'normal');
INSERT INTO `fa_auth_rule` VALUES (33, 'file', 8, 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 29, 'normal');
INSERT INTO `fa_auth_rule` VALUES (34, 'file', 8, 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 28, 'normal');
INSERT INTO `fa_auth_rule` VALUES (35, 'file', 3, 'category/index', 'View', 'fa fa-circle-o', '', '', 'Category tips', 0, NULL, '', '', '', 1491635035, 1491635035, 142, 'normal');
INSERT INTO `fa_auth_rule` VALUES (36, 'file', 3, 'category/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 141, 'normal');
INSERT INTO `fa_auth_rule` VALUES (37, 'file', 3, 'category/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 140, 'normal');
INSERT INTO `fa_auth_rule` VALUES (38, 'file', 3, 'category/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 139, 'normal');
INSERT INTO `fa_auth_rule` VALUES (39, 'file', 3, 'category/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 138, 'normal');
INSERT INTO `fa_auth_rule` VALUES (40, 'file', 9, 'auth/admin/index', 'View', 'fa fa-circle-o', '', '', 'Admin tips', 0, NULL, '', '', '', 1491635035, 1491635035, 117, 'normal');
INSERT INTO `fa_auth_rule` VALUES (41, 'file', 9, 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 116, 'normal');
INSERT INTO `fa_auth_rule` VALUES (42, 'file', 9, 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 115, 'normal');
INSERT INTO `fa_auth_rule` VALUES (43, 'file', 9, 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 114, 'normal');
INSERT INTO `fa_auth_rule` VALUES (44, 'file', 10, 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', '', 'Admin log tips', 0, NULL, '', '', '', 1491635035, 1491635035, 112, 'normal');
INSERT INTO `fa_auth_rule` VALUES (45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 111, 'normal');
INSERT INTO `fa_auth_rule` VALUES (46, 'file', 10, 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 110, 'normal');
INSERT INTO `fa_auth_rule` VALUES (47, 'file', 11, 'auth/group/index', 'View', 'fa fa-circle-o', '', '', 'Group tips', 0, NULL, '', '', '', 1491635035, 1491635035, 108, 'normal');
INSERT INTO `fa_auth_rule` VALUES (48, 'file', 11, 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 107, 'normal');
INSERT INTO `fa_auth_rule` VALUES (49, 'file', 11, 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 106, 'normal');
INSERT INTO `fa_auth_rule` VALUES (50, 'file', 11, 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 105, 'normal');
INSERT INTO `fa_auth_rule` VALUES (51, 'file', 12, 'auth/rule/index', 'View', 'fa fa-circle-o', '', '', 'Rule tips', 0, NULL, '', '', '', 1491635035, 1491635035, 103, 'normal');
INSERT INTO `fa_auth_rule` VALUES (52, 'file', 12, 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 102, 'normal');
INSERT INTO `fa_auth_rule` VALUES (53, 'file', 12, 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 101, 'normal');
INSERT INTO `fa_auth_rule` VALUES (54, 'file', 12, 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 100, 'normal');
INSERT INTO `fa_auth_rule` VALUES (55, 'file', 4, 'addon/index', 'View', 'fa fa-circle-o', '', '', 'Addon tips', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (56, 'file', 4, 'addon/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (57, 'file', 4, 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (58, 'file', 4, 'addon/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (59, 'file', 4, 'addon/downloaded', 'Local addon', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (60, 'file', 4, 'addon/state', 'Update state', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (63, 'file', 4, 'addon/config', 'Setting', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (64, 'file', 4, 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (65, 'file', 4, 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (66, 'file', 0, 'user', 'User', 'fa fa-user-circle', '', '', '', 1, NULL, '', 'hygl', 'huiyuanguanli', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (67, 'file', 66, 'user/user', 'User', 'fa fa-user', '', '', '', 1, NULL, '', 'hygl', 'huiyuanguanli', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (68, 'file', 67, 'user/user/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (69, 'file', 67, 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (70, 'file', 67, 'user/user/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (71, 'file', 67, 'user/user/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (72, 'file', 67, 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (73, 'file', 66, 'user/group', 'User group', 'fa fa-users', '', '', '', 1, NULL, '', 'hyfz', 'huiyuanfenzu', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (74, 'file', 73, 'user/group/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (75, 'file', 73, 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (76, 'file', 73, 'user/group/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (77, 'file', 73, 'user/group/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (78, 'file', 73, 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (79, 'file', 66, 'user/rule', 'User rule', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'hygz', 'huiyuanguize', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (80, 'file', 79, 'user/rule/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (81, 'file', 79, 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (82, 'file', 79, 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (83, 'file', 79, 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (84, 'file', 79, 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (85, 'file', 0, 'command', '在线命令管理', 'fa fa-terminal', '', '', '', 1, NULL, '', 'zxmlgl', 'zaixianminglingguanli', 1715343508, 1715343508, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (86, 'file', 85, 'command/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1715343508, 1715343508, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (87, 'file', 85, 'command/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1715343508, 1715343508, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (88, 'file', 85, 'command/detail', '详情', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xq', 'xiangqing', 1715343508, 1715343508, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (89, 'file', 85, 'command/command', '生成并执行命令', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'scbzxml', 'shengchengbingzhixingmingling', 1715343508, 1715343508, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (90, 'file', 85, 'command/execute', '再次执行命令', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zczxml', 'zaicizhixingmingling', 1715343508, 1715343508, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (91, 'file', 85, 'command/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1715343508, 1715343508, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (92, 'file', 85, 'command/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1715343508, 1715343508, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (93, 'file', 0, 'ygame', '报名系统', 'fa fa-font-awesome', '', '', '', 1, NULL, '', 'bmxt', 'baomingxitong', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (94, 'file', 93, 'ygame/project', '赛事管理', 'fa fa-map-marker', '', '', '', 1, NULL, '', 'ssgl', 'saishiguanli', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (95, 'file', 94, 'ygame/project/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (96, 'file', 94, 'ygame/project/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (97, 'file', 94, 'ygame/project/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (98, 'file', 94, 'ygame/project/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (99, 'file', 94, 'ygame/project/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (100, 'file', 93, 'ygame/banner', '轮播图管理', 'fa fa-photo', '', '', '', 1, NULL, '', 'lbtgl', 'lunbotuguanli', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (101, 'file', 100, 'ygame/banner/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (102, 'file', 100, 'ygame/banner/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (103, 'file', 100, 'ygame/banner/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (104, 'file', 100, 'ygame/banner/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (105, 'file', 100, 'ygame/banner/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (106, 'file', 93, 'ygame/article', '文章管理', 'fa fa-list', '', '', '', 0, NULL, '', 'wzgl', 'wenzhangguanli', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (107, 'file', 106, 'ygame/article/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (108, 'file', 106, 'ygame/article/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (109, 'file', 106, 'ygame/article/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (110, 'file', 106, 'ygame/article/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (111, 'file', 106, 'ygame/article/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (112, 'file', 93, 'ygame/group', '组别管理', 'fa fa-list', '', '', '', 0, NULL, '', 'zbgl', 'zubieguanli', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (113, 'file', 112, 'ygame/group/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (114, 'file', 112, 'ygame/group/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (115, 'file', 112, 'ygame/group/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (116, 'file', 112, 'ygame/group/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (117, 'file', 112, 'ygame/group/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (118, 'file', 93, 'ygame/result', '成绩管理', 'fa fa-list', '', '', '', 0, NULL, '', 'cjgl', 'chengjiguanli', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (119, 'file', 118, 'ygame/result/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (120, 'file', 118, 'ygame/result/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (121, 'file', 118, 'ygame/result/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (122, 'file', 118, 'ygame/result/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (123, 'file', 118, 'ygame/result/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (124, 'file', 118, 'ygame/result/import', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (125, 'file', 118, 'ygame/result/design', '设计电子成绩证书', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sjdzcjzs', 'shejidianzichengjizhengshu', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (126, 'file', 93, 'ygame/record', '报名记录', 'fa fa-braille', '', '', '', 0, NULL, '', 'bmjl', 'baomingjilu', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (127, 'file', 126, 'ygame/record/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1715452646, 1715452646, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (128, 'file', 0, 'test', '测试管理', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'csgl', 'ceshiguanli', 1715690261, 1715690261, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (129, 'file', 128, 'test/index', '查看', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'zk', 'zhakan', 1715690261, 1716545791, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (130, 'file', 128, 'test/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hsz', 'huishouzhan', 1715690261, 1716545664, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (131, 'file', 128, 'test/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1715690261, 1716545671, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (132, 'file', 128, 'test/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1715690261, 1716545685, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (133, 'file', 128, 'test/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1715690261, 1716545723, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (134, 'file', 128, 'test/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zssc', 'zhenshishanchu', 1715690261, 1716545728, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (135, 'file', 128, 'test/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hy', 'huanyuan', 1715690261, 1716545733, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (136, 'file', 128, 'test/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1715690261, 1716545737, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (137, 'file', 128, 'test/work1', 'work1', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'w', 'work1', 1716541291, 1716543899, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (138, 'file', 128, 'test/test1', 'test1', 'fa fa-circle-o', '', '', '', 1, NULL, '', 't', 'test1', 1716541291, 1716543906, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (139, 'file', 93, 'ygame/team', 'Team', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'T', 'Team', 1716627431, 1716627431, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (140, 'file', 139, 'ygame/team/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1716627432, 1716627432, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (141, 'file', 139, 'ygame/team/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1716627432, 1716627432, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (142, 'file', 139, 'ygame/team/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1716627432, 1716627432, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (143, 'file', 139, 'ygame/team/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1716627432, 1716627432, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (144, 'file', 139, 'ygame/team/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1716627432, 1716627432, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (145, 'file', 0, 'mjtest', 'Mjtest', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'M', 'Mjtest', 1716635398, 1716635398, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (146, 'file', 145, 'mjtest/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1716635398, 1716635398, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (147, 'file', 145, 'mjtest/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1716635398, 1716635398, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (148, 'file', 145, 'mjtest/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1716635398, 1716635398, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (149, 'file', 145, 'mjtest/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1716635398, 1716635398, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (150, 'file', 145, 'mjtest/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1716635398, 1716635398, 0, 'normal');

-- ----------------------------
-- Table structure for fa_category
-- ----------------------------
DROP TABLE IF EXISTS `fa_category`;
CREATE TABLE `fa_category`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `flag` set('hot','index','recommend') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` bigint NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `weigh`(`weigh` ASC, `id` ASC) USING BTREE,
  INDEX `pid`(`pid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_category
-- ----------------------------
INSERT INTO `fa_category` VALUES (1, 0, 'page', '官方新闻', 'news', 'recommend', '/assets/img/qrcode.png', '', '', 'news', 1491635035, 1491635035, 1, 'normal');
INSERT INTO `fa_category` VALUES (2, 0, 'page', '移动应用', 'mobileapp', 'hot', '/assets/img/qrcode.png', '', '', 'mobileapp', 1491635035, 1491635035, 2, 'normal');
INSERT INTO `fa_category` VALUES (3, 2, 'page', '微信公众号', 'wechatpublic', 'index', '/assets/img/qrcode.png', '', '', 'wechatpublic', 1491635035, 1491635035, 3, 'normal');
INSERT INTO `fa_category` VALUES (4, 2, 'page', 'Android开发', 'android', 'recommend', '/assets/img/qrcode.png', '', '', 'android', 1491635035, 1491635035, 4, 'normal');
INSERT INTO `fa_category` VALUES (5, 0, 'page', '软件产品', 'software', 'recommend', '/assets/img/qrcode.png', '', '', 'software', 1491635035, 1491635035, 5, 'normal');
INSERT INTO `fa_category` VALUES (6, 5, 'page', '网站建站', 'website', 'recommend', '/assets/img/qrcode.png', '', '', 'website', 1491635035, 1491635035, 6, 'normal');
INSERT INTO `fa_category` VALUES (7, 5, 'page', '企业管理软件', 'company', 'index', '/assets/img/qrcode.png', '', '', 'company', 1491635035, 1491635035, 7, 'normal');
INSERT INTO `fa_category` VALUES (8, 6, 'page', 'PC端', 'website-pc', 'recommend', '/assets/img/qrcode.png', '', '', 'website-pc', 1491635035, 1491635035, 8, 'normal');
INSERT INTO `fa_category` VALUES (9, 6, 'page', '移动端', 'website-mobile', 'recommend', '/assets/img/qrcode.png', '', '', 'website-mobile', 1491635035, 1491635035, 9, 'normal');
INSERT INTO `fa_category` VALUES (10, 7, 'page', 'CRM系统 ', 'company-crm', 'recommend', '/assets/img/qrcode.png', '', '', 'company-crm', 1491635035, 1491635035, 10, 'normal');
INSERT INTO `fa_category` VALUES (11, 7, 'page', 'SASS平台软件', 'company-sass', 'recommend', '/assets/img/qrcode.png', '', '', 'company-sass', 1491635035, 1491635035, 11, 'normal');
INSERT INTO `fa_category` VALUES (12, 0, 'test', '测试1', 'test1', 'recommend', '/assets/img/qrcode.png', '', '', 'test1', 1491635035, 1491635035, 12, 'normal');
INSERT INTO `fa_category` VALUES (13, 0, 'test', '测试2', 'test2', 'recommend', '/assets/img/qrcode.png', '', '', 'test2', 1491635035, 1491635035, 13, 'normal');

-- ----------------------------
-- Table structure for fa_command
-- ----------------------------
DROP TABLE IF EXISTS `fa_command`;
CREATE TABLE `fa_command`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型',
  `params` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参数',
  `command` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '命令',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '返回结果',
  `executetime` bigint UNSIGNED NULL DEFAULT NULL COMMENT '执行时间',
  `createtime` bigint UNSIGNED NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint UNSIGNED NULL DEFAULT NULL COMMENT '更新时间',
  `status` enum('successed','failured') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'failured' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线命令表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_command
-- ----------------------------
INSERT INTO `fa_command` VALUES (1, 'crud', '[\"--table=fa_test\"]', 'php think crud --table=fa_test', 'Build Successed', 1715689818, 1715689818, 1715689818, 'successed');
INSERT INTO `fa_command` VALUES (2, 'menu', '[\"--controller=Test\"]', 'php think menu --controller=Test', 'Build Successed!', 1715690261, 1715690261, 1715690262, 'successed');
INSERT INTO `fa_command` VALUES (4, 'menu', '[\"--controller=Test\"]', 'php think menu --controller=Test', 'SQLSTATE[22001]: String data, right truncated: 1406 Data too long for column \'title\' at row 1', 1716037398, 1716037398, 1716037398, 'failured');
INSERT INTO `fa_command` VALUES (5, 'menu', '[\"--controller=Test\"]', 'php think menu --controller=Test', 'Build Successed!', 1716541291, 1716541291, 1716541291, 'successed');
INSERT INTO `fa_command` VALUES (6, 'menu', '[\"--controller=Test\"]', 'php think menu --controller=Test', 'Build Successed!', 1716543471, 1716543471, 1716543471, 'successed');
INSERT INTO `fa_command` VALUES (7, 'menu', '[\"--force=1\",\"--controller=Test\"]', 'php think menu --force=1 --controller=Test', 'Build Successed!', 1716543630, 1716543630, 1716543630, 'successed');
INSERT INTO `fa_command` VALUES (8, 'crud', '[\"--table=fa_ygame_team\"]', 'php think crud --table=fa_ygame_team', 'model already exists!\nIf you need to rebuild again, use the parameter --force=true', 1716627202, 1716627202, 1716627202, 'failured');
INSERT INTO `fa_command` VALUES (9, 'crud', '[\"--table=fa_ygame_team\"]', 'php think crud --table=fa_ygame_team', 'model already exists!\nIf you need to rebuild again, use the parameter --force=true', 1716627293, 1716627293, 1716627294, 'failured');
INSERT INTO `fa_command` VALUES (10, 'crud', '[\"--force=1\",\"--table=fa_ygame_team\"]', 'php think crud --force=1 --table=fa_ygame_team', 'Build Successed', 1716627317, 1716627317, 1716627318, 'successed');
INSERT INTO `fa_command` VALUES (11, 'menu', '[\"--controller=ygame\\/Team\"]', 'php think menu --controller=ygame/Team', 'Build Successed!', 1716627431, 1716627431, 1716627432, 'successed');
INSERT INTO `fa_command` VALUES (12, 'api', '[\"--force=1\"]', 'php think api --force=1', 'Build Successed!', 1716630938, 1716630938, 1716630940, 'successed');
INSERT INTO `fa_command` VALUES (13, 'crud', '[\"--table=fa_mjtest\"]', 'php think crud --table=fa_mjtest', 'Build Successed', 1716635357, 1716635357, 1716635358, 'successed');
INSERT INTO `fa_command` VALUES (14, 'menu', '[\"--controller=Mjtest\"]', 'php think menu --controller=Mjtest', 'Build Successed!', 1716635398, 1716635398, 1716635398, 'successed');
INSERT INTO `fa_command` VALUES (15, 'api', '[\"--force=1\"]', 'php think api --force=1', 'Build Successed!', 1716635426, 1716635426, 1716635427, 'successed');
INSERT INTO `fa_command` VALUES (16, 'crud', '[\"--force=1\",\"--table=fa_mjtest\",\"--relation=fa_user\",\"--relationmode=hasone\",\"--relationforeignkey=id\",\"--relationprimarykey=leader_id\"]', 'php think crud --force=1 --table=fa_mjtest --relation=fa_user --relationmode=hasone --relationforeignkey=id --relationprimarykey=leader_id', 'Relation Primary key not found in table!', 1716637006, 1716637006, 1716637007, 'failured');
INSERT INTO `fa_command` VALUES (17, 'crud', '[\"--force=1\",\"--table=fa_mjtest\",\"--relation=fa_user\",\"--relationmode=belongsto\",\"--relationforeignkey=leader_id\",\"--relationprimarykey=id\",\"--relationfields=username\"]', 'php think crud --force=1 --table=fa_mjtest --relation=fa_user --relationmode=belongsto --relationforeignkey=leader_id --relationprimarykey=id --relationfields=username', 'Build Successed', 1716637443, 1716637443, 1716637443, 'successed');
INSERT INTO `fa_command` VALUES (19, 'crud', '[\"--force=1\",\"--table=fa_mjtest\",\"--relation=fa_user\",\"--relationmode=belongsto\",\"--relationforeignkey=leader_id\",\"--relationprimarykey=id\",\"--relationfields=nickname\"]', 'php think crud --force=1 --table=fa_mjtest --relation=fa_user --relationmode=belongsto --relationforeignkey=leader_id --relationprimarykey=id --relationfields=nickname', 'Build Successed', 1716637800, 1716637800, 1716637800, 'successed');
INSERT INTO `fa_command` VALUES (20, 'crud', '[\"--force=1\",\"--table=fa_mjtest\",\"--relation=fa_user\",\"--relationmode=belongsto\",\"--relationforeignkey=leader_id\",\"--relationprimarykey=id\",\"--relationfields=group_id,username,nickname\"]', 'php think crud --force=1 --table=fa_mjtest --relation=fa_user --relationmode=belongsto --relationforeignkey=leader_id --relationprimarykey=id --relationfields=group_id,username,nickname', 'Build Successed', 1716637873, 1716637873, 1716637873, 'successed');
INSERT INTO `fa_command` VALUES (21, 'crud', '[\"--force=1\",\"--table=fa_mjtest\",\"--fields=user_id,leader_id,user_name,leader_name\",\"--relation=fa_user\",\"--relationmode=belongsto\",\"--relationforeignkey=leader_id\",\"--relationprimarykey=id\",\"--relationfields=group_id,username,nickname\"]', 'php think crud --force=1 --table=fa_mjtest --fields=user_id,leader_id,user_name,leader_name --relation=fa_user --relationmode=belongsto --relationforeignkey=leader_id --relationprimarykey=id --relationfields=group_id,username,nickname', 'Build Successed', 1716637937, 1716637937, 1716637938, 'successed');
INSERT INTO `fa_command` VALUES (22, 'crud', '[\"--force=1\",\"--table=fa_mjtest\",\"--relation=fa_user\",\"--relationmode=belongsto\",\"--relationforeignkey=leader_id\",\"--relationprimarykey=id\",\"--relationfields=username,nickname,mobile\"]', 'php think crud --force=1 --table=fa_mjtest --relation=fa_user --relationmode=belongsto --relationforeignkey=leader_id --relationprimarykey=id --relationfields=username,nickname,mobile', 'Build Successed', 1716638094, 1716638094, 1716638095, 'successed');
INSERT INTO `fa_command` VALUES (23, 'crud', '[\"--force=1\",\"--table=fa_ygame_team\",\"--relation=fa_ygame_project\",\"--relationmode=belongsto\",\"--relationforeignkey=project_id\",\"--relationprimarykey=id\",\"--relationfields=project_name\",\"--relation=fa_user\",\"--relationmode=belongsto\",\"--relationforeignkey=trainer_id\",\"--relationprimarykey=id\",\"--relationfields=nickname\"]', 'php think crud --force=1 --table=fa_ygame_team --relation=fa_ygame_project --relationmode=belongsto --relationforeignkey=project_id --relationprimarykey=id --relationfields=project_name --relation=fa_user --relationmode=belongsto --relationforeignkey=trainer_id --relationprimarykey=id --relationfields=nickname', 'Build Successed', 1716639640, 1716639640, 1716639640, 'successed');
INSERT INTO `fa_command` VALUES (24, 'crud', '[\"--force=1\",\"--table=fa_ygame_team\",\"--relation=fa_ygame_project\",\"--relationmode=belongsto\",\"--relationforeignkey=project_id\",\"--relationprimarykey=id\"]', 'php think crud --force=1 --table=fa_ygame_team --relation=fa_ygame_project --relationmode=belongsto --relationforeignkey=project_id --relationprimarykey=id', 'Build Successed', 1716641146, 1716641146, 1716641146, 'successed');
INSERT INTO `fa_command` VALUES (25, 'crud', '[\"--force=1\",\"--table=fa_ygame_team\",\"--relation=fa_ygame_project\",\"--relationmode=belongsto\",\"--relationforeignkey=project_id\",\"--relationprimarykey=id\",\"--relation=fa_user\",\"--relationmode=belongsto\",\"--relationforeignkey=trainer_id\",\"--relationprimarykey=id\"]', 'php think crud --force=1 --table=fa_ygame_team --relation=fa_ygame_project --relationmode=belongsto --relationforeignkey=project_id --relationprimarykey=id --relation=fa_user --relationmode=belongsto --relationforeignkey=trainer_id --relationprimarykey=id', 'Build Successed', 1716641689, 1716641689, 1716641690, 'successed');
INSERT INTO `fa_command` VALUES (26, 'crud', '[\"--force=1\",\"--table=fa_ygame_team\",\"--relation=fa_ygame_project\",\"--relationmode=belongsto\",\"--relationforeignkey=project_id\",\"--relationprimarykey=id\",\"--relationfields=project_name\",\"--relation=fa_user\",\"--relationmode=belongsto\",\"--relationforeignkey=trainer_id\",\"--relationprimarykey=id\",\"--relationfields=nickname\"]', 'php think crud --force=1 --table=fa_ygame_team --relation=fa_ygame_project --relationmode=belongsto --relationforeignkey=project_id --relationprimarykey=id --relationfields=project_name --relation=fa_user --relationmode=belongsto --relationforeignkey=trainer_id --relationprimarykey=id --relationfields=nickname', 'Build Successed', 1716642119, 1716642119, 1716642120, 'successed');
INSERT INTO `fa_command` VALUES (27, 'crud', '[\"--force=1\",\"--table=fa_ygame_team\",\"--relation=fa_ygame_project\",\"--relationmode=belongsto\",\"--relationforeignkey=project_id\",\"--relationprimarykey=id\",\"--relationfields=project_name\",\"--relation=fa_user\",\"--relationmode=belongsto\",\"--relationforeignkey=user_id\",\"--relationprimarykey=id\",\"--relationfields=nickname\"]', 'php think crud --force=1 --table=fa_ygame_team --relation=fa_ygame_project --relationmode=belongsto --relationforeignkey=project_id --relationprimarykey=id --relationfields=project_name --relation=fa_user --relationmode=belongsto --relationforeignkey=user_id --relationprimarykey=id --relationfields=nickname', 'Build Successed', 1716642636, 1716642636, 1716642636, 'successed');
INSERT INTO `fa_command` VALUES (28, 'crud', '[\"--force=1\",\"--table=fa_ygame_team\",\"--relation=fa_ygame_project\",\"--relationmode=belongsto\",\"--relationforeignkey=project_id\",\"--relationprimarykey=id\",\"--relationfields=project_name\",\"--relation=fa_user\",\"--relationmode=belongsto\",\"--relationforeignkey=trainer_id\",\"--relationprimarykey=id\",\"--relationfields=nickname\"]', 'php think crud --force=1 --table=fa_ygame_team --relation=fa_ygame_project --relationmode=belongsto --relationforeignkey=project_id --relationprimarykey=id --relationfields=project_name --relation=fa_user --relationmode=belongsto --relationforeignkey=trainer_id --relationprimarykey=id --relationfields=nickname', 'Build Successed', 1716643406, 1716643406, 1716643406, 'successed');
INSERT INTO `fa_command` VALUES (29, 'crud', '[\"--force=1\",\"--table=fa_ygame_record\"]', 'php think crud --force=1 --table=fa_ygame_record', 'Build Successed', 1716671824, 1716671824, 1716671824, 'successed');

-- ----------------------------
-- Table structure for fa_config
-- ----------------------------
DROP TABLE IF EXISTS `fa_config`;
CREATE TABLE `fa_config`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `visible` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '可见条件',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '变量值',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '变量字典数据',
  `rule` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '扩展属性',
  `setting` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '配置',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_config
-- ----------------------------
INSERT INTO `fa_config` VALUES (1, 'name', 'basic', 'Site name', '请填写站点名称', 'string', '', '我的轮滑赛事网站', '', 'required', '', '');
INSERT INTO `fa_config` VALUES (2, 'beian', 'basic', 'Beian', '粤ICP备15000000号-1', 'string', '', '', '', '', '', '');
INSERT INTO `fa_config` VALUES (3, 'cdnurl', 'basic', 'Cdn url', '如果全站静态资源使用第三方云储存请配置该值', 'string', '', '', '', '', '', '');
INSERT INTO `fa_config` VALUES (4, 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '', '1.0.1', '', 'required', '', '');
INSERT INTO `fa_config` VALUES (5, 'timezone', 'basic', 'Timezone', '', 'string', '', 'Asia/Shanghai', '', 'required', '', '');
INSERT INTO `fa_config` VALUES (6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '', '', '');
INSERT INTO `fa_config` VALUES (7, 'languages', 'basic', 'Languages', '', 'array', '', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '', '');
INSERT INTO `fa_config` VALUES (8, 'fixedpage', 'basic', 'Fixed page', '请输入左侧菜单栏存在的链接', 'string', '', 'dashboard', '', 'required', '', '');
INSERT INTO `fa_config` VALUES (9, 'categorytype', 'dictionary', 'Category type', '', 'array', '', '{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}', '', '', '', '');
INSERT INTO `fa_config` VALUES (10, 'configgroup', 'dictionary', 'Config group', '', 'array', '', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}', '', '', '', '');
INSERT INTO `fa_config` VALUES (11, 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '', '1', '[\"请选择\",\"SMTP\"]', '', '', '');
INSERT INTO `fa_config` VALUES (12, 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', '', 'smtp.qq.com', '', '', '', '');
INSERT INTO `fa_config` VALUES (13, 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '', '465', '', '', '', '');
INSERT INTO `fa_config` VALUES (14, 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '', '', '', '', '', '');
INSERT INTO `fa_config` VALUES (15, 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码或授权码）', 'password', '', '', '', '', '', '');
INSERT INTO `fa_config` VALUES (16, 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '', '2', '[\"无\",\"TLS\",\"SSL\"]', '', '', '');
INSERT INTO `fa_config` VALUES (17, 'mail_from', 'email', 'Mail from', '', 'string', '', '', '', '', '', '');
INSERT INTO `fa_config` VALUES (18, 'attachmentcategory', 'dictionary', 'Attachment category', '', 'array', '', '{\"category1\":\"Category1\",\"category2\":\"Category2\",\"custom\":\"Custom\"}', '', '', '', '');

-- ----------------------------
-- Table structure for fa_ems
-- ----------------------------
DROP TABLE IF EXISTS `fa_ems`;
CREATE TABLE `fa_ems`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '验证码',
  `times` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'IP',
  `createtime` bigint NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '邮箱验证码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_ems
-- ----------------------------

-- ----------------------------
-- Table structure for fa_invite
-- ----------------------------
DROP TABLE IF EXISTS `fa_invite`;
CREATE TABLE `fa_invite`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `invited_user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '被邀请人',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '注册IP',
  `createtime` bigint NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '邀请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_invite
-- ----------------------------

-- ----------------------------
-- Table structure for fa_mjtest
-- ----------------------------
DROP TABLE IF EXISTS `fa_mjtest`;
CREATE TABLE `fa_mjtest`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL COMMENT '拥有者ID',
  `leader_id` int NULL DEFAULT NULL COMMENT '领导ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拥有者姓名',
  `leader_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '领导姓名',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_mjtest
-- ----------------------------

-- ----------------------------
-- Table structure for fa_sms
-- ----------------------------
DROP TABLE IF EXISTS `fa_sms`;
CREATE TABLE `fa_sms`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '验证码',
  `times` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'IP',
  `createtime` bigint UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '短信验证码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_sms
-- ----------------------------

-- ----------------------------
-- Table structure for fa_test
-- ----------------------------
DROP TABLE IF EXISTS `fa_test`;
CREATE TABLE `fa_test`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int NULL DEFAULT 0 COMMENT '会员ID',
  `admin_id` int NULL DEFAULT 0 COMMENT '管理员ID',
  `category_id` int UNSIGNED NULL DEFAULT 0 COMMENT '分类ID(单选)',
  `category_ids` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类ID(多选)',
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '标签',
  `week` enum('monday','tuesday','wednesday') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '省市',
  `array` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '数组:value=值',
  `json` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '配置:key=名称,value=值',
  `multiplejson` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '二维数组:title=标题,intro=介绍,author=作者,age=年龄',
  `price` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '价格',
  `views` int UNSIGNED NULL DEFAULT 0 COMMENT '点击',
  `workrange` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '时间区间',
  `startdate` date NULL DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime NULL DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year NULL DEFAULT NULL COMMENT '年',
  `times` time NULL DEFAULT NULL COMMENT '时间',
  `refreshtime` bigint NULL DEFAULT NULL COMMENT '刷新时间',
  `createtime` bigint NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` bigint NULL DEFAULT NULL COMMENT '删除时间',
  `weigh` int NULL DEFAULT 0 COMMENT '权重',
  `switch` tinyint(1) NULL DEFAULT 0 COMMENT '开关',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '测试表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_test
-- ----------------------------
INSERT INTO `fa_test` VALUES (1, 1, 1, 12, '12,13', '互联网,计算机', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '我是一篇测试文章描述，内容过多时将自动隐藏', '广西壮族自治区/百色市/平果县', '[\"a\",\"b\"]', '{\"a\":\"1\",\"b\":\"2\"}', '[{\"title\":\"标题一\",\"intro\":\"介绍一\",\"author\":\"小明\",\"age\":\"21\"}]', 0.00, 0, '2020-10-01 00:00:00 - 2021-10-31 23:59:59', '2017-07-10', '2017-07-10 18:24:45', 2017, '18:24:45', 1491635035, 1491635035, 1715690741, NULL, 0, 1, 'normal', '1');
INSERT INTO `fa_test` VALUES (2, 3, 1, 12, '12,13', 'hehe ', 'monday', 'index', 'male', 'music', 'kkk', 'ddd', '', '', '', '', '', '', '', '', '', 0.00, 0, '', '2024-05-24', '2024-05-24 18:17:42', 2024, '18:17:42', 1716545862, 1716546008, 1716546008, NULL, 2, 0, 'normal', '1');
INSERT INTO `fa_test` VALUES (3, 3, 0, 12, '13', '感到翻跟斗,范德萨', 'monday', 'recommend', 'male', 'reading', 'kkk', 'hhh', '', '', '', '', '', '', '', '', '', 0.00, 0, '', '2024-05-24', '2024-05-24 18:34:51', 2024, '18:34:51', 1716546891, 1716546943, 1716546943, NULL, 3, 0, 'normal', '1');
INSERT INTO `fa_test` VALUES (4, 3, 2, 13, '13,12', 'j,l', 'tuesday', 'index', 'male', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, 0, '', '2024-05-24', '2024-05-24 18:38:51', 2024, '18:38:51', 1716547131, 1716547158, 1716547158, NULL, 4, 0, 'normal', '1');
INSERT INTO `fa_test` VALUES (5, 3, 3, 13, '13,12', 's', 'monday', '', 'male', '', '悦动方舟学员（悦动添加）', '', '', '', '', '', '', '', '', '', '', 0.00, 0, '', '2024-05-24', '2024-05-24 18:50:34', 2024, '18:50:34', 1716547834, 1716547878, 1716547878, NULL, 5, 0, 'normal', '1');

-- ----------------------------
-- Table structure for fa_user
-- ----------------------------
DROP TABLE IF EXISTS `fa_user`;
CREATE TABLE `fa_user`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '组别ID',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像',
  `level` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '等级',
  `gender` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '格言',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '余额',
  `score` int NOT NULL DEFAULT 0 COMMENT '积分',
  `successions` int UNSIGNED NOT NULL DEFAULT 1 COMMENT '连续登录天数',
  `maxsuccessions` int UNSIGNED NOT NULL DEFAULT 1 COMMENT '最大连续登录天数',
  `prevtime` bigint NULL DEFAULT NULL COMMENT '上次登录时间',
  `logintime` bigint NULL DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `joinip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '加入IP',
  `jointime` bigint NULL DEFAULT NULL COMMENT '加入时间',
  `createtime` bigint NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint NULL DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '验证',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username` ASC) USING BTREE,
  INDEX `email`(`email` ASC) USING BTREE,
  INDEX `mobile`(`mobile` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user
-- ----------------------------
INSERT INTO `fa_user` VALUES (1, 1, 'admin', 'admin', 'e6e8433fc4af1a1a5af5f66b3a1e246b', '377e71', 'admin@163.com', '13000000000', 'http://www.faa.com/assets/img/avatar.png', 0, 0, '2017-04-08', '', 0.00, 0, 1, 1, 1491635035, 1491635035, '127.0.0.1', 0, '127.0.0.1', 1491635035, 0, 1491635035, '', 'normal', '');
INSERT INTO `fa_user` VALUES (2, 2, 'huiyuan', '肖领队', '67311f085d439a70bf00a1ada9bf5fe2', 'CI0Phm', '317572877@qq.com', '13136310001', '', 1, 0, NULL, '', 0.00, 0, 1, 1, 1715707468, 1716453708, '127.0.0.1', 0, '127.0.0.1', 1715707468, 1715707468, 1716644339, '', 'normal', '');
INSERT INTO `fa_user` VALUES (3, 0, 'wx3', '新用户', '99124503afa7df05bea827c40469df77', 'ugz4fD', 'wx3@www.faa.com', '', '', 1, 0, NULL, '', 0.00, 0, 2, 2, 1716679487, 1716714169, '127.0.0.1', 0, '127.0.0.1', 1716463661, 1716463661, 1716714169, '', 'normal', '');
INSERT INTO `fa_user` VALUES (4, 0, 'huiyuan2', '会员2', '2e5cb3820a3ca0e057b39d7451168a75', '6Y3N5l', '317572872@qq.com', '15136310002', '', 1, 0, NULL, '', 0.00, 0, 1, 1, 1716468076, 1716468076, '127.0.0.1', 0, '127.0.0.1', 1716468076, 1716468076, 1716468253, '', 'normal', '');
INSERT INTO `fa_user` VALUES (5, 0, 'wx5', '新用户', '57a6334942937a9755bcda5a7ddaedba', '6ICr8a', 'wx5@www.faa.com', '', '', 1, 0, NULL, '', 0.00, 0, 2, 2, 1716656752, 1716657738, '127.0.0.1', 0, '127.0.0.1', 1716650862, 1716650862, 1716657738, '', 'normal', '');

-- ----------------------------
-- Table structure for fa_user_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_group`;
CREATE TABLE `fa_user_group`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '权限节点',
  `createtime` bigint NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` bigint NULL DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user_group
-- ----------------------------
INSERT INTO `fa_user_group` VALUES (1, '默认组', '1,2,3,4,5,6,7,8,9,10,11,12', 1491635035, 1491635035, 'normal');
INSERT INTO `fa_user_group` VALUES (2, '领队组', '11,10,9,12,7,6,5,8,4,2,3,1', 1716538991, 1716626836, 'normal');
INSERT INTO `fa_user_group` VALUES (3, '教练组', '2,4,11,10,9,12,1,3,7,6,5,8', 1716626859, 1716626859, 'normal');
INSERT INTO `fa_user_group` VALUES (4, '家长组', '2,4,11,10,9,12,1,3,7,6,5,8', 1716626896, 1716626896, 'normal');
INSERT INTO `fa_user_group` VALUES (5, '裁判组', '2,4,11,10,9,12,1,3,7,6,5,8', 1716628194, 1716628194, 'normal');
INSERT INTO `fa_user_group` VALUES (6, '编排长', '2,4,11,10,9,12,1,3,7,6,5,8', 1716628327, 1716628327, 'normal');

-- ----------------------------
-- Table structure for fa_user_money_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_money_log`;
CREATE TABLE `fa_user_money_log`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更余额',
  `before` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更前余额',
  `after` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更后余额',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `createtime` bigint NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员余额变动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user_money_log
-- ----------------------------

-- ----------------------------
-- Table structure for fa_user_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_rule`;
CREATE TABLE `fa_user_rule`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int NULL DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '标题',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) NULL DEFAULT NULL COMMENT '是否菜单',
  `createtime` bigint NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int NULL DEFAULT 0 COMMENT '权重',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user_rule
-- ----------------------------
INSERT INTO `fa_user_rule` VALUES (1, 0, 'index', 'Frontend', '', 1, 1491635035, 1491635035, 1, 'normal');
INSERT INTO `fa_user_rule` VALUES (2, 0, 'api', 'API Interface', '', 1, 1491635035, 1491635035, 2, 'normal');
INSERT INTO `fa_user_rule` VALUES (3, 1, 'user', 'User Module', '', 1, 1491635035, 1491635035, 12, 'normal');
INSERT INTO `fa_user_rule` VALUES (4, 2, 'user', 'User Module', '', 1, 1491635035, 1491635035, 11, 'normal');
INSERT INTO `fa_user_rule` VALUES (5, 3, 'index/user/login', 'Login', '', 0, 1491635035, 1491635035, 5, 'normal');
INSERT INTO `fa_user_rule` VALUES (6, 3, 'index/user/register', 'Register', '', 0, 1491635035, 1491635035, 7, 'normal');
INSERT INTO `fa_user_rule` VALUES (7, 3, 'index/user/index', 'User Center', '', 0, 1491635035, 1491635035, 9, 'normal');
INSERT INTO `fa_user_rule` VALUES (8, 3, 'index/user/profile', 'Profile', '', 0, 1491635035, 1491635035, 4, 'normal');
INSERT INTO `fa_user_rule` VALUES (9, 4, 'api/user/login', 'Login', '', 0, 1491635035, 1491635035, 6, 'normal');
INSERT INTO `fa_user_rule` VALUES (10, 4, 'api/user/register', 'Register', '', 0, 1491635035, 1491635035, 8, 'normal');
INSERT INTO `fa_user_rule` VALUES (11, 4, 'api/user/index', 'User Center', '', 0, 1491635035, 1491635035, 10, 'normal');
INSERT INTO `fa_user_rule` VALUES (12, 4, 'api/user/profile', 'Profile', '', 0, 1491635035, 1491635035, 3, 'normal');

-- ----------------------------
-- Table structure for fa_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_score_log`;
CREATE TABLE `fa_user_score_log`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `score` int NOT NULL DEFAULT 0 COMMENT '变更积分',
  `before` int NOT NULL DEFAULT 0 COMMENT '变更前积分',
  `after` int NOT NULL DEFAULT 0 COMMENT '变更后积分',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `createtime` bigint NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员积分变动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user_score_log
-- ----------------------------

-- ----------------------------
-- Table structure for fa_user_token
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_token`;
CREATE TABLE `fa_user_token`  (
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Token',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `createtime` bigint NULL DEFAULT NULL COMMENT '创建时间',
  `expiretime` bigint NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员Token表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user_token
-- ----------------------------
INSERT INTO `fa_user_token` VALUES ('2a9a144038707c5a5e2cb7d7a31b0e7bbd83f536', 4, 1716468076, 1719060076);
INSERT INTO `fa_user_token` VALUES ('3c01456d087ba47cdddf08b9b43f5091f6eed028', 5, 1716657738, 1719249738);
INSERT INTO `fa_user_token` VALUES ('4c294a43a551e64b439401ac22fa80aa6c617306', 3, 1716463661, 1719055661);
INSERT INTO `fa_user_token` VALUES ('63529653aa519682cfde8b31eb5d8ff9ad485ac9', 3, 1716660510, 1719252510);
INSERT INTO `fa_user_token` VALUES ('819f462018857ae8c3c3ae17eee983b5756a8d85', 5, 1716656752, 1719248752);
INSERT INTO `fa_user_token` VALUES ('9891a9476b1f452c4035a096312ec491c0064dac', 3, 1716714169, 1719306169);
INSERT INTO `fa_user_token` VALUES ('a859a887e58c3db7d73fe3354c74b31329a2d8e3', 5, 1716650862, 1719242862);
INSERT INTO `fa_user_token` VALUES ('ab5a4237cbfaa665ba39094c48e71a2da5662cc5', 3, 1716463662, 1719055662);
INSERT INTO `fa_user_token` VALUES ('bb1068863a846a1620f8ea101126f74de6713cce', 3, 1716647159, 1719239159);
INSERT INTO `fa_user_token` VALUES ('cfcb49e13cb8ec208b388cdfd0a4eb2602d8d471', 3, 1716679487, 1719271487);
INSERT INTO `fa_user_token` VALUES ('e02fe0227ecf203aeeede34acfda8fe13bc2c960', 3, 1716464242, 1719056242);
INSERT INTO `fa_user_token` VALUES ('e4420b29678b2fe3315e1a1eb69813b74cd9ca9c', 5, 1716650862, 1719242862);

-- ----------------------------
-- Table structure for fa_version
-- ----------------------------
DROP TABLE IF EXISTS `fa_version`;
CREATE TABLE `fa_version`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '包大小',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '强制更新',
  `createtime` bigint NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '版本表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_version
-- ----------------------------

-- ----------------------------
-- Table structure for fa_ygame_ads
-- ----------------------------
DROP TABLE IF EXISTS `fa_ygame_ads`;
CREATE TABLE `fa_ygame_ads`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '封面图',
  `weigh` int NOT NULL DEFAULT 0 COMMENT '权重',
  `createtime` int NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '轮播图' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_ygame_ads
-- ----------------------------

-- ----------------------------
-- Table structure for fa_ygame_article
-- ----------------------------
DROP TABLE IF EXISTS `fa_ygame_article`;
CREATE TABLE `fa_ygame_article`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `article_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `datetime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '时间',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '作者',
  `createtime` int NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_ygame_article
-- ----------------------------

-- ----------------------------
-- Table structure for fa_ygame_cert
-- ----------------------------
DROP TABLE IF EXISTS `fa_ygame_cert`;
CREATE TABLE `fa_ygame_cert`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fontsize` int NOT NULL,
  `color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createtime` int NOT NULL,
  `updatetime` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '证书表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_ygame_cert
-- ----------------------------

-- ----------------------------
-- Table structure for fa_ygame_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_ygame_group`;
CREATE TABLE `fa_ygame_group`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL COMMENT '赛事ID',
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组别名称',
  `sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '说明',
  `price` decimal(10, 2) NOT NULL COMMENT '报名费',
  `num` int NOT NULL COMMENT '总人数',
  `allow_team` int NOT NULL COMMENT '1允许 0不允许',
  `team_price` decimal(10, 2) NOT NULL COMMENT '团队报名费',
  `weigh` int NOT NULL COMMENT '排序',
  `createtime` int NOT NULL COMMENT '添加时间',
  `updatetime` int NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '组别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_ygame_group
-- ----------------------------
INSERT INTO `fa_ygame_group` VALUES (1, 2, '少儿男子组', '说明', 0.00, 1000, 1, 0.00, 0, 1716464701, 1716464701);
INSERT INTO `fa_ygame_group` VALUES (2, 2, '少儿女子组', '说明', 0.00, 2000, 1, 0.00, 0, 1716464720, 1716464720);

-- ----------------------------
-- Table structure for fa_ygame_order
-- ----------------------------
DROP TABLE IF EXISTS `fa_ygame_order`;
CREATE TABLE `fa_ygame_order`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL COMMENT '1个人 2团队',
  `project_id` int NOT NULL COMMENT '赛事',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单号',
  `out_trade_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付订单号',
  `user_id` int NOT NULL COMMENT '用户ID',
  `price` decimal(10, 2) NOT NULL COMMENT '价格',
  `pay_status` int NOT NULL DEFAULT 0 COMMENT '1已支付 0未支付',
  `pay_time` int NULL DEFAULT NULL COMMENT '支付时间',
  `status` int NOT NULL DEFAULT 1 COMMENT '-1已关闭 1已下单 2已支付',
  `createtime` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '支付订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_ygame_order
-- ----------------------------
INSERT INTO `fa_ygame_order` VALUES (1, 1, 2, '2024052319465488385', '2024052319465488385', 3, 0.00, 1, 1716464814, 2, 1716464814);
INSERT INTO `fa_ygame_order` VALUES (2, 2, 2, '2024052319502174859', '2024052319502174859', 3, 0.00, 1, 1716465021, 2, 1716465021);
INSERT INTO `fa_ygame_order` VALUES (3, 2, 2, '2024052602420469853', '2024052602420469853', 3, 0.00, 1, 1716662524, 2, 1716662524);
INSERT INTO `fa_ygame_order` VALUES (4, 2, 2, '2024052603102548714', '2024052603102548714', 3, 0.00, 1, 1716664226, 2, 1716664226);
INSERT INTO `fa_ygame_order` VALUES (5, 1, 2, '2024052605300483282', '2024052605300483282', 3, 0.00, 1, 1716672604, 2, 1716672604);
INSERT INTO `fa_ygame_order` VALUES (6, 1, 2, '2024052605312964636', '2024052605312964636', 3, 0.00, 1, 1716672689, 2, 1716672689);
INSERT INTO `fa_ygame_order` VALUES (7, 1, 2, '2024052607432058832', '2024052607432058832', 3, 0.00, 1, 1716680600, 2, 1716680600);
INSERT INTO `fa_ygame_order` VALUES (8, 1, 2, '2024052607573692537', '2024052607573692537', 3, 0.00, 1, 1716681456, 2, 1716681456);

-- ----------------------------
-- Table structure for fa_ygame_person
-- ----------------------------
DROP TABLE IF EXISTS `fa_ygame_person`;
CREATE TABLE `fa_ygame_person`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `person_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `idcard` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createtime` int NOT NULL,
  `updatetime` int NOT NULL,
  `admin_id` int NULL DEFAULT NULL COMMENT '机构ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '人员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_ygame_person
-- ----------------------------
INSERT INTO `fa_ygame_person` VALUES (1, 3, '团队成员名字2', '13136310002', '371323198909246312', 1716464981, 1716464981, 0);
INSERT INTO `fa_ygame_person` VALUES (2, 3, '报名人3', '13100003333', '371323198909241111', 1716661763, 1716663065, 0);
INSERT INTO `fa_ygame_person` VALUES (3, 3, '未报4', '13166668888', '371323198909242222', 1716663366, 1716663366, 0);
INSERT INTO `fa_ygame_person` VALUES (4, 3, '未报5', '13155556666', '371323198909245555', 1716665943, 1716665943, 0);

-- ----------------------------
-- Table structure for fa_ygame_project
-- ----------------------------
DROP TABLE IF EXISTS `fa_ygame_project`;
CREATE TABLE `fa_ygame_project`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '赛事名称',
  `start_time` int NOT NULL COMMENT '报名开始时间',
  `end_time` int NOT NULL COMMENT '报名结束时间',
  `game_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '比赛时间',
  `game_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '比赛地点',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '封面图片',
  `agreement` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '赛事协议',
  `min_team_num` int NOT NULL COMMENT '最小成团人数',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '赛事介绍',
  `weigh` int NOT NULL DEFAULT 0 COMMENT '排序',
  `status` int NOT NULL COMMENT '状态：1上线 0草稿箱',
  `createtime` int NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '赛事表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_ygame_project
-- ----------------------------
INSERT INTO `fa_ygame_project` VALUES (1, '第一个测试赛事', 1715773131, 1716118734, '2024-05-30 19:39:00', '南天门', '/uploads/20240515/9467fad63608835514ad8de19753499d.png', '赛事协议，需要确认', 1, '赛事介绍', 0, 1, 1715773227);
INSERT INTO `fa_ygame_project` VALUES (2, '第二个测试赛事', 1716378038, 1716810047, '2024-05-28 19:40:57', '待定', '/uploads/20240515/9467fad63608835514ad8de19753499d.png', '赛事协议', 1, '赛事介绍', 0, 1, 1716464500);
INSERT INTO `fa_ygame_project` VALUES (3, '第3个测试赛事', 1716649237, 1717167637, '2024-05-31 23:00:51', '南天门', '/uploads/20240525/9c420183d3721ad869bc980cc7c43102.png', '协议', 1, '介绍', 0, 1, 1716649287);

-- ----------------------------
-- Table structure for fa_ygame_record
-- ----------------------------
DROP TABLE IF EXISTS `fa_ygame_record`;
CREATE TABLE `fa_ygame_record`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `order_id` int NOT NULL COMMENT '订单ID',
  `type` int NOT NULL COMMENT '1个人 2团队',
  `group_id` int NOT NULL DEFAULT 0 COMMENT '组别ID',
  `team_id` int NOT NULL DEFAULT 0 COMMENT '团队ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号',
  `idcard` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '身份证',
  `price` decimal(10, 2) NOT NULL COMMENT '报名费',
  `status` int NOT NULL DEFAULT 0 COMMENT '0未支付  1已报名  2已通过',
  `user_id` int NULL DEFAULT NULL COMMENT '监护人ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '报名详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_ygame_record
-- ----------------------------
INSERT INTO `fa_ygame_record` VALUES (1, 2, 1, 1, 1, 0, '小程序用户1', '13136310001', '371323198909246311', 0.00, 1, 3);
INSERT INTO `fa_ygame_record` VALUES (2, 2, 2, 2, 2, 1, '团队成员名字2', '13136310002', '371323198909246312', 0.00, 1, 3);
INSERT INTO `fa_ygame_record` VALUES (3, 2, 3, 2, 1, 1, '报名人3', '13100003333', '371323198909241111', 0.00, 1, 3);
INSERT INTO `fa_ygame_record` VALUES (4, 2, 4, 2, 2, 1, '未报4', '13166668888', '371323198909242222', 0.00, 1, 0);
INSERT INTO `fa_ygame_record` VALUES (5, 2, 5, 1, 1, 0, '个人', '13136310010', '371323198909241234', 0.00, 1, 0);
INSERT INTO `fa_ygame_record` VALUES (6, 2, 6, 1, 1, 0, '我爱罗', '13136310013', '371323198909241221', 0.00, 1, 3);
INSERT INTO `fa_ygame_record` VALUES (7, 2, 7, 1, 1, 0, '弟弟', '13152526323', '371323198909246556', 0.00, 1, 3);
INSERT INTO `fa_ygame_record` VALUES (8, 2, 8, 1, 1, 2, '等待', '13136329854', '371323198909245874', 0.00, 1, 3);

-- ----------------------------
-- Table structure for fa_ygame_result
-- ----------------------------
DROP TABLE IF EXISTS `fa_ygame_result`;
CREATE TABLE `fa_ygame_result`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `rank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名次',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `idcard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '身份证号',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号',
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组别',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '赛号',
  `result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '成绩',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_ygame_result
-- ----------------------------

-- ----------------------------
-- Table structure for fa_ygame_team
-- ----------------------------
DROP TABLE IF EXISTS `fa_ygame_team`;
CREATE TABLE `fa_ygame_team`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '领队id以后改成leaderid外键',
  `project_id` int NOT NULL COMMENT '赛事ID',
  `team_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '团队名称',
  `leader` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '领队姓名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号',
  `createtime` int NOT NULL,
  `updatetime` int NULL DEFAULT NULL,
  `trainer_id` int NULL DEFAULT NULL COMMENT '教练id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_ygame_team
-- ----------------------------
INSERT INTO `fa_ygame_team` VALUES (1, 3, 2, '团队名称1', '团队负责人小王1', '13836310001', 1716465021, 1716465021, NULL);
INSERT INTO `fa_ygame_team` VALUES (2, 3, 1, '某某代表队', '某某', '111', 1716643645, 1716643700, 2);

-- ----------------------------
-- Table structure for fa_ygame_wechat
-- ----------------------------
DROP TABLE IF EXISTS `fa_ygame_wechat`;
CREATE TABLE `fa_ygame_wechat`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '来源',
  `openid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'openID',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `createtime` int UNSIGNED NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int UNSIGNED NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `platform`(`openid` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_ygame_wechat
-- ----------------------------
INSERT INTO `fa_ygame_wechat` VALUES (1, 3, 'mini', 'oKtsU7XIXCsHTQyqBw3cNmFe3Wrk', '新用户', '', 1716463661, NULL);
INSERT INTO `fa_ygame_wechat` VALUES (2, 2, 'mini', 'oKtsU7eBAlsSHVYrHA7fk4zH6KBA', '肖', '', 1716650862, NULL);

SET FOREIGN_KEY_CHECKS = 1;
