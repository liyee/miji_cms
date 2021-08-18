/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.28.198
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : 192.168.28.198:3306
 Source Schema         : db_test

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 05/08/2021 13:38:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (2, 0, 7, '系统管理', 'fa-tasks', '', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (3, 2, 3, '管理员列表', 'fa-users', 'auth/users', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (4, 2, 4, '角色列表', 'fa-user', 'auth/roles', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (5, 2, 5, '权限列表', 'fa-ban', 'auth/permissions', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (6, 2, 6, '菜单管理', 'fa-bars', 'auth/menu', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (7, 2, 7, '操作日志', 'fa-history', 'auth/logs', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (8, 0, 2, '用户管理', 'fa-newspaper-o', 'users', '*', '2021-07-28 09:49:12', '2021-08-02 05:42:07');
INSERT INTO `admin_menu` VALUES (9, 0, 3, 'CP管理', 'fa-bars', 'cps', '*', '2021-08-02 10:24:52', '2021-08-02 10:24:52');
INSERT INTO `admin_menu` VALUES (10, 0, 5, '媒资管理', 'fa-file-video-o', NULL, NULL, '2021-08-03 03:11:10', '2021-08-03 03:14:12');
INSERT INTO `admin_menu` VALUES (11, 10, 0, '视频媒资', 'fa-archive', 'media-videos', NULL, '2021-08-03 03:12:24', '2021-08-03 03:12:24');
INSERT INTO `admin_menu` VALUES (12, 0, 4, '栏目管理', 'fa-columns', NULL, NULL, '2021-08-03 08:19:13', '2021-08-03 08:20:05');
INSERT INTO `admin_menu` VALUES (13, 12, 0, '视频栏目', 'fa-bars', 'column-videos', NULL, '2021-08-03 08:21:18', '2021-08-03 08:21:18');
INSERT INTO `admin_menu` VALUES (14, 0, 6, '属性配置', 'fa-cog', 'configs', NULL, '2021-08-03 08:46:56', '2021-08-03 08:46:56');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 890 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES (1, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-28 09:12:44', '2021-07-28 09:12:44');
INSERT INTO `admin_operation_log` VALUES (2, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 09:12:54', '2021-07-28 09:12:54');
INSERT INTO `admin_operation_log` VALUES (3, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 09:13:02', '2021-07-28 09:13:02');
INSERT INTO `admin_operation_log` VALUES (4, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 09:13:18', '2021-07-28 09:13:18');
INSERT INTO `admin_operation_log` VALUES (5, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 09:13:38', '2021-07-28 09:13:38');
INSERT INTO `admin_operation_log` VALUES (6, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 09:13:53', '2021-07-28 09:13:53');
INSERT INTO `admin_operation_log` VALUES (7, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2021-07-28 09:14:48', '2021-07-28 09:14:48');
INSERT INTO `admin_operation_log` VALUES (8, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 09:14:54', '2021-07-28 09:14:54');
INSERT INTO `admin_operation_log` VALUES (9, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 09:15:18', '2021-07-28 09:15:18');
INSERT INTO `admin_operation_log` VALUES (10, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 09:16:01', '2021-07-28 09:16:01');
INSERT INTO `admin_operation_log` VALUES (11, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 09:16:36', '2021-07-28 09:16:36');
INSERT INTO `admin_operation_log` VALUES (12, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-28 09:16:47', '2021-07-28 09:16:47');
INSERT INTO `admin_operation_log` VALUES (13, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-28 09:40:02', '2021-07-28 09:40:02');
INSERT INTO `admin_operation_log` VALUES (14, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-28 09:40:40', '2021-07-28 09:40:40');
INSERT INTO `admin_operation_log` VALUES (15, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 09:40:47', '2021-07-28 09:40:47');
INSERT INTO `admin_operation_log` VALUES (16, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 09:41:09', '2021-07-28 09:41:09');
INSERT INTO `admin_operation_log` VALUES (17, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 09:41:29', '2021-07-28 09:41:29');
INSERT INTO `admin_operation_log` VALUES (18, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 09:42:04', '2021-07-28 09:42:04');
INSERT INTO `admin_operation_log` VALUES (19, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 09:44:43', '2021-07-28 09:44:43');
INSERT INTO `admin_operation_log` VALUES (20, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u5ba2\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-newspaper-o\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"AwXrVNO5T24AlOI3EArng0WmZglKUXYLaIuKteFo\"}', '2021-07-28 09:49:11', '2021-07-28 09:49:11');
INSERT INTO `admin_operation_log` VALUES (21, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-07-28 09:49:14', '2021-07-28 09:49:14');
INSERT INTO `admin_operation_log` VALUES (22, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-07-28 09:49:22', '2021-07-28 09:49:22');
INSERT INTO `admin_operation_log` VALUES (23, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 09:49:31', '2021-07-28 09:49:31');
INSERT INTO `admin_operation_log` VALUES (24, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 09:49:50', '2021-07-28 09:49:50');
INSERT INTO `admin_operation_log` VALUES (25, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 09:49:59', '2021-07-28 09:49:59');
INSERT INTO `admin_operation_log` VALUES (26, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 09:51:31', '2021-07-28 09:51:31');
INSERT INTO `admin_operation_log` VALUES (27, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 09:51:36', '2021-07-28 09:51:36');
INSERT INTO `admin_operation_log` VALUES (28, 1, 'admin/auth/users', 'POST', '127.0.0.1', '{\"username\":\"\\u674e\\u4fca\\u4e7e\",\"name\":\"\\u674e\\u4fca\\u4e7e\",\"password\":\"123456\",\"password_confirmation\":\"123456\",\"roles\":[\"1\",null],\"permissions\":[\"1\",null],\"_token\":\"AwXrVNO5T24AlOI3EArng0WmZglKUXYLaIuKteFo\",\"after-save\":\"3\",\"_previous_\":\"http:\\/\\/test.metaxplay.com\\/admin\\/auth\\/users\"}', '2021-07-28 09:52:33', '2021-07-28 09:52:33');
INSERT INTO `admin_operation_log` VALUES (29, 1, 'admin/auth/users/2', 'GET', '127.0.0.1', '[]', '2021-07-28 09:52:35', '2021-07-28 09:52:35');
INSERT INTO `admin_operation_log` VALUES (30, 1, 'admin/auth/users/2', 'GET', '127.0.0.1', '[]', '2021-07-28 09:54:37', '2021-07-28 09:54:37');
INSERT INTO `admin_operation_log` VALUES (31, 1, 'admin/auth/users/2', 'GET', '127.0.0.1', '[]', '2021-07-28 09:55:35', '2021-07-28 09:55:35');
INSERT INTO `admin_operation_log` VALUES (32, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 09:56:09', '2021-07-28 09:56:09');
INSERT INTO `admin_operation_log` VALUES (33, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 09:56:17', '2021-07-28 09:56:17');
INSERT INTO `admin_operation_log` VALUES (34, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"\\u674e\\u4fca\\u4e7e\",\"name\":\"\\u674e\\u4fca\\u4e7e\",\"password\":\"$2y$10$XfzyE2PmWV0fN6.DvAYSr.2JdtK3sn6ACMow7qdBxyTZYy2ATupLq\",\"password_confirmation\":\"$2y$10$XfzyE2PmWV0fN6.DvAYSr.2JdtK3sn6ACMow7qdBxyTZYy2ATupLq\",\"roles\":[\"1\",null],\"permissions\":[\"3\",null],\"_token\":\"AwXrVNO5T24AlOI3EArng0WmZglKUXYLaIuKteFo\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/test.metaxplay.com\\/admin\\/auth\\/users\"}', '2021-07-28 09:56:45', '2021-07-28 09:56:45');
INSERT INTO `admin_operation_log` VALUES (35, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2021-07-28 09:56:47', '2021-07-28 09:56:47');
INSERT INTO `admin_operation_log` VALUES (36, 2, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-28 09:58:25', '2021-07-28 09:58:25');
INSERT INTO `admin_operation_log` VALUES (37, 2, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 09:58:31', '2021-07-28 09:58:31');
INSERT INTO `admin_operation_log` VALUES (38, 2, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 09:58:36', '2021-07-28 09:58:36');
INSERT INTO `admin_operation_log` VALUES (39, 2, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 09:58:39', '2021-07-28 09:58:39');
INSERT INTO `admin_operation_log` VALUES (40, 2, 'admin/auth/roles', 'POST', '127.0.0.1', '{\"slug\":\"\\u5ba2\\u6237\\u7ba1\\u7406\",\"name\":\"\\u5ba2\\u6237\\u7ba1\\u7406\",\"permissions\":[\"2\",null],\"_token\":\"Hjk0uh27F2u5Vhjs4Mz8Y8iREYuechzzjtYGDwf4\",\"_previous_\":\"http:\\/\\/test.metaxplay.com\\/admin\\/auth\\/roles\"}', '2021-07-28 09:59:42', '2021-07-28 09:59:42');
INSERT INTO `admin_operation_log` VALUES (41, 2, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2021-07-28 09:59:44', '2021-07-28 09:59:44');
INSERT INTO `admin_operation_log` VALUES (42, 2, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 09:59:53', '2021-07-28 09:59:53');
INSERT INTO `admin_operation_log` VALUES (43, 2, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:00:03', '2021-07-28 10:00:03');
INSERT INTO `admin_operation_log` VALUES (44, 2, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:00:07', '2021-07-28 10:00:07');
INSERT INTO `admin_operation_log` VALUES (45, 2, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"\\u674e\\u4fca\\u4e7e\",\"name\":\"\\u674e\\u4fca\\u4e7e\",\"password\":\"$2y$10$XfzyE2PmWV0fN6.DvAYSr.2JdtK3sn6ACMow7qdBxyTZYy2ATupLq\",\"password_confirmation\":\"$2y$10$XfzyE2PmWV0fN6.DvAYSr.2JdtK3sn6ACMow7qdBxyTZYy2ATupLq\",\"roles\":[\"2\",null],\"permissions\":[\"3\",null],\"_token\":\"Hjk0uh27F2u5Vhjs4Mz8Y8iREYuechzzjtYGDwf4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/test.metaxplay.com\\/admin\\/auth\\/users\"}', '2021-07-28 10:00:15', '2021-07-28 10:00:15');
INSERT INTO `admin_operation_log` VALUES (46, 2, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2021-07-28 10:00:17', '2021-07-28 10:00:17');
INSERT INTO `admin_operation_log` VALUES (47, 2, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2021-07-28 10:00:22', '2021-07-28 10:00:22');
INSERT INTO `admin_operation_log` VALUES (48, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:00:24', '2021-07-28 10:00:24');
INSERT INTO `admin_operation_log` VALUES (49, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:00:25', '2021-07-28 10:00:25');
INSERT INTO `admin_operation_log` VALUES (50, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:02:28', '2021-07-28 10:02:28');
INSERT INTO `admin_operation_log` VALUES (51, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-28 10:02:37', '2021-07-28 10:02:37');
INSERT INTO `admin_operation_log` VALUES (52, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2021-07-28 10:02:49', '2021-07-28 10:02:49');
INSERT INTO `admin_operation_log` VALUES (53, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-28 10:16:02', '2021-07-28 10:16:02');
INSERT INTO `admin_operation_log` VALUES (54, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:16:14', '2021-07-28 10:16:14');
INSERT INTO `admin_operation_log` VALUES (55, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-28 10:16:32', '2021-07-28 10:16:32');
INSERT INTO `admin_operation_log` VALUES (56, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:16:37', '2021-07-28 10:16:37');
INSERT INTO `admin_operation_log` VALUES (57, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:16:38', '2021-07-28 10:16:38');
INSERT INTO `admin_operation_log` VALUES (58, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:19:32', '2021-07-28 10:19:32');
INSERT INTO `admin_operation_log` VALUES (59, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:19:56', '2021-07-28 10:19:56');
INSERT INTO `admin_operation_log` VALUES (60, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:20:13', '2021-07-28 10:20:13');
INSERT INTO `admin_operation_log` VALUES (61, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:20:33', '2021-07-28 10:20:33');
INSERT INTO `admin_operation_log` VALUES (62, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:21:01', '2021-07-28 10:21:01');
INSERT INTO `admin_operation_log` VALUES (63, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:21:04', '2021-07-28 10:21:04');
INSERT INTO `admin_operation_log` VALUES (64, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:21:08', '2021-07-28 10:21:08');
INSERT INTO `admin_operation_log` VALUES (65, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:21:08', '2021-07-28 10:21:08');
INSERT INTO `admin_operation_log` VALUES (66, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:21:45', '2021-07-28 10:21:45');
INSERT INTO `admin_operation_log` VALUES (67, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:22:22', '2021-07-28 10:22:22');
INSERT INTO `admin_operation_log` VALUES (68, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:23:07', '2021-07-28 10:23:07');
INSERT INTO `admin_operation_log` VALUES (69, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:23:29', '2021-07-28 10:23:29');
INSERT INTO `admin_operation_log` VALUES (70, 1, 'admin/auth/permissions/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:23:53', '2021-07-28 10:23:53');
INSERT INTO `admin_operation_log` VALUES (71, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:25:35', '2021-07-28 10:25:35');
INSERT INTO `admin_operation_log` VALUES (72, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2021-07-28 10:25:41', '2021-07-28 10:25:41');
INSERT INTO `admin_operation_log` VALUES (73, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:38:09', '2021-07-28 10:38:09');
INSERT INTO `admin_operation_log` VALUES (74, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:38:13', '2021-07-28 10:38:13');
INSERT INTO `admin_operation_log` VALUES (75, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:38:15', '2021-07-28 10:38:15');
INSERT INTO `admin_operation_log` VALUES (76, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:38:16', '2021-07-28 10:38:16');
INSERT INTO `admin_operation_log` VALUES (77, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:39:14', '2021-07-28 10:39:14');
INSERT INTO `admin_operation_log` VALUES (78, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:39:17', '2021-07-28 10:39:17');
INSERT INTO `admin_operation_log` VALUES (79, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:39:23', '2021-07-28 10:39:23');
INSERT INTO `admin_operation_log` VALUES (80, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:44:47', '2021-07-28 10:44:47');
INSERT INTO `admin_operation_log` VALUES (81, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:44:48', '2021-07-28 10:44:48');
INSERT INTO `admin_operation_log` VALUES (82, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:44:52', '2021-07-28 10:44:52');
INSERT INTO `admin_operation_log` VALUES (83, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:44:55', '2021-07-28 10:44:55');
INSERT INTO `admin_operation_log` VALUES (84, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:44:57', '2021-07-28 10:44:57');
INSERT INTO `admin_operation_log` VALUES (85, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:44:59', '2021-07-28 10:44:59');
INSERT INTO `admin_operation_log` VALUES (86, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:44:59', '2021-07-28 10:44:59');
INSERT INTO `admin_operation_log` VALUES (87, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:45:00', '2021-07-28 10:45:00');
INSERT INTO `admin_operation_log` VALUES (88, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:45:29', '2021-07-28 10:45:29');
INSERT INTO `admin_operation_log` VALUES (89, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:45:32', '2021-07-28 10:45:32');
INSERT INTO `admin_operation_log` VALUES (90, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-28 10:55:47', '2021-07-28 10:55:47');
INSERT INTO `admin_operation_log` VALUES (91, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:55:54', '2021-07-28 10:55:54');
INSERT INTO `admin_operation_log` VALUES (92, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:55:56', '2021-07-28 10:55:56');
INSERT INTO `admin_operation_log` VALUES (93, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:55:58', '2021-07-28 10:55:58');
INSERT INTO `admin_operation_log` VALUES (94, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:56:01', '2021-07-28 10:56:01');
INSERT INTO `admin_operation_log` VALUES (95, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 10:56:03', '2021-07-28 10:56:03');
INSERT INTO `admin_operation_log` VALUES (96, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 11:13:04', '2021-07-28 11:13:04');
INSERT INTO `admin_operation_log` VALUES (97, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 11:13:06', '2021-07-28 11:13:06');
INSERT INTO `admin_operation_log` VALUES (98, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 11:13:09', '2021-07-28 11:13:09');
INSERT INTO `admin_operation_log` VALUES (99, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 11:20:33', '2021-07-28 11:20:33');
INSERT INTO `admin_operation_log` VALUES (100, 1, 'admin/auth/users/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 11:20:40', '2021-07-28 11:20:40');
INSERT INTO `admin_operation_log` VALUES (101, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 11:20:59', '2021-07-28 11:20:59');
INSERT INTO `admin_operation_log` VALUES (102, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 11:21:03', '2021-07-28 11:21:03');
INSERT INTO `admin_operation_log` VALUES (103, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 11:23:34', '2021-07-28 11:23:34');
INSERT INTO `admin_operation_log` VALUES (104, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 11:29:14', '2021-07-28 11:29:14');
INSERT INTO `admin_operation_log` VALUES (105, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 11:29:20', '2021-07-28 11:29:20');
INSERT INTO `admin_operation_log` VALUES (106, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 11:29:24', '2021-07-28 11:29:24');
INSERT INTO `admin_operation_log` VALUES (107, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2021-07-28 11:32:55', '2021-07-28 11:32:55');
INSERT INTO `admin_operation_log` VALUES (108, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2021-07-28 11:32:59', '2021-07-28 11:32:59');
INSERT INTO `admin_operation_log` VALUES (109, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2021-07-28 11:33:08', '2021-07-28 11:33:08');
INSERT INTO `admin_operation_log` VALUES (110, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2021-07-28 11:35:00', '2021-07-28 11:35:00');
INSERT INTO `admin_operation_log` VALUES (111, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 11:57:29', '2021-07-28 11:57:29');
INSERT INTO `admin_operation_log` VALUES (112, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 11:58:01', '2021-07-28 11:58:01');
INSERT INTO `admin_operation_log` VALUES (113, 1, 'admin/auth/menu/8', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u5ba2\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-newspaper-o\",\"uri\":\"http:\\/\\/test.metaxplay.com\\/admin\\/auth\\/test\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"rU0kk8RY3595cxNR0kuZH3UtMcczWsBzWSu2S7wA\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/test.metaxplay.com\\/admin\\/auth\\/menu\"}', '2021-07-28 11:58:14', '2021-07-28 11:58:14');
INSERT INTO `admin_operation_log` VALUES (114, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-07-28 11:58:15', '2021-07-28 11:58:15');
INSERT INTO `admin_operation_log` VALUES (115, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 11:58:21', '2021-07-28 11:58:21');
INSERT INTO `admin_operation_log` VALUES (116, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 11:58:27', '2021-07-28 11:58:27');
INSERT INTO `admin_operation_log` VALUES (117, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 11:58:34', '2021-07-28 11:58:34');
INSERT INTO `admin_operation_log` VALUES (118, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 11:58:38', '2021-07-28 11:58:38');
INSERT INTO `admin_operation_log` VALUES (119, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-28 11:58:40', '2021-07-28 11:58:40');
INSERT INTO `admin_operation_log` VALUES (120, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 11:58:47', '2021-07-28 11:58:47');
INSERT INTO `admin_operation_log` VALUES (121, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-28 11:58:55', '2021-07-28 11:58:55');
INSERT INTO `admin_operation_log` VALUES (122, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '[]', '2021-07-28 11:59:22', '2021-07-28 11:59:22');
INSERT INTO `admin_operation_log` VALUES (123, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-28 11:59:34', '2021-07-28 11:59:34');
INSERT INTO `admin_operation_log` VALUES (124, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-28 12:01:04', '2021-07-28 12:01:04');
INSERT INTO `admin_operation_log` VALUES (125, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-29 01:49:43', '2021-07-29 01:49:43');
INSERT INTO `admin_operation_log` VALUES (126, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2021-07-29 01:50:56', '2021-07-29 01:50:56');
INSERT INTO `admin_operation_log` VALUES (127, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-29 01:52:21', '2021-07-29 01:52:21');
INSERT INTO `admin_operation_log` VALUES (128, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-29 01:52:23', '2021-07-29 01:52:23');
INSERT INTO `admin_operation_log` VALUES (129, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-29 01:52:24', '2021-07-29 01:52:24');
INSERT INTO `admin_operation_log` VALUES (130, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-29 01:52:25', '2021-07-29 01:52:25');
INSERT INTO `admin_operation_log` VALUES (131, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-29 06:51:19', '2021-07-29 06:51:19');
INSERT INTO `admin_operation_log` VALUES (132, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-29 07:40:48', '2021-07-29 07:40:48');
INSERT INTO `admin_operation_log` VALUES (133, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-29 07:40:58', '2021-07-29 07:40:58');
INSERT INTO `admin_operation_log` VALUES (134, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-07-29 07:41:36', '2021-07-29 07:41:36');
INSERT INTO `admin_operation_log` VALUES (135, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-29 07:42:00', '2021-07-29 07:42:00');
INSERT INTO `admin_operation_log` VALUES (136, 1, 'admin/auth/menu/8', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u5ba2\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-newspaper-o\",\"uri\":\"users\\/grid\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"yXjYSpwUO77Pwhfajw4R2Rui6Bwh3LfsLrbd74NF\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/test.metaxplay.com\\/admin\\/auth\\/menu\"}', '2021-07-29 07:43:26', '2021-07-29 07:43:26');
INSERT INTO `admin_operation_log` VALUES (137, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-07-29 07:43:27', '2021-07-29 07:43:27');
INSERT INTO `admin_operation_log` VALUES (138, 1, 'admin/users/grid', 'GET', '127.0.0.1', '[]', '2021-07-29 07:43:34', '2021-07-29 07:43:34');
INSERT INTO `admin_operation_log` VALUES (139, 1, 'admin/users/grid', 'GET', '127.0.0.1', '[]', '2021-07-29 07:46:29', '2021-07-29 07:46:29');
INSERT INTO `admin_operation_log` VALUES (140, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-29 07:49:24', '2021-07-29 07:49:24');
INSERT INTO `admin_operation_log` VALUES (141, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-29 13:02:44', '2021-07-29 13:02:44');
INSERT INTO `admin_operation_log` VALUES (142, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-29 13:02:56', '2021-07-29 13:02:56');
INSERT INTO `admin_operation_log` VALUES (143, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-29 13:03:02', '2021-07-29 13:03:02');
INSERT INTO `admin_operation_log` VALUES (144, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-29 13:03:10', '2021-07-29 13:03:10');
INSERT INTO `admin_operation_log` VALUES (145, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-29 13:06:42', '2021-07-29 13:06:42');
INSERT INTO `admin_operation_log` VALUES (146, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-29 13:15:53', '2021-07-29 13:15:53');
INSERT INTO `admin_operation_log` VALUES (147, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-29 13:16:02', '2021-07-29 13:16:02');
INSERT INTO `admin_operation_log` VALUES (148, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-30 06:49:02', '2021-07-30 06:49:02');
INSERT INTO `admin_operation_log` VALUES (149, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-30 06:49:22', '2021-07-30 06:49:22');
INSERT INTO `admin_operation_log` VALUES (150, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-30 06:49:44', '2021-07-30 06:49:44');
INSERT INTO `admin_operation_log` VALUES (151, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-30 06:49:54', '2021-07-30 06:49:54');
INSERT INTO `admin_operation_log` VALUES (152, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-30 07:03:45', '2021-07-30 07:03:45');
INSERT INTO `admin_operation_log` VALUES (153, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-30 07:03:49', '2021-07-30 07:03:49');
INSERT INTO `admin_operation_log` VALUES (154, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-30 08:32:33', '2021-07-30 08:32:33');
INSERT INTO `admin_operation_log` VALUES (155, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-30 11:25:12', '2021-07-30 11:25:12');
INSERT INTO `admin_operation_log` VALUES (156, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-31 01:38:35', '2021-07-31 01:38:35');
INSERT INTO `admin_operation_log` VALUES (157, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-31 05:48:54', '2021-07-31 05:48:54');
INSERT INTO `admin_operation_log` VALUES (158, 1, 'admin/users/grid', 'GET', '127.0.0.1', '[]', '2021-07-31 05:49:53', '2021-07-31 05:49:53');
INSERT INTO `admin_operation_log` VALUES (159, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2021-07-31 05:50:05', '2021-07-31 05:50:05');
INSERT INTO `admin_operation_log` VALUES (160, 1, 'admin/users/grid', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 05:50:21', '2021-07-31 05:50:21');
INSERT INTO `admin_operation_log` VALUES (161, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2021-07-31 05:50:23', '2021-07-31 05:50:23');
INSERT INTO `admin_operation_log` VALUES (162, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 05:50:24', '2021-07-31 05:50:24');
INSERT INTO `admin_operation_log` VALUES (163, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 05:50:30', '2021-07-31 05:50:30');
INSERT INTO `admin_operation_log` VALUES (164, 1, 'admin/auth/menu/8', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u5ba2\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-newspaper-o\",\"uri\":\"users\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"VOTpdwNPyQqEdC0M9NS5oy8OBbz6aJC6uG8FOMMr\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/test.metaxplay.com\\/admin\\/auth\\/menu\"}', '2021-07-31 05:50:41', '2021-07-31 05:50:41');
INSERT INTO `admin_operation_log` VALUES (165, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-07-31 05:50:42', '2021-07-31 05:50:42');
INSERT INTO `admin_operation_log` VALUES (166, 1, 'admin/users/grid', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 05:50:51', '2021-07-31 05:50:51');
INSERT INTO `admin_operation_log` VALUES (167, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-07-31 05:50:52', '2021-07-31 05:50:52');
INSERT INTO `admin_operation_log` VALUES (168, 1, 'admin/users/grid', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 05:51:10', '2021-07-31 05:51:10');
INSERT INTO `admin_operation_log` VALUES (169, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-07-31 05:51:11', '2021-07-31 05:51:11');
INSERT INTO `admin_operation_log` VALUES (170, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-07-31 05:51:21', '2021-07-31 05:51:21');
INSERT INTO `admin_operation_log` VALUES (171, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 05:51:25', '2021-07-31 05:51:25');
INSERT INTO `admin_operation_log` VALUES (172, 1, 'admin/users/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 05:51:34', '2021-07-31 05:51:34');
INSERT INTO `admin_operation_log` VALUES (173, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 05:51:46', '2021-07-31 05:51:46');
INSERT INTO `admin_operation_log` VALUES (174, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 05:52:11', '2021-07-31 05:52:11');
INSERT INTO `admin_operation_log` VALUES (175, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 05:52:38', '2021-07-31 05:52:38');
INSERT INTO `admin_operation_log` VALUES (176, 1, 'admin/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 05:52:50', '2021-07-31 05:52:50');
INSERT INTO `admin_operation_log` VALUES (177, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 05:52:56', '2021-07-31 05:52:56');
INSERT INTO `admin_operation_log` VALUES (178, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":\"2\"}', '2021-07-31 05:53:08', '2021-07-31 05:53:08');
INSERT INTO `admin_operation_log` VALUES (179, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":\"2\",\"per_page\":\"100\"}', '2021-07-31 05:53:15', '2021-07-31 05:53:15');
INSERT INTO `admin_operation_log` VALUES (180, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"per_page\":\"100\"}', '2021-07-31 05:53:23', '2021-07-31 05:53:23');
INSERT INTO `admin_operation_log` VALUES (181, 1, 'admin/users', 'GET', '127.0.0.1', '{\"per_page\":\"100\"}', '2021-07-31 05:54:10', '2021-07-31 05:54:10');
INSERT INTO `admin_operation_log` VALUES (182, 1, 'admin/users', 'GET', '127.0.0.1', '{\"per_page\":\"100\"}', '2021-07-31 05:54:33', '2021-07-31 05:54:33');
INSERT INTO `admin_operation_log` VALUES (183, 1, 'admin/users', 'GET', '127.0.0.1', '{\"per_page\":\"100\"}', '2021-07-31 05:54:35', '2021-07-31 05:54:35');
INSERT INTO `admin_operation_log` VALUES (184, 1, 'admin/users', 'GET', '127.0.0.1', '{\"per_page\":\"100\",\"_export_\":\"all\"}', '2021-07-31 05:55:16', '2021-07-31 05:55:16');
INSERT INTO `admin_operation_log` VALUES (185, 1, 'admin/users', 'GET', '127.0.0.1', '{\"per_page\":\"100\"}', '2021-07-31 05:59:49', '2021-07-31 05:59:49');
INSERT INTO `admin_operation_log` VALUES (186, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-31 06:17:18', '2021-07-31 06:17:18');
INSERT INTO `admin_operation_log` VALUES (187, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 06:17:28', '2021-07-31 06:17:28');
INSERT INTO `admin_operation_log` VALUES (188, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2021-07-31 06:17:37', '2021-07-31 06:17:37');
INSERT INTO `admin_operation_log` VALUES (189, 1, 'admin/users', 'GET', '127.0.0.1', '{\"id\":\"2\",\"_pjax\":\"#pjax-container\"}', '2021-07-31 06:18:11', '2021-07-31 06:18:11');
INSERT INTO `admin_operation_log` VALUES (190, 1, 'admin/users', 'GET', '127.0.0.1', '{\"per_page\":\"100\",\"id\":\"2\",\"_pjax\":\"#pjax-container\"}', '2021-07-31 06:20:49', '2021-07-31 06:20:49');
INSERT INTO `admin_operation_log` VALUES (191, 1, 'admin/users', 'GET', '127.0.0.1', '{\"per_page\":\"100\",\"_pjax\":\"#pjax-container\",\"id\":\"2\"}', '2021-07-31 06:21:21', '2021-07-31 06:21:21');
INSERT INTO `admin_operation_log` VALUES (192, 1, 'admin/users', 'GET', '127.0.0.1', '{\"per_page\":\"100\",\"_pjax\":\"#pjax-container\",\"id\":\"junqian\"}', '2021-07-31 06:22:00', '2021-07-31 06:22:00');
INSERT INTO `admin_operation_log` VALUES (193, 1, 'admin/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 06:22:16', '2021-07-31 06:22:16');
INSERT INTO `admin_operation_log` VALUES (194, 1, 'admin/users', 'GET', '127.0.0.1', '{\"per_page\":\"100\",\"id\":\"junqian\",\"_pjax\":\"#pjax-container\"}', '2021-07-31 06:22:21', '2021-07-31 06:22:21');
INSERT INTO `admin_operation_log` VALUES (195, 1, 'admin/users', 'GET', '127.0.0.1', '{\"per_page\":\"100\",\"_pjax\":\"#pjax-container\",\"id\":\"2\"}', '2021-07-31 06:23:44', '2021-07-31 06:23:44');
INSERT INTO `admin_operation_log` VALUES (196, 1, 'admin/users', 'GET', '127.0.0.1', '{\"per_page\":\"100\",\"id\":\"2\"}', '2021-07-31 06:25:02', '2021-07-31 06:25:02');
INSERT INTO `admin_operation_log` VALUES (197, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-31 06:25:17', '2021-07-31 06:25:17');
INSERT INTO `admin_operation_log` VALUES (198, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-31 06:27:21', '2021-07-31 06:27:21');
INSERT INTO `admin_operation_log` VALUES (199, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 06:27:27', '2021-07-31 06:27:27');
INSERT INTO `admin_operation_log` VALUES (200, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 06:27:54', '2021-07-31 06:27:54');
INSERT INTO `admin_operation_log` VALUES (201, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"name\":\"11\"}', '2021-07-31 06:28:20', '2021-07-31 06:28:20');
INSERT INTO `admin_operation_log` VALUES (202, 1, 'admin/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 06:30:17', '2021-07-31 06:30:17');
INSERT INTO `admin_operation_log` VALUES (203, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 06:37:13', '2021-07-31 06:37:13');
INSERT INTO `admin_operation_log` VALUES (204, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 06:51:18', '2021-07-31 06:51:18');
INSERT INTO `admin_operation_log` VALUES (205, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 06:51:31', '2021-07-31 06:51:31');
INSERT INTO `admin_operation_log` VALUES (206, 1, 'admin/auth/roles/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 06:51:37', '2021-07-31 06:51:37');
INSERT INTO `admin_operation_log` VALUES (207, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 06:51:52', '2021-07-31 06:51:52');
INSERT INTO `admin_operation_log` VALUES (208, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 06:53:31', '2021-07-31 06:53:31');
INSERT INTO `admin_operation_log` VALUES (209, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 06:53:39', '2021-07-31 06:53:39');
INSERT INTO `admin_operation_log` VALUES (210, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 06:54:11', '2021-07-31 06:54:11');
INSERT INTO `admin_operation_log` VALUES (211, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 06:54:15', '2021-07-31 06:54:15');
INSERT INTO `admin_operation_log` VALUES (212, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 06:57:06', '2021-07-31 06:57:06');
INSERT INTO `admin_operation_log` VALUES (213, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 06:57:19', '2021-07-31 06:57:19');
INSERT INTO `admin_operation_log` VALUES (214, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 07:57:18', '2021-07-31 07:57:18');
INSERT INTO `admin_operation_log` VALUES (215, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-07-31 07:57:19', '2021-07-31 07:57:19');
INSERT INTO `admin_operation_log` VALUES (216, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 07:57:20', '2021-07-31 07:57:20');
INSERT INTO `admin_operation_log` VALUES (217, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 07:57:21', '2021-07-31 07:57:21');
INSERT INTO `admin_operation_log` VALUES (218, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 08:08:38', '2021-07-31 08:08:38');
INSERT INTO `admin_operation_log` VALUES (219, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 08:08:39', '2021-07-31 08:08:39');
INSERT INTO `admin_operation_log` VALUES (220, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 08:08:43', '2021-07-31 08:08:43');
INSERT INTO `admin_operation_log` VALUES (221, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 08:09:39', '2021-07-31 08:09:39');
INSERT INTO `admin_operation_log` VALUES (222, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-07-31 08:14:20', '2021-07-31 08:14:20');
INSERT INTO `admin_operation_log` VALUES (223, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-08-02 01:45:06', '2021-08-02 01:45:06');
INSERT INTO `admin_operation_log` VALUES (224, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-08-02 01:45:09', '2021-08-02 01:45:09');
INSERT INTO `admin_operation_log` VALUES (225, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-08-02 05:41:28', '2021-08-02 05:41:28');
INSERT INTO `admin_operation_log` VALUES (226, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-02 05:41:45', '2021-08-02 05:41:45');
INSERT INTO `admin_operation_log` VALUES (227, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-02 05:41:54', '2021-08-02 05:41:54');
INSERT INTO `admin_operation_log` VALUES (228, 1, 'admin/auth/menu/8', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-newspaper-o\",\"uri\":\"users\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"XKEchDbXvR5tedAspbA8DRCtsj7mVtiPagXK2KKx\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/test.metaxplay.com\\/admin\\/auth\\/menu\"}', '2021-08-02 05:42:06', '2021-08-02 05:42:06');
INSERT INTO `admin_operation_log` VALUES (229, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-08-02 05:42:08', '2021-08-02 05:42:08');
INSERT INTO `admin_operation_log` VALUES (230, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-02 07:35:49', '2021-08-02 07:35:49');
INSERT INTO `admin_operation_log` VALUES (231, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-08-02 10:20:44', '2021-08-02 10:20:44');
INSERT INTO `admin_operation_log` VALUES (232, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-02 10:20:53', '2021-08-02 10:20:53');
INSERT INTO `admin_operation_log` VALUES (233, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-02 10:23:41', '2021-08-02 10:23:41');
INSERT INTO `admin_operation_log` VALUES (234, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-02 10:23:50', '2021-08-02 10:23:50');
INSERT INTO `admin_operation_log` VALUES (235, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"CP\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"cps\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"xM4PFJDb7lhq6q388tdzfcvV2VPgKkIiS7uhyH0c\"}', '2021-08-02 10:24:51', '2021-08-02 10:24:51');
INSERT INTO `admin_operation_log` VALUES (236, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-08-02 10:24:52', '2021-08-02 10:24:52');
INSERT INTO `admin_operation_log` VALUES (237, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-08-02 10:24:58', '2021-08-02 10:24:58');
INSERT INTO `admin_operation_log` VALUES (238, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-02 10:25:17', '2021-08-02 10:25:17');
INSERT INTO `admin_operation_log` VALUES (239, 1, 'admin/cps', 'GET', '127.0.0.1', '[]', '2021-08-02 10:27:10', '2021-08-02 10:27:10');
INSERT INTO `admin_operation_log` VALUES (240, 1, 'admin/cps/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-02 10:27:39', '2021-08-02 10:27:39');
INSERT INTO `admin_operation_log` VALUES (241, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-02 10:27:48', '2021-08-02 10:27:48');
INSERT INTO `admin_operation_log` VALUES (242, 1, 'admin/cps/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-02 10:27:54', '2021-08-02 10:27:54');
INSERT INTO `admin_operation_log` VALUES (243, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-02 10:28:09', '2021-08-02 10:28:09');
INSERT INTO `admin_operation_log` VALUES (244, 1, 'admin/cps/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-02 10:28:13', '2021-08-02 10:28:13');
INSERT INTO `admin_operation_log` VALUES (245, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-02 10:28:17', '2021-08-02 10:28:17');
INSERT INTO `admin_operation_log` VALUES (246, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"_columns_\":\"category,country,des,id,name,status\",\"_pjax\":\"#pjax-container\"}', '2021-08-02 10:28:45', '2021-08-02 10:28:45');
INSERT INTO `admin_operation_log` VALUES (247, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"_columns_\":\"category,country,des,id,name,status\",\"_pjax\":\"#pjax-container\",\"per_page\":\"100\"}', '2021-08-02 10:29:06', '2021-08-02 10:29:06');
INSERT INTO `admin_operation_log` VALUES (248, 1, 'admin/cps/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-02 10:29:38', '2021-08-02 10:29:38');
INSERT INTO `admin_operation_log` VALUES (249, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-02 10:29:43', '2021-08-02 10:29:43');
INSERT INTO `admin_operation_log` VALUES (250, 1, 'admin/cps/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-02 10:29:53', '2021-08-02 10:29:53');
INSERT INTO `admin_operation_log` VALUES (251, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-02 10:30:24', '2021-08-02 10:30:24');
INSERT INTO `admin_operation_log` VALUES (252, 1, 'admin/cps/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-02 10:30:34', '2021-08-02 10:30:34');
INSERT INTO `admin_operation_log` VALUES (253, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-02 10:30:47', '2021-08-02 10:30:47');
INSERT INTO `admin_operation_log` VALUES (254, 1, 'admin/cps/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-02 10:39:26', '2021-08-02 10:39:26');
INSERT INTO `admin_operation_log` VALUES (255, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-02 10:39:58', '2021-08-02 10:39:58');
INSERT INTO `admin_operation_log` VALUES (256, 1, 'admin/cps/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-02 10:58:50', '2021-08-02 10:58:50');
INSERT INTO `admin_operation_log` VALUES (257, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-02 10:58:58', '2021-08-02 10:58:58');
INSERT INTO `admin_operation_log` VALUES (258, 1, 'admin/cps', 'GET', '127.0.0.1', '[]', '2021-08-02 11:14:56', '2021-08-02 11:14:56');
INSERT INTO `admin_operation_log` VALUES (259, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-08-03 01:43:34', '2021-08-03 01:43:34');
INSERT INTO `admin_operation_log` VALUES (260, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-08-03 01:43:34', '2021-08-03 01:43:34');
INSERT INTO `admin_operation_log` VALUES (261, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 01:43:46', '2021-08-03 01:43:46');
INSERT INTO `admin_operation_log` VALUES (262, 1, 'admin/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 01:48:20', '2021-08-03 01:48:20');
INSERT INTO `admin_operation_log` VALUES (263, 1, 'admin/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 01:48:26', '2021-08-03 01:48:26');
INSERT INTO `admin_operation_log` VALUES (264, 1, 'admin/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 01:49:07', '2021-08-03 01:49:07');
INSERT INTO `admin_operation_log` VALUES (265, 1, 'admin/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 01:50:11', '2021-08-03 01:50:11');
INSERT INTO `admin_operation_log` VALUES (266, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"__search__\":\"Games\",\"_pjax\":\"#pjax-container\"}', '2021-08-03 01:50:20', '2021-08-03 01:50:20');
INSERT INTO `admin_operation_log` VALUES (267, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"__search__\":\"wo\"}', '2021-08-03 01:50:40', '2021-08-03 01:50:40');
INSERT INTO `admin_operation_log` VALUES (268, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"__search__\":\"wo\"}', '2021-08-03 01:57:21', '2021-08-03 01:57:21');
INSERT INTO `admin_operation_log` VALUES (269, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"__search__\":\"wo\"}', '2021-08-03 02:00:33', '2021-08-03 02:00:33');
INSERT INTO `admin_operation_log` VALUES (270, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"__search__\":\"wo\"}', '2021-08-03 02:00:40', '2021-08-03 02:00:40');
INSERT INTO `admin_operation_log` VALUES (271, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"__search__\":\"wo\"}', '2021-08-03 02:02:54', '2021-08-03 02:02:54');
INSERT INTO `admin_operation_log` VALUES (272, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"__search__\":\"wo\"}', '2021-08-03 02:03:11', '2021-08-03 02:03:11');
INSERT INTO `admin_operation_log` VALUES (273, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"__search__\":\"wo\"}', '2021-08-03 02:04:24', '2021-08-03 02:04:24');
INSERT INTO `admin_operation_log` VALUES (274, 1, 'admin/cps/61/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 02:09:50', '2021-08-03 02:09:50');
INSERT INTO `admin_operation_log` VALUES (275, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 02:09:59', '2021-08-03 02:09:59');
INSERT INTO `admin_operation_log` VALUES (276, 1, 'admin/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 02:13:27', '2021-08-03 02:13:27');
INSERT INTO `admin_operation_log` VALUES (277, 1, 'admin/cps/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 02:13:35', '2021-08-03 02:13:35');
INSERT INTO `admin_operation_log` VALUES (278, 1, 'admin/cps/1', 'PUT', '127.0.0.1', '{\"name\":\"Wanted5Games\",\"category\":\"Wanted5Games\",\"des\":\"Wanted5Games\",\"country\":\"US\",\"status\":\"off\",\"_token\":\"oOEYtMkYufrWeAH36rQysTu3HlPKLakKinR81NHa\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/test.metaxplay.com\\/admin\\/cps\"}', '2021-08-03 02:13:40', '2021-08-03 02:13:40');
INSERT INTO `admin_operation_log` VALUES (279, 1, 'admin/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 02:13:42', '2021-08-03 02:13:42');
INSERT INTO `admin_operation_log` VALUES (280, 1, 'admin/cps/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 02:13:52', '2021-08-03 02:13:52');
INSERT INTO `admin_operation_log` VALUES (281, 1, 'admin/cps/1', 'PUT', '127.0.0.1', '{\"name\":\"Wanted5Games\",\"category\":\"Wanted5Games\",\"des\":\"Wanted5Games\",\"country\":\"US\",\"status\":\"on\",\"_token\":\"oOEYtMkYufrWeAH36rQysTu3HlPKLakKinR81NHa\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/test.metaxplay.com\\/admin\\/cps\"}', '2021-08-03 02:13:57', '2021-08-03 02:13:57');
INSERT INTO `admin_operation_log` VALUES (282, 1, 'admin/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 02:13:58', '2021-08-03 02:13:58');
INSERT INTO `admin_operation_log` VALUES (283, 1, 'admin/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 02:14:24', '2021-08-03 02:14:24');
INSERT INTO `admin_operation_log` VALUES (284, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 02:14:47', '2021-08-03 02:14:47');
INSERT INTO `admin_operation_log` VALUES (285, 1, 'admin/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 02:39:27', '2021-08-03 02:39:27');
INSERT INTO `admin_operation_log` VALUES (286, 1, 'admin/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 02:40:55', '2021-08-03 02:40:55');
INSERT INTO `admin_operation_log` VALUES (287, 1, 'admin/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 02:41:14', '2021-08-03 02:41:14');
INSERT INTO `admin_operation_log` VALUES (288, 1, 'admin/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 02:41:31', '2021-08-03 02:41:31');
INSERT INTO `admin_operation_log` VALUES (289, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 02:45:14', '2021-08-03 02:45:14');
INSERT INTO `admin_operation_log` VALUES (290, 1, 'admin/cps/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 02:45:32', '2021-08-03 02:45:32');
INSERT INTO `admin_operation_log` VALUES (291, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 02:45:36', '2021-08-03 02:45:36');
INSERT INTO `admin_operation_log` VALUES (292, 1, 'admin/cps/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 02:45:43', '2021-08-03 02:45:43');
INSERT INTO `admin_operation_log` VALUES (293, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 02:46:29', '2021-08-03 02:46:29');
INSERT INTO `admin_operation_log` VALUES (294, 1, 'admin/cps/create', 'GET', '127.0.0.1', '[]', '2021-08-03 02:46:32', '2021-08-03 02:46:32');
INSERT INTO `admin_operation_log` VALUES (295, 1, 'admin/cps/create', 'GET', '127.0.0.1', '[]', '2021-08-03 02:46:47', '2021-08-03 02:46:47');
INSERT INTO `admin_operation_log` VALUES (296, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 02:46:53', '2021-08-03 02:46:53');
INSERT INTO `admin_operation_log` VALUES (297, 1, 'admin/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 02:47:06', '2021-08-03 02:47:06');
INSERT INTO `admin_operation_log` VALUES (298, 1, 'admin/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 02:47:13', '2021-08-03 02:47:13');
INSERT INTO `admin_operation_log` VALUES (299, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"__search__\":\"Games\",\"_pjax\":\"#pjax-container\"}', '2021-08-03 02:47:21', '2021-08-03 02:47:21');
INSERT INTO `admin_operation_log` VALUES (300, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"__search__\":null}', '2021-08-03 02:47:27', '2021-08-03 02:47:27');
INSERT INTO `admin_operation_log` VALUES (301, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 03:10:47', '2021-08-03 03:10:47');
INSERT INTO `admin_operation_log` VALUES (302, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u5a92\\u8d44\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"oOEYtMkYufrWeAH36rQysTu3HlPKLakKinR81NHa\"}', '2021-08-03 03:11:10', '2021-08-03 03:11:10');
INSERT INTO `admin_operation_log` VALUES (303, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-08-03 03:11:12', '2021-08-03 03:11:12');
INSERT INTO `admin_operation_log` VALUES (304, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-08-03 03:11:17', '2021-08-03 03:11:17');
INSERT INTO `admin_operation_log` VALUES (305, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"10\",\"title\":\"\\u89c6\\u9891\\u5a92\\u8d44\",\"icon\":\"fa-archive\",\"uri\":\"media-videos\",\"roles\":[null],\"permission\":null,\"_token\":\"oOEYtMkYufrWeAH36rQysTu3HlPKLakKinR81NHa\"}', '2021-08-03 03:12:24', '2021-08-03 03:12:24');
INSERT INTO `admin_operation_log` VALUES (306, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-08-03 03:12:25', '2021-08-03 03:12:25');
INSERT INTO `admin_operation_log` VALUES (307, 1, 'admin/auth/menu/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 03:12:35', '2021-08-03 03:12:35');
INSERT INTO `admin_operation_log` VALUES (308, 1, 'admin/auth/menu/10', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u5a92\\u8d44\\u7ba1\\u7406\",\"icon\":\"fa-file-video-o\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"oOEYtMkYufrWeAH36rQysTu3HlPKLakKinR81NHa\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/test.metaxplay.com\\/admin\\/auth\\/menu\"}', '2021-08-03 03:14:11', '2021-08-03 03:14:11');
INSERT INTO `admin_operation_log` VALUES (309, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-08-03 03:14:13', '2021-08-03 03:14:13');
INSERT INTO `admin_operation_log` VALUES (310, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-08-03 03:14:18', '2021-08-03 03:14:18');
INSERT INTO `admin_operation_log` VALUES (311, 1, 'admin/media-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 03:14:24', '2021-08-03 03:14:24');
INSERT INTO `admin_operation_log` VALUES (312, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 03:15:02', '2021-08-03 03:15:02');
INSERT INTO `admin_operation_log` VALUES (313, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-08-03 04:06:49', '2021-08-03 04:06:49');
INSERT INTO `admin_operation_log` VALUES (314, 1, 'admin/media-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 04:06:54', '2021-08-03 04:06:54');
INSERT INTO `admin_operation_log` VALUES (315, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 04:06:57', '2021-08-03 04:06:57');
INSERT INTO `admin_operation_log` VALUES (316, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:26:09', '2021-08-03 05:26:09');
INSERT INTO `admin_operation_log` VALUES (317, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:27:03', '2021-08-03 05:27:03');
INSERT INTO `admin_operation_log` VALUES (318, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:27:37', '2021-08-03 05:27:37');
INSERT INTO `admin_operation_log` VALUES (319, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:28:47', '2021-08-03 05:28:47');
INSERT INTO `admin_operation_log` VALUES (320, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:29:43', '2021-08-03 05:29:43');
INSERT INTO `admin_operation_log` VALUES (321, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:30:59', '2021-08-03 05:30:59');
INSERT INTO `admin_operation_log` VALUES (322, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:31:28', '2021-08-03 05:31:28');
INSERT INTO `admin_operation_log` VALUES (323, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:31:54', '2021-08-03 05:31:54');
INSERT INTO `admin_operation_log` VALUES (324, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:33:13', '2021-08-03 05:33:13');
INSERT INTO `admin_operation_log` VALUES (325, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:33:41', '2021-08-03 05:33:41');
INSERT INTO `admin_operation_log` VALUES (326, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:34:07', '2021-08-03 05:34:07');
INSERT INTO `admin_operation_log` VALUES (327, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:34:26', '2021-08-03 05:34:26');
INSERT INTO `admin_operation_log` VALUES (328, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:34:50', '2021-08-03 05:34:50');
INSERT INTO `admin_operation_log` VALUES (329, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:35:09', '2021-08-03 05:35:09');
INSERT INTO `admin_operation_log` VALUES (330, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:35:34', '2021-08-03 05:35:34');
INSERT INTO `admin_operation_log` VALUES (331, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:35:56', '2021-08-03 05:35:56');
INSERT INTO `admin_operation_log` VALUES (332, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:36:24', '2021-08-03 05:36:24');
INSERT INTO `admin_operation_log` VALUES (333, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:36:30', '2021-08-03 05:36:30');
INSERT INTO `admin_operation_log` VALUES (334, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:37:28', '2021-08-03 05:37:28');
INSERT INTO `admin_operation_log` VALUES (335, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:38:00', '2021-08-03 05:38:00');
INSERT INTO `admin_operation_log` VALUES (336, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:38:46', '2021-08-03 05:38:46');
INSERT INTO `admin_operation_log` VALUES (337, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:39:07', '2021-08-03 05:39:07');
INSERT INTO `admin_operation_log` VALUES (338, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:39:20', '2021-08-03 05:39:20');
INSERT INTO `admin_operation_log` VALUES (339, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:39:35', '2021-08-03 05:39:35');
INSERT INTO `admin_operation_log` VALUES (340, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:39:50', '2021-08-03 05:39:50');
INSERT INTO `admin_operation_log` VALUES (341, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:39:57', '2021-08-03 05:39:57');
INSERT INTO `admin_operation_log` VALUES (342, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:40:33', '2021-08-03 05:40:33');
INSERT INTO `admin_operation_log` VALUES (343, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:40:38', '2021-08-03 05:40:38');
INSERT INTO `admin_operation_log` VALUES (344, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:40:53', '2021-08-03 05:40:53');
INSERT INTO `admin_operation_log` VALUES (345, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:41:19', '2021-08-03 05:41:19');
INSERT INTO `admin_operation_log` VALUES (346, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:41:34', '2021-08-03 05:41:34');
INSERT INTO `admin_operation_log` VALUES (347, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:42:18', '2021-08-03 05:42:18');
INSERT INTO `admin_operation_log` VALUES (348, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:42:55', '2021-08-03 05:42:55');
INSERT INTO `admin_operation_log` VALUES (349, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:43:09', '2021-08-03 05:43:09');
INSERT INTO `admin_operation_log` VALUES (350, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:43:23', '2021-08-03 05:43:23');
INSERT INTO `admin_operation_log` VALUES (351, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:48:52', '2021-08-03 05:48:52');
INSERT INTO `admin_operation_log` VALUES (352, 1, 'admin/media-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 05:51:05', '2021-08-03 05:51:05');
INSERT INTO `admin_operation_log` VALUES (353, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 05:51:09', '2021-08-03 05:51:09');
INSERT INTO `admin_operation_log` VALUES (354, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:57:18', '2021-08-03 05:57:18');
INSERT INTO `admin_operation_log` VALUES (355, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:58:49', '2021-08-03 05:58:49');
INSERT INTO `admin_operation_log` VALUES (356, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 05:59:13', '2021-08-03 05:59:13');
INSERT INTO `admin_operation_log` VALUES (357, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 06:02:12', '2021-08-03 06:02:12');
INSERT INTO `admin_operation_log` VALUES (358, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 06:02:39', '2021-08-03 06:02:39');
INSERT INTO `admin_operation_log` VALUES (359, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 06:03:34', '2021-08-03 06:03:34');
INSERT INTO `admin_operation_log` VALUES (360, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 06:16:19', '2021-08-03 06:16:19');
INSERT INTO `admin_operation_log` VALUES (361, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 06:16:47', '2021-08-03 06:16:47');
INSERT INTO `admin_operation_log` VALUES (362, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 06:49:14', '2021-08-03 06:49:14');
INSERT INTO `admin_operation_log` VALUES (363, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 06:51:34', '2021-08-03 06:51:34');
INSERT INTO `admin_operation_log` VALUES (364, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 06:54:16', '2021-08-03 06:54:16');
INSERT INTO `admin_operation_log` VALUES (365, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 06:54:29', '2021-08-03 06:54:29');
INSERT INTO `admin_operation_log` VALUES (366, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 06:54:51', '2021-08-03 06:54:51');
INSERT INTO `admin_operation_log` VALUES (367, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 06:55:04', '2021-08-03 06:55:04');
INSERT INTO `admin_operation_log` VALUES (368, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 06:55:41', '2021-08-03 06:55:41');
INSERT INTO `admin_operation_log` VALUES (369, 1, 'admin/api/cps', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2021-08-03 06:55:51', '2021-08-03 06:55:51');
INSERT INTO `admin_operation_log` VALUES (370, 1, 'admin/api/cps', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2021-08-03 07:00:58', '2021-08-03 07:00:58');
INSERT INTO `admin_operation_log` VALUES (371, 1, 'admin/api/cps', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2021-08-03 07:01:14', '2021-08-03 07:01:14');
INSERT INTO `admin_operation_log` VALUES (372, 1, 'admin/api/cps', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2021-08-03 07:01:42', '2021-08-03 07:01:42');
INSERT INTO `admin_operation_log` VALUES (373, 1, 'admin/api/cps', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2021-08-03 07:04:58', '2021-08-03 07:04:58');
INSERT INTO `admin_operation_log` VALUES (374, 1, 'admin/api/cps', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2021-08-03 07:08:34', '2021-08-03 07:08:34');
INSERT INTO `admin_operation_log` VALUES (375, 1, 'admin/api/cps', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2021-08-03 07:09:03', '2021-08-03 07:09:03');
INSERT INTO `admin_operation_log` VALUES (376, 1, 'admin/api/cps', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2021-08-03 07:09:31', '2021-08-03 07:09:31');
INSERT INTO `admin_operation_log` VALUES (377, 1, 'admin/api/cps', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2021-08-03 07:10:48', '2021-08-03 07:10:48');
INSERT INTO `admin_operation_log` VALUES (378, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 07:10:59', '2021-08-03 07:10:59');
INSERT INTO `admin_operation_log` VALUES (379, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 07:11:10', '2021-08-03 07:11:10');
INSERT INTO `admin_operation_log` VALUES (380, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 07:11:39', '2021-08-03 07:11:39');
INSERT INTO `admin_operation_log` VALUES (381, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 07:11:55', '2021-08-03 07:11:55');
INSERT INTO `admin_operation_log` VALUES (382, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 07:12:10', '2021-08-03 07:12:10');
INSERT INTO `admin_operation_log` VALUES (383, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 07:12:33', '2021-08-03 07:12:33');
INSERT INTO `admin_operation_log` VALUES (384, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 07:12:35', '2021-08-03 07:12:35');
INSERT INTO `admin_operation_log` VALUES (385, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 07:14:01', '2021-08-03 07:14:01');
INSERT INTO `admin_operation_log` VALUES (386, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 07:14:19', '2021-08-03 07:14:19');
INSERT INTO `admin_operation_log` VALUES (387, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 07:14:41', '2021-08-03 07:14:41');
INSERT INTO `admin_operation_log` VALUES (388, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 07:14:45', '2021-08-03 07:14:45');
INSERT INTO `admin_operation_log` VALUES (389, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 07:15:00', '2021-08-03 07:15:00');
INSERT INTO `admin_operation_log` VALUES (390, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 07:15:32', '2021-08-03 07:15:32');
INSERT INTO `admin_operation_log` VALUES (391, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 07:16:07', '2021-08-03 07:16:07');
INSERT INTO `admin_operation_log` VALUES (392, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 07:16:48', '2021-08-03 07:16:48');
INSERT INTO `admin_operation_log` VALUES (393, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 07:17:09', '2021-08-03 07:17:09');
INSERT INTO `admin_operation_log` VALUES (394, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 07:17:29', '2021-08-03 07:17:29');
INSERT INTO `admin_operation_log` VALUES (395, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 07:17:50', '2021-08-03 07:17:50');
INSERT INTO `admin_operation_log` VALUES (396, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 07:18:10', '2021-08-03 07:18:10');
INSERT INTO `admin_operation_log` VALUES (397, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 07:18:14', '2021-08-03 07:18:14');
INSERT INTO `admin_operation_log` VALUES (398, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 07:33:32', '2021-08-03 07:33:32');
INSERT INTO `admin_operation_log` VALUES (399, 1, 'admin/media-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 07:33:39', '2021-08-03 07:33:39');
INSERT INTO `admin_operation_log` VALUES (400, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 07:33:42', '2021-08-03 07:33:42');
INSERT INTO `admin_operation_log` VALUES (401, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 07:33:44', '2021-08-03 07:33:44');
INSERT INTO `admin_operation_log` VALUES (402, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 07:38:16', '2021-08-03 07:38:16');
INSERT INTO `admin_operation_log` VALUES (403, 1, 'admin/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 07:56:13', '2021-08-03 07:56:13');
INSERT INTO `admin_operation_log` VALUES (404, 1, 'admin/column-videos', 'GET', '127.0.0.1', '[]', '2021-08-03 07:59:12', '2021-08-03 07:59:12');
INSERT INTO `admin_operation_log` VALUES (405, 1, 'admin/column-videos', 'GET', '127.0.0.1', '[]', '2021-08-03 08:01:45', '2021-08-03 08:01:45');
INSERT INTO `admin_operation_log` VALUES (406, 1, 'admin/column-videos/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:02:15', '2021-08-03 08:02:15');
INSERT INTO `admin_operation_log` VALUES (407, 1, 'admin/column-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 08:03:52', '2021-08-03 08:03:52');
INSERT INTO `admin_operation_log` VALUES (408, 1, 'admin/column-videos', 'GET', '127.0.0.1', '[]', '2021-08-03 08:04:00', '2021-08-03 08:04:00');
INSERT INTO `admin_operation_log` VALUES (409, 1, 'admin/column-videos/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:04:17', '2021-08-03 08:04:17');
INSERT INTO `admin_operation_log` VALUES (410, 1, 'admin/column-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:04:26', '2021-08-03 08:04:26');
INSERT INTO `admin_operation_log` VALUES (411, 1, 'admin/column-videos', 'GET', '127.0.0.1', '[]', '2021-08-03 08:05:06', '2021-08-03 08:05:06');
INSERT INTO `admin_operation_log` VALUES (412, 1, 'admin/column-videos', 'GET', '127.0.0.1', '[]', '2021-08-03 08:05:32', '2021-08-03 08:05:32');
INSERT INTO `admin_operation_log` VALUES (413, 1, 'admin/column-videos', 'POST', '127.0.0.1', '{\"_token\":\"oOEYtMkYufrWeAH36rQysTu3HlPKLakKinR81NHa\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2},{\\\"id\\\":3}]\"}', '2021-08-03 08:05:57', '2021-08-03 08:05:57');
INSERT INTO `admin_operation_log` VALUES (414, 1, 'admin/column-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:05:59', '2021-08-03 08:05:59');
INSERT INTO `admin_operation_log` VALUES (415, 1, 'admin/column-videos', 'POST', '127.0.0.1', '{\"_token\":\"oOEYtMkYufrWeAH36rQysTu3HlPKLakKinR81NHa\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3}]}]\"}', '2021-08-03 08:06:09', '2021-08-03 08:06:09');
INSERT INTO `admin_operation_log` VALUES (416, 1, 'admin/column-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:06:11', '2021-08-03 08:06:11');
INSERT INTO `admin_operation_log` VALUES (417, 1, 'admin/column-videos', 'POST', '127.0.0.1', '{\"_token\":\"oOEYtMkYufrWeAH36rQysTu3HlPKLakKinR81NHa\",\"_order\":\"[{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":1},{\\\"id\\\":3}]}]\"}', '2021-08-03 08:06:20', '2021-08-03 08:06:20');
INSERT INTO `admin_operation_log` VALUES (418, 1, 'admin/column-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:06:22', '2021-08-03 08:06:22');
INSERT INTO `admin_operation_log` VALUES (419, 1, 'admin/column-videos', 'POST', '127.0.0.1', '{\"_token\":\"oOEYtMkYufrWeAH36rQysTu3HlPKLakKinR81NHa\",\"_order\":\"[{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":1},{\\\"id\\\":3}]},{\\\"id\\\":3}]}]\"}', '2021-08-03 08:06:28', '2021-08-03 08:06:28');
INSERT INTO `admin_operation_log` VALUES (420, 1, 'admin/column-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:06:30', '2021-08-03 08:06:30');
INSERT INTO `admin_operation_log` VALUES (421, 1, 'admin/column-videos', 'GET', '127.0.0.1', '[]', '2021-08-03 08:06:33', '2021-08-03 08:06:33');
INSERT INTO `admin_operation_log` VALUES (422, 1, 'admin/column-videos', 'GET', '127.0.0.1', '[]', '2021-08-03 08:06:35', '2021-08-03 08:06:35');
INSERT INTO `admin_operation_log` VALUES (423, 1, 'admin/column-videos', 'GET', '127.0.0.1', '[]', '2021-08-03 08:06:39', '2021-08-03 08:06:39');
INSERT INTO `admin_operation_log` VALUES (424, 1, 'admin/column-videos', 'GET', '127.0.0.1', '[]', '2021-08-03 08:06:49', '2021-08-03 08:06:49');
INSERT INTO `admin_operation_log` VALUES (425, 1, 'admin/column-videos', 'POST', '127.0.0.1', '{\"_token\":\"oOEYtMkYufrWeAH36rQysTu3HlPKLakKinR81NHa\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2},{\\\"id\\\":3}]\"}', '2021-08-03 08:06:56', '2021-08-03 08:06:56');
INSERT INTO `admin_operation_log` VALUES (426, 1, 'admin/column-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:06:58', '2021-08-03 08:06:58');
INSERT INTO `admin_operation_log` VALUES (427, 1, 'admin/column-videos', 'POST', '127.0.0.1', '{\"_token\":\"oOEYtMkYufrWeAH36rQysTu3HlPKLakKinR81NHa\",\"_order\":\"[{\\\"id\\\":1,\\\"children\\\":[{\\\"id\\\":2}]},{\\\"id\\\":3}]\"}', '2021-08-03 08:07:03', '2021-08-03 08:07:03');
INSERT INTO `admin_operation_log` VALUES (428, 1, 'admin/column-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:07:04', '2021-08-03 08:07:04');
INSERT INTO `admin_operation_log` VALUES (429, 1, 'admin/column-videos', 'GET', '127.0.0.1', '[]', '2021-08-03 08:13:56', '2021-08-03 08:13:56');
INSERT INTO `admin_operation_log` VALUES (430, 1, 'admin/column-videos', 'GET', '127.0.0.1', '[]', '2021-08-03 08:14:11', '2021-08-03 08:14:11');
INSERT INTO `admin_operation_log` VALUES (431, 1, 'admin/column-videos/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:14:16', '2021-08-03 08:14:16');
INSERT INTO `admin_operation_log` VALUES (432, 1, 'admin/column-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:14:30', '2021-08-03 08:14:30');
INSERT INTO `admin_operation_log` VALUES (433, 1, 'admin/column-videos/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:14:36', '2021-08-03 08:14:36');
INSERT INTO `admin_operation_log` VALUES (434, 1, 'admin/column-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:14:47', '2021-08-03 08:14:47');
INSERT INTO `admin_operation_log` VALUES (435, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:18:55', '2021-08-03 08:18:55');
INSERT INTO `admin_operation_log` VALUES (436, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u680f\\u76ee\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"oOEYtMkYufrWeAH36rQysTu3HlPKLakKinR81NHa\"}', '2021-08-03 08:19:12', '2021-08-03 08:19:12');
INSERT INTO `admin_operation_log` VALUES (437, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-08-03 08:19:14', '2021-08-03 08:19:14');
INSERT INTO `admin_operation_log` VALUES (438, 1, 'admin/auth/menu/12/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:19:32', '2021-08-03 08:19:32');
INSERT INTO `admin_operation_log` VALUES (439, 1, 'admin/auth/menu/12', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u680f\\u76ee\\u7ba1\\u7406\",\"icon\":\"fa-columns\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"oOEYtMkYufrWeAH36rQysTu3HlPKLakKinR81NHa\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/test.metaxplay.com\\/admin\\/auth\\/menu\"}', '2021-08-03 08:20:04', '2021-08-03 08:20:04');
INSERT INTO `admin_operation_log` VALUES (440, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-08-03 08:20:06', '2021-08-03 08:20:06');
INSERT INTO `admin_operation_log` VALUES (441, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-08-03 08:20:10', '2021-08-03 08:20:10');
INSERT INTO `admin_operation_log` VALUES (442, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"\\u89c6\\u9891\\u680f\\u76ee\",\"icon\":\"fa-bars\",\"uri\":\"column-videos\",\"roles\":[null],\"permission\":null,\"_token\":\"oOEYtMkYufrWeAH36rQysTu3HlPKLakKinR81NHa\"}', '2021-08-03 08:21:17', '2021-08-03 08:21:17');
INSERT INTO `admin_operation_log` VALUES (443, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-08-03 08:21:20', '2021-08-03 08:21:20');
INSERT INTO `admin_operation_log` VALUES (444, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-08-03 08:21:35', '2021-08-03 08:21:35');
INSERT INTO `admin_operation_log` VALUES (445, 1, 'admin/column-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:21:40', '2021-08-03 08:21:40');
INSERT INTO `admin_operation_log` VALUES (446, 1, 'admin/column-videos/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:21:55', '2021-08-03 08:21:55');
INSERT INTO `admin_operation_log` VALUES (447, 1, 'admin/column-videos/2/edit', 'GET', '127.0.0.1', '[]', '2021-08-03 08:27:58', '2021-08-03 08:27:58');
INSERT INTO `admin_operation_log` VALUES (448, 1, 'admin/column-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:28:20', '2021-08-03 08:28:20');
INSERT INTO `admin_operation_log` VALUES (449, 1, 'admin/column-videos', 'GET', '127.0.0.1', '[]', '2021-08-03 08:29:13', '2021-08-03 08:29:13');
INSERT INTO `admin_operation_log` VALUES (450, 1, 'admin/column-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:29:31', '2021-08-03 08:29:31');
INSERT INTO `admin_operation_log` VALUES (451, 1, 'admin/column-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:29:45', '2021-08-03 08:29:45');
INSERT INTO `admin_operation_log` VALUES (452, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:45:55', '2021-08-03 08:45:55');
INSERT INTO `admin_operation_log` VALUES (453, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u5c5e\\u6027\\u914d\\u7f6e\",\"icon\":\"fa-cog\",\"uri\":\"configs\",\"roles\":[null],\"permission\":null,\"_token\":\"oOEYtMkYufrWeAH36rQysTu3HlPKLakKinR81NHa\"}', '2021-08-03 08:46:56', '2021-08-03 08:46:56');
INSERT INTO `admin_operation_log` VALUES (454, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-08-03 08:46:58', '2021-08-03 08:46:58');
INSERT INTO `admin_operation_log` VALUES (455, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:47:07', '2021-08-03 08:47:07');
INSERT INTO `admin_operation_log` VALUES (456, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:47:18', '2021-08-03 08:47:18');
INSERT INTO `admin_operation_log` VALUES (457, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '[]', '2021-08-03 08:47:37', '2021-08-03 08:47:37');
INSERT INTO `admin_operation_log` VALUES (458, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '[]', '2021-08-03 08:49:23', '2021-08-03 08:49:23');
INSERT INTO `admin_operation_log` VALUES (459, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '[]', '2021-08-03 08:51:03', '2021-08-03 08:51:03');
INSERT INTO `admin_operation_log` VALUES (460, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:51:15', '2021-08-03 08:51:15');
INSERT INTO `admin_operation_log` VALUES (461, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 08:52:09', '2021-08-03 08:52:09');
INSERT INTO `admin_operation_log` VALUES (462, 1, 'admin/configs/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:52:24', '2021-08-03 08:52:24');
INSERT INTO `admin_operation_log` VALUES (463, 1, 'admin/configs/create', 'GET', '127.0.0.1', '[]', '2021-08-03 08:52:50', '2021-08-03 08:52:50');
INSERT INTO `admin_operation_log` VALUES (464, 1, 'admin/configs/create', 'GET', '127.0.0.1', '[]', '2021-08-03 08:56:07', '2021-08-03 08:56:07');
INSERT INTO `admin_operation_log` VALUES (465, 1, 'admin/configs', 'POST', '127.0.0.1', '{\"name\":\"English\",\"value\":\"1\",\"description\":null,\"type\":\"1\",\"status\":\"on\",\"_token\":\"oOEYtMkYufrWeAH36rQysTu3HlPKLakKinR81NHa\",\"after-save\":\"2\"}', '2021-08-03 08:57:23', '2021-08-03 08:57:23');
INSERT INTO `admin_operation_log` VALUES (466, 1, 'admin/configs/create', 'GET', '127.0.0.1', '[]', '2021-08-03 08:57:25', '2021-08-03 08:57:25');
INSERT INTO `admin_operation_log` VALUES (467, 1, 'admin/configs', 'POST', '127.0.0.1', '{\"name\":\"French\",\"value\":\"2\",\"description\":null,\"type\":\"1\",\"status\":\"on\",\"_token\":\"oOEYtMkYufrWeAH36rQysTu3HlPKLakKinR81NHa\"}', '2021-08-03 08:57:34', '2021-08-03 08:57:34');
INSERT INTO `admin_operation_log` VALUES (468, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 08:57:35', '2021-08-03 08:57:35');
INSERT INTO `admin_operation_log` VALUES (469, 1, 'admin/configs/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:57:53', '2021-08-03 08:57:53');
INSERT INTO `admin_operation_log` VALUES (470, 1, 'admin/configs', 'POST', '127.0.0.1', '{\"name\":\"German\",\"value\":\"3\",\"description\":null,\"type\":\"1\",\"status\":\"on\",\"_token\":\"oOEYtMkYufrWeAH36rQysTu3HlPKLakKinR81NHa\",\"_previous_\":\"http:\\/\\/test.metaxplay.com\\/admin\\/configs\"}', '2021-08-03 08:58:04', '2021-08-03 08:58:04');
INSERT INTO `admin_operation_log` VALUES (471, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 08:58:06', '2021-08-03 08:58:06');
INSERT INTO `admin_operation_log` VALUES (472, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 08:58:57', '2021-08-03 08:58:57');
INSERT INTO `admin_operation_log` VALUES (473, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 08:59:05', '2021-08-03 08:59:05');
INSERT INTO `admin_operation_log` VALUES (474, 1, 'admin/configs/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 08:59:34', '2021-08-03 08:59:34');
INSERT INTO `admin_operation_log` VALUES (475, 1, 'admin/configs', 'POST', '127.0.0.1', '{\"name\":\"Chinese\",\"value\":\"4\",\"description\":null,\"type\":\"1\",\"status\":\"on\",\"_token\":\"oOEYtMkYufrWeAH36rQysTu3HlPKLakKinR81NHa\",\"_previous_\":\"http:\\/\\/test.metaxplay.com\\/admin\\/configs\"}', '2021-08-03 08:59:40', '2021-08-03 08:59:40');
INSERT INTO `admin_operation_log` VALUES (476, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 08:59:42', '2021-08-03 08:59:42');
INSERT INTO `admin_operation_log` VALUES (477, 1, 'admin/column-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 09:00:04', '2021-08-03 09:00:04');
INSERT INTO `admin_operation_log` VALUES (478, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 09:00:09', '2021-08-03 09:00:09');
INSERT INTO `admin_operation_log` VALUES (479, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 09:02:19', '2021-08-03 09:02:19');
INSERT INTO `admin_operation_log` VALUES (480, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_selector\":{\"type\":\"1\"},\"_pjax\":\"#pjax-container\"}', '2021-08-03 09:02:28', '2021-08-03 09:02:28');
INSERT INTO `admin_operation_log` VALUES (481, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 09:02:50', '2021-08-03 09:02:50');
INSERT INTO `admin_operation_log` VALUES (482, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 09:03:10', '2021-08-03 09:03:10');
INSERT INTO `admin_operation_log` VALUES (483, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 09:03:15', '2021-08-03 09:03:15');
INSERT INTO `admin_operation_log` VALUES (484, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_selector\":{\"type\":\"1\"},\"_pjax\":\"#pjax-container\"}', '2021-08-03 09:03:17', '2021-08-03 09:03:17');
INSERT INTO `admin_operation_log` VALUES (485, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 09:03:18', '2021-08-03 09:03:18');
INSERT INTO `admin_operation_log` VALUES (486, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 09:03:23', '2021-08-03 09:03:23');
INSERT INTO `admin_operation_log` VALUES (487, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_selector\":{\"type\":\"1\"},\"_pjax\":\"#pjax-container\"}', '2021-08-03 09:03:29', '2021-08-03 09:03:29');
INSERT INTO `admin_operation_log` VALUES (488, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 09:03:31', '2021-08-03 09:03:31');
INSERT INTO `admin_operation_log` VALUES (489, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 09:04:16', '2021-08-03 09:04:16');
INSERT INTO `admin_operation_log` VALUES (490, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 09:06:57', '2021-08-03 09:06:57');
INSERT INTO `admin_operation_log` VALUES (491, 1, 'admin/configs/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 09:07:06', '2021-08-03 09:07:06');
INSERT INTO `admin_operation_log` VALUES (492, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 09:07:15', '2021-08-03 09:07:15');
INSERT INTO `admin_operation_log` VALUES (493, 1, 'admin/configs/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 09:07:23', '2021-08-03 09:07:23');
INSERT INTO `admin_operation_log` VALUES (494, 1, 'admin/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 09:09:59', '2021-08-03 09:09:59');
INSERT INTO `admin_operation_log` VALUES (495, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 09:10:10', '2021-08-03 09:10:10');
INSERT INTO `admin_operation_log` VALUES (496, 1, 'admin/configs/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 09:10:19', '2021-08-03 09:10:19');
INSERT INTO `admin_operation_log` VALUES (497, 1, 'admin/configs/3', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 09:10:28', '2021-08-03 09:10:28');
INSERT INTO `admin_operation_log` VALUES (498, 1, 'admin/configs/3', 'GET', '127.0.0.1', '[]', '2021-08-03 09:10:49', '2021-08-03 09:10:49');
INSERT INTO `admin_operation_log` VALUES (499, 1, 'admin/configs/3', 'GET', '127.0.0.1', '[]', '2021-08-03 09:13:40', '2021-08-03 09:13:40');
INSERT INTO `admin_operation_log` VALUES (500, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 09:13:46', '2021-08-03 09:13:46');
INSERT INTO `admin_operation_log` VALUES (501, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_selector\":{\"type\":\"1\"}}', '2021-08-03 09:13:59', '2021-08-03 09:13:59');
INSERT INTO `admin_operation_log` VALUES (502, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 09:14:01', '2021-08-03 09:14:01');
INSERT INTO `admin_operation_log` VALUES (503, 1, 'admin/media-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 09:14:16', '2021-08-03 09:14:16');
INSERT INTO `admin_operation_log` VALUES (504, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 09:14:20', '2021-08-03 09:14:20');
INSERT INTO `admin_operation_log` VALUES (505, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 09:14:22', '2021-08-03 09:14:22');
INSERT INTO `admin_operation_log` VALUES (506, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:15:30', '2021-08-03 09:15:30');
INSERT INTO `admin_operation_log` VALUES (507, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 09:15:33', '2021-08-03 09:15:33');
INSERT INTO `admin_operation_log` VALUES (508, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:16:10', '2021-08-03 09:16:10');
INSERT INTO `admin_operation_log` VALUES (509, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 09:16:13', '2021-08-03 09:16:13');
INSERT INTO `admin_operation_log` VALUES (510, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:18:02', '2021-08-03 09:18:02');
INSERT INTO `admin_operation_log` VALUES (511, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 09:18:05', '2021-08-03 09:18:05');
INSERT INTO `admin_operation_log` VALUES (512, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:20:11', '2021-08-03 09:20:11');
INSERT INTO `admin_operation_log` VALUES (513, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 09:20:13', '2021-08-03 09:20:13');
INSERT INTO `admin_operation_log` VALUES (514, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:21:31', '2021-08-03 09:21:31');
INSERT INTO `admin_operation_log` VALUES (515, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:22:59', '2021-08-03 09:22:59');
INSERT INTO `admin_operation_log` VALUES (516, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:23:28', '2021-08-03 09:23:28');
INSERT INTO `admin_operation_log` VALUES (517, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:25:19', '2021-08-03 09:25:19');
INSERT INTO `admin_operation_log` VALUES (518, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:27:12', '2021-08-03 09:27:12');
INSERT INTO `admin_operation_log` VALUES (519, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 09:27:35', '2021-08-03 09:27:35');
INSERT INTO `admin_operation_log` VALUES (520, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:28:58', '2021-08-03 09:28:58');
INSERT INTO `admin_operation_log` VALUES (521, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:29:29', '2021-08-03 09:29:29');
INSERT INTO `admin_operation_log` VALUES (522, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 09:29:36', '2021-08-03 09:29:36');
INSERT INTO `admin_operation_log` VALUES (523, 1, 'admin/media-videos/[%7B%22text%22:%22English%22,%22id%22:1%7D,%7B%22text%22:%22French%22,%22id%22:2%7D,%7B%22text%22:%22German%22,%22id%22:3%7D,%7B%22text%22:%22Chinese%22,%22id%22:4%7D]', 'GET', '127.0.0.1', '[]', '2021-08-03 09:29:38', '2021-08-03 09:29:38');
INSERT INTO `admin_operation_log` VALUES (524, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:29:46', '2021-08-03 09:29:46');
INSERT INTO `admin_operation_log` VALUES (525, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:32:08', '2021-08-03 09:32:08');
INSERT INTO `admin_operation_log` VALUES (526, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:32:22', '2021-08-03 09:32:22');
INSERT INTO `admin_operation_log` VALUES (527, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 09:32:26', '2021-08-03 09:32:26');
INSERT INTO `admin_operation_log` VALUES (528, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:32:28', '2021-08-03 09:32:28');
INSERT INTO `admin_operation_log` VALUES (529, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 09:32:35', '2021-08-03 09:32:35');
INSERT INTO `admin_operation_log` VALUES (530, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:32:49', '2021-08-03 09:32:49');
INSERT INTO `admin_operation_log` VALUES (531, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:33:19', '2021-08-03 09:33:19');
INSERT INTO `admin_operation_log` VALUES (532, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:38:54', '2021-08-03 09:38:54');
INSERT INTO `admin_operation_log` VALUES (533, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 09:38:57', '2021-08-03 09:38:57');
INSERT INTO `admin_operation_log` VALUES (534, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:39:24', '2021-08-03 09:39:24');
INSERT INTO `admin_operation_log` VALUES (535, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 09:39:32', '2021-08-03 09:39:32');
INSERT INTO `admin_operation_log` VALUES (536, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:39:42', '2021-08-03 09:39:42');
INSERT INTO `admin_operation_log` VALUES (537, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 09:39:55', '2021-08-03 09:39:55');
INSERT INTO `admin_operation_log` VALUES (538, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:40:51', '2021-08-03 09:40:51');
INSERT INTO `admin_operation_log` VALUES (539, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 09:40:55', '2021-08-03 09:40:55');
INSERT INTO `admin_operation_log` VALUES (540, 1, 'admin/api/configs', 'GET', '127.0.0.1', '{\"type\":\"1?\"}', '2021-08-03 09:40:57', '2021-08-03 09:40:57');
INSERT INTO `admin_operation_log` VALUES (541, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:41:51', '2021-08-03 09:41:51');
INSERT INTO `admin_operation_log` VALUES (542, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 09:41:55', '2021-08-03 09:41:55');
INSERT INTO `admin_operation_log` VALUES (543, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:43:22', '2021-08-03 09:43:22');
INSERT INTO `admin_operation_log` VALUES (544, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 09:43:26', '2021-08-03 09:43:26');
INSERT INTO `admin_operation_log` VALUES (545, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 09:43:28', '2021-08-03 09:43:28');
INSERT INTO `admin_operation_log` VALUES (546, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:43:52', '2021-08-03 09:43:52');
INSERT INTO `admin_operation_log` VALUES (547, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 09:43:56', '2021-08-03 09:43:56');
INSERT INTO `admin_operation_log` VALUES (548, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 09:43:57', '2021-08-03 09:43:57');
INSERT INTO `admin_operation_log` VALUES (549, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:45:09', '2021-08-03 09:45:09');
INSERT INTO `admin_operation_log` VALUES (550, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 09:45:13', '2021-08-03 09:45:13');
INSERT INTO `admin_operation_log` VALUES (551, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 09:45:15', '2021-08-03 09:45:15');
INSERT INTO `admin_operation_log` VALUES (552, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:46:18', '2021-08-03 09:46:18');
INSERT INTO `admin_operation_log` VALUES (553, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 09:46:23', '2021-08-03 09:46:23');
INSERT INTO `admin_operation_log` VALUES (554, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 09:46:24', '2021-08-03 09:46:24');
INSERT INTO `admin_operation_log` VALUES (555, 1, 'admin/media-videos', 'GET', '127.0.0.1', '[]', '2021-08-03 09:50:51', '2021-08-03 09:50:51');
INSERT INTO `admin_operation_log` VALUES (556, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:50:55', '2021-08-03 09:50:55');
INSERT INTO `admin_operation_log` VALUES (557, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 09:50:59', '2021-08-03 09:50:59');
INSERT INTO `admin_operation_log` VALUES (558, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 09:51:01', '2021-08-03 09:51:01');
INSERT INTO `admin_operation_log` VALUES (559, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 09:52:47', '2021-08-03 09:52:47');
INSERT INTO `admin_operation_log` VALUES (560, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 09:54:53', '2021-08-03 09:54:53');
INSERT INTO `admin_operation_log` VALUES (561, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 09:54:57', '2021-08-03 09:54:57');
INSERT INTO `admin_operation_log` VALUES (562, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 09:54:59', '2021-08-03 09:54:59');
INSERT INTO `admin_operation_log` VALUES (563, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 09:55:18', '2021-08-03 09:55:18');
INSERT INTO `admin_operation_log` VALUES (564, 1, 'admin/api/configs/q=3', 'GET', '127.0.0.1', '[]', '2021-08-03 10:24:29', '2021-08-03 10:24:29');
INSERT INTO `admin_operation_log` VALUES (565, 1, 'admin/api/configs/q=3', 'GET', '127.0.0.1', '[]', '2021-08-03 10:25:10', '2021-08-03 10:25:10');
INSERT INTO `admin_operation_log` VALUES (566, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 10:26:09', '2021-08-03 10:26:09');
INSERT INTO `admin_operation_log` VALUES (567, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 10:26:14', '2021-08-03 10:26:14');
INSERT INTO `admin_operation_log` VALUES (568, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 10:26:16', '2021-08-03 10:26:16');
INSERT INTO `admin_operation_log` VALUES (569, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 10:31:22', '2021-08-03 10:31:22');
INSERT INTO `admin_operation_log` VALUES (570, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 10:31:25', '2021-08-03 10:31:25');
INSERT INTO `admin_operation_log` VALUES (571, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 10:31:25', '2021-08-03 10:31:25');
INSERT INTO `admin_operation_log` VALUES (572, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 10:31:34', '2021-08-03 10:31:34');
INSERT INTO `admin_operation_log` VALUES (573, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 10:31:38', '2021-08-03 10:31:38');
INSERT INTO `admin_operation_log` VALUES (574, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 10:31:40', '2021-08-03 10:31:40');
INSERT INTO `admin_operation_log` VALUES (575, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 10:33:21', '2021-08-03 10:33:21');
INSERT INTO `admin_operation_log` VALUES (576, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 10:33:26', '2021-08-03 10:33:26');
INSERT INTO `admin_operation_log` VALUES (577, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 10:34:37', '2021-08-03 10:34:37');
INSERT INTO `admin_operation_log` VALUES (578, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 10:34:41', '2021-08-03 10:34:41');
INSERT INTO `admin_operation_log` VALUES (579, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 10:35:25', '2021-08-03 10:35:25');
INSERT INTO `admin_operation_log` VALUES (580, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 10:35:29', '2021-08-03 10:35:29');
INSERT INTO `admin_operation_log` VALUES (581, 1, 'admin/api/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 10:35:31', '2021-08-03 10:35:31');
INSERT INTO `admin_operation_log` VALUES (582, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 10:37:03', '2021-08-03 10:37:03');
INSERT INTO `admin_operation_log` VALUES (583, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 10:37:08', '2021-08-03 10:37:08');
INSERT INTO `admin_operation_log` VALUES (584, 1, 'admin/api/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 10:37:09', '2021-08-03 10:37:09');
INSERT INTO `admin_operation_log` VALUES (585, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 10:37:30', '2021-08-03 10:37:30');
INSERT INTO `admin_operation_log` VALUES (586, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 10:37:35', '2021-08-03 10:37:35');
INSERT INTO `admin_operation_log` VALUES (587, 1, 'admin/api/configs', 'GET', '127.0.0.1', '{\"type\":\"1?\"}', '2021-08-03 10:37:36', '2021-08-03 10:37:36');
INSERT INTO `admin_operation_log` VALUES (588, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 10:38:30', '2021-08-03 10:38:30');
INSERT INTO `admin_operation_log` VALUES (589, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 10:38:35', '2021-08-03 10:38:35');
INSERT INTO `admin_operation_log` VALUES (590, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 10:38:36', '2021-08-03 10:38:36');
INSERT INTO `admin_operation_log` VALUES (591, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 10:39:33', '2021-08-03 10:39:33');
INSERT INTO `admin_operation_log` VALUES (592, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 10:39:38', '2021-08-03 10:39:38');
INSERT INTO `admin_operation_log` VALUES (593, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 10:39:40', '2021-08-03 10:39:40');
INSERT INTO `admin_operation_log` VALUES (594, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 10:42:51', '2021-08-03 10:42:51');
INSERT INTO `admin_operation_log` VALUES (595, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 10:42:57', '2021-08-03 10:42:57');
INSERT INTO `admin_operation_log` VALUES (596, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 10:42:59', '2021-08-03 10:42:59');
INSERT INTO `admin_operation_log` VALUES (597, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 10:44:22', '2021-08-03 10:44:22');
INSERT INTO `admin_operation_log` VALUES (598, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 10:44:27', '2021-08-03 10:44:27');
INSERT INTO `admin_operation_log` VALUES (599, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 10:44:29', '2021-08-03 10:44:29');
INSERT INTO `admin_operation_log` VALUES (600, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 10:49:22', '2021-08-03 10:49:22');
INSERT INTO `admin_operation_log` VALUES (601, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 10:49:26', '2021-08-03 10:49:26');
INSERT INTO `admin_operation_log` VALUES (602, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 10:49:28', '2021-08-03 10:49:28');
INSERT INTO `admin_operation_log` VALUES (603, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 10:55:12', '2021-08-03 10:55:12');
INSERT INTO `admin_operation_log` VALUES (604, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 10:55:16', '2021-08-03 10:55:16');
INSERT INTO `admin_operation_log` VALUES (605, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 10:55:18', '2021-08-03 10:55:18');
INSERT INTO `admin_operation_log` VALUES (606, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 10:57:35', '2021-08-03 10:57:35');
INSERT INTO `admin_operation_log` VALUES (607, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 10:57:40', '2021-08-03 10:57:40');
INSERT INTO `admin_operation_log` VALUES (608, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 10:57:42', '2021-08-03 10:57:42');
INSERT INTO `admin_operation_log` VALUES (609, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 10:58:26', '2021-08-03 10:58:26');
INSERT INTO `admin_operation_log` VALUES (610, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 10:58:30', '2021-08-03 10:58:30');
INSERT INTO `admin_operation_log` VALUES (611, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 10:58:32', '2021-08-03 10:58:32');
INSERT INTO `admin_operation_log` VALUES (612, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 10:59:19', '2021-08-03 10:59:19');
INSERT INTO `admin_operation_log` VALUES (613, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 10:59:23', '2021-08-03 10:59:23');
INSERT INTO `admin_operation_log` VALUES (614, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 10:59:25', '2021-08-03 10:59:25');
INSERT INTO `admin_operation_log` VALUES (615, 1, 'admin/column-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 10:59:56', '2021-08-03 10:59:56');
INSERT INTO `admin_operation_log` VALUES (616, 1, 'admin/column-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 11:00:06', '2021-08-03 11:00:06');
INSERT INTO `admin_operation_log` VALUES (617, 1, 'admin/media-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 11:00:09', '2021-08-03 11:00:09');
INSERT INTO `admin_operation_log` VALUES (618, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 11:00:13', '2021-08-03 11:00:13');
INSERT INTO `admin_operation_log` VALUES (619, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 11:00:16', '2021-08-03 11:00:16');
INSERT INTO `admin_operation_log` VALUES (620, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 11:01:12', '2021-08-03 11:01:12');
INSERT INTO `admin_operation_log` VALUES (621, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 11:01:12', '2021-08-03 11:01:12');
INSERT INTO `admin_operation_log` VALUES (622, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 11:01:12', '2021-08-03 11:01:12');
INSERT INTO `admin_operation_log` VALUES (623, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 11:01:12', '2021-08-03 11:01:12');
INSERT INTO `admin_operation_log` VALUES (624, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 11:01:15', '2021-08-03 11:01:15');
INSERT INTO `admin_operation_log` VALUES (625, 1, 'admin/configs/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 11:01:27', '2021-08-03 11:01:27');
INSERT INTO `admin_operation_log` VALUES (626, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 11:01:29', '2021-08-03 11:01:29');
INSERT INTO `admin_operation_log` VALUES (627, 1, 'admin/configs/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 11:01:35', '2021-08-03 11:01:35');
INSERT INTO `admin_operation_log` VALUES (628, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 11:01:37', '2021-08-03 11:01:37');
INSERT INTO `admin_operation_log` VALUES (629, 1, 'admin/column-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 11:02:31', '2021-08-03 11:02:31');
INSERT INTO `admin_operation_log` VALUES (630, 1, 'admin/column-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 11:03:10', '2021-08-03 11:03:10');
INSERT INTO `admin_operation_log` VALUES (631, 1, 'admin/column-videos/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 11:03:36', '2021-08-03 11:03:36');
INSERT INTO `admin_operation_log` VALUES (632, 1, 'admin/column-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 11:04:26', '2021-08-03 11:04:26');
INSERT INTO `admin_operation_log` VALUES (633, 1, 'admin/media-videos', 'GET', '127.0.0.1', '[]', '2021-08-03 11:57:59', '2021-08-03 11:57:59');
INSERT INTO `admin_operation_log` VALUES (634, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 11:58:04', '2021-08-03 11:58:04');
INSERT INTO `admin_operation_log` VALUES (635, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 11:58:07', '2021-08-03 11:58:07');
INSERT INTO `admin_operation_log` VALUES (636, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 11:58:07', '2021-08-03 11:58:07');
INSERT INTO `admin_operation_log` VALUES (637, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 11:59:23', '2021-08-03 11:59:23');
INSERT INTO `admin_operation_log` VALUES (638, 1, 'admin/configs/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 11:59:27', '2021-08-03 11:59:27');
INSERT INTO `admin_operation_log` VALUES (639, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 11:59:29', '2021-08-03 11:59:29');
INSERT INTO `admin_operation_log` VALUES (640, 1, 'admin/configs/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:00:44', '2021-08-03 12:00:44');
INSERT INTO `admin_operation_log` VALUES (641, 1, 'admin/configs/create', 'GET', '127.0.0.1', '[]', '2021-08-03 12:00:59', '2021-08-03 12:00:59');
INSERT INTO `admin_operation_log` VALUES (642, 1, 'admin/configs/create', 'GET', '127.0.0.1', '[]', '2021-08-03 12:01:25', '2021-08-03 12:01:25');
INSERT INTO `admin_operation_log` VALUES (643, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:01:31', '2021-08-03 12:01:31');
INSERT INTO `admin_operation_log` VALUES (644, 1, 'admin/configs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:01:40', '2021-08-03 12:01:40');
INSERT INTO `admin_operation_log` VALUES (645, 1, 'admin/column-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:02:23', '2021-08-03 12:02:23');
INSERT INTO `admin_operation_log` VALUES (646, 1, 'admin/column-videos/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:02:34', '2021-08-03 12:02:34');
INSERT INTO `admin_operation_log` VALUES (647, 1, 'admin/column-videos', 'POST', '127.0.0.1', '{\"title\":\"game\",\"parent_id\":\"0\",\"des\":null,\"sort\":null,\"status\":\"on\",\"_token\":\"oOEYtMkYufrWeAH36rQysTu3HlPKLakKinR81NHa\",\"_previous_\":\"http:\\/\\/test.metaxplay.com\\/admin\\/column-videos\"}', '2021-08-03 12:02:48', '2021-08-03 12:02:48');
INSERT INTO `admin_operation_log` VALUES (648, 1, 'admin/column-videos', 'GET', '127.0.0.1', '[]', '2021-08-03 12:02:49', '2021-08-03 12:02:49');
INSERT INTO `admin_operation_log` VALUES (649, 1, 'admin/column-videos/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:03:26', '2021-08-03 12:03:26');
INSERT INTO `admin_operation_log` VALUES (650, 1, 'admin/column-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:03:53', '2021-08-03 12:03:53');
INSERT INTO `admin_operation_log` VALUES (651, 1, 'admin/column-videos/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:03:57', '2021-08-03 12:03:57');
INSERT INTO `admin_operation_log` VALUES (652, 1, 'admin/media-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:09:16', '2021-08-03 12:09:16');
INSERT INTO `admin_operation_log` VALUES (653, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:09:20', '2021-08-03 12:09:20');
INSERT INTO `admin_operation_log` VALUES (654, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 12:09:22', '2021-08-03 12:09:22');
INSERT INTO `admin_operation_log` VALUES (655, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 12:09:23', '2021-08-03 12:09:23');
INSERT INTO `admin_operation_log` VALUES (656, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:12:24', '2021-08-03 12:12:24');
INSERT INTO `admin_operation_log` VALUES (657, 1, 'admin/configs/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:16:26', '2021-08-03 12:16:26');
INSERT INTO `admin_operation_log` VALUES (658, 1, 'admin/configs/create', 'GET', '127.0.0.1', '[]', '2021-08-03 12:17:01', '2021-08-03 12:17:01');
INSERT INTO `admin_operation_log` VALUES (659, 1, 'admin/configs', 'POST', '127.0.0.1', '{\"name\":\"Pay Mark\",\"value\":\"pay_mark\",\"description\":null,\"type\":\"2\",\"status\":\"on\",\"_token\":\"oOEYtMkYufrWeAH36rQysTu3HlPKLakKinR81NHa\",\"after-save\":\"2\"}', '2021-08-03 12:17:37', '2021-08-03 12:17:37');
INSERT INTO `admin_operation_log` VALUES (660, 1, 'admin/configs/create', 'GET', '127.0.0.1', '[]', '2021-08-03 12:17:39', '2021-08-03 12:17:39');
INSERT INTO `admin_operation_log` VALUES (661, 1, 'admin/configs', 'POST', '127.0.0.1', '{\"name\":\"Feature Content Mark\",\"value\":\"feature_content_mark\",\"description\":null,\"type\":\"2\",\"status\":\"on\",\"_token\":\"oOEYtMkYufrWeAH36rQysTu3HlPKLakKinR81NHa\"}', '2021-08-03 12:18:08', '2021-08-03 12:18:08');
INSERT INTO `admin_operation_log` VALUES (662, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 12:18:09', '2021-08-03 12:18:09');
INSERT INTO `admin_operation_log` VALUES (663, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_selector\":{\"type\":\"2\"},\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:18:23', '2021-08-03 12:18:23');
INSERT INTO `admin_operation_log` VALUES (664, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 12:18:25', '2021-08-03 12:18:25');
INSERT INTO `admin_operation_log` VALUES (665, 1, 'admin/configs/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:18:39', '2021-08-03 12:18:39');
INSERT INTO `admin_operation_log` VALUES (666, 1, 'admin/configs', 'POST', '127.0.0.1', '{\"name\":\"Clarity Mark\",\"value\":\"clarity_mark\",\"description\":null,\"type\":\"2\",\"status\":\"on\",\"_token\":\"oOEYtMkYufrWeAH36rQysTu3HlPKLakKinR81NHa\",\"_previous_\":\"http:\\/\\/test.metaxplay.com\\/admin\\/configs\"}', '2021-08-03 12:19:04', '2021-08-03 12:19:04');
INSERT INTO `admin_operation_log` VALUES (667, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 12:19:05', '2021-08-03 12:19:05');
INSERT INTO `admin_operation_log` VALUES (668, 1, 'admin/configs/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:19:10', '2021-08-03 12:19:10');
INSERT INTO `admin_operation_log` VALUES (669, 1, 'admin/configs', 'POST', '127.0.0.1', '{\"name\":\"Operation Mark\",\"value\":\"operation_mark\",\"description\":null,\"type\":\"2\",\"status\":\"on\",\"_token\":\"oOEYtMkYufrWeAH36rQysTu3HlPKLakKinR81NHa\",\"_previous_\":\"http:\\/\\/test.metaxplay.com\\/admin\\/configs\"}', '2021-08-03 12:19:32', '2021-08-03 12:19:32');
INSERT INTO `admin_operation_log` VALUES (670, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 12:19:34', '2021-08-03 12:19:34');
INSERT INTO `admin_operation_log` VALUES (671, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_selector\":{\"type\":\"2\"},\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:20:17', '2021-08-03 12:20:17');
INSERT INTO `admin_operation_log` VALUES (672, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 12:20:19', '2021-08-03 12:20:19');
INSERT INTO `admin_operation_log` VALUES (673, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_selector\":{\"type\":\"2\"},\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:21:22', '2021-08-03 12:21:22');
INSERT INTO `admin_operation_log` VALUES (674, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 12:21:24', '2021-08-03 12:21:24');
INSERT INTO `admin_operation_log` VALUES (675, 1, 'admin/configs', 'GET', '127.0.0.1', '[]', '2021-08-03 12:23:58', '2021-08-03 12:23:58');
INSERT INTO `admin_operation_log` VALUES (676, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_selector\":{\"type\":\"2\"},\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:24:05', '2021-08-03 12:24:05');
INSERT INTO `admin_operation_log` VALUES (677, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_selector\":{\"type\":\"1\"},\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:24:11', '2021-08-03 12:24:11');
INSERT INTO `admin_operation_log` VALUES (678, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_selector\":{\"type\":\"2\"},\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:24:25', '2021-08-03 12:24:25');
INSERT INTO `admin_operation_log` VALUES (679, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_selector\":{\"type\":\"1\"},\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:24:29', '2021-08-03 12:24:29');
INSERT INTO `admin_operation_log` VALUES (680, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_selector\":{\"type\":\"1,2\"},\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:24:34', '2021-08-03 12:24:34');
INSERT INTO `admin_operation_log` VALUES (681, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:24:41', '2021-08-03 12:24:41');
INSERT INTO `admin_operation_log` VALUES (682, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_selector\":{\"type\":\"1\"},\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:24:43', '2021-08-03 12:24:43');
INSERT INTO `admin_operation_log` VALUES (683, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:24:45', '2021-08-03 12:24:45');
INSERT INTO `admin_operation_log` VALUES (684, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_selector\":{\"type\":\"1\"}}', '2021-08-03 12:24:51', '2021-08-03 12:24:51');
INSERT INTO `admin_operation_log` VALUES (685, 1, 'admin/column-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:25:38', '2021-08-03 12:25:38');
INSERT INTO `admin_operation_log` VALUES (686, 1, 'admin/media-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:25:47', '2021-08-03 12:25:47');
INSERT INTO `admin_operation_log` VALUES (687, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:25:51', '2021-08-03 12:25:51');
INSERT INTO `admin_operation_log` VALUES (688, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 12:25:53', '2021-08-03 12:25:53');
INSERT INTO `admin_operation_log` VALUES (689, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 12:25:53', '2021-08-03 12:25:53');
INSERT INTO `admin_operation_log` VALUES (690, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 12:34:06', '2021-08-03 12:34:06');
INSERT INTO `admin_operation_log` VALUES (691, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 12:34:09', '2021-08-03 12:34:09');
INSERT INTO `admin_operation_log` VALUES (692, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 12:34:09', '2021-08-03 12:34:09');
INSERT INTO `admin_operation_log` VALUES (693, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 12:46:26', '2021-08-03 12:46:26');
INSERT INTO `admin_operation_log` VALUES (694, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 12:46:41', '2021-08-03 12:46:41');
INSERT INTO `admin_operation_log` VALUES (695, 1, 'admin/api/configs/2', 'GET', '127.0.0.1', '[]', '2021-08-03 12:46:44', '2021-08-03 12:46:44');
INSERT INTO `admin_operation_log` VALUES (696, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 12:46:44', '2021-08-03 12:46:44');
INSERT INTO `admin_operation_log` VALUES (697, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 12:46:44', '2021-08-03 12:46:44');
INSERT INTO `admin_operation_log` VALUES (698, 1, 'admin/api/configs/3', 'GET', '127.0.0.1', '[]', '2021-08-03 12:46:44', '2021-08-03 12:46:44');
INSERT INTO `admin_operation_log` VALUES (699, 1, 'admin/api/configs/4', 'GET', '127.0.0.1', '[]', '2021-08-03 12:46:44', '2021-08-03 12:46:44');
INSERT INTO `admin_operation_log` VALUES (700, 1, 'admin/api/configs/5', 'GET', '127.0.0.1', '[]', '2021-08-03 12:46:45', '2021-08-03 12:46:45');
INSERT INTO `admin_operation_log` VALUES (701, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 12:47:54', '2021-08-03 12:47:54');
INSERT INTO `admin_operation_log` VALUES (702, 1, 'admin/api/configs/5', 'GET', '127.0.0.1', '[]', '2021-08-03 12:47:58', '2021-08-03 12:47:58');
INSERT INTO `admin_operation_log` VALUES (703, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 12:47:58', '2021-08-03 12:47:58');
INSERT INTO `admin_operation_log` VALUES (704, 1, 'admin/api/configs/2', 'GET', '127.0.0.1', '[]', '2021-08-03 12:47:58', '2021-08-03 12:47:58');
INSERT INTO `admin_operation_log` VALUES (705, 1, 'admin/api/configs/4', 'GET', '127.0.0.1', '[]', '2021-08-03 12:47:58', '2021-08-03 12:47:58');
INSERT INTO `admin_operation_log` VALUES (706, 1, 'admin/api/configs/3', 'GET', '127.0.0.1', '[]', '2021-08-03 12:47:58', '2021-08-03 12:47:58');
INSERT INTO `admin_operation_log` VALUES (707, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 12:47:58', '2021-08-03 12:47:58');
INSERT INTO `admin_operation_log` VALUES (708, 1, 'admin/media-videos', 'POST', '127.0.0.1', '{\"title\":\"test01\",\"title_sub\":\"test01\",\"duration\":\"1000\",\"drama_num\":\"10\",\"drama_end\":\"off\",\"updatetime\":\"2021-08-03 00:00:00\",\"publishtime\":\"2021-08-03 00:00:00\",\"cp_id\":\"1\",\"score\":\"80\",\"language\":\"1\",\"class\":\"0\",\"class_sub\":null,\"intro\":\"111111\",\"pay_mark\":[\"0\",\"0\",null],\"feature_content_mark\":[\"0\",\"0\",\"0\",null],\"clarity_mark\":\"1080\",\"operation_mark\":\"0\",\"img_original\":null,\"img_input\":null,\"title_original\":null,\"uuid\":null,\"sort\":null,\"url\":null,\"tag\":null,\"keyword\":null,\"area\":null,\"country\":null,\"item\":null,\"expand\":null,\"status\":\"off\",\"_token\":\"oOEYtMkYufrWeAH36rQysTu3HlPKLakKinR81NHa\"}', '2021-08-03 12:50:44', '2021-08-03 12:50:44');
INSERT INTO `admin_operation_log` VALUES (709, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-03 12:50:47', '2021-08-03 12:50:47');
INSERT INTO `admin_operation_log` VALUES (710, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 12:50:50', '2021-08-03 12:50:50');
INSERT INTO `admin_operation_log` VALUES (711, 1, 'admin/api/configs/5', 'GET', '127.0.0.1', '[]', '2021-08-03 12:50:50', '2021-08-03 12:50:50');
INSERT INTO `admin_operation_log` VALUES (712, 1, 'admin/api/configs/2', 'GET', '127.0.0.1', '[]', '2021-08-03 12:50:50', '2021-08-03 12:50:50');
INSERT INTO `admin_operation_log` VALUES (713, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 12:50:50', '2021-08-03 12:50:50');
INSERT INTO `admin_operation_log` VALUES (714, 1, 'admin/api/configs/4', 'GET', '127.0.0.1', '[]', '2021-08-03 12:50:50', '2021-08-03 12:50:50');
INSERT INTO `admin_operation_log` VALUES (715, 1, 'admin/api/configs/3', 'GET', '127.0.0.1', '[]', '2021-08-03 12:50:50', '2021-08-03 12:50:50');
INSERT INTO `admin_operation_log` VALUES (716, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 12:52:12', '2021-08-03 12:52:12');
INSERT INTO `admin_operation_log` VALUES (717, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_selector\":{\"type\":\"4\"}}', '2021-08-03 12:52:22', '2021-08-03 12:52:22');
INSERT INTO `admin_operation_log` VALUES (718, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_selector\":{\"type\":\"5\"}}', '2021-08-03 12:52:26', '2021-08-03 12:52:26');
INSERT INTO `admin_operation_log` VALUES (719, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_selector\":{\"type\":\"1\"}}', '2021-08-03 12:52:31', '2021-08-03 12:52:31');
INSERT INTO `admin_operation_log` VALUES (720, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_selector\":{\"type\":\"2\"}}', '2021-08-03 12:52:37', '2021-08-03 12:52:37');
INSERT INTO `admin_operation_log` VALUES (721, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_selector\":{\"type\":\"3\"}}', '2021-08-03 12:52:42', '2021-08-03 12:52:42');
INSERT INTO `admin_operation_log` VALUES (722, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_selector\":{\"type\":\"4\"}}', '2021-08-03 12:52:47', '2021-08-03 12:52:47');
INSERT INTO `admin_operation_log` VALUES (723, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_selector\":{\"type\":\"1\"}}', '2021-08-03 12:52:55', '2021-08-03 12:52:55');
INSERT INTO `admin_operation_log` VALUES (724, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_selector\":{\"type\":\"2\"}}', '2021-08-03 12:52:59', '2021-08-03 12:52:59');
INSERT INTO `admin_operation_log` VALUES (725, 1, 'admin/media-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 13:02:46', '2021-08-03 13:02:46');
INSERT INTO `admin_operation_log` VALUES (726, 1, 'admin/column-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 13:04:37', '2021-08-03 13:04:37');
INSERT INTO `admin_operation_log` VALUES (727, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 13:05:38', '2021-08-03 13:05:38');
INSERT INTO `admin_operation_log` VALUES (728, 1, 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_selector\":{\"type\":\"1\"}}', '2021-08-03 13:05:46', '2021-08-03 13:05:46');
INSERT INTO `admin_operation_log` VALUES (729, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 13:05:56', '2021-08-03 13:05:56');
INSERT INTO `admin_operation_log` VALUES (730, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 13:06:09', '2021-08-03 13:06:09');
INSERT INTO `admin_operation_log` VALUES (731, 1, 'admin/media-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 13:06:12', '2021-08-03 13:06:12');
INSERT INTO `admin_operation_log` VALUES (732, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 13:06:16', '2021-08-03 13:06:16');
INSERT INTO `admin_operation_log` VALUES (733, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-03 13:06:20', '2021-08-03 13:06:20');
INSERT INTO `admin_operation_log` VALUES (734, 1, 'admin/api/configs/2', 'GET', '127.0.0.1', '[]', '2021-08-03 13:06:20', '2021-08-03 13:06:20');
INSERT INTO `admin_operation_log` VALUES (735, 1, 'admin/api/configs/3', 'GET', '127.0.0.1', '[]', '2021-08-03 13:06:20', '2021-08-03 13:06:20');
INSERT INTO `admin_operation_log` VALUES (736, 1, 'admin/api/configs/5', 'GET', '127.0.0.1', '[]', '2021-08-03 13:06:19', '2021-08-03 13:06:19');
INSERT INTO `admin_operation_log` VALUES (737, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-03 13:06:19', '2021-08-03 13:06:19');
INSERT INTO `admin_operation_log` VALUES (738, 1, 'admin/api/configs/4', 'GET', '127.0.0.1', '[]', '2021-08-03 13:06:21', '2021-08-03 13:06:21');
INSERT INTO `admin_operation_log` VALUES (739, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 13:06:32', '2021-08-03 13:06:32');
INSERT INTO `admin_operation_log` VALUES (740, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-03 13:06:34', '2021-08-03 13:06:34');
INSERT INTO `admin_operation_log` VALUES (741, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-08-04 01:31:00', '2021-08-04 01:31:00');
INSERT INTO `admin_operation_log` VALUES (742, 1, 'admin/column-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-04 01:32:13', '2021-08-04 01:32:13');
INSERT INTO `admin_operation_log` VALUES (743, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-08-04 01:57:17', '2021-08-04 01:57:17');
INSERT INTO `admin_operation_log` VALUES (744, 1, 'admin/column-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-04 02:59:11', '2021-08-04 02:59:11');
INSERT INTO `admin_operation_log` VALUES (745, 1, 'admin/media-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-04 02:59:20', '2021-08-04 02:59:20');
INSERT INTO `admin_operation_log` VALUES (746, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-04 02:59:26', '2021-08-04 02:59:26');
INSERT INTO `admin_operation_log` VALUES (747, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-04 02:59:29', '2021-08-04 02:59:29');
INSERT INTO `admin_operation_log` VALUES (748, 1, 'admin/api/configs/5', 'GET', '127.0.0.1', '[]', '2021-08-04 02:59:29', '2021-08-04 02:59:29');
INSERT INTO `admin_operation_log` VALUES (749, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-04 02:59:29', '2021-08-04 02:59:29');
INSERT INTO `admin_operation_log` VALUES (750, 1, 'admin/api/configs/3', 'GET', '127.0.0.1', '[]', '2021-08-04 02:59:29', '2021-08-04 02:59:29');
INSERT INTO `admin_operation_log` VALUES (751, 1, 'admin/api/configs/4', 'GET', '127.0.0.1', '[]', '2021-08-04 02:59:29', '2021-08-04 02:59:29');
INSERT INTO `admin_operation_log` VALUES (752, 1, 'admin/api/configs/2', 'GET', '127.0.0.1', '[]', '2021-08-04 02:59:29', '2021-08-04 02:59:29');
INSERT INTO `admin_operation_log` VALUES (753, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-08-04 03:03:22', '2021-08-04 03:03:22');
INSERT INTO `admin_operation_log` VALUES (754, 1, 'admin/media-videos', 'GET', '127.0.0.1', '[]', '2021-08-04 03:18:39', '2021-08-04 03:18:39');
INSERT INTO `admin_operation_log` VALUES (755, 1, 'admin/media-videos', 'GET', '127.0.0.1', '{\"_columns_\":\"area,clarity_mark,class_sub,country,cp_id,created_at,drama_end,drama_num,duration,expand,feature_content_mark,id,img_input,img_original,intro,item,keyword,operation_mark,pay_mark,publishtime,score,sort,status,tag,title,title_original,title_sub,updated_at,updatetime,url,uuid\",\"_pjax\":\"#pjax-container\"}', '2021-08-04 03:36:03', '2021-08-04 03:36:03');
INSERT INTO `admin_operation_log` VALUES (756, 1, 'admin/media-videos', 'GET', '127.0.0.1', '{\"_columns_\":\"area,clarity_mark,class_sub,country,cp_id,created_at,drama_end,drama_num,duration,expand,feature_content_mark,id,img_input,img_original,intro,item,keyword,operation_mark,pay_mark,publishtime,score,sort,status,tag,title,title_original,title_sub,updated_at,updatetime,url,uuid\"}', '2021-08-04 03:36:23', '2021-08-04 03:36:23');
INSERT INTO `admin_operation_log` VALUES (757, 1, 'admin/media-videos', 'GET', '127.0.0.1', '[]', '2021-08-04 03:36:39', '2021-08-04 03:36:39');
INSERT INTO `admin_operation_log` VALUES (758, 1, 'admin/media-videos', 'GET', '127.0.0.1', '[]', '2021-08-04 03:36:45', '2021-08-04 03:36:45');
INSERT INTO `admin_operation_log` VALUES (759, 1, 'admin/media-videos', 'GET', '127.0.0.1', '[]', '2021-08-04 03:37:13', '2021-08-04 03:37:13');
INSERT INTO `admin_operation_log` VALUES (760, 1, 'admin/media-videos', 'GET', '127.0.0.1', '[]', '2021-08-04 03:45:19', '2021-08-04 03:45:19');
INSERT INTO `admin_operation_log` VALUES (761, 1, 'admin/media-videos', 'GET', '127.0.0.1', '[]', '2021-08-04 03:46:03', '2021-08-04 03:46:03');
INSERT INTO `admin_operation_log` VALUES (762, 1, 'admin/media-videos', 'GET', '127.0.0.1', '[]', '2021-08-04 03:52:22', '2021-08-04 03:52:22');
INSERT INTO `admin_operation_log` VALUES (763, 1, 'admin/media-videos', 'GET', '127.0.0.1', '[]', '2021-08-04 03:55:02', '2021-08-04 03:55:02');
INSERT INTO `admin_operation_log` VALUES (764, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-04 03:55:37', '2021-08-04 03:55:37');
INSERT INTO `admin_operation_log` VALUES (765, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-04 03:55:40', '2021-08-04 03:55:40');
INSERT INTO `admin_operation_log` VALUES (766, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-04 03:55:40', '2021-08-04 03:55:40');
INSERT INTO `admin_operation_log` VALUES (767, 1, 'admin/api/configs/2', 'GET', '127.0.0.1', '[]', '2021-08-04 03:55:40', '2021-08-04 03:55:40');
INSERT INTO `admin_operation_log` VALUES (768, 1, 'admin/api/configs/3', 'GET', '127.0.0.1', '[]', '2021-08-04 03:55:40', '2021-08-04 03:55:40');
INSERT INTO `admin_operation_log` VALUES (769, 1, 'admin/api/configs/4', 'GET', '127.0.0.1', '[]', '2021-08-04 03:55:40', '2021-08-04 03:55:40');
INSERT INTO `admin_operation_log` VALUES (770, 1, 'admin/api/configs/5', 'GET', '127.0.0.1', '[]', '2021-08-04 03:55:40', '2021-08-04 03:55:40');
INSERT INTO `admin_operation_log` VALUES (771, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-04 09:53:50', '2021-08-04 09:53:50');
INSERT INTO `admin_operation_log` VALUES (772, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-04 09:53:54', '2021-08-04 09:53:54');
INSERT INTO `admin_operation_log` VALUES (773, 1, 'admin/api/configs/2', 'GET', '127.0.0.1', '[]', '2021-08-04 09:53:54', '2021-08-04 09:53:54');
INSERT INTO `admin_operation_log` VALUES (774, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-04 09:53:54', '2021-08-04 09:53:54');
INSERT INTO `admin_operation_log` VALUES (775, 1, 'admin/api/configs/4', 'GET', '127.0.0.1', '[]', '2021-08-04 09:53:54', '2021-08-04 09:53:54');
INSERT INTO `admin_operation_log` VALUES (776, 1, 'admin/api/configs/5', 'GET', '127.0.0.1', '[]', '2021-08-04 09:53:54', '2021-08-04 09:53:54');
INSERT INTO `admin_operation_log` VALUES (777, 1, 'admin/api/configs/3', 'GET', '127.0.0.1', '[]', '2021-08-04 09:53:54', '2021-08-04 09:53:54');
INSERT INTO `admin_operation_log` VALUES (778, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-04 10:03:57', '2021-08-04 10:03:57');
INSERT INTO `admin_operation_log` VALUES (779, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-04 10:04:19', '2021-08-04 10:04:19');
INSERT INTO `admin_operation_log` VALUES (780, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-04 10:04:30', '2021-08-04 10:04:30');
INSERT INTO `admin_operation_log` VALUES (781, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-04 10:05:37', '2021-08-04 10:05:37');
INSERT INTO `admin_operation_log` VALUES (782, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-04 10:05:57', '2021-08-04 10:05:57');
INSERT INTO `admin_operation_log` VALUES (783, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 10:06:15', '2021-08-04 10:06:15');
INSERT INTO `admin_operation_log` VALUES (784, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 10:06:27', '2021-08-04 10:06:27');
INSERT INTO `admin_operation_log` VALUES (785, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 10:06:37', '2021-08-04 10:06:37');
INSERT INTO `admin_operation_log` VALUES (786, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-08-04 10:09:58', '2021-08-04 10:09:58');
INSERT INTO `admin_operation_log` VALUES (787, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-04 10:10:31', '2021-08-04 10:10:31');
INSERT INTO `admin_operation_log` VALUES (788, 1, 'admin/cps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-04 10:10:38', '2021-08-04 10:10:38');
INSERT INTO `admin_operation_log` VALUES (789, 1, 'admin/media-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-04 10:10:41', '2021-08-04 10:10:41');
INSERT INTO `admin_operation_log` VALUES (790, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 10:21:20', '2021-08-04 10:21:20');
INSERT INTO `admin_operation_log` VALUES (791, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 10:23:54', '2021-08-04 10:23:54');
INSERT INTO `admin_operation_log` VALUES (792, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 10:24:58', '2021-08-04 10:24:58');
INSERT INTO `admin_operation_log` VALUES (793, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 10:25:29', '2021-08-04 10:25:29');
INSERT INTO `admin_operation_log` VALUES (794, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 10:33:10', '2021-08-04 10:33:10');
INSERT INTO `admin_operation_log` VALUES (795, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 10:33:39', '2021-08-04 10:33:39');
INSERT INTO `admin_operation_log` VALUES (796, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 10:34:49', '2021-08-04 10:34:49');
INSERT INTO `admin_operation_log` VALUES (797, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 10:41:55', '2021-08-04 10:41:55');
INSERT INTO `admin_operation_log` VALUES (798, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 10:42:07', '2021-08-04 10:42:07');
INSERT INTO `admin_operation_log` VALUES (799, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 10:43:09', '2021-08-04 10:43:09');
INSERT INTO `admin_operation_log` VALUES (800, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-04 10:43:42', '2021-08-04 10:43:42');
INSERT INTO `admin_operation_log` VALUES (801, 1, 'admin/media-videos', 'GET', '127.0.0.1', '[]', '2021-08-04 10:43:48', '2021-08-04 10:43:48');
INSERT INTO `admin_operation_log` VALUES (802, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 10:47:35', '2021-08-04 10:47:35');
INSERT INTO `admin_operation_log` VALUES (803, 1, 'admin/media-videos', 'GET', '127.0.0.1', '[]', '2021-08-04 10:47:45', '2021-08-04 10:47:45');
INSERT INTO `admin_operation_log` VALUES (804, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-08-04 10:47:50', '2021-08-04 10:47:50');
INSERT INTO `admin_operation_log` VALUES (805, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-04 10:47:55', '2021-08-04 10:47:55');
INSERT INTO `admin_operation_log` VALUES (806, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-04 10:47:57', '2021-08-04 10:47:57');
INSERT INTO `admin_operation_log` VALUES (807, 1, 'admin/api/configs/2', 'GET', '127.0.0.1', '[]', '2021-08-04 10:48:04', '2021-08-04 10:48:04');
INSERT INTO `admin_operation_log` VALUES (808, 1, 'admin/api/configs/3', 'GET', '127.0.0.1', '[]', '2021-08-04 10:48:06', '2021-08-04 10:48:06');
INSERT INTO `admin_operation_log` VALUES (809, 1, 'admin/api/configs/5', 'GET', '127.0.0.1', '[]', '2021-08-04 10:48:07', '2021-08-04 10:48:07');
INSERT INTO `admin_operation_log` VALUES (810, 1, 'admin/api/configs/4', 'GET', '127.0.0.1', '[]', '2021-08-04 10:48:10', '2021-08-04 10:48:10');
INSERT INTO `admin_operation_log` VALUES (811, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 10:48:12', '2021-08-04 10:48:12');
INSERT INTO `admin_operation_log` VALUES (812, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-04 10:52:13', '2021-08-04 10:52:13');
INSERT INTO `admin_operation_log` VALUES (813, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-04 10:52:34', '2021-08-04 10:52:34');
INSERT INTO `admin_operation_log` VALUES (814, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-04 10:52:36', '2021-08-04 10:52:36');
INSERT INTO `admin_operation_log` VALUES (815, 1, 'admin/api/configs/2', 'GET', '127.0.0.1', '[]', '2021-08-04 10:52:38', '2021-08-04 10:52:38');
INSERT INTO `admin_operation_log` VALUES (816, 1, 'admin/api/configs/3', 'GET', '127.0.0.1', '[]', '2021-08-04 10:52:40', '2021-08-04 10:52:40');
INSERT INTO `admin_operation_log` VALUES (817, 1, 'admin/api/configs/4', 'GET', '127.0.0.1', '[]', '2021-08-04 10:52:41', '2021-08-04 10:52:41');
INSERT INTO `admin_operation_log` VALUES (818, 1, 'admin/api/configs/5', 'GET', '127.0.0.1', '[]', '2021-08-04 10:52:43', '2021-08-04 10:52:43');
INSERT INTO `admin_operation_log` VALUES (819, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 10:52:44', '2021-08-04 10:52:44');
INSERT INTO `admin_operation_log` VALUES (820, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-04 11:17:25', '2021-08-04 11:17:25');
INSERT INTO `admin_operation_log` VALUES (821, 1, 'admin/api/configs/4', 'GET', '127.0.0.1', '[]', '2021-08-04 11:17:28', '2021-08-04 11:17:28');
INSERT INTO `admin_operation_log` VALUES (822, 1, 'admin/api/configs/2', 'GET', '127.0.0.1', '[]', '2021-08-04 11:17:28', '2021-08-04 11:17:28');
INSERT INTO `admin_operation_log` VALUES (823, 1, 'admin/api/configs/3', 'GET', '127.0.0.1', '[]', '2021-08-04 11:17:28', '2021-08-04 11:17:28');
INSERT INTO `admin_operation_log` VALUES (824, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-04 11:17:29', '2021-08-04 11:17:29');
INSERT INTO `admin_operation_log` VALUES (825, 1, 'admin/api/configs/5', 'GET', '127.0.0.1', '[]', '2021-08-04 11:17:29', '2021-08-04 11:17:29');
INSERT INTO `admin_operation_log` VALUES (826, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 11:17:30', '2021-08-04 11:17:30');
INSERT INTO `admin_operation_log` VALUES (827, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-04 11:17:31', '2021-08-04 11:17:31');
INSERT INTO `admin_operation_log` VALUES (828, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-04 11:17:36', '2021-08-04 11:17:36');
INSERT INTO `admin_operation_log` VALUES (829, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-04 11:17:40', '2021-08-04 11:17:40');
INSERT INTO `admin_operation_log` VALUES (830, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-04 11:17:40', '2021-08-04 11:17:40');
INSERT INTO `admin_operation_log` VALUES (831, 1, 'admin/api/configs/4', 'GET', '127.0.0.1', '[]', '2021-08-04 11:17:40', '2021-08-04 11:17:40');
INSERT INTO `admin_operation_log` VALUES (832, 1, 'admin/api/configs/3', 'GET', '127.0.0.1', '[]', '2021-08-04 11:17:40', '2021-08-04 11:17:40');
INSERT INTO `admin_operation_log` VALUES (833, 1, 'admin/api/configs/5', 'GET', '127.0.0.1', '[]', '2021-08-04 11:17:40', '2021-08-04 11:17:40');
INSERT INTO `admin_operation_log` VALUES (834, 1, 'admin/api/configs/2', 'GET', '127.0.0.1', '[]', '2021-08-04 11:17:40', '2021-08-04 11:17:40');
INSERT INTO `admin_operation_log` VALUES (835, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 11:17:42', '2021-08-04 11:17:42');
INSERT INTO `admin_operation_log` VALUES (836, 1, 'admin/media-videos/create', 'GET', '127.0.0.1', '[]', '2021-08-04 11:28:24', '2021-08-04 11:28:24');
INSERT INTO `admin_operation_log` VALUES (837, 1, 'admin/api/cps', 'GET', '127.0.0.1', '[]', '2021-08-04 11:28:28', '2021-08-04 11:28:28');
INSERT INTO `admin_operation_log` VALUES (838, 1, 'admin/api/configs/4', 'GET', '127.0.0.1', '[]', '2021-08-04 11:28:28', '2021-08-04 11:28:28');
INSERT INTO `admin_operation_log` VALUES (839, 1, 'admin/api/configs/2', 'GET', '127.0.0.1', '[]', '2021-08-04 11:28:28', '2021-08-04 11:28:28');
INSERT INTO `admin_operation_log` VALUES (840, 1, 'admin/api/configs/1', 'GET', '127.0.0.1', '[]', '2021-08-04 11:28:28', '2021-08-04 11:28:28');
INSERT INTO `admin_operation_log` VALUES (841, 1, 'admin/api/configs/3', 'GET', '127.0.0.1', '[]', '2021-08-04 11:28:28', '2021-08-04 11:28:28');
INSERT INTO `admin_operation_log` VALUES (842, 1, 'admin/api/configs/5', 'GET', '127.0.0.1', '[]', '2021-08-04 11:28:28', '2021-08-04 11:28:28');
INSERT INTO `admin_operation_log` VALUES (843, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 11:28:30', '2021-08-04 11:28:30');
INSERT INTO `admin_operation_log` VALUES (844, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 11:29:31', '2021-08-04 11:29:31');
INSERT INTO `admin_operation_log` VALUES (845, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 11:30:06', '2021-08-04 11:30:06');
INSERT INTO `admin_operation_log` VALUES (846, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 11:40:02', '2021-08-04 11:40:02');
INSERT INTO `admin_operation_log` VALUES (847, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 11:40:22', '2021-08-04 11:40:22');
INSERT INTO `admin_operation_log` VALUES (848, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 11:40:43', '2021-08-04 11:40:43');
INSERT INTO `admin_operation_log` VALUES (849, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 11:40:51', '2021-08-04 11:40:51');
INSERT INTO `admin_operation_log` VALUES (850, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 11:40:54', '2021-08-04 11:40:54');
INSERT INTO `admin_operation_log` VALUES (851, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 11:42:33', '2021-08-04 11:42:33');
INSERT INTO `admin_operation_log` VALUES (852, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 11:42:38', '2021-08-04 11:42:38');
INSERT INTO `admin_operation_log` VALUES (853, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 11:43:04', '2021-08-04 11:43:04');
INSERT INTO `admin_operation_log` VALUES (854, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 11:43:50', '2021-08-04 11:43:50');
INSERT INTO `admin_operation_log` VALUES (855, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 11:44:48', '2021-08-04 11:44:48');
INSERT INTO `admin_operation_log` VALUES (856, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 11:45:17', '2021-08-04 11:45:17');
INSERT INTO `admin_operation_log` VALUES (857, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 11:46:45', '2021-08-04 11:46:45');
INSERT INTO `admin_operation_log` VALUES (858, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 11:48:02', '2021-08-04 11:48:02');
INSERT INTO `admin_operation_log` VALUES (859, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 11:48:11', '2021-08-04 11:48:11');
INSERT INTO `admin_operation_log` VALUES (860, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 11:53:14', '2021-08-04 11:53:14');
INSERT INTO `admin_operation_log` VALUES (861, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 11:54:24', '2021-08-04 11:54:24');
INSERT INTO `admin_operation_log` VALUES (862, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 11:55:33', '2021-08-04 11:55:33');
INSERT INTO `admin_operation_log` VALUES (863, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-04 11:56:14', '2021-08-04 11:56:14');
INSERT INTO `admin_operation_log` VALUES (864, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-08-05 01:29:15', '2021-08-05 01:29:15');
INSERT INTO `admin_operation_log` VALUES (865, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-05 01:29:23', '2021-08-05 01:29:23');
INSERT INTO `admin_operation_log` VALUES (866, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-05 01:30:22', '2021-08-05 01:30:22');
INSERT INTO `admin_operation_log` VALUES (867, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-05 01:30:38', '2021-08-05 01:30:38');
INSERT INTO `admin_operation_log` VALUES (868, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-05 01:30:59', '2021-08-05 01:30:59');
INSERT INTO `admin_operation_log` VALUES (869, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-05 01:31:28', '2021-08-05 01:31:28');
INSERT INTO `admin_operation_log` VALUES (870, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-05 01:31:39', '2021-08-05 01:31:39');
INSERT INTO `admin_operation_log` VALUES (871, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-05 01:31:43', '2021-08-05 01:31:43');
INSERT INTO `admin_operation_log` VALUES (872, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-05 01:55:24', '2021-08-05 01:55:24');
INSERT INTO `admin_operation_log` VALUES (873, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-05 01:55:28', '2021-08-05 01:55:28');
INSERT INTO `admin_operation_log` VALUES (874, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-05 02:05:46', '2021-08-05 02:05:46');
INSERT INTO `admin_operation_log` VALUES (875, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-05 02:05:50', '2021-08-05 02:05:50');
INSERT INTO `admin_operation_log` VALUES (876, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-05 02:06:14', '2021-08-05 02:06:14');
INSERT INTO `admin_operation_log` VALUES (877, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-05 02:07:42', '2021-08-05 02:07:42');
INSERT INTO `admin_operation_log` VALUES (878, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-05 02:09:56', '2021-08-05 02:09:56');
INSERT INTO `admin_operation_log` VALUES (879, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-05 02:12:13', '2021-08-05 02:12:13');
INSERT INTO `admin_operation_log` VALUES (880, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-05 02:13:39', '2021-08-05 02:13:39');
INSERT INTO `admin_operation_log` VALUES (881, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-05 02:54:52', '2021-08-05 02:54:52');
INSERT INTO `admin_operation_log` VALUES (882, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-05 02:58:14', '2021-08-05 02:58:14');
INSERT INTO `admin_operation_log` VALUES (883, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-05 02:59:22', '2021-08-05 02:59:22');
INSERT INTO `admin_operation_log` VALUES (884, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-05 03:00:01', '2021-08-05 03:00:01');
INSERT INTO `admin_operation_log` VALUES (885, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-08-05 03:04:46', '2021-08-05 03:04:46');
INSERT INTO `admin_operation_log` VALUES (886, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-05 03:37:33', '2021-08-05 03:37:33');
INSERT INTO `admin_operation_log` VALUES (887, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-05 03:38:28', '2021-08-05 03:38:28');
INSERT INTO `admin_operation_log` VALUES (888, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-05 03:38:42', '2021-08-05 03:38:42');
INSERT INTO `admin_operation_log` VALUES (889, 1, 'admin/api/regions', 'GET', '127.0.0.1', '[]', '2021-08-05 03:38:58', '2021-08-05 03:38:58');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_permissions_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_menu_role_id_menu_id_index`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES (1, 2, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 8, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 9, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_permissions_role_id_permission_id_index`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES (1, 1, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 2, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users`  (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_users_role_id_user_id_index`(`role_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES (1, 1, NULL, NULL);
INSERT INTO `admin_role_users` VALUES (2, 2, NULL, NULL);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_roles_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2021-07-28 09:10:32', '2021-07-28 09:10:32');
INSERT INTO `admin_roles` VALUES (2, '客户管理', '客户管理', '2021-07-28 09:59:43', '2021-07-28 09:59:43');

-- ----------------------------
-- Table structure for admin_test
-- ----------------------------
DROP TABLE IF EXISTS `admin_test`;
CREATE TABLE `admin_test`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_test
-- ----------------------------
INSERT INTO `admin_test` VALUES (1, 'admin', '$2y$10$bKo5xyfCJ1MtZOTFmp6S8OwE0Qu.OXmpDanS6VRohV3iR8xpr3kcq', 'Administrator', NULL, 'wpzLvasGGYZh3bPsBgw3S8LwgAYDIi79eWFRKH4rgR4eO3Na3mFixV4zzqY6', '2021-07-28 09:10:32', '2021-07-28 09:10:32');
INSERT INTO `admin_test` VALUES (2, '李俊乾', '$2y$10$XfzyE2PmWV0fN6.DvAYSr.2JdtK3sn6ACMow7qdBxyTZYy2ATupLq', '李俊乾', NULL, '3U8KpwpAmRPIOXxaDXhVq5bD6xnTYn1sPkewjOPsD9OskcRchpKcdn74OCP6', '2021-07-28 09:52:34', '2021-07-28 09:52:34');

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions`  (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_user_permissions_user_id_permission_id_index`(`user_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_user_permissions
-- ----------------------------
INSERT INTO `admin_user_permissions` VALUES (2, 3, NULL, NULL);

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$bKo5xyfCJ1MtZOTFmp6S8OwE0Qu.OXmpDanS6VRohV3iR8xpr3kcq', 'Administrator', NULL, 'wpzLvasGGYZh3bPsBgw3S8LwgAYDIi79eWFRKH4rgR4eO3Na3mFixV4zzqY6', '2021-07-28 09:10:32', '2021-07-28 09:10:32');
INSERT INTO `admin_users` VALUES (2, '李俊乾', '$2y$10$XfzyE2PmWV0fN6.DvAYSr.2JdtK3sn6ACMow7qdBxyTZYy2ATupLq', '李俊乾', NULL, '3U8KpwpAmRPIOXxaDXhVq5bD6xnTYn1sPkewjOPsD9OskcRchpKcdn74OCP6', '2021-07-28 09:52:34', '2021-07-28 09:52:34');

-- ----------------------------
-- Table structure for data_list
-- ----------------------------
DROP TABLE IF EXISTS `data_list`;
CREATE TABLE `data_list`  (
  `id` int(11) NOT NULL,
  `attr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attr_val` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_list
-- ----------------------------

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for m_column_video
-- ----------------------------
DROP TABLE IF EXISTS `m_column_video`;
CREATE TABLE `m_column_video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '父级编号',
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `sort` smallint(6) NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '状态',
  `updated_at` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `created_at` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_column_video
-- ----------------------------
INSERT INTO `m_column_video` VALUES (1, 0, 'video01', NULL, 1, 1, '2021-08-03 08:06:57', '2021-08-03 16:06:57');
INSERT INTO `m_column_video` VALUES (2, 1, 'video02', NULL, 2, 1, '2021-08-03 08:07:03', '2021-08-03 16:07:03');
INSERT INTO `m_column_video` VALUES (3, 0, 'video01-1', NULL, 3, 1, '2021-08-03 08:06:57', '2021-08-03 16:06:57');
INSERT INTO `m_column_video` VALUES (4, 0, 'game', NULL, NULL, 1, '2021-08-03 12:02:48', '2021-08-03 12:02:48');

-- ----------------------------
-- Table structure for m_config
-- ----------------------------
DROP TABLE IF EXISTS `m_config`;
CREATE TABLE `m_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '键',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '值',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '描述',
  `type` tinyint(4) NULL DEFAULT 1 COMMENT '1语言',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1启用,0禁用',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_config_name_unique`(`name`, `value`, `type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_config
-- ----------------------------
INSERT INTO `m_config` VALUES (1, 'English', '1', NULL, 1, 1, '2021-08-03 08:57:23', '2021-08-03 08:57:23');
INSERT INTO `m_config` VALUES (2, 'French', '2', NULL, 1, 1, '2021-08-03 08:57:34', '2021-08-03 08:57:34');
INSERT INTO `m_config` VALUES (3, 'German', '3', NULL, 1, 1, '2021-08-03 08:58:04', '2021-08-03 08:58:04');
INSERT INTO `m_config` VALUES (4, 'Chinese', '4', NULL, 1, 1, '2021-08-03 08:59:41', '2021-08-03 08:59:41');
INSERT INTO `m_config` VALUES (5, 'VIP', 'vip', NULL, 2, 1, '2021-08-03 12:17:38', '2021-08-03 12:17:38');
INSERT INTO `m_config` VALUES (6, 'Rent', 'rent', NULL, 2, 1, '2021-08-03 12:18:08', '2021-08-03 12:18:08');
INSERT INTO `m_config` VALUES (7, 'Buy', 'buy', NULL, 2, 1, '2021-08-03 12:19:04', '2021-08-03 12:19:04');
INSERT INTO `m_config` VALUES (8, 'Metax only', 'metax only', NULL, 2, 1, '2021-08-03 12:19:33', '2021-08-03 12:19:33');
INSERT INTO `m_config` VALUES (9, 'Originals', 'originals', NULL, 2, 1, '2021-08-03 08:57:23', '2021-08-03 08:57:23');
INSERT INTO `m_config` VALUES (10, 'Redeem', 'redeem', NULL, 2, 1, '2021-08-03 08:57:23', '2021-08-03 08:57:23');
INSERT INTO `m_config` VALUES (11, 'Ad', 'ad', NULL, 3, 1, '2021-08-03 08:57:23', '2021-08-03 08:57:23');
INSERT INTO `m_config` VALUES (12, 'Subtitled', 'subtitled', NULL, 3, 1, '2021-08-03 08:57:23', '2021-08-03 08:57:23');
INSERT INTO `m_config` VALUES (13, 'Live', 'live', NULL, 3, 1, '2021-08-03 08:57:23', '2021-08-03 08:57:23');
INSERT INTO `m_config` VALUES (14, '3D', '3d', NULL, 3, 1, '2021-08-03 08:57:23', '2021-08-03 08:57:23');
INSERT INTO `m_config` VALUES (15, 'VR', 'vr', NULL, 3, 1, '2021-08-03 08:57:23', '2021-08-03 08:57:23');
INSERT INTO `m_config` VALUES (16, 'Dolby', 'dolby', NULL, 3, 1, '2021-08-03 08:57:23', '2021-08-03 08:57:23');
INSERT INTO `m_config` VALUES (17, 'Blu-ray', 'blu-ray', NULL, 3, 1, '2021-08-03 08:57:23', '2021-08-03 08:57:23');
INSERT INTO `m_config` VALUES (18, '720p', '720p', NULL, 4, 1, '2021-08-03 08:57:23', '2021-08-03 08:57:23');
INSERT INTO `m_config` VALUES (19, '1080p', '1080p', NULL, 4, 1, '2021-08-03 08:57:23', '2021-08-03 08:57:23');
INSERT INTO `m_config` VALUES (20, '4k', '4k', NULL, 4, 1, '2021-08-03 08:57:23', '2021-08-03 08:57:23');
INSERT INTO `m_config` VALUES (21, '8k', '8k', NULL, 4, 1, '2021-08-03 08:57:23', '2021-08-03 08:57:23');
INSERT INTO `m_config` VALUES (22, '4k Restoration', '4k restoration', NULL, 4, 1, '2021-08-03 08:57:23', '2021-08-03 08:57:23');
INSERT INTO `m_config` VALUES (23, 'New', 'new', NULL, 5, 1, '2021-08-03 08:57:23', '2021-08-03 08:57:23');
INSERT INTO `m_config` VALUES (24, 'Premiere', 'premiere', NULL, 5, 1, '2021-08-03 08:57:23', '2021-08-03 08:57:23');
INSERT INTO `m_config` VALUES (25, 'Hot', 'hot', NULL, 5, 1, '2021-08-03 08:57:23', '2021-08-03 08:57:23');
INSERT INTO `m_config` VALUES (26, 'Trailor', 'trailor', NULL, 5, 1, '2021-08-03 08:57:23', '2021-08-03 08:57:23');
INSERT INTO `m_config` VALUES (27, 'Collection', 'collection', NULL, 5, 1, '2021-08-03 08:57:23', '2021-08-03 08:57:23');
INSERT INTO `m_config` VALUES (28, 'Coming Soon', 'coming soon', NULL, 5, 1, '2021-08-03 08:57:23', '2021-08-03 08:57:23');
INSERT INTO `m_config` VALUES (29, 'Ranking', 'ranking', NULL, 5, 1, '2021-08-03 08:57:23', '2021-08-03 08:57:23');

-- ----------------------------
-- Table structure for m_cp
-- ----------------------------
DROP TABLE IF EXISTS `m_cp`;
CREATE TABLE `m_cp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'CP编号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'CP名称',
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'CP类型',
  `des` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'CP描述',
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'CP所属国家',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1启用,0禁用',
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `created_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_cpnae_category`(`id`, `name`, `category`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_cp
-- ----------------------------
INSERT INTO `m_cp` VALUES (1, 'Wanted5Games', 'Wanted5Games', 'Wanted5Games', 'US', 1, '2021-08-03 02:13:57', '2021-08-03 10:13:57');
INSERT INTO `m_cp` VALUES (2, 'Forestrygames', 'Forestrygames', 'Forestrygames', 'US', 1, '2020-11-18 07:01:48', '2020-12-21 16:05:19');
INSERT INTO `m_cp` VALUES (4, 'C2 Games', 'C2 Games', 'C2 Games', 'US', 1, '2020-09-22 09:30:18', '2020-12-21 16:04:34');
INSERT INTO `m_cp` VALUES (5, 'Inlogic', 'Plug in Digital', 'Plug in Digital', 'US', 1, '2020-09-27 18:49:28', '2021-06-21 09:37:20');
INSERT INTO `m_cp` VALUES (6, 'Playtouch', 'Playtouch', 'Playtouch', 'US', 1, '2020-10-13 01:49:15', '2020-12-21 16:05:33');
INSERT INTO `m_cp` VALUES (7, 'famobi', 'Gamepix', 'Gamepix', 'US', 1, '2020-11-10 08:44:54', '2021-06-17 05:44:01');
INSERT INTO `m_cp` VALUES (8, 'unicom', 'unicom', '联通', 'CN', 1, '2020-12-24 13:46:15', '2021-06-17 07:07:10');
INSERT INTO `m_cp` VALUES (9, 'gamegiri', 'gamegiri', 'gamegiri', 'CN', 1, '2021-06-17 13:47:57', '2021-06-17 13:47:55');
INSERT INTO `m_cp` VALUES (10, 'marketjs', 'marketjs', 'marketjs', 'CN', 1, '2021-06-17 14:13:24', '2021-06-17 14:13:21');
INSERT INTO `m_cp` VALUES (11, 'yesAuto', 'yesAuto', '汽车之家', 'CN', 1, '2021-06-17 16:13:14', '2021-06-17 16:13:11');
INSERT INTO `m_cp` VALUES (12, 'wangbo', 'wangbo', '网博', 'CN', 1, '2021-06-17 16:13:44', '2021-06-17 16:13:42');
INSERT INTO `m_cp` VALUES (13, 'TG', 'TG', 'TG', 'CN', 1, '2021-06-17 16:14:16', '2021-06-17 16:14:13');
INSERT INTO `m_cp` VALUES (59, 'HuntMobi', 'HuntMobi', 'HuntMobi', 'CN', 1, '2021-06-24 18:54:05', '2021-06-24 18:54:02');
INSERT INTO `m_cp` VALUES (60, 'Xiaoyougame', 'Xiaoyougame', 'Xiaoyougame', 'CN', 1, '2021-07-01 19:40:38', '2021-07-01 19:40:36');
INSERT INTO `m_cp` VALUES (61, 'woloTV', 'woloTV', 'woloTV', 'CN', 1, '2021-07-12 12:08:16', '2021-07-12 05:37:53');
INSERT INTO `m_cp` VALUES (62, 'wo', 'wo', 'wo', 'CN', 1, '2021-07-12 12:08:39', '2021-07-12 05:38:14');

-- ----------------------------
-- Table structure for m_customer
-- ----------------------------
DROP TABLE IF EXISTS `m_customer`;
CREATE TABLE `m_customer`  (
  `id` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `customer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` tinyint(4) NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_customer
-- ----------------------------
INSERT INTO `m_customer` VALUES (1, 'default', 'default', 'default', 1, '2021-02-20 17:12:34', NULL);
INSERT INTO `m_customer` VALUES (2, 'MetaxAR', 'Demo', 'MetaxAR', 1, '2021-03-17 10:04:08', NULL);
INSERT INTO `m_customer` VALUES (3, '137568', 'Xiaomi', '137568', 1, '2021-03-22 06:32:18', NULL);
INSERT INTO `m_customer` VALUES (4, '520678', 'Google', '520678', 1, '2021-03-22 18:06:06', NULL);
INSERT INTO `m_customer` VALUES (5, '416026', 'SQY', '416026', 1, '2021-03-30 21:46:20', NULL);
INSERT INTO `m_customer` VALUES (6, 'v39_s', 'linux_v1', 'v39_s', 1, '2021-05-20 19:39:30', NULL);
INSERT INTO `m_customer` VALUES (7, 'v47_j', 'linux_v1', 'v47_j', 1, '2021-05-20 19:39:55', NULL);
INSERT INTO `m_customer` VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `m_customer` VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `m_customer` VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `m_customer` VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `m_customer` VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `m_customer` VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for m_media_app
-- ----------------------------
DROP TABLE IF EXISTS `m_media_app`;
CREATE TABLE `m_media_app`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目标题',
  `title_sub` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目副标题',
  `updatetime` int(11) NULL DEFAULT 0 COMMENT '节目更新时间',
  `publishtime` int(11) NULL DEFAULT 0 COMMENT '节目发行时间',
  `cp_id` int(11) NULL DEFAULT 0 COMMENT '节目CP名称',
  `score` int(11) NULL DEFAULT 0 COMMENT '节目评分',
  `click_num` int(11) NULL DEFAULT 0 COMMENT '节目点击数',
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目语言',
  `class` smallint(6) NULL DEFAULT 0 COMMENT '节目分类',
  `mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目角标',
  `img_original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目运营图片',
  `img_input` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目录入图片',
  `title_original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目源标题',
  `uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目唯一标识(ID)',
  `sort` int(11) NULL DEFAULT 0 COMMENT '节目排序',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目链接',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目标签',
  `keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目关键字',
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目版权权益区域',
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目分发的国家',
  `item` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目分发的客户项目',
  `expand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '拓展参数',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '状态',
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `created_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_media_app
-- ----------------------------

-- ----------------------------
-- Table structure for m_media_game
-- ----------------------------
DROP TABLE IF EXISTS `m_media_game`;
CREATE TABLE `m_media_game`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目标题',
  `title_sub` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目副标题',
  `updatetime` int(11) NULL DEFAULT 0 COMMENT '节目更新时间',
  `publishtime` int(11) NULL DEFAULT 0 COMMENT '节目发行时间',
  `cp_id` int(11) NULL DEFAULT 0 COMMENT '节目CP名称',
  `score` int(11) NULL DEFAULT 0 COMMENT '节目评分',
  `click_num` int(11) NULL DEFAULT 0 COMMENT '节目点击数',
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目语言',
  `class` smallint(6) NULL DEFAULT 0 COMMENT '节目分类',
  `mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目角标',
  `img_original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目运营图片',
  `img_input` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目录入图片',
  `title_original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目源标题',
  `uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目唯一标识(ID)',
  `sort` int(11) NULL DEFAULT 0 COMMENT '节目排序',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目链接',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目标签',
  `keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目关键字',
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目版权权益区域',
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目分发的国家',
  `item` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目分发的客户项目',
  `expand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '拓展参数',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '状态',
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `created_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_media_game
-- ----------------------------

-- ----------------------------
-- Table structure for m_media_video
-- ----------------------------
DROP TABLE IF EXISTS `m_media_video`;
CREATE TABLE `m_media_video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目标题',
  `title_sub` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目副标题',
  `duration` int(11) NOT NULL DEFAULT 0 COMMENT '节目时长',
  `drama_num` int(11) NOT NULL DEFAULT 0 COMMENT '节目集数',
  `drama_end` tinyint(4) NOT NULL DEFAULT 0 COMMENT '节目剧集状态',
  `updatetime` int(11) NOT NULL COMMENT '节目更新时间',
  `publishtime` int(11) NOT NULL COMMENT '节目发行时间',
  `cp_id` int(11) NOT NULL DEFAULT 0 COMMENT '节目CP名称',
  `score` int(11) NULL DEFAULT 0 COMMENT '节目评分',
  `click_num` int(11) NULL DEFAULT 0 COMMENT '节目点击数',
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '节目语言',
  `class` smallint(6) NOT NULL DEFAULT 0 COMMENT '节目分类',
  `class_sub` smallint(6) NOT NULL DEFAULT 0 COMMENT '节目子分类',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目简介',
  `pay_mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目角标-支付',
  `feature_content_mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目角标-内容特色',
  `clarity_mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目角标-清晰度',
  `operation_mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目角标-运营',
  `img_original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '节目运营图片',
  `img_input` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '节目录入图片',
  `title_original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '节目源标题',
  `uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '节目唯一标识(ID)',
  `sort` int(11) NULL DEFAULT 0 COMMENT '节目排序',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目链接',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目标签',
  `keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目关键字',
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '节目版权权益区域',
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目分发的国家',
  `item_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节目分发的客户项目',
  `expand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '拓展参数',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '状态',
  `updated_at` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `created_at` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_media_video
-- ----------------------------

-- ----------------------------
-- Table structure for m_region
-- ----------------------------
DROP TABLE IF EXISTS `m_region`;
CREATE TABLE `m_region`  (
  `id` int(11) NOT NULL,
  `code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `code3` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name_zh` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1启用,0禁用',
  `created_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_region
-- ----------------------------
INSERT INTO `m_region` VALUES (1, 'AF', 'AFG', 'Afghanistan', ' 阿富汗', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:05');
INSERT INTO `m_region` VALUES (2, 'AX', 'ALA', 'Åland Islands', ' 奥兰', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (3, 'AL', 'ALB', 'Albania', ' 阿尔巴尼亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (4, 'DZ', 'DZA', 'Algeria', ' 阿尔及利亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (5, 'AS', 'ASM', 'American Samoa', ' 美属萨摩亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (6, 'AD', 'AND', 'Andorra', ' 安道尔', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (7, 'AO', 'AGO', 'Angola', ' 安哥拉', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (8, 'AI', 'AIA', 'Anguilla', ' 安圭拉', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (9, 'AQ', 'ATA', 'Antarctica', ' 南极洲', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (10, 'AG', 'ATG', 'Antigua and Barbuda', ' 安提瓜和巴布达', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (11, 'AR', 'ARG', 'Argentina', ' 阿根廷', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (12, 'AM', 'ARM', 'Armenia', ' 亚美尼亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (13, 'AW', 'ABW', 'Aruba', ' 阿鲁巴', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (14, 'AU', 'AUS', 'Australia', ' 澳大利亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (15, 'AT', 'AUT', 'Austria', ' 奥地利', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (16, 'AZ', 'AZE', 'Azerbaijan', ' 阿塞拜疆', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (17, 'BS', 'BHS', 'Bahamas', ' 巴哈马', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (18, 'BH', 'BHR', 'Bahrain', ' 巴林', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (19, 'BD', 'BGD', 'Bangladesh', ' 孟加拉国', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (20, 'BB', 'BRB', 'Barbados', ' 巴巴多斯', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (21, 'BY', 'BLR', 'Belarus', ' 白俄罗斯', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (22, 'BE', 'BEL', 'Belgium', ' 比利时', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (23, 'BZ', 'BLZ', 'Belize', ' 伯利兹', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (24, 'BJ', 'BEN', 'Benin', ' 贝宁', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (25, 'BM', 'BMU', 'Bermuda', ' 百慕大', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (26, 'BT', 'BTN', 'Bhutan', ' 不丹', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (27, 'BO', 'BOL', 'Bolivia (Plurinational State of)', ' 玻利维亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (28, 'BQ', 'BES', 'Bonaire, Sint Eustatius and Saba', ' 荷兰加勒比区', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (29, 'BA', 'BIH', 'Bosnia and Herzegovina', ' 波黑', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (30, 'BW', 'BWA', 'Botswana', ' 博茨瓦纳', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (31, 'BV', 'BVT', 'Bouvet Island', ' 布韦岛', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (32, 'BR', 'BRA', 'Brazil', ' 巴西', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (33, 'IO', 'IOT', 'British Indian Ocean Territory', ' 英属印度洋领地', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (34, 'BN', 'BRN', 'Brunei Darussalam', ' 文莱', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (35, 'BG', 'BGR', 'Bulgaria', ' 保加利亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (36, 'BF', 'BFA', 'Burkina Faso', ' 布基纳法索', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (37, 'BI', 'BDI', 'Burundi', ' 布隆迪', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (38, 'CV', 'CPV', 'Cabo Verde', ' 佛得角', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (39, 'KH', 'KHM', 'Cambodia', ' 柬埔寨', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (40, 'CM', 'CMR', 'Cameroon', ' 喀麦隆', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (41, 'CA', 'CAN', 'Canada', ' 加拿大', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (42, 'KY', 'CYM', 'Cayman Islands', ' 开曼群岛', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (43, 'CF', 'CAF', 'Central African Republic', ' 中非', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (44, 'TD', 'TCD', 'Chad', ' 乍得', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (45, 'CL', 'CHL', 'Chile', ' 智利', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (46, 'CN', 'CHN', 'China', ' 中国', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (47, 'CX', 'CXR', 'Christmas Island', ' 圣诞岛', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (48, 'CC', 'CCK', 'Cocos (Keeling) Islands', ' 科科斯（基林）群岛', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:48');
INSERT INTO `m_region` VALUES (49, 'CO', 'COL', 'Colombia', ' 哥伦比亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:49');
INSERT INTO `m_region` VALUES (50, 'KM', 'COM', 'Comoros', ' 科摩罗', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:49');
INSERT INTO `m_region` VALUES (51, 'CG', 'COG', 'Congo', ' 刚果共和国', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:49');
INSERT INTO `m_region` VALUES (52, 'CD', 'COD', 'Congo (Democratic Republic of the)', ' 刚果民主共和国', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:49');
INSERT INTO `m_region` VALUES (53, 'CK', 'COK', 'Cook Islands', ' 库克群岛', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:49');
INSERT INTO `m_region` VALUES (54, 'CR', 'CRI', 'Costa Rica', ' 哥斯达黎加', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:49');
INSERT INTO `m_region` VALUES (55, 'CI', 'CIV', 'Côte d\'Ivoire', ' 科特迪瓦', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:49');
INSERT INTO `m_region` VALUES (56, 'HR', 'HRV', 'Croatia', ' 克罗地亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:49');
INSERT INTO `m_region` VALUES (57, 'CU', 'CUB', 'Cuba', ' 古巴', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:49');
INSERT INTO `m_region` VALUES (58, 'CW', 'CUW', 'Curaçao', ' 库拉索', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:49');
INSERT INTO `m_region` VALUES (59, 'CY', 'CYP', 'Cyprus', ' 塞浦路斯', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:49');
INSERT INTO `m_region` VALUES (60, 'CZ', 'CZE', 'Czechia', ' 捷克', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:49');
INSERT INTO `m_region` VALUES (61, 'DK', 'DNK', 'Denmark', ' 丹麦', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:49');
INSERT INTO `m_region` VALUES (62, 'DJ', 'DJI', 'Djibouti', ' 吉布提', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:49');
INSERT INTO `m_region` VALUES (63, 'DM', 'DMA', 'Dominica', ' 多米尼克', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:49');
INSERT INTO `m_region` VALUES (64, 'DO', 'DOM', 'Dominican Republic', ' 多米尼加', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:49');
INSERT INTO `m_region` VALUES (65, 'EC', 'ECU', 'Ecuador', ' 厄瓜多尔', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:49');
INSERT INTO `m_region` VALUES (66, 'EG', 'EGY', 'Egypt', ' 埃及', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:49');
INSERT INTO `m_region` VALUES (67, 'SV', 'SLV', 'El Salvador', ' 萨尔瓦多', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:49');
INSERT INTO `m_region` VALUES (68, 'GQ', 'GNQ', 'Equatorial Guinea', ' 赤道几内亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:49');
INSERT INTO `m_region` VALUES (69, 'ER', 'ERI', 'Eritrea', ' 厄立特里亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:49');
INSERT INTO `m_region` VALUES (70, 'EE', 'EST', 'Estonia', ' 爱沙尼亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:49');
INSERT INTO `m_region` VALUES (71, 'SZ', 'SWZ', 'Eswatini', ' 斯威士兰', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:49');
INSERT INTO `m_region` VALUES (72, 'ET', 'ETH', 'Ethiopia', ' 埃塞俄比亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:49');
INSERT INTO `m_region` VALUES (73, 'FK', 'FLK', 'Falkland Islands (Malvinas)', ' 福克兰群岛', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (74, 'FO', 'FRO', 'Faroe Islands', ' 法罗群岛', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (75, 'FJ', 'FJI', 'Fiji', ' 斐济', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (76, 'FI', 'FIN', 'Finland', ' 芬兰', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (77, 'FR', 'FRA', 'France', ' 法国', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (78, 'GF', 'GUF', 'French Guiana', ' 法属圭亚那', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (79, 'PF', 'PYF', 'French Polynesia', ' 法属波利尼西亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (80, 'TF', 'ATF', 'French Southern Territories', ' 法属南部和南极领地', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (81, 'GA', 'GAB', 'Gabon', ' 加蓬', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (82, 'GM', 'GMB', 'Gambia', ' 冈比亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (83, 'GE', 'GEO', 'Georgia', ' 格鲁吉亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (84, 'DE', 'DEU', 'Germany', ' 德国', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (85, 'GH', 'GHA', 'Ghana', ' 加纳', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (86, 'GI', 'GIB', 'Gibraltar', ' 直布罗陀', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (87, 'GR', 'GRC', 'Greece', ' 希腊', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (88, 'GL', 'GRL', 'Greenland', ' 格陵兰', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (89, 'GD', 'GRD', 'Grenada', ' 格林纳达', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (90, 'GP', 'GLP', 'Guadeloupe', ' 瓜德罗普', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (91, 'GU', 'GUM', 'Guam', ' 关岛', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (92, 'GT', 'GTM', 'Guatemala', ' 危地马拉', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (93, 'GG', 'GGY', 'Guernsey', ' 根西', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (94, 'GN', 'GIN', 'Guinea', ' 几内亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (95, 'GW', 'GNB', 'Guinea-Bissau', ' 几内亚比绍', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (96, 'GY', 'GUY', 'Guyana', ' 圭亚那', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (97, 'HT', 'HTI', 'Haiti', ' 海地', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (98, 'HM', 'HMD', 'Heard Island and McDonald Islands', ' 赫德岛和麦克唐纳群岛', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (99, 'VA', 'VAT', 'Holy See', ' 梵蒂冈', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (100, 'HN', 'HND', 'Honduras', ' 洪都拉斯', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (101, 'HK', 'HKG', 'Hong Kong', ' 香港', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (102, 'HU', 'HUN', 'Hungary', ' 匈牙利', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (103, 'IS', 'ISL', 'Iceland', ' 冰岛', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (104, 'IN', 'IND', 'India', ' 印度', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (105, 'ID', 'IDN', 'Indonesia', ' 印尼', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (106, 'IR', 'IRN', 'Iran (Islamic Republic of)', ' 伊朗', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (107, 'IQ', 'IRQ', 'Iraq', ' 伊拉克', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (108, 'IE', 'IRL', 'Ireland', ' 爱尔兰', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (109, 'IM', 'IMN', 'Isle of Man', ' 马恩岛', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (110, 'IL', 'ISR', 'Israel', ' 以色列', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (111, 'IT', 'ITA', 'Italy', ' 意大利', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (112, 'JM', 'JAM', 'Jamaica', ' 牙买加', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (113, 'JP', 'JPN', 'Japan', ' 日本', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (114, 'JE', 'JEY', 'Jersey', ' 泽西', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:50');
INSERT INTO `m_region` VALUES (115, 'JO', 'JOR', 'Jordan', ' 约旦', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (116, 'KZ', 'KAZ', 'Kazakhstan', ' 哈萨克斯坦', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (117, 'KE', 'KEN', 'Kenya', ' 肯尼亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (118, 'KI', 'KIR', 'Kiribati', ' 基里巴斯', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (119, 'KP', 'PRK', 'Korea (Democratic People\'s Republic of)', ' 朝鲜', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (120, 'KR', 'KOR', 'Korea (Republic of)', ' 韩国', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (121, 'KW', 'KWT', 'Kuwait', ' 科威特', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (122, 'KG', 'KGZ', 'Kyrgyzstan', ' 吉尔吉斯斯坦', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (123, 'LA', 'LAO', 'Lao People\'s Democratic Republic', ' 老挝', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (124, 'LV', 'LVA', 'Latvia', ' 拉脱维亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (125, 'LB', 'LBN', 'Lebanon', ' 黎巴嫩', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (126, 'LS', 'LSO', 'Lesotho', ' 莱索托', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (127, 'LR', 'LBR', 'Liberia', ' 利比里亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (128, 'LY', 'LBY', 'Libya', ' 利比亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (129, 'LI', 'LIE', 'Liechtenstein', ' 列支敦士登', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (130, 'LT', 'LTU', 'Lithuania', ' 立陶宛', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (131, 'LU', 'LUX', 'Luxembourg', ' 卢森堡', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (132, 'MO', 'MAC', 'Macao', ' 澳门', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (133, 'MG', 'MDG', 'Madagascar', ' 马达加斯加', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (134, 'MW', 'MWI', 'Malawi', ' 马拉维', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (135, 'MY', 'MYS', 'Malaysia', ' 马来西亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (136, 'MV', 'MDV', 'Maldives', ' 马尔代夫', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (137, 'ML', 'MLI', 'Mali', ' 马里', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (138, 'MT', 'MLT', 'Malta', ' 马耳他', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (139, 'MH', 'MHL', 'Marshall Islands', ' 马绍尔群岛', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (140, 'MQ', 'MTQ', 'Martinique', ' 马提尼克', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (141, 'MR', 'MRT', 'Mauritania', ' 毛里塔尼亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (142, 'MU', 'MUS', 'Mauritius', ' 毛里求斯', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (143, 'YT', 'MYT', 'Mayotte', ' 马约特', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (144, 'MX', 'MEX', 'Mexico', ' 墨西哥', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (145, 'FM', 'FSM', 'Micronesia (Federated States of)', ' 密克罗尼西亚联邦', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (146, 'MD', 'MDA', 'Moldova (Republic of)', ' 摩尔多瓦', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (147, 'MC', 'MCO', 'Monaco', ' 摩纳哥', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (148, 'MN', 'MNG', 'Mongolia', ' 蒙古', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (149, 'ME', 'MNE', 'Montenegro', ' 黑山', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (150, 'MS', 'MSR', 'Montserrat', ' 蒙特塞拉特', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (151, 'MA', 'MAR', 'Morocco', ' 摩洛哥', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (152, 'MZ', 'MOZ', 'Mozambique', ' 莫桑比克', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (153, 'MM', 'MMR', 'Myanmar', ' 缅甸', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (154, 'NA', 'NAM', 'Namibia', ' 纳米比亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (155, 'NR', 'NRU', 'Nauru', ' 瑙鲁', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (156, 'NP', 'NPL', 'Nepal', ' 尼泊尔', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (157, 'NL', 'NLD', 'Netherlands', ' 荷兰', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (158, 'NC', 'NCL', 'New Caledonia', ' 新喀里多尼亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (159, 'NZ', 'NZL', 'New Zealand', ' 新西兰', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (160, 'NI', 'NIC', 'Nicaragua', ' 尼加拉瓜', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (161, 'NE', 'NER', 'Niger', ' 尼日尔', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (162, 'NG', 'NGA', 'Nigeria', ' 尼日利亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (163, 'NU', 'NIU', 'Niue', ' 纽埃', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (164, 'NF', 'NFK', 'Norfolk Island', ' 诺福克岛', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (165, 'MK', 'MKD', 'North Macedonia', ' 北马其顿', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (166, 'MP', 'MNP', 'Northern Mariana Islands', ' 北马里亚纳群岛', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (167, 'NO', 'NOR', 'Norway', ' 挪威', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (168, 'OM', 'OMN', 'Oman', ' 阿曼', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (169, 'PK', 'PAK', 'Pakistan', ' 巴基斯坦', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (170, 'PW', 'PLW', 'Palau', ' 帕劳', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (171, 'PS', 'PSE', 'Palestine, State of', ' 巴勒斯坦', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (172, 'PA', 'PAN', 'Panama', ' 巴拿马', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (173, 'PG', 'PNG', 'Papua New Guinea', ' 巴布亚新几内亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (174, 'PY', 'PRY', 'Paraguay', ' 巴拉圭', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (175, 'PE', 'PER', 'Peru', ' 秘鲁', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (176, 'PH', 'PHL', 'Philippines', ' 菲律宾', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (177, 'PN', 'PCN', 'Pitcairn', ' 皮特凯恩群岛', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (178, 'PL', 'POL', 'Poland', ' 波兰', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (179, 'PT', 'PRT', 'Portugal', ' 葡萄牙', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (180, 'PR', 'PRI', 'Puerto Rico', ' 波多黎各', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (181, 'QA', 'QAT', 'Qatar', ' 卡塔尔', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (182, 'RE', 'REU', 'Réunion', ' 留尼汪', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (183, 'RO', 'ROU', 'Romania', ' 罗马尼亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (184, 'RU', 'RUS', 'Russian Federation', ' 俄罗斯', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (185, 'RW', 'RWA', 'Rwanda', ' 卢旺达', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (186, 'BL', 'BLM', 'Saint Barthélemy', ' 圣巴泰勒米', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (187, 'SH', 'SHN', 'Saint Helena, Ascension and Tristan da Cunha', ' 圣赫勒拿、阿森松和特里斯坦-达库尼亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (188, 'KN', 'KNA', 'Saint Kitts and Nevis', ' 圣基茨和尼维斯', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (189, 'LC', 'LCA', 'Saint Lucia', ' 圣卢西亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (190, 'MF', 'MAF', 'Saint Martin (French part)', ' 法属圣马丁', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:51');
INSERT INTO `m_region` VALUES (191, 'PM', 'SPM', 'Saint Pierre and Miquelon', ' 圣皮埃尔和密克隆', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (192, 'VC', 'VCT', 'Saint Vincent and the Grenadines', ' 圣文森特和格林纳丁斯', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (193, 'WS', 'WSM', 'Samoa', ' 萨摩亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (194, 'SM', 'SMR', 'San Marino', ' 圣马力诺', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (195, 'ST', 'STP', 'Sao Tome and Principe', ' 圣多美和普林西比', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (196, 'SA', 'SAU', 'Saudi Arabia', ' 沙特阿拉伯', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (197, 'SN', 'SEN', 'Senegal', ' 塞内加尔', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (198, 'RS', 'SRB', 'Serbia', ' 塞尔维亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (199, 'SC', 'SYC', 'Seychelles', ' 塞舌尔', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (200, 'SL', 'SLE', 'Sierra Leone', ' 塞拉利昂', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (201, 'SG', 'SGP', 'Singapore', ' 新加坡', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (202, 'SX', 'SXM', 'Sint Maarten (Dutch part)', ' 荷属圣马丁', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (203, 'SK', 'SVK', 'Slovakia', ' 斯洛伐克', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (204, 'SI', 'SVN', 'Slovenia', ' 斯洛文尼亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (205, 'SB', 'SLB', 'Solomon Islands', ' 所罗门群岛', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (206, 'SO', 'SOM', 'Somalia', ' 索马里', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (207, 'ZA', 'ZAF', 'South Africa', ' 南非', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (208, 'GS', 'SGS', 'South Georgia and the South Sandwich Islands', ' 南乔治亚和南桑威奇群岛', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (209, 'SS', 'SSD', 'South Sudan', ' 南苏丹', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (210, 'ES', 'ESP', 'Spain', ' 西班牙', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (211, 'LK', 'LKA', 'Sri Lanka', ' 斯里兰卡', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (212, 'SD', 'SDN', 'Sudan', ' 苏丹', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (213, 'SR', 'SUR', 'Suriname', ' 苏里南', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (214, 'SJ', 'SJM', 'Svalbard and Jan Mayen', ' 斯瓦尔巴和扬马延', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (215, 'SE', 'SWE', 'Sweden', ' 瑞典', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (216, 'CH', 'CHE', 'Switzerland', ' 瑞士', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (217, 'SY', 'SYR', 'Syrian Arab Republic', ' 叙利亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (218, 'TW', 'TWN', 'Taiwan, Province of China', ' 中国台湾省', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (219, 'TJ', 'TJK', 'Tajikistan', ' 塔吉克斯坦', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (220, 'TZ', 'TZA', 'Tanzania, United Republic of', ' 坦桑尼亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (221, 'TH', 'THA', 'Thailand', ' 泰国', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (222, 'TL', 'TLS', 'Timor-Leste', ' 东帝汶', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (223, 'TG', 'TGO', 'Togo', ' 多哥', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (224, 'TK', 'TKL', 'Tokelau', ' 托克劳', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (225, 'TO', 'TON', 'Tonga', ' 汤加', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (226, 'TT', 'TTO', 'Trinidad and Tobago', ' 特立尼达和多巴哥', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (227, 'TN', 'TUN', 'Tunisia', ' 突尼斯', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (228, 'TR', 'TUR', 'Turkey', ' 土耳其', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (229, 'TM', 'TKM', 'Turkmenistan', ' 土库曼斯坦', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (230, 'TC', 'TCA', 'Turks and Caicos Islands', ' 特克斯和凯科斯群岛', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (231, 'TV', 'TUV', 'Tuvalu', ' 图瓦卢', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (232, 'UG', 'UGA', 'Uganda', ' 乌干达', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (233, 'UA', 'UKR', 'Ukraine', ' 乌克兰', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (234, 'AE', 'ARE', 'United Arab Emirates', ' 阿联酋', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (235, 'GB', 'GBR', 'United Kingdom of Great Britain and Northern Ireland', ' 英国', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (236, 'UM', 'UMI', 'United States Minor Outlying Islands', ' 美国本土外小岛屿', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (237, 'US', 'USA', 'United States of America', ' 美国', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (238, 'UY', 'URY', 'Uruguay', ' 乌拉圭', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (239, 'UZ', 'UZB', 'Uzbekistan', ' 乌兹别克斯坦', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (240, 'VU', 'VUT', 'Vanuatu', ' 瓦努阿图', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (241, 'VE', 'VEN', 'Venezuela (Bolivarian Republic of)', ' 委内瑞拉', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (242, 'VN', 'VNM', 'Viet Nam', ' 越南', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (243, 'VG', 'VGB', 'Virgin Islands (British)', ' 英属维尔京群岛', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (244, 'VI', 'VIR', 'Virgin Islands (U.S.)', ' 美属维尔京群岛', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (245, 'WF', 'WLF', 'Wallis and Futuna', ' 瓦利斯和富图纳', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (246, 'EH', 'ESH', 'Western Sahara', ' 西撒哈拉', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (247, 'YE', 'YEM', 'Yemen', ' 也门', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (248, 'ZM', 'ZMB', 'Zambia', ' 赞比亚', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');
INSERT INTO `m_region` VALUES (249, 'ZW', 'ZWE', 'Zimbabwe', ' 津巴布韦', 1, '2021-08-03 12:05:00', '2021-08-03 12:05:52');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `migrations` VALUES (4, '2019_08_19_000000_create_failed_jobs_table', 1);

-- ----------------------------
-- Table structure for password
-- ----------------------------
DROP TABLE IF EXISTS `password`;
CREATE TABLE `password`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '11', '11@qq.com', NULL, '123465', NULL, '2021-07-29 16:02:24', '2021-07-29 16:02:27');
INSERT INTO `users` VALUES (2, 'junqian.li', 'junqian.li@metaxsoft.com', NULL, '$2y$10$NqTG5pcbtaimvm8UA4qkM.kkqjfW4MW.kqxr.xEPb5S437vCey26q', 'CZkMMno1RwIPgeryoZ53tqbduN4dZHuDuyhp4vjJbIjw0YWV12UL8oCxWZYI', '2021-07-30 08:34:40', '2021-07-30 08:34:40');

SET FOREIGN_KEY_CHECKS = 1;
