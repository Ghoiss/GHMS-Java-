/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : ghms

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2024-12-23 20:38:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', 'WZZ', '3268');
INSERT INTO `employee` VALUES ('2', 'BCC', '013');
INSERT INTO `employee` VALUES ('4', 'LR', '184');

-- ----------------------------
-- Table structure for `guests`
-- ----------------------------
DROP TABLE IF EXISTS `guests`;
CREATE TABLE `guests` (
  `guest_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `id_card` varchar(18) COLLATE utf8_bin NOT NULL,
  `phone` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`guest_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of guests
-- ----------------------------
INSERT INTO `guests` VALUES ('1', '李四', '110101199001011235', '13800138002', 'lisi@example.com');
INSERT INTO `guests` VALUES ('2', '王五', '110101199001011236', '13800138003', 'wangwu@example.com');
INSERT INTO `guests` VALUES ('3', '赵六', '110101199001011237', '13800138004', 'zhaoliu@example.com');

-- ----------------------------
-- Table structure for `reservations`
-- ----------------------------
DROP TABLE IF EXISTS `reservations`;
CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL AUTO_INCREMENT,
  `guest_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `status` varchar(20) COLLATE utf8_bin NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reservation_id`),
  KEY `guest_id` (`guest_id`),
  KEY `room_id` (`room_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of reservations
-- ----------------------------
INSERT INTO `reservations` VALUES ('1', '1', '102', '2', '2024-01-01', '2024-01-03', 'COMPLETED', '2024-12-11 13:43:42');
INSERT INTO `reservations` VALUES ('2', '2', '201', '2', '2024-01-02', '2024-01-05', 'COMPLETED', '2024-12-11 13:43:42');
INSERT INTO `reservations` VALUES ('3', '3', '202', '2', '2024-01-03', '2024-01-06', 'COMPLETED', '2024-12-11 13:43:42');
INSERT INTO `reservations` VALUES ('4', '2', '121', '2', '2024-01-04', '2024-01-07', 'COMPLETED', '2024-12-11 13:43:42');
INSERT INTO `reservations` VALUES ('5', '1', '110', '2', '2024-01-05', '2024-01-08', 'CANCELLED', '2024-12-11 13:43:42');
INSERT INTO `reservations` VALUES ('6', '3', '101', '3', '2024-12-12', '2024-12-31', 'PENDING', '2024-12-11 20:23:07');
INSERT INTO `reservations` VALUES ('7', '3', '425', '3', '2024-12-23', '2024-12-24', 'CHECKED_IN', '2024-12-23 12:08:59');

-- ----------------------------
-- Table structure for `rooms`
-- ----------------------------
DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_number` varchar(10) COLLATE utf8_bin NOT NULL,
  `room_type` varchar(50) COLLATE utf8_bin NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` varchar(20) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  UNIQUE KEY `room_number` (`room_number`),
  KEY `employee_id` (`employee_id`)
) ENGINE=MyISAM AUTO_INCREMENT=609 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of rooms
-- ----------------------------
INSERT INTO `rooms` VALUES ('101', '101', '单人间', '199.00', 'RESERVED', 0xE6A087E58786E58D95E4BABAE997B4EFBC8CE5B8A6E78BACE7AB8BE58DABE6B5B4, '1');
INSERT INTO `rooms` VALUES ('102', '102', '单人间', '199.00', 'OCCUPIED', 0xE6A087E58786E58D95E4BABAE997B4EFBC8CE5B8A6E78BACE7AB8BE58DABE6B5B4, '1');
INSERT INTO `rooms` VALUES ('201', '201', '双人间', '299.00', 'AVAILABLE', 0xE8B1AAE58D8EE58F8CE4BABAE997B4EFBC8CE5B8A6E998B3E58FB0, '1');
INSERT INTO `rooms` VALUES ('202', '202', '双人间', '299.00', 'MAINTENANCE', 0xE8B1AAE58D8EE58F8CE4BABAE997B4EFBC8CE5B8A6E998B3E58FB0, '1');
INSERT INTO `rooms` VALUES ('301', '301', '豪华套房', '599.00', 'AVAILABLE', 0xE8B1AAE58D8EE5A597E688BFEFBC8CE5B8A6E5AEA2E58E85E5928CE58EA8E688BF, '1');
INSERT INTO `rooms` VALUES ('302', '302', '豪华套房', '599.00', 'AVAILABLE', 0xE8B1AAE58D8EE5A597E688BFEFBC8CE5B8A6E5AEA2E58E85E5928CE58EA8E688BF, '1');
INSERT INTO `rooms` VALUES ('401', '401', '单人间', '9999.00', 'AVAILABLE', 0xE680BBE7BB9FE5A597E688BFEFBC8CE9858DE5A487E585A8E5A597E8AEBEE696BD, '2');
INSERT INTO `rooms` VALUES ('110', '110', '豪华套房', '3268.00', 'AVAILABLE', 0xE7959CE7949FE4B98BE5AEB6, '2');
INSERT INTO `rooms` VALUES ('425', '425', '单人间', '1000.00', 'RESERVED', 0xE58D97E6A281E5BFABE4B990E5B18B, '2');
INSERT INTO `rooms` VALUES ('121', '121', '单人间', '150.00', 'AVAILABLE', 0xE68891E58EBBEFBC81E5889DE99FB3E69CAAE69DA5EFBC81, '2');
INSERT INTO `rooms` VALUES ('103', '103', '单人间', '100.00', 'AVAILABLE', 0xE58D95E4BABAE997B4EFBC8CE78BACE7AB8BE58DABE6B5B4, '1');
INSERT INTO `rooms` VALUES ('104', '104', '单人间', '100.00', 'AVAILABLE', 0xE58D95E4BABAE997B4EFBC8CE78BACE7AB8BE58DABE6B5B4, '1');
INSERT INTO `rooms` VALUES ('405', '105', '单人间', '100.00', 'AVAILABLE', 0xE58D95E4BABAE997B4EFBC8CE78BACE7AB8BE58DABE6B5B4, '1');
INSERT INTO `rooms` VALUES ('106', '106', '单人间', '100.00', 'AVAILABLE', 0xE58D95E4BABAE997B4EFBC8CE78BACE7AB8BE58DABE6B5B4, '1');
INSERT INTO `rooms` VALUES ('608', '608', '双人间', '620.00', 'AVAILABLE', 0xE887AAE4B9A0E5AEA4, '1');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(64) COLLATE utf8_bin NOT NULL,
  `role` varchar(20) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', 'ADMIN', 'admin@example.com', '13800000000', '2024-12-11 13:39:44');
INSERT INTO `users` VALUES ('2', 'zxr', 'b9d487a30398d42ecff55c228ed5652b', 'USER', '123@qq.com', '1134', '2024-12-11 11:31:55');
INSERT INTO `users` VALUES ('3', 'tjj', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', 'USER', '56891446789548995@547', '+958+', '2024-12-11 11:45:38');
INSERT INTO `users` VALUES ('4', 'zzp', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', 'USER', '3583932764@qq.com', '163000000', '2024-12-12 09:49:03');
