/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : shixun

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 28/04/2023 11:57:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `addid` int(11) NOT NULL AUTO_INCREMENT COMMENT '地址编号',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户编号',
  `provid` int(11) NULL DEFAULT NULL COMMENT '省id',
  `cityid` int(11) NULL DEFAULT NULL COMMENT '市id',
  `areaid` int(11) NULL DEFAULT NULL COMMENT '区id',
  `addrinfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `isdefalut` int(11) NULL DEFAULT 0 COMMENT '是否默认地址',
  `getpeople` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人电',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `is_deleted` int(1) NULL DEFAULT 0,
  PRIMARY KEY (`addid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, 1, 1, 1, 2, '小区一号', 1, '貂蝉', '13174889055', NULL, NULL, 0);
INSERT INTO `address` VALUES (3, 2, 1, 1, 1, '小区二号', 1, '貂蝉', '13174889055', NULL, NULL, 0);
INSERT INTO `address` VALUES (16, 1, 3, 3, 6, '小区三号', 0, '貂蝉', '13174889055', NULL, NULL, 0);
INSERT INTO `address` VALUES (29, 29, 2, 2, 4, '小区四号', 1, '貂蝉', '13174889055', NULL, NULL, 0);
INSERT INTO `address` VALUES (30, 29, 1, 1, 1, '3.22', 0, '3.22', '3.22', '2023-03-22 15:55:24', '2023-03-22 15:55:24', 0);
INSERT INTO `address` VALUES (31, 31, 1, 1, 1, '2222222222222222222', 1, '22222', '22222', '2023-03-23 16:10:23', '2023-03-23 16:10:23', 0);
INSERT INTO `address` VALUES (32, 32, 2, 2, 2, '333', 1, '333', '333', '2023-03-23 17:51:00', '2023-03-23 17:51:00', 0);
INSERT INTO `address` VALUES (33, 33, 1, 1, 1, '444444', 1, '44444', '444', '2023-03-23 17:55:27', '2023-03-23 17:55:27', 0);
INSERT INTO `address` VALUES (34, 35, 1, 1, 1, '11', 1, '张严解', '17695461014', '2023-03-23 18:17:29', '2023-03-23 18:17:29', 0);
INSERT INTO `address` VALUES (35, 36, 1, 1, 1, '于家堡 1111', 1, '张苏苏', '17695461014', '2023-03-23 18:36:07', '2023-03-23 18:36:07', 0);
INSERT INTO `address` VALUES (36, 37, 1, 1, 1, '天津外国语大学 文学院 ', 1, '张严杰', '17695461014', '2023-03-24 13:32:33', '2023-03-24 13:32:33', 0);
INSERT INTO `address` VALUES (37, 38, 1, 1, 1, '嗷嗷', 1, '啊啊啊啊啊啊', '4324233244', '2023-03-24 13:46:26', '2023-03-24 13:46:26', 0);
INSERT INTO `address` VALUES (38, 40, 1, 1, 1, '大学软件学院', 1, '张严杰', '17695461014', '2023-03-24 15:21:39', '2023-03-24 15:21:39', 0);

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '身份证号',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '状态 0:禁用，1:正常',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建人',
  `update_user` bigint(20) NOT NULL COMMENT '修改人',
  `is_deleted` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '17695461014', '1', '110101199001010047', 1, '2021-05-06 17:20:07', '2022-06-03 11:50:08', 1, 1, NULL);
INSERT INTO `admin` VALUES (2, '张三三啊啊', 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '13174889053', '1', '111222333444555666', 1, '2022-06-26 20:13:42', '2022-06-30 20:43:24', 1, 1, NULL);

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area`  (
  `areaid` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区名称',
  `cityid` int(11) NULL DEFAULT NULL COMMENT '市外键',
  PRIMARY KEY (`areaid`) USING BTREE,
  INDEX `cid`(`cityid`) USING BTREE,
  CONSTRAINT `area_ibfk_1` FOREIGN KEY (`cityid`) REFERENCES `city` (`cityid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11111 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES (1, '滨海新区', 1);
