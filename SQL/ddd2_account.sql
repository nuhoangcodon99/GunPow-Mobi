/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.177_3306
Source Server Version : 50648
Source Host           : 192.168.1.177:3306
Source Database       : ddd2_account

Target Server Type    : MYSQL
Target Server Version : 50648
File Encoding         : 65001

Date: 2020-07-26 16:23:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gift_code
-- ----------------------------
DROP TABLE IF EXISTS `gift_code`;
CREATE TABLE `gift_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expired_date` datetime NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(10000) COLLATE utf8_unicode_ci NOT NULL,
  `gold` int(11) NOT NULL,
  `server` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_limited` int(11) NOT NULL DEFAULT '0',
  `limit_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of gift_code
-- ----------------------------
INSERT INTO `gift_code` VALUES ('1', 'iSLETzvxOKHTM19o', '2030-10-20 00:00:00', 'Giftcode Tân Thủ', 'Cám ơn bạn đã tham gia game, đây là phần thưởng Giftcode Tân Thủ của bạn', '4', '0', 'all', '0', '0');
INSERT INTO `gift_code` VALUES ('2', 'RFYSZnLKi0i05Pt0', '2030-10-20 00:00:00', 'Giftcode Máy Chủ Mới', 'Cám ơn bạn đã tham gia game, đây là phần thưởng Giftcode Máy Chủ Mới của bạn', '5', '0', 'all', '0', '0');
INSERT INTO `gift_code` VALUES ('3', 'Fc08rkmb30s42JtS', '2030-10-20 00:00:00', 'Giftcode Facebook', 'Cám ơn bạn đã tham gia game, đây là phần thưởng Giftcode Facebook của bạn', '6', '0', 'all', '0', '0');

-- ----------------------------
-- Table structure for tab_account
-- ----------------------------
DROP TABLE IF EXISTS `tab_account`;
CREATE TABLE `tab_account` (
  `id` int(11) NOT NULL COMMENT '主键：主账号id',
  `udid` varchar(50) DEFAULT NULL COMMENT '设备编号',
  `user_name` varchar(255) DEFAULT NULL COMMENT '账号（不能重复）',
  `password` varchar(255) DEFAULT NULL COMMENT '账号对应的密码',
  `status` tinyint(4) NOT NULL COMMENT '账号是否有效（1为有效,0为禁止）',
  `create_time` datetime NOT NULL COMMENT '账号注册时间',
  `channel` int(4) DEFAULT '0',
  `login_times` varchar(1000) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IX_USERNAME` (`user_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户账号表，通用表';

-- ----------------------------
-- Records of tab_account
-- ----------------------------

-- ----------------------------
-- Table structure for used_code
-- ----------------------------
DROP TABLE IF EXISTS `used_code`;
CREATE TABLE `used_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gift_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`username`,`gift_code`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of used_code
-- ----------------------------
