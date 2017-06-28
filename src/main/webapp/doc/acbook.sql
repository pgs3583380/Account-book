/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50544
Source Host           : localhost:3306
Source Database       : acbook

Target Server Type    : MYSQL
Target Server Version : 50544
File Encoding         : 65001

Date: 2017-06-28 10:09:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ac_category`
-- ----------------------------
DROP TABLE IF EXISTS `ac_category`;
CREATE TABLE `ac_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `category_name` varchar(20) NOT NULL,
  `level` int(11) NOT NULL,
  `orderlist` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=200202 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ac_category
-- ----------------------------
INSERT INTO `ac_category` VALUES ('1', '0', '支出', '1', '1');
INSERT INTO `ac_category` VALUES ('2', '0', '收入', '1', '2');
INSERT INTO `ac_category` VALUES ('1003', '1', '衣服饰品', '2', '2');
INSERT INTO `ac_category` VALUES ('1004', '1', '食品酒水', '2', '1');
INSERT INTO `ac_category` VALUES ('1005', '1', '居家物业', '2', '3');
INSERT INTO `ac_category` VALUES ('1006', '1', '行车交通', '2', '4');
INSERT INTO `ac_category` VALUES ('1007', '1', '交通通讯', '2', '5');
INSERT INTO `ac_category` VALUES ('1008', '1', '休闲娱乐', '2', '6');
INSERT INTO `ac_category` VALUES ('1009', '1', '学习进修', '2', '7');
INSERT INTO `ac_category` VALUES ('1010', '1', '人情往来', '2', '8');
INSERT INTO `ac_category` VALUES ('1011', '1', '医疗保健', '2', '9');
INSERT INTO `ac_category` VALUES ('1012', '1', '金融保险', '2', '10');
INSERT INTO `ac_category` VALUES ('1013', '1', '其他杂项', '2', '11');
INSERT INTO `ac_category` VALUES ('2001', '2', '职业收入', '2', '1');
INSERT INTO `ac_category` VALUES ('2002', '2', '其他收入', '2', '2');
INSERT INTO `ac_category` VALUES ('100301', '1003', '衣服裤子', '3', '1');
INSERT INTO `ac_category` VALUES ('100302', '1003', '鞋帽包包', '3', '2');
INSERT INTO `ac_category` VALUES ('100303', '1003', '化妆品', '3', '3');
INSERT INTO `ac_category` VALUES ('100401', '1004', '早午晚餐', '3', '1');
INSERT INTO `ac_category` VALUES ('100402', '1004', '饮料', '3', '2');
INSERT INTO `ac_category` VALUES ('100403', '1004', '水果零食', '3', '3');
INSERT INTO `ac_category` VALUES ('100501', '1005', '日常用品', '3', '1');
INSERT INTO `ac_category` VALUES ('100502', '1005', '水电煤气', '3', '2');
INSERT INTO `ac_category` VALUES ('100503', '1005', '物业管理', '3', '3');
INSERT INTO `ac_category` VALUES ('100504', '1005', '维修保养', '3', '4');
INSERT INTO `ac_category` VALUES ('100601', '1006', '公共交通', '3', '1');
INSERT INTO `ac_category` VALUES ('100602', '1006', '打车租车', '3', '2');
INSERT INTO `ac_category` VALUES ('100603', '1006', '私家车费用', '3', '3');
INSERT INTO `ac_category` VALUES ('100701', '1007', '手机费', '3', '1');
INSERT INTO `ac_category` VALUES ('100702', '1007', '上网费', '3', '2');
INSERT INTO `ac_category` VALUES ('100703', '1007', '座机费', '3', '3');
INSERT INTO `ac_category` VALUES ('100801', '1008', '运动健身', '3', '1');
INSERT INTO `ac_category` VALUES ('100802', '1008', '腐败聚会', '3', '2');
INSERT INTO `ac_category` VALUES ('100803', '1008', '休闲玩乐', '3', '3');
INSERT INTO `ac_category` VALUES ('100804', '1008', '宠物宝贝', '3', '4');
INSERT INTO `ac_category` VALUES ('100805', '1008', '旅游度假', '3', '5');
INSERT INTO `ac_category` VALUES ('100901', '1009', '书报杂志', '3', '1');
INSERT INTO `ac_category` VALUES ('100902', '1009', '培训进修', '3', '2');
INSERT INTO `ac_category` VALUES ('100903', '1009', '数码装备', '3', '3');
INSERT INTO `ac_category` VALUES ('101001', '1010', '送人请客', '3', '1');
INSERT INTO `ac_category` VALUES ('101002', '1010', '孝敬家长', '3', '2');
INSERT INTO `ac_category` VALUES ('101003', '1010', '还人钱物', '3', '3');
INSERT INTO `ac_category` VALUES ('101004', '1010', '慈善捐助', '3', '4');
INSERT INTO `ac_category` VALUES ('101101', '1011', '药品费', '3', '1');
INSERT INTO `ac_category` VALUES ('101102', '1011', '保健费', '3', '2');
INSERT INTO `ac_category` VALUES ('101103', '1011', '美容费', '3', '3');
INSERT INTO `ac_category` VALUES ('101104', '1011', '治疗费', '3', '4');
INSERT INTO `ac_category` VALUES ('101201', '1012', '银行手续', '3', '1');
INSERT INTO `ac_category` VALUES ('101202', '1012', '投资亏损', '3', '2');
INSERT INTO `ac_category` VALUES ('101203', '1012', '按揭还款', '3', '3');
INSERT INTO `ac_category` VALUES ('101204', '1012', '消费税收', '3', '4');
INSERT INTO `ac_category` VALUES ('101205', '1012', '利息支出', '3', '5');
INSERT INTO `ac_category` VALUES ('101206', '1012', '赔偿罚款', '3', '6');
INSERT INTO `ac_category` VALUES ('101301', '1013', '其他支出', '3', '1');
INSERT INTO `ac_category` VALUES ('101302', '1013', '意外丢失', '3', '2');
INSERT INTO `ac_category` VALUES ('101303', '1013', '烂账损失', '3', '3');
INSERT INTO `ac_category` VALUES ('101304', '1013', '消费税收', '3', '4');
INSERT INTO `ac_category` VALUES ('101305', '1013', '利息支出', '3', '5');
INSERT INTO `ac_category` VALUES ('101306', '1013', '赔偿罚款', '3', '6');
INSERT INTO `ac_category` VALUES ('200101', '2001', '工资收入', '3', '1');
INSERT INTO `ac_category` VALUES ('200201', '2002', '礼金收入', '3', '1');