INSERT INTO `area` VALUES (2, '西青区', 1);
INSERT INTO `area` VALUES (3, '红桥区', 1);
INSERT INTO `area` VALUES (4, '朝阳区', 2);
INSERT INTO `area` VALUES (5, '海港区', 3);
INSERT INTO `area` VALUES (6, '北戴河区', 3);
INSERT INTO `area` VALUES (7, '路南区', 4);
INSERT INTO `area` VALUES (8, '广阳区', 5);
INSERT INTO `area` VALUES (9, '平成区', 6);
INSERT INTO `area` VALUES (10, '历下区', 7);
INSERT INTO `area` VALUES (11, '潍城区', 8);
INSERT INTO `area` VALUES (12, '海淀区', 2);

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city`  (
  `cityid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市名称',
  `provid` int(11) NULL DEFAULT NULL COMMENT '省的外键',
  PRIMARY KEY (`cityid`) USING BTREE,
  INDEX `pid`(`provid`) USING BTREE,
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`provid`) REFERENCES `province` (`provid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES (1, '天津市', 1);
INSERT INTO `city` VALUES (2, '北京市', 2);
INSERT INTO `city` VALUES (3, '秦皇岛市', 3);
INSERT INTO `city` VALUES (4, '唐山市', 3);
INSERT INTO `city` VALUES (5, '廊坊市', 3);
INSERT INTO `city` VALUES (6, '大同市', 4);
INSERT INTO `city` VALUES (7, '济南', 5);
INSERT INTO `city` VALUES (8, '潍坊', 5);

-- ----------------------------
-- Table structure for logcompany
-- ----------------------------
DROP TABLE IF EXISTS `logcompany`;
CREATE TABLE `logcompany`  (
  `logcompany_id` int(11) NOT NULL COMMENT '物流分配ID',
  `logcompany_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`logcompany_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of logcompany
-- ----------------------------
INSERT INTO `logcompany` VALUES (1, '顺丰');
INSERT INTO `logcompany` VALUES (2, '韵达');
INSERT INTO `logcompany` VALUES (3, '申通');
INSERT INTO `logcompany` VALUES (4, '德邦');
INSERT INTO `logcompany` VALUES (5, '极兔');
INSERT INTO `logcompany` VALUES (6, '京东物流');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品名',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `oid` bigint(20) NOT NULL COMMENT '订单id',
  `number` int(11) NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `is_deleted` int(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 125 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (55, '丝芙兰唇膏', '/picture/3-7.jpg', 1544858146818756609, 1, 99.00, NULL, NULL, 0);
INSERT INTO `order_detail` VALUES (56, '纪梵希面膜', '/picture/4-4.jpg', 1544858146818756609, 1, 3000.00, NULL, NULL, 0);
INSERT INTO `order_detail` VALUES (57, '理肤泉保湿霜', '/picture/2-20.png', 1544861681081937922, 1, 300.00, NULL, NULL, 0);
INSERT INTO `order_detail` VALUES (58, '珂润洁面', '/picture/6-15.png', 1544861681081937922, 1, 108.00, NULL, NULL, 0);
INSERT INTO `order_detail` VALUES (59, 'NASA腮红', '/picture/5-11.png', 1544878458948055041, 1, 300.00, NULL, NULL, 0);
INSERT INTO `order_detail` VALUES (60, '理肤泉保湿霜', '/picture/2-20.png', 1545077639625048066, 1, 300.00, NULL, NULL, 0);
INSERT INTO `order_detail` VALUES (61, '纪梵希面膜', '/picture/4-4.jpg', 1545077639625048066, 1, 3000.00, NULL, NULL, 0);
INSERT INTO `order_detail` VALUES (62, '德妃紫苏洁面', '/picture/6-14.png', 1545090656379174914, 1, 89.00, NULL, NULL, 0);
INSERT INTO `order_detail` VALUES (63, 'TOM FORD腮红', '/picture/5-10.png', 1545090656379174914, 1, 50.00, NULL, NULL, 0);
INSERT INTO `order_detail` VALUES (76, '德妃紫苏洁面', '/picture/6-14.png', 1545091327132270594, 1, 89.00, NULL, NULL, 0);
INSERT INTO `order_detail` VALUES (77, '理肤泉保湿霜', '/picture/2-20.png', 1545091327132270594, 1, 300.00, NULL, NULL, 0);
INSERT INTO `order_detail` VALUES (79, '纪梵希黑吧', '/picture/2-2.jpg', 12345678901234, 4, 3000.00, NULL, NULL, 0);
INSERT INTO `order_detail` VALUES (84, '丝芙兰唇膏', '/picture/3-7.jpg', 1545091327132270597, 5, 495.00, '2023-03-23 04:10:39', '2023-03-23 04:10:39', 0);
INSERT INTO `order_detail` VALUES (85, 'NASA腮红', '/picture/5-11.png', 1545091327132270597, 4, 1200.00, '2023-03-23 04:10:39', '2023-03-23 04:10:39', 0);
INSERT INTO `order_detail` VALUES (86, '丝芙兰唇膏', '/picture/3-7.jpg', 1545091327132270598, 5, 495.00, '2023-03-23 04:51:09', '2023-03-23 04:51:09', 0);
INSERT INTO `order_detail` VALUES (87, 'NASA腮红', '/picture/5-11.png', 1545091327132270598, 4, 1200.00, '2023-03-23 04:51:09', '2023-03-23 04:51:09', 0);
INSERT INTO `order_detail` VALUES (88, '丝芙兰唇膏', '/picture/3-7.jpg', 1545091327132270599, 5, 495.00, '2023-03-23 04:56:59', '2023-03-23 04:56:59', 0);
INSERT INTO `order_detail` VALUES (89, 'NASA腮红', '/picture/5-11.png', 1545091327132270599, 4, 1200.00, '2023-03-23 04:56:59', '2023-03-23 04:56:59', 0);
INSERT INTO `order_detail` VALUES (96, '丝芙兰唇膏', '/picture/3-7.jpg', 1545091327132270600, 5, 495.00, NULL, NULL, 0);
INSERT INTO `order_detail` VALUES (97, 'NASA腮红', '/picture/5-11.png', 1545091327132270600, 4, 1200.00, NULL, NULL, 0);
INSERT INTO `order_detail` VALUES (98, '纪梵希精华乳液', '/picture/4-8.jpg', 1545091327132270601, 1, 1350.00, '2023-03-23 16:19:49', '2023-03-23 16:19:49', 0);
INSERT INTO `order_detail` VALUES (99, '纪梵希精华乳液', '/picture/4-8.jpg', 1545091327132270602, 1, 1350.00, '2023-03-23 17:42:39', '2023-03-23 17:42:39', 0);
INSERT INTO `order_detail` VALUES (100, '丝芙兰唇膏', '/picture/3-7.jpg', 1545091327132270603, 4, 396.00, '2023-03-23 17:51:10', '2023-03-23 17:51:10', 0);
INSERT INTO `order_detail` VALUES (101, '纪梵希精华乳液', '/picture/4-8.jpg', 1545091327132270603, 4, 5400.00, '2023-03-23 17:51:10', '2023-03-23 17:51:10', 0);
INSERT INTO `order_detail` VALUES (108, '黑暗', '/picture/3087f3f1-0d37-4a2c-b242-87c35ddb7504.png', 1545091327132270604, 14, 1386.00, NULL, NULL, 0);
INSERT INTO `order_detail` VALUES (109, '纪梵希精华乳液', '/picture/4-8.jpg', 1545091327132270605, 3, 4050.00, NULL, NULL, 0);
INSERT INTO `order_detail` VALUES (110, '丝芙兰唇膏', '/picture/3-7.jpg', 1545091327132270605, 4, 396.00, NULL, NULL, 0);
INSERT INTO `order_detail` VALUES (113, '丝芙兰唇膏', '/picture/3-7.jpg', 1545091327132270606, 3, 297.00, NULL, NULL, 0);
INSERT INTO `order_detail` VALUES (114, '德妃紫苏洁面', '/picture/6-14.png', 1545091327132270606, 4, 356.00, NULL, NULL, 0);
INSERT INTO `order_detail` VALUES (115, '妮维雅凝胶霜', '/picture/317e3cfb-935d-40e7-b319-cd3b2237ae8c.png', 1545091327132270607, 2, 0.02, '2023-03-24 13:42:12', '2023-03-24 13:42:12', 0);
INSERT INTO `order_detail` VALUES (116, 'TOM FORD腮红', '/picture/5-10.png', 1545091327132270607, 5, 2.50, '2023-03-24 13:42:12', '2023-03-24 13:42:12', 0);
INSERT INTO `order_detail` VALUES (117, 'TOM FORD腮红', '/picture/5-10.png', 1545091327132270608, 1, 0.50, '2023-03-24 13:46:32', '2023-03-24 13:46:32', 0);
INSERT INTO `order_detail` VALUES (118, '珂润洁面', '/picture/6-15.png', 1545091327132270608, 2, 216.00, '2023-03-24 13:46:32', '2023-03-24 13:46:32', 0);
INSERT INTO `order_detail` VALUES (119, '纪梵希精华乳液', '/picture/4-8.jpg', 1545091327132270609, 1, 1350.00, '2023-03-24 13:49:14', '2023-03-24 13:49:14', 0);
INSERT INTO `order_detail` VALUES (120, '纪梵希精华乳液', '/picture/4-8.jpg', 1545091327132270610, 1, 1350.00, '2023-03-24 13:52:14', '2023-03-24 13:52:14', 0);
INSERT INTO `order_detail` VALUES (121, '纪梵希精华乳液', '/picture/4-8.jpg', 1545091327132270611, 1, 1350.00, '2023-03-24 13:56:05', '2023-03-24 13:56:05', 0);
INSERT INTO `order_detail` VALUES (122, '毕设演示1', '/picture/a845bd8d-6635-45cc-9b55-5354f5ebdf71.webp', 1545091327132270612, 6, 594.00, '2023-03-24 14:08:25', '2023-03-24 14:08:25', 0);
INSERT INTO `order_detail` VALUES (123, '丝芙兰唇膏', '/picture/3-7.jpg', 1545091327132270613, 1, 99.00, '2023-03-24 14:51:18', '2023-03-24 14:51:18', 0);
INSERT INTO `order_detail` VALUES (125, '毕设演示2', '/picture/3024797d-80c3-4c7f-b7f1-6c3ab799c0a1.jpg', 1545091327132270614, 3, 2997.00, NULL, NULL, 0);

-- ----------------------------
-- Table structure for order_log
-- ----------------------------
DROP TABLE IF EXISTS `order_log`;
CREATE TABLE `order_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logid` bigint(11) NOT NULL COMMENT '物流编号',
  `oid` bigint(10) NULL DEFAULT NULL COMMENT '订单编号',
  `logcompany_id` int(255) NULL DEFAULT NULL COMMENT '物流分类',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `is_deleted` int(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_log
-- ----------------------------
INSERT INTO `order_log` VALUES (29, 1544858146818756610, 1544858146818756609, 1, NULL, NULL, 0);
INSERT INTO `order_log` VALUES (30, 1544861681081937923, 1544861681081937922, 1, NULL, NULL, 0);
INSERT INTO `order_log` VALUES (31, 1544878458948055042, 1544878458948055041, 1, NULL, NULL, 0);
INSERT INTO `order_log` VALUES (32, 1545077639625048067, 1545077639625048066, 1, NULL, NULL, 0);
INSERT INTO `order_log` VALUES (33, 1545090656379174915, 1545090656379174914, 1, NULL, NULL, 0);
INSERT INTO `order_log` VALUES (41, 1545091327432432, 1545091327132270594, 4, NULL, NULL, 0);
INSERT INTO `order_log` VALUES (43, 1543522223535, 12345678901234, 4, NULL, NULL, 0);
INSERT INTO `order_log` VALUES (45, 8326975329515728896, 1545091327132270597, 1, '2023-03-23 04:10:40', '2023-03-23 04:10:40', 0);
INSERT INTO `order_log` VALUES (46, 8326985522553155584, 1545091327132270598, 1, '2023-03-23 04:51:10', '2023-03-23 04:51:10', 0);
INSERT INTO `order_log` VALUES (47, 8326986988575125504, 1545091327132270599, 1, '2023-03-23 04:56:59', '2023-03-23 04:56:59', 0);
INSERT INTO `order_log` VALUES (51, 8326988000205598720, 1545091327132270600, 1, NULL, NULL, 0);
INSERT INTO `order_log` VALUES (52, 8327158829380915200, 1545091327132270601, 1, '2023-03-23 16:19:49', '2023-03-23 16:19:49', 0);
INSERT INTO `order_log` VALUES (53, 8327179675754418176, 1545091327132270602, 1, '2023-03-23 17:42:39', '2023-03-23 17:42:39', 0);
INSERT INTO `order_log` VALUES (54, 8327181818996576256, 1545091327132270603, 1, '2023-03-23 17:51:10', '2023-03-23 17:51:10', 0);
INSERT INTO `order_log` VALUES (60, 8327182942914859008, 1545091327132270604, 1, NULL, NULL, 0);
INSERT INTO `order_log` VALUES (61, 8327188552336658432, 1545091327132270605, 1, NULL, NULL, 0);
INSERT INTO `order_log` VALUES (63, 8327193218395000832, 1545091327132270606, 1, NULL, NULL, 0);
INSERT INTO `order_log` VALUES (64, 8327481554256392192, 1545091327132270607, 1, '2023-03-24 13:42:13', '2023-03-24 13:42:13', 0);
INSERT INTO `order_log` VALUES (65, 8327482641004752896, 1545091327132270608, 1, '2023-03-24 13:46:32', '2023-03-24 13:46:32', 0);
INSERT INTO `order_log` VALUES (66, 8327483321035124736, 1545091327132270609, 1, '2023-03-24 13:49:14', '2023-03-24 13:49:14', 0);
INSERT INTO `order_log` VALUES (67, 8327484079209050112, 1545091327132270610, 1, '2023-03-24 13:52:15', '2023-03-24 13:52:15', 0);
INSERT INTO `order_log` VALUES (68, 8327485047171575808, 1545091327132270611, 1, '2023-03-24 13:56:06', '2023-03-24 13:56:06', 0);
INSERT INTO `order_log` VALUES (69, 8327488148171517952, 1545091327132270612, 1, '2023-03-24 14:08:25', '2023-03-24 14:08:25', 0);
INSERT INTO `order_log` VALUES (70, 8327498942122684416, 1545091327132270613, 1, '2023-03-24 14:51:19', '2023-03-24 14:51:19', 0);
INSERT INTO `order_log` VALUES (72, 8327506727845621760, 1545091327132270614, 1, NULL, NULL, 0);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oid` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户编号',
  `address_id` int(11) NULL DEFAULT NULL COMMENT '地址编号',
  `oprice` decimal(10, 2) NULL DEFAULT NULL COMMENT '付款金额',
  `order_time` datetime(0) NULL DEFAULT NULL COMMENT '下单时间',
  `checkout_time` datetime(0) NULL DEFAULT NULL COMMENT '付款时间',
  `ostatus` int(255) NULL DEFAULT NULL COMMENT '订单状态 1待发货，2待付款，3已完成，4已取消 5发货中',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `address_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `consignee` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `is_deleted` int(1) NULL DEFAULT 0,
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1545091327232270604 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1545091327132270604, 33, 33, 1386.00, '2023-04-13 17:55:38', '2023-03-23 17:56:06', 3, '', '44', '天津市天津市滨海新区444444', '444', '44444', '2023-03-23 17:56:06', '2023-03-23 17:55:38', 0);
INSERT INTO `orders` VALUES (1545091327132270605, 35, 34, 4446.00, '2023-03-23 18:17:55', '2023-03-23 18:18:50', 5, '312312', '张严解', '天津市天津市滨海新区11', '17695461014', '张严解', '2023-03-23 18:18:50', '2023-03-23 18:17:55', 0);
INSERT INTO `orders` VALUES (1545091327132270606, 36, 35, 653.00, '2023-03-23 18:36:28', '2023-03-23 18:36:46', 5, '不发邮政', '张苏苏', '天津市天津市滨海新区于家堡 1111', '17695461014', '张苏苏', '2023-03-23 18:36:46', '2023-03-23 18:36:28', 0);
INSERT INTO `orders` VALUES (1545091327132270612, 37, 36, 594.00, '2023-03-24 14:08:25', '2023-03-24 14:09:57', 1, '', '张严杰', '天津市天津市滨海新区天津外国语大学 文学院 ', '17695461014', '张严杰', '2023-03-24 14:09:57', '2023-03-24 14:08:25', 0);
INSERT INTO `orders` VALUES (1545091327132270613, 37, 36, 99.00, '2023-03-24 14:51:18', '2023-03-24 14:51:52', 1, '', '张严杰', '天津市天津市滨海新区天津外国语大学 文学院 ', '17695461014', '张严杰', '2023-03-24 14:51:52', '2023-03-24 14:51:18', 0);
INSERT INTO `orders` VALUES (1545091327132270644, 40, 38, 2997.00, '2023-03-24 15:22:15', '2023-03-24 15:24:09', 5, '不发邮政', '666@qq.com', '天津市天津市滨海新区大学软件学院', '17695461014', '张严杰', '2023-03-24 15:24:09', '2023-03-24 15:22:15', 0);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `kid` int(11) NULL DEFAULT NULL COMMENT '类别编号',
  `pname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `pstatus` int(255) NULL DEFAULT NULL COMMENT '商品状态 1代表上线 0代表下架',
  `integral` int(11) NULL DEFAULT NULL COMMENT '积分值，与价钱数一样',
  `psales` decimal(10, 2) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '1代表促销 0代表不促销',
  `pstock` int(11) NULL DEFAULT 1000 COMMENT '库存',
  `pmonthsale` int(11) NULL DEFAULT 0 COMMENT '销量',
  `pmoreinfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细信息',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片路径',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `is_deleted` int(1) NULL DEFAULT 0,
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `kid`(`kid`) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`kid`) REFERENCES `product_kind` (`kid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (3, 3, '丝芙兰唇膏', 1, 99, 00000000.00, 968, 32, '丝芙兰唇情物语系列唇膏', 99.00, '/picture/3-7.jpg', NULL, '2023-03-24 14:51:19', 0);
INSERT INTO `product` VALUES (8, 4, '纪梵希精华乳液', 1, 1350, 00000000.00, 988, 12, '纪梵希时光无痕精华乳', 1350.00, '/picture/4-8.jpg', NULL, '2023-03-24 13:56:06', 0);
INSERT INTO `product` VALUES (10, 5, 'TOM FORD腮红', 1, 50, 00000000.00, 994, 6, 'TOM FORD奢金柔光双色腮红', 0.50, '/picture/5-10.png', NULL, '2023-03-24 13:46:32', 0);
INSERT INTO `product` VALUES (11, 5, 'NASA腮红', 1, 300, 00000000.00, 984, 16, 'NARS腮红Behave豆沙泰姬陵焦糖橘', 300.00, '/picture/5-11.png', NULL, '2023-03-23 05:01:00', 0);
INSERT INTO `product` VALUES (13, 6, '芙丽芳丝洁面', 1, 169, 00000000.00, 1000, 0, '芙丽芳丝氨基酸系洗面奶泡沫温和洁面敏弱肌', 169.00, '/picture/6-13.png', NULL, NULL, 0);
INSERT INTO `product` VALUES (14, 6, '德妃紫苏洁面', 1, 89, 00000000.00, 996, 4, '德妃紫苏洗面奶女氨基酸深层清洁毛孔油皮洁面乳', 89.00, '/picture/6-14.png', NULL, '2023-03-23 18:36:28', 0);
INSERT INTO `product` VALUES (15, 6, '珂润洁面', 1, 108, 00000000.00, 998, 2, 'curel珂润洗面奶保湿洁面泡沫温和', 108.00, '/picture/6-15.png', NULL, '2023-03-24 13:46:32', 0);
INSERT INTO `product` VALUES (16, 6, 'UNNY洁面', 1, 60, 00000000.00, 1000, 0, 'unny官方旗舰店氨基酸洗面奶清洁控油洁面乳', 60.00, '/picture/6-16.png', NULL, NULL, 0);
INSERT INTO `product` VALUES (17, 1, '妮维雅凝胶霜', 1, 0, 00000000.00, 998, 2, '妮维雅紧致爽肤凝胶霜', 0.01, '/picture/317e3cfb-935d-40e7-b319-cd3b2237ae8c.png', NULL, '2023-03-24 13:42:13', 0);
INSERT INTO `product` VALUES (18, 1, '妮维雅身体乳', 1, 59, 00000000.00, 1000, 0, '妮维雅兰花精油身体乳', 59.00, '/picture/d82de2e0-bb93-49a5-bc53-271fa5711dbe.png', NULL, NULL, 0);
INSERT INTO `product` VALUES (19, 1, '妮维雅润肤露', 1, 979, 00000000.00, 1000, 0, '妮维雅芦荟润肤露', 979.00, '/picture/4ec735df-614f-41c8-8d81-540c3607bafb.png', NULL, NULL, 0);
INSERT INTO `product` VALUES (20, 2, '理肤泉保湿霜', 1, 300, 00000000.00, 1000, 0, '理肤泉三重修护保湿霜', 300.00, '/picture/2-20.png', NULL, NULL, 0);
INSERT INTO `product` VALUES (21, 2, '理肤泉修复面霜', 1, 200, 00000000.00, 1000, 0, '理肤泉双重修护面霜', 200.00, '/picture/2-21.png', NULL, NULL, 0);
INSERT INTO `product` VALUES (22, 2, '理肤泉修复精华液', 1, 199, 00000000.00, 1000, 0, '理肤泉玻尿酸B5修复精华液', 199.00, '/picture/2-22.png', NULL, NULL, 0);
INSERT INTO `product` VALUES (35, 4, '雏菊', 1, 100, 00000000.00, 1000, 0, '', 100.00, '/picture/b26080c9-11ba-449b-9ea1-6f1f7ba61466.jpg', NULL, NULL, 0);
INSERT INTO `product` VALUES (41, 3, '你好', 1, 1111, 00000000.00, 1000, 0, '', 1111.00, '/picture/5752b8f7-353b-4536-a048-6584ba8387ac.jpg', NULL, NULL, 0);
INSERT INTO `product` VALUES (42, 3, '213213', 1, 111, 00000000.00, 1000, 0, '', 111.00, '/picture/634eec71-7914-4f2a-9ebf-52a6f3db1480.jpg', NULL, NULL, 0);
INSERT INTO `product` VALUES (43, 3, '黑暗', 1, NULL, 00000000.00, 11097, 14, '', 99.00, '/picture/3087f3f1-0d37-4a2c-b242-87c35ddb7504.png', NULL, '2023-03-23 17:55:38', 0);
INSERT INTO `product` VALUES (44, 3, '毕设演示1', 1, NULL, 00000000.00, 994, 6, '', 99.00, '/picture/a845bd8d-6635-45cc-9b55-5354f5ebdf71.webp', NULL, '2023-03-24 14:08:25', 0);
INSERT INTO `product` VALUES (45, 5, '毕设演示2', 1, NULL, 00000000.00, 997, 3, '', 999.00, '/picture/3024797d-80c3-4c7f-b7f1-6c3ab799c0a1.jpg', NULL, '2023-03-24 15:22:15', 0);

-- ----------------------------
-- Table structure for product_kind
-- ----------------------------
DROP TABLE IF EXISTS `product_kind`;
CREATE TABLE `product_kind`  (
  `kid` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别编号',
  `kname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别名字',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片位置',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人 员工 管理员',
  `update_user` bigint(20) NOT NULL COMMENT '修改人 员工 管理员',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '状态 0:禁用，1:正常',
  `is_deleted` int(1) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`kid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_kind
-- ----------------------------
INSERT INTO `product_kind` VALUES (1, '快速修复', '1.jpg', '2022-06-27 09:30:48', '2023-03-24 15:19:51', 1, 1, '修复你', 1, 0);
INSERT INTO `product_kind` VALUES (2, '皮肤护理', '2.jpg', '2022-06-27 09:30:44', '2022-07-07 09:47:31', 1, 2, '护理你', 1, 0);
INSERT INTO `product_kind` VALUES (3, '唇妆', '3.jpg', '2022-06-27 09:30:50', '2022-06-27 09:31:07', 1, 1, '斩男', 1, 0);
INSERT INTO `product_kind` VALUES (4, '面部护理', '4.jpg', '2022-06-27 09:30:54', '2022-06-27 09:31:09', 1, 1, '变漂亮', 1, 0);
INSERT INTO `product_kind` VALUES (5, '腮红', '5.jpg', '2022-06-27 09:30:57', '2022-06-28 17:37:07', 1, 1, '大腮红', 1, 0);
INSERT INTO `product_kind` VALUES (6, '洁面', '6.jpg', '2022-06-27 09:30:59', '2023-03-18 03:03:40', 1, 1, '洗脸去吧', 1, 0);

-- ----------------------------
-- Table structure for product_lable
-- ----------------------------
DROP TABLE IF EXISTS `product_lable`;
CREATE TABLE `product_lable`  (
  `laid` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签编号',
  `laname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名',
  `value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签数据',
  `pid` int(11) NULL DEFAULT NULL COMMENT '商品标签',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建人',
  `update_user` bigint(20) NOT NULL COMMENT '修改人',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`laid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_lable
-- ----------------------------
INSERT INTO `product_lable` VALUES (2, '款式', '[\"入门款\",\"基本款\",\"升级款\",\"限量款\"]', 26, '2022-06-28 16:00:23', '2022-06-28 16:00:23', 1, 1, 0);
INSERT INTO `product_lable` VALUES (4, '净含量', '[\"35g\",\"50g\",\"100g\",\"150g\",\"200g\"]', 27, '2022-06-28 16:02:20', '2022-06-28 16:02:20', 1, 1, 0);
INSERT INTO `product_lable` VALUES (5, '净含量', '[\"35g\",\"50g\",\"100g\",\"150g\",\"200g\"]', 1, '2022-06-28 16:44:21', '2022-06-28 16:44:21', 1, 1, 0);
INSERT INTO `product_lable` VALUES (6, '净含量', '[\"35g\",\"50g\",\"200g\"]', 29, '2022-06-30 11:05:51', '2022-06-30 11:05:51', 1, 1, 0);
INSERT INTO `product_lable` VALUES (7, '净含量', '[\"35g\",\"50g\",\"100g\",\"150g\",\"200g\"]', 30, '2022-07-03 15:36:33', '2022-07-03 15:36:33', 1, 1, 0);
INSERT INTO `product_lable` VALUES (15, '规格', '[\"5片\",\"10片\",\"20片\",\"30片\"]', 34, '2022-07-07 09:49:34', '2022-07-07 09:49:34', 2, 2, 0);
INSERT INTO `product_lable` VALUES (41, '规格', '[\"入门款\",\"基本款\",\"升级款\",\"限量款\"]', 3, '2022-07-08 00:23:42', '2022-07-08 00:23:42', 1, 1, 0);
INSERT INTO `product_lable` VALUES (42, '净含量', '[\"35g\",\"50g\",\"100g\",\"150g\",\"200g\"]', 10, '2023-03-18 22:38:23', '2023-03-18 22:38:23', 1, 1, 0);
INSERT INTO `product_lable` VALUES (43, '款式', '[\"入门款\",\"基本款\",\"升级款\",\"限量款\"]', 43, '2023-03-23 17:53:59', '2023-03-23 17:53:59', 1, 1, 0);
INSERT INTO `product_lable` VALUES (44, '款式', '[\"入门款\",\"基本款\",\"升级款\",\"限量款\"]', 44, '2023-03-24 14:07:58', '2023-03-24 14:07:58', 1, 1, 0);
INSERT INTO `product_lable` VALUES (45, '容量', '[\"35ml\",\"50ml\",\"100ml\",\"150ml\"]', 45, '2023-03-24 15:20:27', '2023-03-24 15:20:27', 1, 1, 0);

-- ----------------------------
-- Table structure for product_pictures
-- ----------------------------
DROP TABLE IF EXISTS `product_pictures`;
CREATE TABLE `product_pictures`  (
  `picid` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片编号',
  `pid` int(11) NULL DEFAULT NULL COMMENT '商品编号',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片路径',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `is_deleted` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`picid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_pictures
-- ----------------------------
INSERT INTO `product_pictures` VALUES (7, 7, 'picture/3-7.jpg', NULL, NULL, 0);
INSERT INTO `product_pictures` VALUES (8, 8, 'picture/4-8.png', NULL, NULL, 0);
INSERT INTO `product_pictures` VALUES (11, 11, 'picture/5-11.png', NULL, NULL, 0);
INSERT INTO `product_pictures` VALUES (13, 13, 'picture/6-13.png', NULL, NULL, 0);
INSERT INTO `product_pictures` VALUES (14, 14, 'picture/6-14.png', NULL, NULL, 0);
INSERT INTO `product_pictures` VALUES (15, 15, 'picture/6-15.png', NULL, NULL, 0);
INSERT INTO `product_pictures` VALUES (16, 16, 'picture/6-16.png', NULL, NULL, 0);
INSERT INTO `product_pictures` VALUES (20, 20, 'picture/2-20.png', NULL, NULL, 0);
INSERT INTO `product_pictures` VALUES (21, 21, 'picture/2-21.png', NULL, NULL, 0);
INSERT INTO `product_pictures` VALUES (22, 22, 'picture/2-22.png', NULL, NULL, 0);
INSERT INTO `product_pictures` VALUES (36, 17, 'picture/1-17.png', NULL, NULL, 0);
INSERT INTO `product_pictures` VALUES (37, 18, 'picture/1-18.png', NULL, NULL, 0);
INSERT INTO `product_pictures` VALUES (38, 19, 'picture/1-19.png', NULL, NULL, 0);
INSERT INTO `product_pictures` VALUES (39, 10, 'picture/5-10.png', NULL, NULL, 0);

-- ----------------------------
-- Table structure for product_review
-- ----------------------------
DROP TABLE IF EXISTS `product_review`;
CREATE TABLE `product_review`  (
  `rvid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户编号',
  `pid` int(11) NULL DEFAULT NULL COMMENT '商品编号',
  `rvcontent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `rvtime` datetime(0) NULL DEFAULT NULL COMMENT '评论时间',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `is_deleted` int(1) NULL DEFAULT 0,
  PRIMARY KEY (`rvid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_review
-- ----------------------------
INSERT INTO `product_review` VALUES (1, 2, 11, '3123', '2022-07-07 09:34:41', '2022-07-07 09:34:41', '2022-07-07 09:34:41', 0);
INSERT INTO `product_review` VALUES (2, 2, 16, '很好用', '2022-07-07 09:58:51', '2022-07-07 09:34:41', '2022-07-07 09:34:41', 0);
INSERT INTO `product_review` VALUES (3, 2, 35, '11', '2022-07-08 00:09:29', '2022-07-07 09:34:41', '2022-07-07 09:34:41', 0);
INSERT INTO `product_review` VALUES (4, 2, 17, '111', '2022-07-08 00:28:54', '2022-07-07 09:34:41', '2022-07-07 09:34:41', 0);
INSERT INTO `product_review` VALUES (5, 2, 10, '很好用哦', '2022-07-08 01:00:54', '2022-07-07 09:34:41', '2022-07-07 09:34:41', 0);
INSERT INTO `product_review` VALUES (6, 29, 3, '买它就对了', NULL, '2023-03-19 02:45:08', '2023-03-19 02:45:08', 0);
INSERT INTO `product_review` VALUES (7, 29, 3, '送人不错', NULL, '2023-03-19 02:45:08', '2023-03-19 02:45:08', 0);
INSERT INTO `product_review` VALUES (8, 29, 3, '1231', NULL, '2023-03-19 06:40:23', '2023-03-19 06:40:23', 0);
INSERT INTO `product_review` VALUES (9, 29, 3, '312', NULL, '2023-03-19 06:40:30', '2023-03-19 06:40:30', 0);
INSERT INTO `product_review` VALUES (10, 29, 3, '344324', NULL, '2023-03-19 06:40:34', '2023-03-19 06:40:34', 0);
INSERT INTO `product_review` VALUES (11, 29, 3, '123', NULL, '2023-03-19 06:57:43', '2023-03-19 06:57:43', 0);
INSERT INTO `product_review` VALUES (12, 29, 8, '24324', NULL, '2023-03-23 15:27:10', '2023-03-23 15:27:10', 0);
INSERT INTO `product_review` VALUES (13, 31, 13, '22', NULL, '2023-03-23 17:44:59', '2023-03-23 17:44:59', 0);
INSERT INTO `product_review` VALUES (14, 35, 13, '213213', NULL, '2023-03-23 18:32:50', '2023-03-23 18:32:50', 0);

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province`  (
  `provid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省名称',
  PRIMARY KEY (`provid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES (1, '天津市');
INSERT INTO `province` VALUES (2, '北京市');
INSERT INTO `province` VALUES (3, '河北省');
INSERT INTO `province` VALUES (4, '山西省');
INSERT INTO `province` VALUES (5, '山东省');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `lid` int(11) NULL DEFAULT NULL COMMENT '等级编号',
  `uname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `utel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `uemail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `upwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `nowpoint` decimal(11, 0) NULL DEFAULT NULL COMMENT '当前积分',
  `hispoint` decimal(11, 0) NULL DEFAULT NULL COMMENT '累计积分',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像存储位置',
  `status` int(10) NULL DEFAULT NULL COMMENT '状态 1禁用 0启用',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `is_deleted` int(1) NULL DEFAULT 0 COMMENT '0启动 1删除',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, 1, '1403407797@qq.com', '17695461014', '1403407797@qq.com', '123456', 1100, 100, '1.webp', 0, '2023-03-17 02:47:59', '2023-03-17 02:47:59', 0);
INSERT INTO `user` VALUES (3, 1, '2403407797@qq.com', '2403407797@qq.com', '2403407797@qq.com', '2403407797@qq.com', 0, 0, '1.webp', 0, '2023-03-17 02:47:59', '2023-03-17 02:47:59', 0);
INSERT INTO `user` VALUES (29, 1, '11', '11', '11', '11', 6780, 6780, '1.webp', 0, '2023-03-17 02:47:59', '2023-03-23 05:01:00', 0);
INSERT INTO `user` VALUES (30, 1, '324', '23432', '11@qq.com', '123', 0, 0, '1.webp', 0, '2023-03-17 03:37:29', '2023-03-17 03:37:29', 0);
INSERT INTO `user` VALUES (31, 1, '22', '22', '22', '22', 2700, 2700, NULL, 0, '2023-03-23 15:57:36', '2023-03-23 17:42:39', 0);
INSERT INTO `user` VALUES (32, 1, '33', '33', '33', '33', 5796, 5796, '1.webp', 0, '2023-03-23 17:50:21', '2023-03-23 17:51:10', 0);
INSERT INTO `user` VALUES (33, 1, '44', '44', '44@qq.com', '44', 1386, 1386, '1.webp', 0, '2023-03-23 17:52:08', '2023-03-23 17:55:38', 0);
INSERT INTO `user` VALUES (34, 1, '66', '66', '66@qq.com', '66', 0, 0, '1.webp', 0, '2023-03-23 18:15:17', '2023-03-23 18:15:17', 0);
INSERT INTO `user` VALUES (35, 1, '777777', '17695461014', '77@qq.com', '123456', 4446, 4446, '1.webp', 0, '2023-03-23 18:15:53', '2023-03-23 18:17:56', 0);
INSERT INTO `user` VALUES (36, 1, '张苏苏', '17695461014', '111@qq.com', '123456', 653, 653, '1.webp', 0, '2023-03-23 18:35:07', '2023-03-23 18:36:28', 0);
INSERT INTO `user` VALUES (37, 1, '张严杰', '17695461014', '222@qq.com', '123456', 4746, 4746, '1.webp', 0, '2023-03-24 13:29:39', '2023-03-24 14:51:19', 0);
INSERT INTO `user` VALUES (38, 1, '张严杰', '17695461014', '333@qq.com', '123456', 217, 217, '1.webp', 0, '2023-03-24 13:45:48', '2023-03-24 13:46:32', 0);
INSERT INTO `user` VALUES (39, 1, '张苏苏', '17695461014', '1043407797@qq.com', '123456', 0, 0, '1.webp', 0, '2023-03-24 15:19:02', '2023-03-24 15:19:02', 0);
INSERT INTO `user` VALUES (40, 1, '666@qq.com', '17695461014', '666@qq.com', '123456', 2997, 2997, '1.webp', 0, '2023-03-24 15:21:06', '2023-03-24 15:22:15', 0);

-- ----------------------------
-- Table structure for user_cart
-- ----------------------------
DROP TABLE IF EXISTS `user_cart`;
CREATE TABLE `user_cart`  (
  `cartid` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车ID',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `pid` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  `cartcount` int(255) NULL DEFAULT NULL COMMENT '购物车数量',
  `cartoneprice` decimal(10, 2) NULL DEFAULT NULL COMMENT '购物车单个商品价格',
  `cartallprice` decimal(10, 2) NULL DEFAULT NULL COMMENT '购物车所有商品总价',
  `pname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名',
  `cartimage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `is_deleted` int(1) NULL DEFAULT 0,
  PRIMARY KEY (`cartid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_cart
-- ----------------------------
INSERT INTO `user_cart` VALUES (17, 2, 8, 1, 1350.00, 1350.00, '纪梵希精华乳液', '/picture/317e3cfb-935d-40e7-b319-cd3b2237ae8c.png', NULL, NULL, 1);
INSERT INTO `user_cart` VALUES (18, 29, 7, 1, 99.00, 99.00, '丝芙兰唇膏', '/picture/3-7.jpg', NULL, NULL, 1);
INSERT INTO `user_cart` VALUES (19, 29, 3, 1, 99.00, 99.00, '丝芙兰唇膏', '/picture/3-7.jpg', '2023-03-19 06:39:12', '2023-03-19 06:39:12', 1);
INSERT INTO `user_cart` VALUES (20, 29, 3, 1, 99.00, 99.00, '丝芙兰唇膏', '/picture/3-7.jpg', '2023-03-19 06:40:46', '2023-03-19 06:40:46', 1);
INSERT INTO `user_cart` VALUES (21, 29, 3, 5, 99.00, 495.00, '丝芙兰唇膏', '/picture/3-7.jpg', '2023-03-19 06:58:01', '2023-03-22 18:37:48', 0);
INSERT INTO `user_cart` VALUES (23, 29, 11, 4, 300.00, 1200.00, 'NASA腮红', '/picture/5-11.png', '2023-03-19 18:31:29', '2023-03-19 21:01:48', 0);
INSERT INTO `user_cart` VALUES (24, 29, 13, 2, 169.00, 338.00, '芙丽芳丝洁面', '/picture/6-13.png', '2023-03-23 15:39:26', '2023-03-23 15:40:33', 0);
INSERT INTO `user_cart` VALUES (25, 31, 8, 1, 1350.00, 1350.00, '纪梵希精华乳液', '/picture/4-8.jpg', '2023-03-23 15:58:13', '2023-03-23 15:58:13', 0);
INSERT INTO `user_cart` VALUES (26, 32, 3, 4, 99.00, 396.00, '丝芙兰唇膏', '/picture/3-7.jpg', '2023-03-23 17:50:33', '2023-03-23 17:51:06', 1);
INSERT INTO `user_cart` VALUES (27, 32, 8, 4, 1350.00, 5400.00, '纪梵希精华乳液', '/picture/4-8.jpg', '2023-03-23 17:50:36', '2023-03-23 17:51:07', 1);
INSERT INTO `user_cart` VALUES (28, 33, 43, 14, 99.00, 1386.00, '黑暗', '/picture/3087f3f1-0d37-4a2c-b242-87c35ddb7504.png', '2023-03-23 17:54:09', '2023-03-23 17:55:34', 1);
INSERT INTO `user_cart` VALUES (29, 35, 8, 3, 1350.00, 4050.00, '纪梵希精华乳液', '/picture/4-8.jpg', '2023-03-23 18:17:42', '2023-03-23 18:17:50', 1);
INSERT INTO `user_cart` VALUES (30, 35, 3, 4, 99.00, 396.00, '丝芙兰唇膏', '/picture/3-7.jpg', '2023-03-23 18:17:48', '2023-03-23 18:17:51', 1);
INSERT INTO `user_cart` VALUES (31, 36, 3, 3, 99.00, 297.00, '丝芙兰唇膏', '/picture/3-7.jpg', '2023-03-23 18:36:12', '2023-03-23 18:36:17', 1);
INSERT INTO `user_cart` VALUES (32, 36, 14, 4, 89.00, 356.00, '德妃紫苏洁面', '/picture/6-14.png', '2023-03-23 18:36:16', '2023-03-23 18:36:18', 1);
INSERT INTO `user_cart` VALUES (33, 37, 17, 2, 0.01, 0.02, '妮维雅凝胶霜', '/picture/317e3cfb-935d-40e7-b319-cd3b2237ae8c.png', '2023-03-24 13:30:17', '2023-03-24 13:32:44', 1);
INSERT INTO `user_cart` VALUES (34, 37, 10, 5, 0.50, 2.50, 'TOM FORD腮红', '/picture/5-10.png', '2023-03-24 13:30:25', '2023-03-24 13:32:45', 1);
INSERT INTO `user_cart` VALUES (35, 38, 10, 1, 0.50, 0.50, 'TOM FORD腮红', '/picture/5-10.png', '2023-03-24 13:46:08', '2023-03-24 13:46:08', 1);
INSERT INTO `user_cart` VALUES (36, 38, 15, 2, 108.00, 216.00, '珂润洁面', '/picture/6-15.png', '2023-03-24 13:46:13', '2023-03-24 13:46:29', 1);
INSERT INTO `user_cart` VALUES (37, 37, 8, 1, 1350.00, 1350.00, '纪梵希精华乳液', '/picture/4-8.jpg', '2023-03-24 13:49:03', '2023-03-24 13:49:03', 1);
INSERT INTO `user_cart` VALUES (38, 37, 8, 1, 1350.00, 1350.00, '纪梵希精华乳液', '/picture/4-8.jpg', '2023-03-24 13:52:11', '2023-03-24 13:52:11', 1);
INSERT INTO `user_cart` VALUES (39, 37, 8, 1, 1350.00, 1350.00, '纪梵希精华乳液', '/picture/4-8.jpg', '2023-03-24 13:56:02', '2023-03-24 13:56:02', 1);
INSERT INTO `user_cart` VALUES (40, 37, 44, 6, 99.00, 594.00, '毕设演示1', '/picture/a845bd8d-6635-45cc-9b55-5354f5ebdf71.webp', '2023-03-24 14:08:20', '2023-03-24 14:08:24', 1);
INSERT INTO `user_cart` VALUES (41, 37, 3, 1, 99.00, 99.00, '丝芙兰唇膏', '/picture/3-7.jpg', '2023-03-24 14:51:09', '2023-03-24 14:51:09', 1);
INSERT INTO `user_cart` VALUES (42, 40, 45, 3, 999.00, 2997.00, '毕设演示2', '/picture/3024797d-80c3-4c7f-b7f1-6c3ab799c0a1.jpg', '2023-03-24 15:21:57', '2023-03-24 15:22:09', 1);

-- ----------------------------
-- Table structure for user_favorites
-- ----------------------------
DROP TABLE IF EXISTS `user_favorites`;
CREATE TABLE `user_favorites`  (
  `favoid` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户编号',
  `pid` int(11) NULL DEFAULT NULL COMMENT '商品编号',
  `pname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `fimage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `is_deleted` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`favoid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_favorites
-- ----------------------------
INSERT INTO `user_favorites` VALUES (36, 3, 4, '纪梵希面膜', 3000.00, '/picture/4-4.jpg', NULL, NULL, NULL);
INSERT INTO `user_favorites` VALUES (37, NULL, 5, '迪奥精华液', 650.00, '/picture/4-5.jpg', NULL, NULL, NULL);
INSERT INTO `user_favorites` VALUES (38, NULL, 7, '丝芙兰唇膏', 99.00, '/picture/3-7.jpg', NULL, NULL, NULL);
INSERT INTO `user_favorites` VALUES (39, NULL, 22, '理肤泉修复精华液', 199.00, '/picture/2-22.png', NULL, NULL, NULL);
INSERT INTO `user_favorites` VALUES (41, 2, 11, 'NASA腮红', 300.00, '/picture/5-11.png', NULL, NULL, NULL);
INSERT INTO `user_favorites` VALUES (42, 29, 3, '丝芙兰唇膏', NULL, '/picture/3-7.jpg', '2023-03-19 06:52:09', '2023-03-19 06:52:09', NULL);
INSERT INTO `user_favorites` VALUES (43, 29, 3, '丝芙兰唇膏', NULL, '/picture/3-7.jpg', '2023-03-19 06:54:48', '2023-03-19 06:54:48', NULL);
INSERT INTO `user_favorites` VALUES (44, 29, 3, '丝芙兰唇膏', NULL, '/picture/3-7.jpg', '2023-03-19 06:57:16', '2023-03-19 06:57:16', NULL);
INSERT INTO `user_favorites` VALUES (45, 29, 3, '丝芙兰唇膏', NULL, '/picture/3-7.jpg', '2023-03-19 06:58:03', '2023-03-19 06:58:03', NULL);

-- ----------------------------
-- Table structure for user_level
-- ----------------------------
DROP TABLE IF EXISTS `user_level`;
CREATE TABLE `user_level`  (
  `lid` int(11) NOT NULL AUTO_INCREMENT COMMENT '等级编号',
  `lname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级名称',
  `ldes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级描述',
  `lpoint_rule` int(255) NULL DEFAULT NULL COMMENT '等级积分规则',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建人',
  `update_user` bigint(20) NOT NULL COMMENT '修改人',
  `is_deleted` int(1) NULL DEFAULT 0 COMMENT '0启动 1删除',
  PRIMARY KEY (`lid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_level
-- ----------------------------
INSERT INTO `user_level` VALUES (1, '普通用户', '对不起没优惠', 0, '2022-06-11 22:37:34', '2022-07-07 09:50:19', 1, 2, NULL);
INSERT INTO `user_level` VALUES (2, '会员', '95折扣', 1000, '2022-06-04 22:43:25', '2022-06-09 22:43:28', 1, 1, NULL);
INSERT INTO `user_level` VALUES (3, '金粉会员', '9折扣', 3000, '2022-06-16 22:44:37', '2022-06-10 22:44:41', 1, 1, NULL);
INSERT INTO `user_level` VALUES (4, '钻粉会员', '85折扣', 5000, '2022-06-24 22:45:14', '2022-06-29 11:31:37', 1, 1, NULL);
INSERT INTO `user_level` VALUES (7, '大会员', '7折', 20000, '2022-07-08 19:24:37', '2022-07-08 19:24:37', 1, 1, NULL);

SET FOREIGN_KEY_CHECKS = 1;
