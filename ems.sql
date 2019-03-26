/*
Navicat MySQL Data Transfer

Source Server         : mydatabase
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : ems

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2018-10-17 12:06:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for assess
-- ----------------------------
DROP TABLE IF EXISTS `assess`;
CREATE TABLE `assess` (
  `assessmenter` varchar(255) NOT NULL COMMENT '评估人',
  `teacherName` varchar(255) DEFAULT NULL COMMENT '被评估的老师',
  `workAssess` varchar(255) DEFAULT NULL COMMENT '工作评价',
  `problemType` varchar(255) DEFAULT NULL COMMENT '问题反馈类型',
  `problemContent` varchar(255) DEFAULT NULL COMMENT '反馈内容',
  `assessTime` datetime DEFAULT NULL COMMENT '评估时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assess
-- ----------------------------
INSERT INTO `assess` VALUES ('阿沙', '李老师', '满意', '提问', '工作评价：满意，没有问题，李老师很优秀的', '2018-09-04 20:17:35');
INSERT INTO `assess` VALUES ('阿沙', '王权海', '满意', '提问', '工作评价：满意，哈哈哈', '2018-09-04 20:30:59');
INSERT INTO `assess` VALUES ('阿沙', '王权海', '满意', '提问', '工作评价：满意，法国德国的', '2018-09-04 20:37:31');
INSERT INTO `assess` VALUES ('阿沙', '王权海', '满意', '提问', '工作评价：满意，共同的广泛豆腐干', '2018-09-04 20:38:36');
INSERT INTO `assess` VALUES ('阿沙', '王权海', '一般', '投诉', '工作评价：一般，fdsgsgfs', '2018-09-05 16:55:10');
INSERT INTO `assess` VALUES ('阿沙', '王权海', '满意', '提问', '工作评价：满意，法国科技发来的国防科大风格的科技股份回扣的浪费国家官方定价功能时间快到了飞机和生理健康的发呆看书了发动机和深刻的浪费时间', '2018-09-06 20:56:20');
INSERT INTO `assess` VALUES ('阿沙', '王权海', '满意', '提问', '工作评价：满意，突然酷狗和部分解释的开发的傻空范德萨几号发的啥感觉fda设计开发代号发的沙发给大家仨开发的哈萨克', '2018-09-06 20:57:52');
INSERT INTO `assess` VALUES ('阿沙', '王权海', '满意', '提问', '工作评价：满意，范德萨的功夫撒发的撒旦飞洒发的', '2018-09-06 20:58:05');
INSERT INTO `assess` VALUES ('阿沙', '王权海', '满意', '提问', '工作评价：满意，回复id是国防科技示范范德萨官方的那是空间里的飞机回家看撒付款的话发货的撒健康', '2018-09-06 20:59:00');
INSERT INTO `assess` VALUES ('阿沙', '王权海', '满意', '提问', '工作评价：满意，trtghfhfgh', '2018-09-07 18:12:51');
INSERT INTO `assess` VALUES ('阿作阿沙', '焦蓉', '满意', '提问', '工作评价：满意，vcbcxvbxcnvcxnx', '2018-09-11 11:19:02');
INSERT INTO `assess` VALUES ('阿作阿沙', '焦蓉', '满意', '提问', '工作评价：满意，999999', '2018-09-12 21:41:44');
INSERT INTO `assess` VALUES ('阿作阿沙', '焦蓉', '满意', '提问', '工作评价：满意，飞机飞过后就发和 ', '2018-09-14 09:43:15');

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `id` int(25) NOT NULL,
  `student` varchar(255) DEFAULT NULL,
  `teacher` varchar(255) DEFAULT NULL,
  `class_id` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------

-- ----------------------------
-- Table structure for collegenotice
-- ----------------------------
DROP TABLE IF EXISTS `collegenotice`;
CREATE TABLE `collegenotice` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `noticeType` varchar(255) DEFAULT NULL COMMENT '信息类型',
  `noticeTitle` varchar(255) DEFAULT NULL COMMENT '通知标题',
  `noticeContext` varchar(255) DEFAULT NULL COMMENT '通知内容',
  `createTime` datetime DEFAULT NULL COMMENT '发布时间',
  `publisher_name` varchar(255) DEFAULT NULL COMMENT '发布者姓名',
  `receiver_id` varchar(255) DEFAULT NULL COMMENT '接收者ID',
  `receiver_name` varchar(255) DEFAULT NULL COMMENT '接收者姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collegenotice
-- ----------------------------
INSERT INTO `collegenotice` VALUES ('1', '校内', '停水通知', '今晚要哦停水停电，请学生们做好心里准备', '2018-09-04 20:17:35', '佳佳', '201513', '阿沙');

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `materialId` varchar(255) DEFAULT NULL COMMENT '材料ID',
  `materialName` varchar(255) DEFAULT NULL COMMENT '材料名',
  `materialType` varchar(255) DEFAULT NULL COMMENT '材料类型',
  `uploadTime` datetime DEFAULT NULL COMMENT '上传时间',
  `downloadTime` datetime DEFAULT NULL COMMENT '下载时间',
  `filePath` varchar(255) DEFAULT NULL COMMENT '文件路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES ('1', '2018090726fb5d6ff4aa4c76af50c742f39ce0a5', '2018090726fb5d6ff4aa4c76af50c742f39ce0a5.docx', '基于SSM框架的学生信息管理系统.docx', '2018-09-07 12:40:59', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\2018090726fb5d6ff4aa4c76af50c742f39ce0a5.docx');
INSERT INTO `material` VALUES ('7', '201809077c13ca9e711045f8b70bb29f01779031', '201809077c13ca9e711045f8b70bb29f01779031.exe', 'navicat.exe', '2018-09-07 13:42:13', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\201809077c13ca9e711045f8b70bb29f01779031.exe');
INSERT INTO `material` VALUES ('8', '20180907eb306e476958416b937007f45b0f72e4', '20180907eb306e476958416b937007f45b0f72e4.exe', 'KuGou.exe', '2018-09-07 13:42:49', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180907eb306e476958416b937007f45b0f72e4.exe');
INSERT INTO `material` VALUES ('9', '20180907766e1a621969440e9074fb642dcc37ed', '20180907766e1a621969440e9074fb642dcc37ed.ppt', '第2章　数据模型.ppt', '2018-09-07 13:43:25', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180907766e1a621969440e9074fb642dcc37ed.ppt');
INSERT INTO `material` VALUES ('10', '20180907da0ea8931d554818a4eda997c6e4db26', '20180907da0ea8931d554818a4eda997c6e4db26.ppt', '第4章  关系数据库方法a.ppt', '2018-09-07 13:43:34', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180907da0ea8931d554818a4eda997c6e4db26.ppt');
INSERT INTO `material` VALUES ('11', '20180907be61670591794f6ea0a1fdd72c5813b2', '20180907be61670591794f6ea0a1fdd72c5813b2.ppt', '第5章  关系数据库的结构化查询语言SQL.ppt', '2018-09-07 13:43:43', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180907be61670591794f6ea0a1fdd72c5813b2.ppt');
INSERT INTO `material` VALUES ('12', '201809078b5e6863fa424f69841433a6dbf187b9', '201809078b5e6863fa424f69841433a6dbf187b9.pdf', 'PowerDesigner实验指导书_繁体.pdf', '2018-09-07 13:43:54', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\201809078b5e6863fa424f69841433a6dbf187b9.pdf');
INSERT INTO `material` VALUES ('13', '20180907b334257728f4421088ca0b61dc107865', '20180907b334257728f4421088ca0b61dc107865.ppt', '第6章  关系模式的规范化理论(萨师煊版).ppt', '2018-09-07 13:45:39', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180907b334257728f4421088ca0b61dc107865.ppt');
INSERT INTO `material` VALUES ('14', '20180907635810ef4a254369a2fe162acc0d2275', '20180907635810ef4a254369a2fe162acc0d2275.pdf', 'JavaScript和jQuery实战手册(原书第2版).pdf', '2018-09-07 13:45:53', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180907635810ef4a254369a2fe162acc0d2275.pdf');
INSERT INTO `material` VALUES ('15', '2018090736101cbc6e164141953936335a1d2041', '2018090736101cbc6e164141953936335a1d2041.doc', 'mysql安装.doc', '2018-09-07 13:46:22', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\2018090736101cbc6e164141953936335a1d2041.doc');
INSERT INTO `material` VALUES ('16', '201809072b471a8002374aacbebd272078a35a64', '201809072b471a8002374aacbebd272078a35a64.doc', 'mysql左右连接内连接查询.doc', '2018-09-07 13:46:30', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\201809072b471a8002374aacbebd272078a35a64.doc');
INSERT INTO `material` VALUES ('17', '20180907b72dc7ce33d648c2bc66b683614bf5e4', '20180907b72dc7ce33d648c2bc66b683614bf5e4.doc', '数据库备份.doc', '2018-09-07 13:46:37', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180907b72dc7ce33d648c2bc66b683614bf5e4.doc');
INSERT INTO `material` VALUES ('18', '2018090780436666328847b2bd3741c7da9568b4', '2018090780436666328847b2bd3741c7da9568b4.doc', '数据库查询练习.doc', '2018-09-07 13:46:45', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\2018090780436666328847b2bd3741c7da9568b4.doc');
INSERT INTO `material` VALUES ('19', '201809077e01d9bc1bf646ea8e5e40a451f9a926', '201809077e01d9bc1bf646ea8e5e40a451f9a926.doc', '数据库-常用函数.doc', '2018-09-07 13:46:54', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\201809077e01d9bc1bf646ea8e5e40a451f9a926.doc');
INSERT INTO `material` VALUES ('20', '20180907a1a0141c4df3440dac7c5cb604d51d94', '20180907a1a0141c4df3440dac7c5cb604d51d94.doc', '数据库-触发器.doc', '2018-09-07 13:47:03', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180907a1a0141c4df3440dac7c5cb604d51d94.doc');
INSERT INTO `material` VALUES ('21', '20180907367bc7d166b341f88821e961d80607d8', '20180907367bc7d166b341f88821e961d80607d8.doc', '数据库-存储过程.doc', '2018-09-07 13:47:10', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180907367bc7d166b341f88821e961d80607d8.doc');
INSERT INTO `material` VALUES ('22', '20180907ac42781da1f84d0daf8b53630ba782ea', '20180907ac42781da1f84d0daf8b53630ba782ea.doc', '数据库-基础.doc', '2018-09-07 13:47:18', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180907ac42781da1f84d0daf8b53630ba782ea.doc');
INSERT INTO `material` VALUES ('23', '20180908546765cdb7064240aa6c23bc730b02b6', '20180908546765cdb7064240aa6c23bc730b02b6.doc', '数据库-索引.doc', '2018-09-08 16:01:36', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180908546765cdb7064240aa6c23bc730b02b6.doc');
INSERT INTO `material` VALUES ('24', '2018090877b3d2f39d1047f5bc83c5b1b6fecdfd', '2018090877b3d2f39d1047f5bc83c5b1b6fecdfd.doc', '数据库-建表规则.doc', '2018-09-08 16:01:44', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\2018090877b3d2f39d1047f5bc83c5b1b6fecdfd.doc');
INSERT INTO `material` VALUES ('25', '2018090830da30ee36704447bebeed51918eeecf', '2018090830da30ee36704447bebeed51918eeecf.txt', '练习1.txt', '2018-09-08 16:01:57', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\2018090830da30ee36704447bebeed51918eeecf.txt');
INSERT INTO `material` VALUES ('26', '2018090880e22c928153485e89bbc9c7fd41d9d7', '2018090880e22c928153485e89bbc9c7fd41d9d7.txt', '练习1代码.txt', '2018-09-08 16:02:04', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\2018090880e22c928153485e89bbc9c7fd41d9d7.txt');
INSERT INTO `material` VALUES ('27', '20180908df2ce9fe706b498c91789e7bfba5cc01', '20180908df2ce9fe706b498c91789e7bfba5cc01.txt', '练习2.txt', '2018-09-08 16:02:12', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180908df2ce9fe706b498c91789e7bfba5cc01.txt');
INSERT INTO `material` VALUES ('28', '20180908408dc97025364a0fbfc5d281e88e8121', '20180908408dc97025364a0fbfc5d281e88e8121.sql', 'testone.sql', '2018-09-08 16:03:28', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180908408dc97025364a0fbfc5d281e88e8121.sql');
INSERT INTO `material` VALUES ('29', '2018090801ec1905f3f7430cae6569e818d8cbfa', '2018090801ec1905f3f7430cae6569e818d8cbfa.txt', '练习3.txt', '2018-09-08 16:05:05', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\2018090801ec1905f3f7430cae6569e818d8cbfa.txt');
INSERT INTO `material` VALUES ('30', '20180908e5c28ec332d04ed187b6baf69f44189d', '20180908e5c28ec332d04ed187b6baf69f44189d.ppt', '第1章 概述.ppt', '2018-09-08 16:05:54', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180908e5c28ec332d04ed187b6baf69f44189d.ppt');
INSERT INTO `material` VALUES ('31', '201809081079bb6d70d24fa3b6bff1282cadc578', '201809081079bb6d70d24fa3b6bff1282cadc578.ppt', '第2章 移动信道.ppt', '2018-09-08 16:05:59', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\201809081079bb6d70d24fa3b6bff1282cadc578.ppt');
INSERT INTO `material` VALUES ('32', '201809087cf8a94b3e9148b79057f472ab1706ff', '201809087cf8a94b3e9148b79057f472ab1706ff.ppt', '第3章 调制技术.ppt', '2018-09-08 16:06:04', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\201809087cf8a94b3e9148b79057f472ab1706ff.ppt');
INSERT INTO `material` VALUES ('33', '2018090858fd9514d7944e008c4caf7aa2a32cc0', '2018090858fd9514d7944e008c4caf7aa2a32cc0.ppt', '第4代移动通信系统的关键技术.ppt', '2018-09-08 16:06:09', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\2018090858fd9514d7944e008c4caf7aa2a32cc0.ppt');
INSERT INTO `material` VALUES ('34', '2018090813edb27c23fe48c0a7778a7b608b3332', '2018090813edb27c23fe48c0a7778a7b608b3332.ppt', '第5章 语音编码.ppt', '2018-09-08 16:06:14', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\2018090813edb27c23fe48c0a7778a7b608b3332.ppt');
INSERT INTO `material` VALUES ('35', '20180908fa9f39aad21d4701b6d3dc13031779d1', '20180908fa9f39aad21d4701b6d3dc13031779d1.ppt', '第6章 组网技术.ppt', '2018-09-08 16:06:19', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180908fa9f39aad21d4701b6d3dc13031779d1.ppt');
INSERT INTO `material` VALUES ('36', '2018090838c31ae32fce495cbcfdfb39c9327db7', '2018090838c31ae32fce495cbcfdfb39c9327db7.ppt', '第8章 数字蜂窝移动通信系统（CDMA）.ppt', '2018-09-08 16:06:25', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\2018090838c31ae32fce495cbcfdfb39c9327db7.ppt');
INSERT INTO `material` VALUES ('37', '20180908e8a461ce468f4d9eb2ad537fa61f5c0f', '20180908e8a461ce468f4d9eb2ad537fa61f5c0f.ppt', '第9章 第三代移动通信系统.ppt', '2018-09-08 16:06:30', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180908e8a461ce468f4d9eb2ad537fa61f5c0f.ppt');
INSERT INTO `material` VALUES ('38', '20180908daf99754cf8e48a38f0a7af6d233d385', '20180908daf99754cf8e48a38f0a7af6d233d385.ppt', '第10章 移动数据传输.ppt', '2018-09-08 16:06:34', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180908daf99754cf8e48a38f0a7af6d233d385.ppt');
INSERT INTO `material` VALUES ('39', '201809084cb30e70bae24e66b32a78ab1b78ca79', '201809084cb30e70bae24e66b32a78ab1b78ca79.ppt', '第11章 移动通信展望——个人通信.ppt', '2018-09-08 16:06:39', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\201809084cb30e70bae24e66b32a78ab1b78ca79.ppt');
INSERT INTO `material` VALUES ('40', '20180908a5cd81c075264a40961105188bd6155f', '20180908a5cd81c075264a40961105188bd6155f.ppt', '扩频通信技术简介.ppt', '2018-09-08 16:06:45', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180908a5cd81c075264a40961105188bd6155f.ppt');
INSERT INTO `material` VALUES ('41', '20180908b2a1a26bcfda4efe8d82cb22dee6edde', '20180908b2a1a26bcfda4efe8d82cb22dee6edde.ppt', '数字蜂窝移动通信系统（GSM）实战.ppt', '2018-09-08 16:06:51', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180908b2a1a26bcfda4efe8d82cb22dee6edde.ppt');
INSERT INTO `material` VALUES ('42', '201809080b7ade629790431395594ca1498615ee', '201809080b7ade629790431395594ca1498615ee.doc', '移动通信技术实验报告模板（2015级）.doc', '2018-09-08 16:06:59', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\201809080b7ade629790431395594ca1498615ee.doc');
INSERT INTO `material` VALUES ('43', '2018090880e7190325504d9fa3cc9a0035dd53d5', '2018090880e7190325504d9fa3cc9a0035dd53d5.html', 'ajax.html', '2018-09-08 18:09:57', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\2018090880e7190325504d9fa3cc9a0035dd53d5.html');
INSERT INTO `material` VALUES ('44', '201809084a35de809ff4452da652b85e4e80a2da', '201809084a35de809ff4452da652b85e4e80a2da.js', 'ajax.js', '2018-09-08 18:10:02', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\201809084a35de809ff4452da652b85e4e80a2da.js');
INSERT INTO `material` VALUES ('45', '20180908d1f25e460bc54704b17412336c378b8c', '20180908d1f25e460bc54704b17412336c378b8c.html', 'CustomEvent.html', '2018-09-08 18:10:07', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180908d1f25e460bc54704b17412336c378b8c.html');
INSERT INTO `material` VALUES ('46', '201809085877416961a8451990a18e229eccc6df', '201809085877416961a8451990a18e229eccc6df.js', 'Ease.js', '2018-09-08 18:10:15', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\201809085877416961a8451990a18e229eccc6df.js');
INSERT INTO `material` VALUES ('47', '20180908bbb61e54049f4ffcb22e1c5942af5dae', '20180908bbb61e54049f4ffcb22e1c5942af5dae.html', 'CustomEvent.html', '2018-09-08 18:10:19', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180908bbb61e54049f4ffcb22e1c5942af5dae.html');
INSERT INTO `material` VALUES ('48', '20180908a6cd088e5bc148c6803e361fddff2c46', '20180908a6cd088e5bc148c6803e361fddff2c46.js', 'fade.js', '2018-09-08 18:10:24', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180908a6cd088e5bc148c6803e361fddff2c46.js');
INSERT INTO `material` VALUES ('49', '201809085d40e71cbc274ae99400d2f3846f8262', '201809085d40e71cbc274ae99400d2f3846f8262.js', 'easeljs-0.8.2.min.js', '2018-09-08 18:10:28', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\201809085d40e71cbc274ae99400d2f3846f8262.js');
INSERT INTO `material` VALUES ('50', '20180908677e82701abd4582a5f15fe56d67a84f', '20180908677e82701abd4582a5f15fe56d67a84f.html', 'EventMethod.html', '2018-09-08 18:10:32', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180908677e82701abd4582a5f15fe56d67a84f.html');
INSERT INTO `material` VALUES ('51', '20180908cc3aeb273e294308a66d5379f8f5a972', '20180908cc3aeb273e294308a66d5379f8f5a972.js', 'easeljs-0.8.2.min.js', '2018-09-08 18:10:36', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180908cc3aeb273e294308a66d5379f8f5a972.js');
INSERT INTO `material` VALUES ('52', '201809086bb4d698f17047fe86e0b5c7fe57d4af', '201809086bb4d698f17047fe86e0b5c7fe57d4af.js', 'Ease.js', '2018-09-08 18:10:40', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\201809086bb4d698f17047fe86e0b5c7fe57d4af.js');
INSERT INTO `material` VALUES ('53', '20180908bc4a77f0bd0741db89fe5c1e773a8e6c', '20180908bc4a77f0bd0741db89fe5c1e773a8e6c.html', 'EventMethod.html', '2018-09-08 18:10:45', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180908bc4a77f0bd0741db89fe5c1e773a8e6c.html');
INSERT INTO `material` VALUES ('54', '20180908d725bebe14ba41ebb48b30fd15923395', '20180908d725bebe14ba41ebb48b30fd15923395.js', 'jquery-2.2.1.min.js', '2018-09-08 18:10:49', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180908d725bebe14ba41ebb48b30fd15923395.js');
INSERT INTO `material` VALUES ('55', '201809084cc618b3687441aa9ee2f37bf3931fb0', '201809084cc618b3687441aa9ee2f37bf3931fb0.html', 'jQueryUI.html', '2018-09-08 18:10:57', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\201809084cc618b3687441aa9ee2f37bf3931fb0.html');
INSERT INTO `material` VALUES ('56', '20180908006fdbcfc4a349bba86f9c338938c705', '20180908006fdbcfc4a349bba86f9c338938c705.css', 'jquery-ui.min.css', '2018-09-08 18:11:03', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180908006fdbcfc4a349bba86f9c338938c705.css');
INSERT INTO `material` VALUES ('57', '201809080457baac20184c2e982f97df25b1e9bd', '201809080457baac20184c2e982f97df25b1e9bd.JPG', 'IMG_1285.JPG', '2018-09-08 22:07:12', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\201809080457baac20184c2e982f97df25b1e9bd.JPG');
INSERT INTO `material` VALUES ('58', '201809090d8e3b8b83b64d11b9a157cd54b05280', '201809090d8e3b8b83b64d11b9a157cd54b05280.jpg', 'bandicam 2018-06-11 09-33-10-552.jpg', '2018-09-09 16:16:07', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\201809090d8e3b8b83b64d11b9a157cd54b05280.jpg');
INSERT INTO `material` VALUES ('59', '2018091071dd9788ba6b4617ad1c76bb0b4f7cb4', '2018091071dd9788ba6b4617ad1c76bb0b4f7cb4.chm', 'CSS 参考手册V4.2.3.chm', '2018-09-10 22:01:33', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\2018091071dd9788ba6b4617ad1c76bb0b4f7cb4.chm');
INSERT INTO `material` VALUES ('60', '201809104e32deaefa1a4dd1bd0877823ee51492', '201809104e32deaefa1a4dd1bd0877823ee51492.chw', 'CSS 参考手册V4.2.3.chw', '2018-09-10 22:01:37', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\201809104e32deaefa1a4dd1bd0877823ee51492.chw');
INSERT INTO `material` VALUES ('61', '20180910ceb24aefeb82451e9b56cd1eaf349f27', '20180910ceb24aefeb82451e9b56cd1eaf349f27.chm', 'HTML4.0简体中文手册.chm', '2018-09-10 22:01:51', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180910ceb24aefeb82451e9b56cd1eaf349f27.chm');
INSERT INTO `material` VALUES ('62', '201809100e2004174abf4b4ba3281e153e70e011', '201809100e2004174abf4b4ba3281e153e70e011.chm', 'JDK 1.6 API.chm', '2018-09-10 22:02:02', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\201809100e2004174abf4b4ba3281e153e70e011.chm');
INSERT INTO `material` VALUES ('63', '20180910a1c9bb858b3c44479df08ba69d66d8fc', '20180910a1c9bb858b3c44479df08ba69d66d8fc.chm', 'JDK 1.8 API.chm', '2018-09-10 22:02:09', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180910a1c9bb858b3c44479df08ba69d66d8fc.chm');
INSERT INTO `material` VALUES ('64', '20180910dd28cd1fc2b042e8ba358b0b5d75b136', '20180910dd28cd1fc2b042e8ba358b0b5d75b136.chm', '微软JavaScript手册js.chm', '2018-09-10 22:02:22', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180910dd28cd1fc2b042e8ba358b0b5d75b136.chm');
INSERT INTO `material` VALUES ('65', '20180910b48f99021f3a4310b688f14ca507babc', '20180910b48f99021f3a4310b688f14ca507babc.doc', 'DSP实验报告.doc', '2018-09-10 22:02:54', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180910b48f99021f3a4310b688f14ca507babc.doc');
INSERT INTO `material` VALUES ('66', '20180910a23742a391a54fdeb82a20172fc7bd3a', '20180910a23742a391a54fdeb82a20172fc7bd3a.doc', '就业指导报告封皮.doc', '2018-09-10 22:03:01', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180910a23742a391a54fdeb82a20172fc7bd3a.doc');
INSERT INTO `material` VALUES ('67', '20180910720e3dfd6d144a919e586c918e6781a4', '20180910720e3dfd6d144a919e586c918e6781a4.doc', '信息理论与编码实验指导书(1).doc', '2018-09-10 22:03:06', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180910720e3dfd6d144a919e586c918e6781a4.doc');
INSERT INTO `material` VALUES ('68', '2018091035981b88d838418e98046252870f7686', '2018091035981b88d838418e98046252870f7686.docx', '单片机.docx', '2018-09-10 22:03:12', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\2018091035981b88d838418e98046252870f7686.docx');
INSERT INTO `material` VALUES ('69', '2018091072439cb507fe482ab9cdbf8f1869367e', '2018091072439cb507fe482ab9cdbf8f1869367e.docx', '光纤通信.docx', '2018-09-10 22:03:15', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\2018091072439cb507fe482ab9cdbf8f1869367e.docx');
INSERT INTO `material` VALUES ('70', '20180910f810391342f042a1a35a273621c0b402', '20180910f810391342f042a1a35a273621c0b402.pdf', '数据库原理实验教材-简体.pdf', '2018-09-10 22:03:21', null, 'D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\20180910f810391342f042a1a35a273621c0b402.pdf');
INSERT INTO `material` VALUES ('71', '2018091224a89ff85897425b800655f4b51af0fc', '2018091224a89ff85897425b800655f4b51af0fc.zip', 'PanDownload_v1.5.4.zip', '2018-09-12 21:30:42', null, 'C:\\Soft\\apache-tomcat-8.0.28-windows-x64\\apache-tomcat-8.0.28\\webapps\\EducationalManagementSystem\\uploadFile\\2018091224a89ff85897425b800655f4b51af0fc.zip');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `messageTitle` varchar(255) DEFAULT NULL COMMENT '信息主题',
  `messageType` varchar(255) DEFAULT NULL COMMENT '信息类型',
  `messageContext` varchar(255) DEFAULT NULL COMMENT '信息内容',
  `createTime` datetime DEFAULT NULL COMMENT '发布时间',
  `messager` varchar(255) DEFAULT NULL COMMENT '发布者',
  `messageReceiver` varchar(255) DEFAULT NULL COMMENT '接收者',
  `receiver_id` varchar(255) DEFAULT NULL COMMENT '接收者工号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('5', 'hello', '意见', '哈哈哈哈哈啊哈哈哈哈哈哈哈哈哈啊哈', '2018-09-06 19:44:38', '阿沙', '王权海', '201513070120');
INSERT INTO `message` VALUES ('6', '我要学习', '提问', '我不知道怎么学习', '2018-09-06 20:10:06', '阿沙', '王权海', '201513070120');
INSERT INTO `message` VALUES ('7', '我要看书', '提问', '不知道看什么书', '2018-09-06 20:12:09', '阿沙', '王权海', '201513070120');
INSERT INTO `message` VALUES ('13', '绝对是', '邮件', '烦得很给高富帅的空间发动机实况功夫', '2018-09-13 19:38:04', '阿作阿沙', '焦蓉', '201513070120');
INSERT INTO `message` VALUES ('14', '888888', '邮件', '一天日独立和规范断开连接功放的韩国', '2018-09-14 09:43:55', '阿作阿沙', '焦蓉', '201513070120');

-- ----------------------------
-- Table structure for mybook
-- ----------------------------
DROP TABLE IF EXISTS `mybook`;
CREATE TABLE `mybook` (
  `id` int(128) NOT NULL,
  `bookName` varchar(255) DEFAULT NULL COMMENT '书名',
  `bookTime` datetime DEFAULT NULL COMMENT '发书日期',
  `student_name` varchar(255) DEFAULT NULL COMMENT '学生姓名',
  `student_id` varchar(255) DEFAULT NULL COMMENT '学生学号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mybook
-- ----------------------------
INSERT INTO `mybook` VALUES ('1', '物理', '2018-09-04 20:17:35', '阿沙', '201513070120');
INSERT INTO `mybook` VALUES ('2', '化学', '2018-09-04 20:17:35', '阿沙', '201513070120');
INSERT INTO `mybook` VALUES ('3', '英语', '2018-09-04 20:17:35', '阿沙', '201513070120');
INSERT INTO `mybook` VALUES ('4', '高等数学', '2018-09-04 20:17:35', '阿沙', '201513070120');
INSERT INTO `mybook` VALUES ('5', '微机原理', '2018-09-04 20:17:03', '阿沙', '201513070120');
INSERT INTO `mybook` VALUES ('6', '数据库技术', '2018-09-04 20:17:03', '阿沙', '201513070120');
INSERT INTO `mybook` VALUES ('7', '通信原理', '2018-09-04 20:17:03', '阿沙', '201513070120');
INSERT INTO `mybook` VALUES ('8', '概率论与数理统计', '2018-09-04 20:17:03', '阿沙', '201513070120');

-- ----------------------------
-- Table structure for myexamination
-- ----------------------------
DROP TABLE IF EXISTS `myexamination`;
CREATE TABLE `myexamination` (
  `id` int(255) NOT NULL,
  `examinationName` varchar(255) DEFAULT NULL COMMENT '报考科目',
  `examinationNumber` int(128) DEFAULT NULL COMMENT '报考次数',
  `price` varchar(128) DEFAULT NULL COMMENT '单价',
  `combined` varchar(255) DEFAULT NULL COMMENT '合计',
  `total` varchar(255) DEFAULT NULL COMMENT '总价',
  `createTime` datetime DEFAULT NULL COMMENT '报考时间',
  `examinationTime` datetime DEFAULT NULL COMMENT '考试时间',
  `student_id` varchar(255) DEFAULT NULL COMMENT '学生学号',
  `student_name` varchar(255) DEFAULT NULL COMMENT '学生姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myexamination
-- ----------------------------
INSERT INTO `myexamination` VALUES ('1', '英语四级', '2', '25', '50', '50', '2018-09-04 20:17:35', null, '201513070120', '阿沙');
INSERT INTO `myexamination` VALUES ('2', '计算机二级', '1', '80', '80', '130', '2018-09-04 20:17:35', null, '201513070120', '阿沙');

-- ----------------------------
-- Table structure for myfinancial
-- ----------------------------
DROP TABLE IF EXISTS `myfinancial`;
CREATE TABLE `myfinancial` (
  `id` int(128) NOT NULL,
  `amountPayable` varchar(255) DEFAULT NULL COMMENT '应付金额',
  `realPay` varchar(255) DEFAULT NULL COMMENT '实付金额',
  `arrearage` varchar(255) DEFAULT NULL COMMENT '欠缴费用',
  `payCount` int(255) DEFAULT NULL COMMENT '缴费次数',
  `shouldPayTotal` varchar(255) DEFAULT NULL COMMENT '应缴总费用',
  `realPayTotal` varchar(255) DEFAULT NULL COMMENT '实付总费用',
  `arrearageTotal` varchar(255) DEFAULT NULL COMMENT '欠费总费用',
  `payTime` datetime DEFAULT NULL COMMENT '缴费时间',
  `isSelfExamination` int(3) DEFAULT NULL COMMENT '是否是自考',
  `student_id` varchar(255) DEFAULT NULL COMMENT '学生学号',
  `student_name` varchar(255) DEFAULT NULL COMMENT '学生姓名',
  `payTotalCount` int(255) DEFAULT NULL COMMENT '总缴费次数',
  `arrearageName` varchar(255) DEFAULT NULL COMMENT '欠费项目名称',
  `selfExaminationName` varchar(255) DEFAULT NULL COMMENT '自考项目名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myfinancial
-- ----------------------------
INSERT INTO `myfinancial` VALUES ('0', '8000', '25', '', '2', '6000', '5000', '', '2018-09-04 20:17:35', '1', '201513070120', '阿沙', '2', ' 论文答辩费 ', '英语四级');
INSERT INTO `myfinancial` VALUES ('1', '6000', '80', '', '1', '0', '0', '', '2018-09-04 20:17:35', '0', '201513070120', '阿沙', '0', '毕业工本费', '计算机二级');

-- ----------------------------
-- Table structure for objection
-- ----------------------------
DROP TABLE IF EXISTS `objection`;
CREATE TABLE `objection` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `mtitle` varchar(255) DEFAULT NULL COMMENT '异议标题',
  `objectionContext` varchar(255) DEFAULT NULL COMMENT '异议内容',
  `objectionType` varchar(255) DEFAULT NULL COMMENT '异议类型',
  `createTime` datetime DEFAULT NULL COMMENT '添加时间',
  `status` varchar(255) DEFAULT NULL COMMENT '状态',
  `student_id` varchar(255) DEFAULT NULL COMMENT '学生学号',
  `student_name` varchar(255) DEFAULT NULL COMMENT '学生姓名',
  `objectionName` varchar(255) DEFAULT NULL COMMENT '异议项目名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of objection
-- ----------------------------
INSERT INTO `objection` VALUES ('9', '缴费有异议', '学费有问题', '提问', '2018-09-06 18:47:15', '已处理', '201513070120', '阿沙', null);
INSERT INTO `objection` VALUES ('10', '缴费有异议', '数目不准确啊', '提问', '2018-09-06 22:28:30', '正在处理', '201513070120', '阿沙', '英语四级');
INSERT INTO `objection` VALUES ('11', '缴费有异议', '没交啊啊', '提问', '2018-09-07 18:30:42', '正在处理', '201513070120', '阿沙', '英语四级');
INSERT INTO `objection` VALUES ('12', '缴费有异议', '更符合换购吗韩国和发的你的', '提问', '2018-09-09 17:02:46', '正在处理', '201513070120', '阿作阿沙', '英语四级');
INSERT INTO `objection` VALUES ('13', '缴费有异议', '官方v冰女出你从哪冒出', '提问', '2018-09-09 17:04:05', '正在处理', '201513070120', '阿作阿沙', '英语四级');
INSERT INTO `objection` VALUES ('14', '缴费有异议', 'bvbcnbncvbn', '提问', '2018-09-10 08:41:34', '正在处理', '201513070120', '阿作阿沙', '英语四级');
INSERT INTO `objection` VALUES ('15', '缴费有异议', '666666666666', '提问', '2018-09-12 21:41:59', '正在处理', '201513070120', '阿作阿沙', '英语四级');
INSERT INTO `objection` VALUES ('16', '缴费有异议', '发多少时光的合法的十分士大夫公司', '提问', '2018-09-14 09:44:22', '正在处理', '201513070120', '阿作阿沙', '英语四级');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `id` int(128) NOT NULL,
  `bookName` varchar(255) DEFAULT NULL COMMENT '科目名称',
  `score` int(128) DEFAULT NULL COMMENT '得分',
  `student_name` varchar(255) DEFAULT NULL COMMENT '学生姓名',
  `student_id` varchar(255) DEFAULT NULL COMMENT '学生学号',
  `code` varchar(255) DEFAULT NULL COMMENT '课程代码',
  `createTime` datetime DEFAULT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES ('1', '化学', '85', '阿沙', '201513070120', '000596', '2018-09-04 20:17:35');
INSERT INTO `score` VALUES ('2', '物理', '90', '阿沙', '201513070120', '005132', '2018-09-04 20:17:35');
INSERT INTO `score` VALUES ('3', '高等数学', '95', '阿沙', '201513070120', '032651', '2018-09-04 20:17:35');
INSERT INTO `score` VALUES ('4', '英语', '86', '阿沙', '201513070120', '056841', '2018-09-04 20:17:35');
INSERT INTO `score` VALUES ('5', '微机原理', '88', '阿沙', '201513070120', '089565', '2018-09-04 20:17:35');
INSERT INTO `score` VALUES ('6', '数据库技术', '100', '阿沙', '201513070120', '059565', '2018-09-04 20:17:35');
INSERT INTO `score` VALUES ('7', '通信原来', '79', '阿沙', '201513070120', '099566', '2018-09-04 20:17:35');
INSERT INTO `score` VALUES ('8', '概率论与数理统计', '75', '阿沙', '201513070120', '626566', '2018-09-04 20:17:35');
INSERT INTO `score` VALUES ('9', 'DSP技术', '95', '阿沙', '201513070120', '464566', '2018-09-04 20:17:35');
INSERT INTO `score` VALUES ('10', '毛概', '70', '阿沙', '201513070120', '965655', '2018-09-04 20:17:35');
INSERT INTO `score` VALUES ('11', '地理', '87', '阿沙', '201513070120', '987546', '2018-09-04 20:17:35');
INSERT INTO `score` VALUES ('12', '日语', '95', '阿沙', '201513070120', '646565', '2018-09-04 20:17:35');
INSERT INTO `score` VALUES ('13', '德语', '100', '阿沙', '201513070120', '964659', '2018-09-04 20:17:35');
INSERT INTO `score` VALUES ('14', '移动通信技术', '68', '阿沙', '201513070120', '984654', '2018-09-04 20:17:35');
INSERT INTO `score` VALUES ('15', '光纤通信', '60', '阿沙', '201513070120', '989465', '2018-09-04 20:17:35');
INSERT INTO `score` VALUES ('16', 'FPGA', '95', '阿沙', '201513070120', '978444', '2018-09-04 20:17:35');
INSERT INTO `score` VALUES ('17', '射频通信', '86', '阿沙', '201513070120', '989465', '2018-09-04 20:17:35');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(255) NOT NULL COMMENT '学号',
  `student_idcard` varchar(255) DEFAULT NULL COMMENT '学生身份证',
  `student_name` varchar(255) DEFAULT NULL COMMENT '学生姓名',
  `student_sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `student_class` varchar(255) DEFAULT NULL COMMENT '班级',
  `student_age` varchar(255) DEFAULT NULL COMMENT '年龄',
  `student_college` varchar(255) DEFAULT NULL COMMENT '报考大学',
  `student_profession` varchar(255) DEFAULT NULL COMMENT '专业',
  `password` varchar(255) DEFAULT NULL,
  `confirmpassword` varchar(255) DEFAULT NULL,
  `baomingTime` varchar(255) DEFAULT NULL COMMENT '报名时间',
  `baokaoCengci` varchar(255) DEFAULT NULL COMMENT '报考层次',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `baokaoLeibie` varchar(255) DEFAULT NULL COMMENT '包报考类别',
  `firstProfession` varchar(255) DEFAULT NULL COMMENT '原专业',
  `status` varchar(255) DEFAULT NULL COMMENT '状态',
  `phone2` varchar(255) DEFAULT NULL COMMENT '第二联系号码',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `address` varchar(255) CHARACTER SET utf16 DEFAULT NULL COMMENT '联系地址',
  `kaoJihao` varchar(255) DEFAULT NULL COMMENT '考籍号',
  `qq` varchar(255) DEFAULT NULL COMMENT '个人qq',
  `banjiqq` varchar(255) DEFAULT NULL COMMENT '班级qq',
  `teacher` varchar(255) DEFAULT NULL COMMENT '辅导员老师',
  `teacherPhone` varchar(255) DEFAULT NULL COMMENT '辅导员电话',
  `college_id` varchar(255) DEFAULT NULL COMMENT '所在学院',
  `student_header` varchar(255) DEFAULT NULL COMMENT '学生头像',
  `student_class_name` varchar(255) DEFAULT NULL COMMENT '班级名称',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('37', '201513070120', '513436199410054012', '阿作阿沙', '男', '2015130701', '24', '成都理工大学', '通信工程', '054012', '054012', '2018-09-01', '本科', '15894655665', '自考', '通信工程', '在读', '15283403085', '1374018377@qq.com', '成都理工大学松林2宿舍128号', '68798468498', '1374018377', '486652874', '焦蓉', '13897456562', '201513', 'userHeader/20181016755eae65a09d44888dada575be33a7ba.jpg', '2015级通信工程一班');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `class_id` varchar(255) DEFAULT NULL,
  `teachBook_name` varchar(255) DEFAULT NULL,
  `teacher_name` varchar(255) DEFAULT NULL,
  `age` int(25) DEFAULT NULL,
  `teacher_sex` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
