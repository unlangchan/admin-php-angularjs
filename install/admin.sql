/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50711
Source Host           : localhost:3307
Source Database       : admin

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-10-14 18:51:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `router` varchar(6535) NOT NULL,
  `resource` varchar(6535) NOT NULL,
  `status` int(11) NOT NULL,
  `utime` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES ('0', '超级管理员', '*', '*', '1', '1475039129', '1475039129');

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `role` int(11) NOT NULL,
  `status` int(2) NOT NULL,
  `utime` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  `ip` int(11) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES ('0', 'admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '0', '1', '1475044139', '1473404039', '0');

-- ----------------------------
-- Table structure for resourcies
-- ----------------------------
DROP TABLE IF EXISTS `resourcies`;
CREATE TABLE `resourcies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `controller` varchar(20) NOT NULL,
  `resource` varchar(20) NOT NULL,
  `tbl` varchar(20) NOT NULL,
  `template` varchar(100) NOT NULL,
  `status` int(2) NOT NULL,
  `utime` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resourcies
-- ----------------------------
INSERT INTO `resourcies` VALUES ('1', 'admin', 'roles', 'admin_roles', 'admin/Admin_roles_model', '1', '1473404039', '1473404039');
INSERT INTO `resourcies` VALUES ('2', 'admin', 'users', 'admin_users', 'admin/Admin_users_model', '1', '1473404039', '1473404039');
INSERT INTO `resourcies` VALUES ('3', 'resource', 'templates', 'resource_templates', 'admin/Resource_templates_model', '1', '1473404039', '1473404039');
INSERT INTO `resourcies` VALUES ('4', 'resource', 'resourcies', 'resourcies', 'admin/Resourcies_model', '1', '1473404039', '1473404039');

-- ----------------------------
-- Table structure for resourcies_template
-- ----------------------------
DROP TABLE IF EXISTS `resourcies_template`;
CREATE TABLE `resourcies_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lable` varchar(100) NOT NULL,
  `template` varchar(100) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  `utime` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resourcies_template
-- ----------------------------
INSERT INTO `resourcies_template` VALUES ('1', '推广类型1', 'template/Template_extend_tg1_model', '1', '1473404039', '1473404039');

-- ----------------------------
-- Table structure for token_key
-- ----------------------------
DROP TABLE IF EXISTS `token_key`;
CREATE TABLE `token_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(40) NOT NULL,
  `uid` int(11) NOT NULL,
  `utime` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of token_key
-- ----------------------------
INSERT INTO `token_key` VALUES ('14', '04cgw8osgwss8csc88sgoksc0sg0wk8ckc8wokso', '0', '1476173059', '1476173059');
INSERT INTO `token_key` VALUES ('15', 'ok400wso44w8gsc8c48o4co4w4c0g4c4cg80wkww', '0', '1476266308', '1476266308');
INSERT INTO `token_key` VALUES ('16', 'scwgo00ogc4scgkc84soc8840wwwos4cc0ksk40g', '0', '1476266516', '1476266516');
INSERT INTO `token_key` VALUES ('17', 'ggwcw4ccowowkgc04w448wk0ww4kossc4gwkcwo8', '0', '1476266536', '1476266536');
INSERT INTO `token_key` VALUES ('18', 'sgw0ks4kow400swcoowwk88sc4skcwg04ogkwcsk', '0', '1476321967', '1476321967');
INSERT INTO `token_key` VALUES ('19', 's84404ww4cwswkk0okocs4g8ok0ooks44gog4wgw', '0', '1476321969', '1476321969');
INSERT INTO `token_key` VALUES ('20', 'ok44o888ksc00kg8cswkcos088cs88g4ko00c40c', '0', '1476322050', '1476322050');
INSERT INTO `token_key` VALUES ('21', '00go0ckkg8ks08s4wwoo080go0w88cg4ckgcwgsw', '0', '1476322054', '1476322054');