-- ----------------------------
-- Table structure for `ac_payments`
-- ----------------------------
DROP TABLE IF EXISTS `ac_payments`;
CREATE TABLE `ac_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `createtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  `edittime` datetime NOT NULL COMMENT '用户输入的时间，用于统计一段时间内的收支情况',
  `category_type` int(11) NOT NULL COMMENT '明细类别',
  `category_parent` int(11) DEFAULT NULL COMMENT '一级类别，冗余',
  `money_type` int(11) NOT NULL COMMENT '1收入，2支出',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `money` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ac_payments
-- ----------------------------
INSERT INTO `ac_payments` VALUES ('2', '1', '2017-06-22 15:01:33', '2017-06-22 15:01:33', '2017-06-10 00:00:00', '200101', '2001', '2', '发工资啦', '5000.00');
INSERT INTO `ac_payments` VALUES ('4', '1', '2017-06-23 09:33:16', '2017-06-27 12:43:55', '2017-06-23 09:33:02', '100401', '1004', '1', '吃的是鸡蛋', '4.00');
INSERT INTO `ac_payments` VALUES ('5', '1', '2017-06-23 09:39:40', '2017-06-23 12:39:46', '2017-06-22 00:00:00', '100401', '1004', '1', 'sss', '24.00');
INSERT INTO `ac_payments` VALUES ('6', '1', '2017-06-23 12:39:27', '2017-06-23 12:39:27', '2017-06-23 12:39:06', '100401', '1004', '1', '牛肉拉面', '10.00');
INSERT INTO `ac_payments` VALUES ('8', '1', '2017-06-23 16:59:03', '2017-06-23 16:59:03', '2017-06-23 16:59:01', '100401', '1004', '1', '22', '2.00');
INSERT INTO `ac_payments` VALUES ('9', '1', '2017-06-26 09:27:04', '2017-06-27 12:43:32', '2017-06-26 09:26:58', '100401', '1004', '1', '', '2.50');
INSERT INTO `ac_payments` VALUES ('10', '1', '2017-06-26 09:41:49', '2017-06-26 09:41:49', '2017-06-25 00:00:00', '100401', '1004', '1', '', '39.00');
INSERT INTO `ac_payments` VALUES ('12', '1', '2017-06-26 12:45:16', '2017-06-27 12:43:18', '2017-06-26 12:45:10', '100401', '1004', '1', '', '10.50');
INSERT INTO `ac_payments` VALUES ('13', '1', '2017-06-27 10:10:58', '2017-06-27 10:10:58', '2017-06-27 10:10:56', '100401', '1004', '1', '', '4.00');
INSERT INTO `ac_payments` VALUES ('14', '1', '2017-06-27 13:35:17', '2017-06-27 13:35:17', '2017-06-27 13:35:16', '100301', '1003', '1', '', '500.00');
INSERT INTO `ac_payments` VALUES ('15', '1', '2017-06-27 13:35:32', '2017-06-27 13:35:32', '2017-06-27 13:35:32', '100501', '1005', '1', '', '300.00');
INSERT INTO `ac_payments` VALUES ('16', '1', '2017-06-27 13:35:55', '2017-06-27 13:35:55', '2017-06-27 13:35:55', '100601', '1006', '1', '', '100.00');
INSERT INTO `ac_payments` VALUES ('17', '1', '2017-06-27 13:36:23', '2017-06-27 13:36:23', '2017-06-27 13:36:21', '100801', '1008', '1', '', '500.00');
INSERT INTO `ac_payments` VALUES ('18', '1', '2017-06-28 09:42:39', '2017-06-28 09:42:39', '2017-06-28 00:00:00', '200201', '2002', '2', '111', '500.00');

-- ----------------------------
-- Table structure for `ac_user`
-- ----------------------------
DROP TABLE IF EXISTS `ac_user`;
CREATE TABLE `ac_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `createtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  `lastlogintime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ac_user
-- ----------------------------
INSERT INTO `ac_user` VALUES ('1', 'pgs', 'E10ADC3949BA59ABBE56E057F20F883E', '2017-06-21 15:02:46', '2017-06-21 15:02:44', '2017-06-21 15:02:40');
INSERT INTO `ac_user` VALUES ('2', 'chh', 'E10ADC3949BA59ABBE56E057F20F883E', '2017-06-26 16:19:42', '2017-06-26 16:19:45', '2017-06-26 16:19:47');
INSERT INTO `ac_user` VALUES ('3', 'chg', 'E10ADC3949BA59ABBE56E057F20F883E', '2017-06-27 10:25:54', '2017-06-27 10:25:54', '2017-06-27 10:25:54');
