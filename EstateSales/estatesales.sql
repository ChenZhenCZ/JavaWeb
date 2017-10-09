/*
Navicat MySQL Data Transfer

Source Server         : saleHouse
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : estatesales

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-09-05 14:53:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(50) NOT NULL,
  `adminPwd` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '1111');

-- ----------------------------
-- Table structure for t_activity
-- ----------------------------
DROP TABLE IF EXISTS `t_activity`;
CREATE TABLE `t_activity` (
  `id` varchar(36) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `content` text,
  `logo` varchar(500) DEFAULT NULL,
  `buildings_id` varchar(36) DEFAULT NULL,
  `a_status` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_activity
-- ----------------------------
INSERT INTO `t_activity` VALUES ('402880cf5deed43d015deef48c900000', '管理员活动测试', '2017-07-06 00:00:00', '2017-08-31 00:00:00', '赣州', '赣州宏图科技', '/EstateSales/attached/agency/2170983842208821.jpg', null, '激活');
INSERT INTO `t_activity` VALUES ('402880cf5df2af61015df2deed620003', 'fdsfds', '2017-08-18 00:00:00', '2017-08-26 00:00:00', 'dfsdf', 'dsfdsf', '/EstateSales/attached/agency/2170991614305672.jpg', null, '冻结');
INSERT INTO `t_activity` VALUES ('402880f35dc0e3dc015dc0e463980000', '样板房盛大公开1', '2017-08-01 00:00:00', '2017-08-05 00:00:00', '文清路天缘公寓', '自从8月1日项目营销中心开放之后，天缘公寓这个楼盘瞬间在福州楼市火爆起来，成为当之无愧的“网红”楼盘。', '/EstateSales/attached/agency/2213338890166888.jpg', '402880f35da5a7c5015da5a9ca260000', '激活');
INSERT INTO `t_activity` VALUES ('402880f35dde1f7a015dde26ff3f0000', '样板房盛大公开', '2017-08-02 00:00:00', '2017-08-04 00:00:00', '文清路天缘公寓', '自从6月18日项目营销中心开放之后，福州红星大都汇这个楼盘瞬间在福州楼市火爆起来，成为当之无愧的“网红”楼盘。', '/EstateSales/attached/agency/2168889682801412.jpg', '402880f35da70ba2015da72d1b590001', '冻结');
INSERT INTO `t_activity` VALUES ('alsdklkj546546', '金九”开局好兆头 本周末宝山1盘摇号入市', '2017-09-07 00:00:00', '2017-09-16 00:00:00', '赣州市', '几乎所有房源都有降价，还有部分急用钱的房主在交易时会进一步降价，降价幅度可达50万元。”北京市海淀区八一学校附近的房产中介对中国证券报记者说，与北京“3·17”新政前相比，附近住宅包括学区住房每平方米平均降价一两万元。业内人士表示，包括学区住房在内的住宅价格逐渐回归合理，四季度北京房价或继续下降。随着租购同权的落实，房地产市场将更趋平稳。', '/EstateSales/attached/agency/2168895929052442.jpg', '402880f35dac1c66015dac3dc1730000', '冻结');

-- ----------------------------
-- Table structure for t_ads
-- ----------------------------
DROP TABLE IF EXISTS `t_ads`;
CREATE TABLE `t_ads` (
  `id` varchar(36) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(50) DEFAULT NULL,
  `logo` varchar(500) DEFAULT NULL,
  `ad_url` varchar(500) DEFAULT NULL,
  `show_status` varchar(2) DEFAULT NULL,
  `show_order` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `a_status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ads
-- ----------------------------

-- ----------------------------
-- Table structure for t_agency
-- ----------------------------
DROP TABLE IF EXISTS `t_agency`;
CREATE TABLE `t_agency` (
  `id` varchar(36) NOT NULL,
  `t_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pwd` varchar(64) NOT NULL,
  `leader` varchar(20) NOT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `logo` varchar(500) DEFAULT NULL,
  `intro` varchar(500) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `a_status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `t_name` (`t_name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_agency
-- ----------------------------
INSERT INTO `t_agency` VALUES ('402880ef5d7883ff015d7885aa060000', '嘉园股份有限公司', '120@qq.com', '123456', '李明', '18162194001', '65893345', '江西省赣州市', '/EstateSales/attached/agency/2213188521140213.png', '本公司实力雄厚', '2017-08-02 16:37:23', '激活');
INSERT INTO `t_agency` VALUES ('402880f35dd141e5015dd1448e3d0000', '世纪贸易有限公司', '111@qq.com', '123456', '谢谦', '18162194000', '6589450', '上海浦东新区', '/EstateSales/attached/agency/2168717156562552.jpg', '上海浦东新区上海浦东新区上海浦东新区', '2017-08-09 14:51:49', '激活');
INSERT INTO `t_agency` VALUES ('4028ab3e5e4d17a4015e4d1bd76f0000', '科达有限公司', '172971@qq.com', '123456', '李达', '18162194002', '6590453', '江西省 南昌市 青云谱区 广州路 225号', '/EstateSales/attached/agency/2172871092507978.jpg', '简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介', '2017-09-04 00:00:00', '激活');

-- ----------------------------
-- Table structure for t_appointment
-- ----------------------------
DROP TABLE IF EXISTS `t_appointment`;
CREATE TABLE `t_appointment` (
  `id` varchar(36) NOT NULL,
  `emp_id` varchar(36) DEFAULT NULL,
  `customer_id` varchar(36) DEFAULT NULL,
  `app_arrive_time` datetime DEFAULT NULL,
  `house_id` varchar(36) DEFAULT NULL,
  `app_status` varchar(20) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_appointment
-- ----------------------------
INSERT INTO `t_appointment` VALUES ('402880875e3c1aa0015e3c1f4c190002', '402880875e2b582e015e2baafbf30057', '402880875dbfde50015dbfe38d330000', '2017-09-14 00:00:00', '402880875e2b582e015e2b77e45c0006', '已预约', '2017-09-01 00:00:00', '激活');
INSERT INTO `t_appointment` VALUES ('402880875e3c1aa0015e3c1ff9410003', '402880875e2b582e015e2baafbf30057', '402880875dbfde50015dbfe38d330000', '2017-09-15 00:00:00', '402880875e2b582e015e2b773ada0004', '已预约', '2017-09-01 00:00:00', '激活');
INSERT INTO `t_appointment` VALUES ('402880f35e4ad1c2015e4ad8b8340001', '402880875e2b582e015e2baf2ee6005b', '402880875dbfde50015dbfe38d330000', '2017-09-08 00:00:00', '402880875e28bd1c015e28ddc2c600ac', '已购房', '2017-09-04 00:00:00', '激活');
INSERT INTO `t_appointment` VALUES ('4028ab3e5e4cf855015e4d02ca740000', null, '402880875dbfde50015dbfe38d330000', '2017-09-04 00:00:00', '402880115e23a1b4015e23b8b7f70001', '已预约', '2017-09-04 00:00:00', '激活');
INSERT INTO `t_appointment` VALUES ('4028ab3e5e4d2fe1015e4d357c240001', '4028ab3e5e4d2fe1015e4d31cff70000', '402880875dbfde50015dbfe38d330000', '2017-09-04 00:00:00', '402880875e28bd1c015e28d8b2e80015', '已购房', '2017-09-04 00:00:00', '激活');
INSERT INTO `t_appointment` VALUES ('4028ab3e5e4d2fe1015e4d4ae8350006', '402880875e2b582e015e2baf2ee6005b', '402880875dbfde50015dbfe38d330000', '2017-09-04 00:00:00', '402880875e28bd1c015e28dec8dd00ae', '已购房', '2017-09-04 00:00:00', '激活');
INSERT INTO `t_appointment` VALUES ('4028ab3e5e4d2fe1015e4d509718000e', '402880875e2b582e015e2bb0bc1a005d', '402880875dbfde50015dbfe38d330000', '2017-09-04 00:00:00', '402880f35e03b945015e03ba52320000', '已购房', '2017-09-04 00:00:00', '激活');
INSERT INTO `t_appointment` VALUES ('ff8080815e4f46aa015e4f7ae24d0006', '4028ab3e5e4d2fe1015e4d31cff70000', 'ff8080815e4f46aa015e4f74077c0001', '2017-10-04 00:00:00', '402880f35e35cce9015e361780b00000', '已购房', '2017-09-05 00:00:00', '冻结');

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` varchar(36) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `abstracts` varchar(200) DEFAULT NULL,
  `content` text,
  `content_url` varchar(200) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `msg_status` varchar(2) DEFAULT NULL,
  `orderBy` int(11) DEFAULT NULL,
  `typeId` varchar(36) DEFAULT NULL,
  `logo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES ('4028ab3e5e4d2fe1015e4d5bc1aa0030', '南昌楼市新政下月试行', '南昌楼市新政下月试行', '<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"><html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"></head><body><p style=\"color:#333333;text-indent:2em;font-family:&quot;font-size:16px;font-style:normal;font-weight:normal;\">\r\n	继去年10月南昌推出“史上最严”限购限贷房产新政之后，新一轮的针对楼市的“限价房、竞地价”调控政策即将施行。\r\n</p>\r\n<p style=\"color:#333333;text-indent:2em;font-family:&quot;font-size:16px;font-style:normal;font-weight:normal;\">\r\n	9月3日，江南都市报全媒体记者了解到，南昌市有关部门已出台《关于市区“限价房、竞地价”商品住宅项目销售管理（试行）的通知》（以下简称《通知》），并制定了具体操作细则，将从10月1日起试行。同时，南昌县、新建区将参照该通知执行。\r\n</p>\r\n<p style=\"color:#333333;text-indent:2em;font-family:&quot;font-size:16px;font-style:normal;font-weight:normal;\">\r\n	对“限房价、竞地价”方式出让用地开发建设的商品住宅(含商住)项目，在商品住宅销售及转让过程中，采取限房价、限对象、限转让等措施(简称“三限房”)\r\n</p></body></html>', '/EstateSales/attached/logo/2176954886978498.html', '2017-09-04 00:00:00', '激活', '1', '402880cf5dab16f7015dab1c6f5a0000', '/EstateSales/attached/logo/2176954885486638.jpg');
INSERT INTO `t_article` VALUES ('4028ab3e5e4d2fe1015e4d5f61550032', '地产中介', '鼓吹小产权房好处 媒体:转正之说痴人说梦', '<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"><html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"></head><body><p style=\"color:#333333;text-indent:2em;font-family:&quot;microsoft yahei&quot;;font-size:16px;font-style:normal;font-weight:normal;\">\r\n	北京地铁4号线在过了新宫站之后就属大兴线范围了。在地铁从地下冲上地面之后，视野豁然开朗，然而映入眼帘的却是一片废墟，间或有几栋亦工亦商亦住的\"公寓\"。这些废墟此前曾是鳞次栉比的小产权房，为北漂一族提供了廉价的住所。\r\n</p>\r\n<p style=\"color:#333333;text-indent:2em;font-family:&quot;microsoft yahei&quot;;font-size:16px;font-style:normal;font-weight:normal;\">\r\n	在北京市整治小产权房政策的推动下，京开高速以东、地铁大兴线附近的大多数小产权房被拆除。再加上政策对小产权房的严厉打击，小产权房的消亡似乎指日可待。但一些新政策的出现，让一些地产中介和交易平台觅得了\"商机\"。\r\n</p>\r\n<p style=\"color:#333333;text-indent:2em;font-family:&quot;microsoft yahei&quot;;font-size:16px;font-style:normal;font-weight:normal;\">\r\n	7月下旬，住建部会同八部门联合发布了《关于在人口净流入的大中城市加快发展住房租赁市场的通知》，这是继2016年国办39号文之后关于租赁市场发展的另一个重大的\"政策红利\"。12座城市被选为成为首批开展住房租赁试点。\r\n</p>\r\n<p style=\"color:#333333;text-indent:2em;font-family:&quot;microsoft yahei&quot;;font-size:16px;font-style:normal;font-weight:normal;\">\r\n	时隔一个月之后，北京市发布《关于加快发展和规范管理本市住房租赁市场的通知（征求意见稿）》。北京租房新政策在多渠道增加租赁住房供应、搭建便捷公共服务平台、维护当事人合法权益等多方面予以细化规定。\r\n</p>\r\n<p style=\"color:#333333;text-indent:2em;font-family:&quot;microsoft yahei&quot;;font-size:16px;font-style:normal;font-weight:normal;\">\r\n	随后，8月28日，国土资源部、住房和城乡建设部对外发布《利用集体建设用地建设租赁住房试点方案》，在北京等13个城市开展利用集体建设用地建设租赁住房试点。\r\n</p>\r\n<p style=\"color:#333333;text-indent:2em;font-family:&quot;microsoft yahei&quot;;font-size:16px;font-style:normal;font-weight:normal;\">\r\n	发展租赁住房市场政策的密集出台，让一些不安分的中介开始变得活跃起来，这次他们盯上了被边缘化的小产权房。而且他们的政策嗅觉异常灵敏，早在相关政策出台之前，就已经开始大肆宣传小产权房的好处，并推出了一批房源。\r\n</p>\r\n<p style=\"color:#333333;text-indent:2em;font-family:&quot;microsoft yahei&quot;;font-size:16px;font-style:normal;font-weight:normal;\">\r\n	这种打政策擦边球的做法，相关监管部门是不能容忍的。7月19日，北京市住建委、市工商局对违法发布\"小产权房\"信息的中介机构及部分\"小产权房\"周边存在违规代理的中介机构进行排查，现场关停26家违法经营的中介门店。同时，约谈了相关网站和交易平台负责人。\r\n</p>\r\n<p style=\"color:#333333;text-indent:2em;font-family:&quot;microsoft yahei&quot;;font-size:16px;font-style:normal;font-weight:normal;\">\r\n	然而，房地产中介是不会放过任何机会的。就在\"8·28\"政策出台后，部分房地产中介开始拿着这个政策忽悠购房者，称小产权房要转正了，错过这个机会可能就要承担更高价位了，云云。\r\n</p>\r\n<p style=\"color:#333333;text-indent:2em;font-family:&quot;microsoft yahei&quot;;font-size:16px;font-style:normal;font-weight:normal;\">\r\n	\"8·28\"政策显然没有中介人员所说的这些事情。国土资源部土地利用司负责人8月30日表示，集体租赁住房与小产权房一个是依法依规，一个违法违规，不能混为一谈。\r\n</p>\r\n<p style=\"color:#333333;text-indent:2em;font-family:&quot;microsoft yahei&quot;;font-size:16px;font-style:normal;font-weight:normal;\">\r\n	房地产市场专家也认为，将这个政策与小产权房转正挂钩未免太牵强了。这个政策是房地产长效机制的重要组成部分，向租房市场释放土地增量，以改变住房租售体系结构。\r\n</p>\r\n<p style=\"color:#333333;text-indent:2em;font-family:&quot;microsoft yahei&quot;;font-size:16px;font-style:normal;font-weight:normal;\">\r\n	发展租赁住房市场，可以给租房者以物美价廉的居住体验，而其所享受的\"政策红利\"则是小产权房无可比拟的。无论从哪个方面看，都不能把住房租赁和小产权房划等号。因此，小产权房仍将受到政策的打压，转正之说或许是痴人说梦吧。\r\n</p>\r\n<div class=\"clearfix\" style=\"margin:0px;padding:0px;border:0px currentColor;color:#333333;font-family:&quot;microsoft yahei&quot;;font-size:12px;font-style:normal;font-weight:normal;\">\r\n	<div class=\"news-labels clears\" style=\"margin:20px 0px 30px 30px;padding:0px;border:0px currentColor;color:#666666;font-family:&quot;microsoft yahei&quot;;font-size:14px;font-style:normal;font-weight:normal;\">\r\n		<br class=\"Apple-interchange-newline\" />\r\n	</div>\r\n</div></body></html>', '/EstateSales/attached/logo/2177192366311622.html', '2017-09-04 00:00:00', '激活', '2', '402880cf5dab16f7015dab1c6f5a0000', '/EstateSales/attached/logo/2177192364697202.jpg');

-- ----------------------------
-- Table structure for t_article_type
-- ----------------------------
DROP TABLE IF EXISTS `t_article_type`;
CREATE TABLE `t_article_type` (
  `id` varchar(36) NOT NULL,
  `t_name` varchar(50) DEFAULT NULL,
  `des` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_article_type
-- ----------------------------
INSERT INTO `t_article_type` VALUES ('402880cf5d98629f015d9865f9cd0004', '音乐', '聆听心灵之窗');
INSERT INTO `t_article_type` VALUES ('402880cf5d98629f015d9867dec20005', '', '行走在数字之间');
INSERT INTO `t_article_type` VALUES ('402880cf5d98629f015d98698b6c0007', '游戏', '跳跃于心中的精灵');
INSERT INTO `t_article_type` VALUES ('402880cf5d98629f015d986a7c780008', '情感', '三千烦恼丝');
INSERT INTO `t_article_type` VALUES ('402880cf5dab16f7015dab1c6f5a0000', '房地产', '最新最全的房地产资讯');
INSERT INTO `t_article_type` VALUES ('402880cf5df2af61015df2c4e2810000', '生活', '生活是最好的老师');
INSERT INTO `t_article_type` VALUES ('4028ab3e5e4d2fe1015e4d5cd4d90031', '体育', '体育');

-- ----------------------------
-- Table structure for t_building
-- ----------------------------
DROP TABLE IF EXISTS `t_building`;
CREATE TABLE `t_building` (
  `id` varchar(36) NOT NULL,
  `t_name` varchar(50) DEFAULT NULL,
  `total_floor` int(11) DEFAULT NULL,
  `total_lift` int(11) DEFAULT NULL,
  `floor_rooms` int(11) DEFAULT NULL,
  `total_room` int(11) DEFAULT NULL,
  `buildings_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `b_status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_building
-- ----------------------------
INSERT INTO `t_building` VALUES ('402880115e23a1b4015e23b2f9300000', 'C', '2', '0', '30', '60', '402880f35da5a7c5015da5a9ca260000', '2017-08-27 00:00:00', '激活');
INSERT INTO `t_building` VALUES ('402880875e28bd1c015e28d434800005', 'A', '12', '2', '4', '48', '402880875e28bd1c015e28ce7f1f0003', '2017-08-28 00:00:00', '激活');
INSERT INTO `t_building` VALUES ('402880875e28bd1c015e28d475610006', 'B', '12', '2', '4', '48', '402880875e28bd1c015e28ce7f1f0003', '2017-08-28 00:00:00', '激活');
INSERT INTO `t_building` VALUES ('402880875e28bd1c015e28d492950007', 'C', '12', '2', '4', '48', '402880875e28bd1c015e28ce7f1f0003', '2017-08-28 00:00:00', '激活');
INSERT INTO `t_building` VALUES ('402880875e28bd1c015e28dbc02100a7', 'A', '7', '2', '4', '28', '402880875e28bd1c015e28d2cccb0004', '2017-08-28 00:00:00', '激活');
INSERT INTO `t_building` VALUES ('402880875e28bd1c015e28dbe1d600a8', 'B', '7', '2', '4', '28', '402880875e28bd1c015e28d2cccb0004', '2017-08-28 00:00:00', '激活');
INSERT INTO `t_building` VALUES ('402880875e28bd1c015e28dc27f200a9', 'C', '7', '2', '4', '28', '402880875e28bd1c015e28d2cccb0004', '2017-08-28 00:00:00', '激活');
INSERT INTO `t_building` VALUES ('402880875e28bd1c015e28dc713700aa', 'D', '7', '2', '4', '28', '402880875e28bd1c015e28d2cccb0004', '2017-08-28 00:00:00', '激活');
INSERT INTO `t_building` VALUES ('402880875e28bd1c015e28dcc07a00ab', 'B', '7', '1', '4', '28', '402880875e28bd1c015e28ce7f1f0003', '2017-08-28 00:00:00', '激活');
INSERT INTO `t_building` VALUES ('402880875e28bd1c015e28e809c70120', 'A', '20', '3', '4', '80', '402880875e28bd1c015e28e725ff011f', '2017-08-28 00:00:00', '激活');
INSERT INTO `t_building` VALUES ('402880875e28bd1c015e28e82d3f0121', 'B', '20', '3', '4', '80', '402880875e28bd1c015e28e725ff011f', '2017-08-28 00:00:00', '激活');
INSERT INTO `t_building` VALUES ('402880875e28bd1c015e28e844610122', 'C', '20', '3', '4', '80', '402880875e28bd1c015e28e725ff011f', '2017-08-28 00:00:00', '激活');
INSERT INTO `t_building` VALUES ('402880875e2b582e015e2b7679760001', 'A', '6', '2', '4', '24', '402880875e2b582e015e2b75e6370000', '2017-08-29 00:00:00', '激活');
INSERT INTO `t_building` VALUES ('402880875e2b582e015e2b769dbb0002', 'B', '6', '2', '4', '24', '402880875e2b582e015e2b75e6370000', '2017-08-29 00:00:00', '激活');
INSERT INTO `t_building` VALUES ('402880875e2b582e015e2b76baec0003', 'C', '6', '2', '4', '24', '402880875e2b582e015e2b75e6370000', '2017-08-29 00:00:00', '激活');
INSERT INTO `t_building` VALUES ('402880cf5e2d11c7015e2dcbde730004', 'H', '-9', '-5', '-3', '27', '402880875e28bd1c015e28e725ff011f', '2017-08-29 00:00:00', '激活');
INSERT INTO `t_building` VALUES ('402880f35dde8705015dde87a4280000', 'A', '32', '4', '4', '128', '402880f35da5a7c5015da5a9ca260000', '2017-08-14 00:00:00', '激活');
INSERT INTO `t_building` VALUES ('402880f35ddea8c4015ddeac59a70000', 'E', '30', '4', '4', '120', '402880f35da70ba2015da711af810000', '2017-08-14 00:00:00', '冻结');
INSERT INTO `t_building` VALUES ('402880f35ddf7fe2015ddf8274db0000', 'F', '18', '4', '4', '72', '402880f35da70ba2015da711af810000', '2017-08-14 00:00:00', '激活');
INSERT INTO `t_building` VALUES ('402880f35ddf7fe2015ddf901fc40001', 'B', '30', '4', '5', '150', '402880f35da5a7c5015da5a9ca260000', '2017-08-14 00:00:00', '激活');
INSERT INTO `t_building` VALUES ('402880f35e02b29a015e02b3c7540000', 'C', '40', '4', '4', '160', '402880f35da5a7c5015da5a9ca260000', '2017-08-21 00:00:00', '激活');

-- ----------------------------
-- Table structure for t_buildings
-- ----------------------------
DROP TABLE IF EXISTS `t_buildings`;
CREATE TABLE `t_buildings` (
  `id` varchar(36) NOT NULL,
  `t_name` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `floor_area` double DEFAULT NULL,
  `building_area` double DEFAULT NULL,
  `house_type` varchar(20) DEFAULT NULL,
  `building_type` varchar(20) DEFAULT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `avg_price` double NOT NULL,
  `company` varchar(100) DEFAULT NULL,
  `open_date` date DEFAULT NULL,
  `total_rooms` int(11) DEFAULT NULL,
  `reception_address` varchar(100) DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `green_ratio` double DEFAULT NULL,
  `plot_ratio` double DEFAULT NULL,
  `property_company` varchar(100) DEFAULT NULL,
  `property_fee` double DEFAULT NULL,
  `car_station` int(11) DEFAULT NULL,
  `traffic` text,
  `equipments` text,
  `logo` varchar(500) DEFAULT NULL,
  `intro` varchar(500) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `b_status` varchar(2) DEFAULT NULL,
  `agency_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_buildings
-- ----------------------------
INSERT INTO `t_buildings` VALUES ('402880875e28bd1c015e28ce7f1f0003', '星光公寓', '江西省赣州市360721', '江西省赣州市章贡区', '1000000', '600000', '商品房', '洛可可建筑', '114.943062', '25', '250', '嘉园股份有限公司', '2017-09-07', '108', '江西省赣州市章贡区沙石镇', '6589934', '2000000', '1500000', '万达业务有限公司', '250', '68', '良好', '周边环境，鸟语花香，空气新鲜', '/EstateSales/attached/agency/2169217254174007.jpg', '理工帝湖湾，扼守世纪大道与山阳路交汇处，雄踞高新区核心区域，北与江西理工大学隔路相望，东与碧莲湖公园深情相拥，西靠规划中的商业区，地理位置无可比拟。周边汇集迎宾大道、晋焦高速、凯旋路、神州路等多条快捷通道，11路、20路、30路等', '2017-05-28 00:00:00', '激活', '402880ef5d7883ff015d7885aa060000');
INSERT INTO `t_buildings` VALUES ('402880875e28bd1c015e28d2cccb0004', '和家兴', '江西省赣州市360731', '江西省赣州市于都', '1060000', '560000', '商品房', '园林式建筑', '116', '25', '250', '嘉园股份有限公司', '2017-08-02', '108', '世纪大道与山阳路交汇处河理工大学南邻', '6589934', '201524000', '17065400', '万达业务有限公司', '250', '78', '良好', '周边环境，鸟语花香，空气新鲜', '/EstateSales/attached/agency/2169228459065326.jpg', '承袭沙坪企业集团47年的专业造房经验,宜居•莱茵城秉承“宜居”的理念,以考究的品质,高端的配套,旨在将欧洲的生活理念和莱茵河畔自由浪漫的生活方式.', '2017-04-28 00:00:00', '激活', '402880ef5d7883ff015d7885aa060000');
INSERT INTO `t_buildings` VALUES ('402880875e28bd1c015e28e725ff011f', '星海国际', '上海市市辖区310109', '上海虹口区', '1500000', '1300000', '经济适用房', '办公式建筑', '121', '31', '800', '世纪贸易有限公司', '2017-09-13', '205', '上海虹口区和平公园', '7894561', '1596222', '1432222', '万达业务有限公司', '448', '210', '较好', '周边环境，鸟语花香，空气新鲜', '/EstateSales/attached/agency/2168728105154070.jpg', '星海国际新城绿树成荫、花草满园，空气清新，植被绿化面积达40%，超宽楼间距，尽显城市舒适空间；围合式水景大宅私享惬意生活，彰显生活品味；小区以浅绿色为主题色，诠释经典、豪华、大气的现代高端楼盘气质；现代风格园林设计，一万平米超大休闲广场，伴有水系景观，漫游其中，尽享水景公园式优雅生活', '2017-03-28 00:00:00', '激活', '402880f35dd141e5015dd1448e3d0000');
INSERT INTO `t_buildings` VALUES ('402880875e2b582e015e2b75e6370000', '枫叶花园地产', '江西省赣州市360731', '赣州市于都县枫叶花园', '10000000', '9000000', '商品房', '哥特式建筑', '115', '25', '150', '世纪贸易有限公司', '2016-08-08', '68', '于都县枫叶花园', '7456548', '202000', '179998', '万达业务有限公司', '450', '58', '良好', '周边环境，鸟语花香，空气新鲜', '/EstateSales/attached/agency/2168738378396229.jpg', '小区位于燕郊102国道旁，成熟 社区，商场超市农贸市场，出行购物方便，地址：燕郊开发区行宫东大街。 交通位置 出行您可以选择到 国道边乘坐930，也可...', '2017-02-28 00:00:00', '激活', '402880f35dd141e5015dd1448e3d0000');
INSERT INTO `t_buildings` VALUES ('402880f35da5a7c5015da5a9ca260000', '天缘公寓', '安徽省安庆市340803', '中心花园城', '4465', '1900', '商品房', '哥特式建筑', '114.91', '25.83', '6000', '万达房地产股份有限公司', '2017-08-01', '400', '中心花园城', '65306465', '65', '78', '燕兴物业股份有限公司', '500', '400', '良好', '配套设施齐全', '/EstateSales/attached/agency/2169235188753756.jpg', '环境优美，配套设置齐全', '2017-06-03 00:00:00', '激活', '402880ef5d7883ff015d7885aa060000');
INSERT INTO `t_buildings` VALUES ('402880f35da70ba2015da711af810000', '都市新海岸', '福建省龙岩市', '商贸建材城', '4465', '1900', '商品房', '哥特式建筑', '114.89', '25.83', '6000', '万达房地产股份有限公司', '2017-08-09', '400', '商贸建材城', '65306465', '65', '67', '嘉兴物业有限公司', '500', '50', '良好', '配套设施齐全', '/EstateSales/attached/agency/2169242064312977.jpg', '环境良好', '2016-08-03 00:00:00', '激活', '402880ef5d7883ff015d7885aa060000');
INSERT INTO `t_buildings` VALUES ('402880f35da70ba2015da72d1b590001', '五星公馆', '广东省河源市441624', '和平路剑桥大道115号', '6000', '1900', '商品房', '洛可可建筑', '114.85', '25.83', '8000', '方源房地产有限公司', '2017-08-09', '1500', '剑桥大道115号', '6590450', '65', '70', '方源物业有限公司', '500', '1500', '交通良好', '配套齐全', '/EstateSales/attached/agency/2168745240860774.jpg', '本楼盘位于城市中央，环境优美', '2017-07-03 00:00:00', '激活', '402880f35dd141e5015dd1448e3d0000');
INSERT INTO `t_buildings` VALUES ('402880f35dac1c66015dac3dc1730000', '中心花园城', '安徽省安庆市340803', '中心花园城', '4465', '1900', '商品房', '哥特式建筑', '114.92', '25.83', '6000', '万达房地产股份有限公司', '2017-08-01', '400', '中心花园城', '65306465', '65', '78', '燕兴物业股份有限公司', '500', '400', '良好', '配套设施齐全', '/EstateSales/attached/agency/2168752855749063.jpg', '环境优美，配套设置齐全', '2017-06-03 00:00:00', '激活', '402880f35dd141e5015dd1448e3d0000');
INSERT INTO `t_buildings` VALUES ('402880f35df30061015df325daa70001', '江山里', '福建省龙岩市350821', '茂兴路117号', '2500', '1500', '经济适用房', '中式建筑', '114', '25', '12000', '万达房地产股份有限公司', '2017-08-02', '449', '茂兴路117号', '123456', '45', '56', '燕兴物业', '450', '1000', '乘坐27路、31路、112路、117路公交车至汽车南站，再往北走约100米，穿过马路，可到达营销中心。', '幼儿园：金星幼儿园、伦敦英语幼儿园、开发区蓓蕾幼儿园\r\n中小学：黄金小学、金星小学、黄金中学、赣州三中、赣州中学\r\n医院：赣州三康医院、七一九医院\r\n银行：农村信用社、江西银座银行、建行\r\n其他：汽车南站、建材大市场 、赣州粮食城、中国联通\r\n小区内部配套：意大利轴线对称景观园林、景观泳池、花镜、台地花园、儿童游戏区、临赞贤路公共景观广场', '/EstateSales/attached/agency/2169250758822258.jpg', ' 天峰国际新城坐落于阳泉市保晋路，占地面积近十万平方米，建筑面积四十万平方米，是天峰公司倾力打造的阳泉地标式建筑群。    \r\n    天峰国际新城绿树成荫、花草满园，空气清新，植被绿化面积达40%，超宽楼间距，尽显城市舒适空间；围合式水景大宅私享惬意生活，彰显生活品味；小区以浅绿色为主题色，诠释经典、豪华、大气的现代高端楼盘气质；现代风格园林设计，一万平米超大休闲广场，伴有水系景观，漫游其中，尽享水景公园式优雅生活。', '2016-08-18 01:00:00', '冻结', '402880ef5d7883ff015d7885aa060000');
INSERT INTO `t_buildings` VALUES ('402880f35e0289b8015e029537630000', '123456', '安徽省安庆市340803', '123', '123', '132', '商品房', '哥特式建筑', '123', '29', '123', '123', '2017-08-04', '123', '123', '1231111', '123', '123', '123', '123', '123', '132', '1233', '/EstateSales/attached/agency/2169258863760186.jpg', '123', '2017-07-11 00:00:00', '冻结', '402880ef5d7883ff015d7885aa060000');

-- ----------------------------
-- Table structure for t_buildings_img
-- ----------------------------
DROP TABLE IF EXISTS `t_buildings_img`;
CREATE TABLE `t_buildings_img` (
  `id` varchar(36) NOT NULL,
  `img_path` varchar(500) DEFAULT NULL,
  `img_des` varchar(50) DEFAULT NULL,
  `buildings_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_buildings_img
-- ----------------------------
INSERT INTO `t_buildings_img` VALUES ('402880cf5e2d11c7015e2dc7ad820002', '/EstateSales/attached/agency/291907762509773.jpg', null, '402880cf5e2d11c7015e2dc64ea20001', '2017-08-29 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880cf5e2d11c7015e2dc7add20003', '/EstateSales/attached/agency/291907843380979.jpg', null, '402880cf5e2d11c7015e2dc64ea20001', '2017-08-29 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880f35e0e5443015e0e5664f90006', '/EstateSales/attached/agency/1119564232139644.png', null, '402880f35da70ba2015da72d1b590001', '2017-08-23 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880f35e0e5443015e0e5664ff0007', '/EstateSales/attached/agency/1119564236620053.png', null, '402880f35da70ba2015da72d1b590001', '2017-08-23 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880f35e0e5443015e0e56c20b0008', '/EstateSales/attached/agency/1119588060208099.png', null, '402880f35dac1c66015dac3dc1730000', '2017-08-23 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880f35e0e5443015e0e56c2120009', '/EstateSales/attached/agency/1119588068721541.png', null, '402880f35dac1c66015dac3dc1730000', '2017-08-23 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880f35e0e5443015e0e56c214000a', '/EstateSales/attached/agency/1119588068721541.png', null, '402880f35dac1c66015dac3dc1730000', '2017-08-23 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880f35e0e5443015e0e56c22b000b', '/EstateSales/attached/agency/1119588090554252.png', null, '402880f35dac1c66015dac3dc1730000', '2017-08-23 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880f35e0ee53b015e0eec229c0000', '/EstateSales/attached/agency/1129377660207979.png', null, '402880f35df30061015df325daa70001', '2017-08-23 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880f35e47cd4b015e47d2a20f0000', '/EstateSales/attached/agency/2084072809054036.jpg', null, '402880875e28bd1c015e28ce7f1f0003', '2017-09-03 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880f35e47cd4b015e47d2a3030001', null, null, '402880875e28bd1c015e28ce7f1f0003', '2017-09-03 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880f35e47cd4b015e47d2a3110002', null, null, '402880875e28bd1c015e28ce7f1f0003', '2017-09-03 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880f35e47cd4b015e47d2a3190003', null, null, '402880875e28bd1c015e28ce7f1f0003', '2017-09-03 00:00:00');
INSERT INTO `t_buildings_img` VALUES ('402880f35e47cd4b015e47d2a3290004', '/EstateSales/attached/agency/2084073052708953.jpg', null, '402880875e28bd1c015e28ce7f1f0003', '2017-09-03 00:00:00');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` varchar(36) NOT NULL,
  `content` text,
  `buildings_id` varchar(36) DEFAULT NULL,
  `comment_time` datetime DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('402880cf5e3d2041015e3d2dda820001', '我来评论啦！！！！', '402880875e28bd1c015e28d2cccb0004', '2017-09-01 00:00:00', '402880875dbfde50015dbfe38d330000');
INSERT INTO `t_comment` VALUES ('402880cf5e3d327c015e3d3b75310002', 'askjdfolaisjdof', '402880875e28bd1c015e28e725ff011f', '2017-09-01 00:00:00', '402880875dbfde50015dbfe38d330000');
INSERT INTO `t_comment` VALUES ('402880cf5e3d5806015e3d67c9ea0002', 'asdfasdfsfasfd', '402880875e2b582e015e2b75e6370000', '2017-09-01 00:00:00', '402880875dbfde50015dbfe38d330000');
INSERT INTO `t_comment` VALUES ('402880cf5e3d8004015e3d83f25a0001', 'asdfasfda', '402880875e28bd1c015e28ce7f1f0003', '2017-09-01 00:00:00', '402880875dbfde50015dbfe38d330000');
INSERT INTO `t_comment` VALUES ('402880f05e3b4ced015e3b54bb850001', '1121122', '402880875e2b582e015e2b75e6370000', '2017-09-01 00:00:00', '402880875dbfde50015dbfe38d330000');
INSERT INTO `t_comment` VALUES ('402880f05e3c35d4015e3c393ed50000', '1321222', '402880f35da70ba2015da72d1b590001', '2017-09-01 00:00:00', '402880875dbfde50015dbfe38d330000');
INSERT INTO `t_comment` VALUES ('402880f05e3c35d4015e3c4480f30001', '121322', '402880f35da70ba2015da72d1b590001', '2017-09-01 00:00:00', '402880875dbfde50015dbfe38d330000');
INSERT INTO `t_comment` VALUES ('402880f05e3c35d4015e3c4dfe1b0002', '124413351', '402880f35da70ba2015da72d1b590001', '2017-09-01 00:00:00', '402880875dbfde50015dbfe38d330000');
INSERT INTO `t_comment` VALUES ('402880f05e3c35d4015e3c4e337b0003', '411211125', '402880f35da70ba2015da72d1b590001', '2017-09-01 00:00:00', '402880875dbfde50015dbfe38d330000');
INSERT INTO `t_comment` VALUES ('402880f05e3d6a19015e3d6b904f0001', '1212323', '402880f35da5a7c5015da5a9ca260000', '2017-09-01 00:00:00', '402880875dbfde50015dbfe38d330000');
INSERT INTO `t_comment` VALUES ('402880f05e3d6a19015e3d6bc3a90002', '1233212323', '402880f35da5a7c5015da5a9ca260000', '2017-09-01 00:00:00', '402880875dbfde50015dbfe38d330000');
INSERT INTO `t_comment` VALUES ('402880f05e3d6a19015e3d6bf2950003', '我认为任务·', '402880f35da5a7c5015da5a9ca260000', '2017-09-01 00:00:00', '402880875dbfde50015dbfe38d330000');
INSERT INTO `t_comment` VALUES ('4028abbc5e3da458015e3da76bd80000', 'asdfasdfasdfassdfgdfhgfhfgh', '402880875e2b582e015e2b75e6370000', '2017-09-01 00:00:00', '402880875dbfde50015dbfe38d330000');
INSERT INTO `t_comment` VALUES ('4028abbc5e3da458015e3da79fd30001', '2334434dddddddddddddddddddddddddd', '402880875e2b582e015e2b75e6370000', '2017-09-01 00:00:00', '402880875dbfde50015dbfe38d330000');
INSERT INTO `t_comment` VALUES ('4028abbc5e3da458015e3dab73470002', 'ttttttttttttttttt', '402880875e28bd1c015e28d2cccb0004', '2017-09-01 00:00:00', '402880875dbfde50015dbfe38d330000');
INSERT INTO `t_comment` VALUES ('4028abbc5e3da458015e3dab8f540003', 'ttttttttttttttttt', '402880875e28bd1c015e28d2cccb0004', '2017-09-01 00:00:00', '402880875dbfde50015dbfe38d330000');
INSERT INTO `t_comment` VALUES ('4028abbc5e3da458015e3db6d3450004', 'ggg', '402880875e2b582e015e2b75e6370000', '2017-09-01 00:00:00', '402880875dbfde50015dbfe38d330000');
INSERT INTO `t_comment` VALUES ('4028abbc5e3da458015e3db761010005', 'kk', '402880875e2b582e015e2b75e6370000', '2017-09-01 00:00:00', '402880875dbfde50015dbfe38d330000');
INSERT INTO `t_comment` VALUES ('4028abbc5e3da458015e3db9784f0006', 'ggsssddff', '402880875e2b582e015e2b75e6370000', '2017-09-01 00:00:00', '402880875dbfde50015dbfe38d330000');
INSERT INTO `t_comment` VALUES ('988544444444444444444444444488919', '你好', '402880875e2b582e015e2b75e6370000', '2017-08-31 09:36:03', '402880875dbfde50015dbfe38d330000');
INSERT INTO `t_comment` VALUES ('ff8080815e4f46aa015e4f7504af0003', '虎如', '402880875e28bd1c015e28ce7f1f0003', '2017-09-05 00:00:00', 'ff8080815e4f46aa015e4f74077c0001');
INSERT INTO `t_comment` VALUES ('ff8080815e4f46aa015e4f75dce70004', '**交易下午2：00', '402880875e28bd1c015e28ce7f1f0003', '2017-09-05 00:00:00', 'ff8080815e4f46aa015e4f74077c0001');

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `id` varchar(36) NOT NULL,
  `headicon` varchar(255) DEFAULT NULL,
  `t_name` varchar(10) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `identity_id` varchar(18) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `customer_type` varchar(20) DEFAULT NULL,
  `together` varchar(100) DEFAULT NULL,
  `contract` varchar(255) DEFAULT NULL,
  `archives` varchar(500) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `c_status` varchar(2) DEFAULT NULL,
  `emp_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES ('402880875dbfde50015dbfe38d330000', '/EstateSales/attached/user/2169966678640385.jpg', '王丽鹃', '女', '2017-08-31', null, '2325324563@qq.com', '15560643568', '江西九江市', '已预约', null, null, null, '2017-09-04 00:00:00', '激活', '402880875e2b582e015e2bb0bc1a005d');
INSERT INTO `t_customer` VALUES ('ff8080815e4f46aa015e4f74077c0001', null, '丹丹', null, null, null, null, '15270743950', null, '已预约', null, null, null, '2017-09-05 00:00:00', '激活', '4028ab3e5e4d2fe1015e4d31cff70000');

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee` (
  `id` varchar(36) NOT NULL,
  `t_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pwd` varchar(64) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `wechat` varchar(50) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `exp` varchar(50) DEFAULT NULL,
  `des` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `basic_salary` double DEFAULT NULL,
  `headicon` varchar(500) DEFAULT NULL,
  `intro` varchar(500) DEFAULT NULL,
  `agency_id` varchar(36) DEFAULT NULL,
  `building_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `percent` varchar(4) DEFAULT NULL,
  `e_status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee` VALUES ('402880875d883d04015d883da3c50000', '谢学培', '48548@qq.com', '123456', '17370134026', '34543645sad', '11231231', '男', '', '我爱上网', '浙江', '3500', '/EstateSales/attached/agency/39874523992255.jpg', null, '402880f35dd141e5015dd1448e3d0000', '402880875e28bd1c015e28e725ff011f', '2017-08-14 19:28:58', '1', '激活');
INSERT INTO `t_employee` VALUES ('402880875e2b582e015e2ba4e0fb0050', '王伟', '123@qq.com', '123456', '15678945611', null, null, '男', null, null, '浙江', '2500', '/EstateSales/attached/agency/26197680689006.jpg', null, '402880f35dd141e5015dd1448e3d0000', '402880875e28bd1c015e28e725ff011f', '2017-08-29 00:00:00', '2', '激活');
INSERT INTO `t_employee` VALUES ('402880875e2b582e015e2baafbf30057', '张三', '48544@qq.con', '123456', '15278964555', null, null, '男', null, null, '浙江', '2500', '/EstateSales/attached/agency/26591472841577.jpg', null, '402880f35dd141e5015dd1448e3d0000', '402880875e28bd1c015e28e725ff011f', '2017-08-29 00:00:00', '3', '激活');
INSERT INTO `t_employee` VALUES ('402880875e2b582e015e2baf2ee6005b', '赖凌飞', '241243@qq.con', '123456', '15612345689', null, null, '男', null, null, '赣州市', '3000', '/EstateSales/attached/agency/2175964159161081.png', null, '402880ef5d7883ff015d7885aa060000', '402880875e28bd1c015e28d2cccb0004', '2017-08-29 00:00:00', '2', '激活');
INSERT INTO `t_employee` VALUES ('402880875e2b582e015e2bafc499005c', '赖小红', '242643@qq.con', '123456', '15614665689', null, null, '女', null, null, '赣州市', '250', null, null, '402880ef5d7883ff015d7885aa060000', '402880875e28bd1c015e28ce7f1f0003', '2017-08-29 00:00:00', '2', '激活');
INSERT INTO `t_employee` VALUES ('402880875e2b582e015e2bb0bc1a005d', '赖夏夏', '22165643@qq.con', '123456', '15612665689', null, null, '女', null, null, '太原', '2500', '/EstateSales/attached/agency/2176285235638360.png', null, '402880ef5d7883ff015d7885aa060000', '402880f35da70ba2015da711af810000', '2017-08-29 00:00:00', '2', '激活');
INSERT INTO `t_employee` VALUES ('402880875e2b582e015e2bb14c83005e', '赖小夏', '2245643@qq.con', '123456', '15612125689', null, null, '女', null, null, '太原', '2500', null, null, '402880ef5d7883ff015d7885aa060000', '402880f35df30061015df325daa70001', '2017-08-29 00:00:00', '2', '激活');
INSERT INTO `t_employee` VALUES ('402880cf5e2d11c7015e2dd1d8d5000b', '谢谦', '1817894561@qq.com', '123456', '1817894561', null, null, '男', null, null, '江西省赣州市', '3200', null, null, '402880f35dd141e5015dd1448e3d0000', '402880875e28bd1c015e28e725ff011f', '2017-08-29 00:00:00', '1', '激活');
INSERT INTO `t_employee` VALUES ('402880f35e0c8a64015e0c8b65620000', '罗慧', '1234@qq.com', '123456', '18162194000', null, null, '男', null, null, '江西赣州', '3200', '/EstateSales/attached/agency/2171370973342140.jpg', '卖房高手，一次成交，终身维护！', '402880f35dd141e5015dd1448e3d0000', '402880f35da70ba2015da72d1b590001', '2017-08-23 00:00:00', '2', '激活');
INSERT INTO `t_employee` VALUES ('4028ab3e5e4d2fe1015e4d31cff70000', '谢林', '123456@qq.com', '123456', '18162194556', null, null, '男', null, null, '江西赣州', '3200', '/EstateSales/attached/agency/2174271800408978.jpg', null, '402880ef5d7883ff015d7885aa060000', '402880875e28bd1c015e28ce7f1f0003', '2017-09-04 00:00:00', '1', '激活');

-- ----------------------------
-- Table structure for t_history
-- ----------------------------
DROP TABLE IF EXISTS `t_history`;
CREATE TABLE `t_history` (
  `id` varchar(36) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `buildings_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_history
-- ----------------------------
INSERT INTO `t_history` VALUES ('402880f35e4c2ffc015e4c3133ad0000', '', '402880875e28bd1c015e28ce7f1f0003', '2017-09-04 00:00:00');
INSERT INTO `t_history` VALUES ('402880f35e4c2ffc015e4c3281410001', '402880875dbfde50015dbfe38d330000', '402880875e28bd1c015e28ce7f1f0003', '2017-09-04 00:00:00');
INSERT INTO `t_history` VALUES ('402880f35e4cbe39015e4cbf3f7b0000', '', '402880f35da70ba2015da72d1b590001', '2017-09-04 00:00:00');
INSERT INTO `t_history` VALUES ('402880f35e4cbe39015e4cbf9efd0001', '', '402880f35da70ba2015da72d1b590001', '2017-09-04 00:00:00');
INSERT INTO `t_history` VALUES ('4028ab3e5e4cc936015e4ccaaee30000', '', '402880f35dac1c66015dac3dc1730000', '2017-09-04 00:00:00');
INSERT INTO `t_history` VALUES ('4028ab3e5e4d2fe1015e4d48a0ab0004', '', '402880f35da70ba2015da72d1b590001', '2017-09-04 00:00:00');
INSERT INTO `t_history` VALUES ('4028ab3e5e4d2fe1015e4d4a43bf0005', '', '402880875e28bd1c015e28d2cccb0004', '2017-09-04 00:00:00');
INSERT INTO `t_history` VALUES ('4028ab3e5e4d2fe1015e4d4e78af000a', '', '402880f35da5a7c5015da5a9ca260000', '2017-09-04 00:00:00');
INSERT INTO `t_history` VALUES ('4028ab3e5e4d2fe1015e4d4f2c63000b', '402880875dbfde50015dbfe38d330000', '402880875e2b582e015e2b75e6370000', '2017-09-04 00:00:00');
INSERT INTO `t_history` VALUES ('4028ab3e5e4d2fe1015e4d4feefd000c', '402880875dbfde50015dbfe38d330000', '402880f35da5a7c5015da5a9ca260000', '2017-09-04 00:00:00');
INSERT INTO `t_history` VALUES ('4028ab3e5e4d2fe1015e4d505eec000d', '402880875dbfde50015dbfe38d330000', '402880f35da70ba2015da711af810000', '2017-09-04 00:00:00');
INSERT INTO `t_history` VALUES ('ff8080815e4f46aa015e4f6cd5e10000', '', '402880f35da70ba2015da72d1b590001', '2017-09-05 00:00:00');
INSERT INTO `t_history` VALUES ('ff8080815e4f46aa015e4f74c4710002', 'ff8080815e4f46aa015e4f74077c0001', '402880875e28bd1c015e28ce7f1f0003', '2017-09-05 00:00:00');
INSERT INTO `t_history` VALUES ('ff8080815e4f46aa015e4f815a080008', 'ff8080815e4f46aa015e4f74077c0001', '402880f35da5a7c5015da5a9ca260000', '2017-09-05 00:00:00');
INSERT INTO `t_history` VALUES ('ff8080815e4f46aa015e4f81df8b0009', 'ff8080815e4f46aa015e4f74077c0001', '402880875e28bd1c015e28e725ff011f', '2017-09-05 00:00:00');
INSERT INTO `t_history` VALUES ('ff8080815e4f46aa015e4f82a939000a', 'ff8080815e4f46aa015e4f74077c0001', '402880f35e0289b8015e029537630000', '2017-09-05 00:00:00');

-- ----------------------------
-- Table structure for t_hourse
-- ----------------------------
DROP TABLE IF EXISTS `t_hourse`;
CREATE TABLE `t_hourse` (
  `id` varchar(36) NOT NULL,
  `t_name` varchar(50) DEFAULT NULL,
  `logo` varchar(500) DEFAULT NULL,
  `intro` varchar(500) DEFAULT NULL,
  `area` double DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `buildings_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `h_status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_hourse
-- ----------------------------
INSERT INTO `t_hourse` VALUES ('402880115e23a1b4015e23b8b7f70001', '三室两厅一厨一卫', '/EstateSales/attached/agency/2169292339181028.jpg', '宽敞大气美观', '122', '45500', '402880f35da5a7c5015da5a9ca260000', '2017-08-27 00:00:00', '激活');
INSERT INTO `t_hourse` VALUES ('402880875e28bd1c015e28d8b2e80015', '三室一厅', '/EstateSales/attached/agency/2169299241386035.jpg', '良好', '240', '1000', '402880875e28bd1c015e28ce7f1f0003', '2017-08-28 00:00:00', '激活');
INSERT INTO `t_hourse` VALUES ('402880875e28bd1c015e28d9703b0016', '二室一厅', '/EstateSales/attached/agency/2169305941812039.jpg', '较好', '180', '90000', '402880875e28bd1c015e28ce7f1f0003', '2017-08-28 00:00:00', '激活');
INSERT INTO `t_hourse` VALUES ('402880875e28bd1c015e28ddc2c600ac', '三室一厅', '/EstateSales/attached/agency/2169313623440369.jpg', '良好', '280', '11000', '402880875e28bd1c015e28d2cccb0004', '2017-08-28 00:00:00', '激活');
INSERT INTO `t_hourse` VALUES ('402880875e28bd1c015e28de1ff500ad', '二室一厅', '/EstateSales/attached/agency/2213311061648640.jpg', '良好', '210', '11000', '402880875e28bd1c015e28d2cccb0004', '2017-08-28 00:00:00', '激活');
INSERT INTO `t_hourse` VALUES ('402880875e28bd1c015e28dec8dd00ae', '六室二厅', '/EstateSales/attached/agency/2169324249530586.jpg', '良好', '350', '18000', '402880875e28bd1c015e28d2cccb0004', '2017-08-28 00:00:00', '激活');
INSERT INTO `t_hourse` VALUES ('402880875e28bd1c015e28e8cea00123', '三室一厅', '/EstateSales/attached/agency/2168787117591869.jpg', '良好', '210', '40000', '402880875e28bd1c015e28e725ff011f', '2017-08-28 00:00:00', '冻结');
INSERT INTO `t_hourse` VALUES ('402880875e28bd1c015e28e9454f0124', '二室一厅', '/EstateSales/attached/agency/2168794522593433.jpg', '良好', '160', '25000', '402880875e28bd1c015e28e725ff011f', '2017-08-28 00:00:00', '激活');
INSERT INTO `t_hourse` VALUES ('402880875e28bd1c015e28e9ad8e0125', '六室二厅', '/EstateSales/attached/agency/2168801568867647.jpg', '良好', '380', '55000', '402880875e28bd1c015e28e725ff011f', '2017-08-28 00:00:00', '激活');
INSERT INTO `t_hourse` VALUES ('402880875e2b582e015e2b773ada0004', '三室一厅', '/EstateSales/attached/agency/2168810672523820.jpg', '良好', '420', '100000', '402880875e2b582e015e2b75e6370000', '2017-08-29 00:00:00', '激活');
INSERT INTO `t_hourse` VALUES ('402880875e2b582e015e2b7776130005', '二室一厅', '/EstateSales/attached/agency/2168827127176961.jpg', '良好', '320', '10000', '402880875e2b582e015e2b75e6370000', '2017-08-29 00:00:00', '激活');
INSERT INTO `t_hourse` VALUES ('402880875e2b582e015e2b77e45c0006', '六室二厅', '/EstateSales/attached/agency/2168837105803098.jpg', '良好', '420', '20000', '402880875e2b582e015e2b75e6370000', '2017-08-29 00:00:00', '激活');
INSERT INTO `t_hourse` VALUES ('402880cf5e07d135015e07e32c7b0001', '一室一厅', '/EstateSales/attached/agency/2169330962359372.jpg', '空间都很方正，方便后期家具的摆放。整个空间采光很好，主卧和客厅均能够保证很好的采光；并且能真正做到全明通透，整个空间空气好。整个户型空间布局合理，真正做到了干湿分离、动静分离，方便后期生活。客厅、卧室、卫生间和厨房等主要功能间尺寸以及比例合适，方便采光、通风，后期居住方便。公摊相对合理，一般房子公摊基本都在此范畴。日常使用基本满足。 各个空间都很方正，方便后期家具的摆放。', '98', '5000', '402880f35da5a7c5015da5a9ca260000', '2017-08-22 00:00:00', '激活');
INSERT INTO `t_hourse` VALUES ('402880cf5e191490015e19184e1f0000', '四室二厅', '/EstateSales/attached/agency/2169337511088423.jpg', '客厅敞亮，房间宽敞', '170', '50000', '402880f35da5a7c5015da5a9ca260000', '2017-08-25 00:00:00', '激活');
INSERT INTO `t_hourse` VALUES ('402880cf5e191490015e19193d070001', '三室二厅', '/EstateSales/attached/agency/2169344049760251.jpg', '客厅敞亮，房间宽敞', '139', '4500', '402880f35da5a7c5015da5a9ca260000', '2017-08-25 00:00:00', '激活');
INSERT INTO `t_hourse` VALUES ('402880cf5e191490015e1919c6a10002', '二室二厅', '/EstateSales/attached/agency/2169351989735087.jpg', '空间都很方正，方便后期家具的摆放。整个空间采光很好，主卧和客厅均能够保证很好的采光；并且能真正做到全明通透，整个空间空气好。整个户型空间布局合理，真正做到了干湿分离、动静分离，方便后期生活。客厅、卧室、卫生间和厨房等主要功能间尺寸以及比例合适，方便采光、通风，后期居住方便。公摊相对合理，一般房子公摊基本都在此范畴。日常使用基本满足。 各个空间都很方正，方便后期家具的摆放。', '102', '33000', '402880f35da5a7c5015da5a9ca260000', '2017-08-25 00:00:00', '激活');
INSERT INTO `t_hourse` VALUES ('402880f35de3b475015de3b523130000', '三室二厅', '/EstateSales/attached/agency/2169399270545220.jpg', '空间都很方正，方便后期家具的摆放。整个空间采光很好，主卧和客厅均能够保证很好的采光；并且能真正做到全明通透，整个空间空气好。整个户型空间布局合理，真正做到了干湿分离、动静分离，方便后期生活。客厅、卧室、卫生间和厨房等主要功能间尺寸以及比例合适，方便采光、通风，后期居住方便。公摊相对合理，一般房子公摊基本都在此范畴。日常使用基本满足。\r\n各个空间都很方正，方便后期家具的摆放。整个空间采光很好，主卧和客厅均能够保证很好的采光；并且能真正做到全明通透，整个空间空气好。整个户型空间布局合理，真正做到了干湿分离、动静分离，方便后期生活。客厅、卧室、卫生间和厨房等主要功能间尺寸以及比例合适，方便采光、通风，后期居住方便。公摊相对合理，一般房子公摊基本都在此范畴。日常使用基本满足。 ', '156', '80000', '402880f35da5a7c5015da5a9ca260000', '2017-08-15 00:00:00', '激活');
INSERT INTO `t_hourse` VALUES ('402880f35e03b945015e03ba52320000', '三室二厅二卫', '/EstateSales/attached/agency/2169407696613339.jpg', '双明亮卧房，良好通风采光，与生活阳台连为一体，视野柔和宽阔', '187', '16000', '402880f35da70ba2015da711af810000', '2017-08-21 00:00:00', '冻结');
INSERT INTO `t_hourse` VALUES ('402880f35e03bc08015e03bdc9f90000', '四室二厅一厨三卫', '/EstateSales/attached/agency/2169416677368893.jpg', '户型精巧布局，南北通透，享受充足阳光新风；  餐客连体布局，一脉相连，通透开敞  宽景花园阳台，养花育草浇灌心境，彰显写意人生', '210', '2000', '402880f35df30061015df325daa70001', '2017-08-21 00:00:00', '冻结');
INSERT INTO `t_hourse` VALUES ('402880f35e238abf015e238eab230000', '三室二厅', '/EstateSales/attached/agency/2168845650857140.jpg', '闲适生活在声与光的伴随中缓缓流淌。 14、15、16#88.26㎡（三室二厅一卫） 窈窕一居，给笃学求索的心一个归处；  功能齐备小三居，尺寸的掌控有如屋主人对人生的把握； 空间开敞，格局紧凑，分区合理，通道少，有效减少面积浪费；  人性化间隔精巧书房，海纳万卷；  宽大景观花园阳台，采光、通风、纳景，入画于烟雨满园；', '165', '7800', '402880f35dac1c66015dac3dc1730000', '2017-08-27 00:00:00', '激活');
INSERT INTO `t_hourse` VALUES ('402880f35e35cce9015e361780b00000', '三室二厅一厨二卫', '/EstateSales/attached/agency/2169648253293139.jpg', '户型方正，格局优越  动静分离，干湿分区，礼遇主人  超大客厅设计，起居室与餐厅完全隔离，互不干扰 动静分区，功能分区合理，保证主人生活的私密性 南北通透，采光通风良好，格局合理 动线合理，交通面积小，超大客厅设计 起居室与餐厅分布合理  动静分区，功能分区合理，保证主人生活的私密性 卫生间布局合理', '120', '780000', '402880875e28bd1c015e28ce7f1f0003', '2017-08-31 00:00:00', '激活');
INSERT INTO `t_hourse` VALUES ('402880f35e3c6e96015e3c6ff1ae0000', '1室1厅1厨1卫', '/EstateSales/attached/agency/2169657019728651.jpg', '就如同生命中某个阶段，花样年华，一切精致、简洁、直接，  户型设计从功能出发，简约自然，小尺寸大容量；  精巧客厅，温馨惬意；  双明亮卧房，良好通风采光，与生活阳台连为一体，视野柔和宽阔；  封闭厨房、畅想操作乐趣  在私享的天空下  邀爱人翩翩起舞，邀明月把酒对酌  生活在此浪漫无比 ', '120', '7800000', '402880875e28bd1c015e28ce7f1f0003', '2017-09-01 00:00:00', '激活');
INSERT INTO `t_hourse` VALUES ('402880f35e3c9b8e015e3d326d980000', '3室2厅1厨1卫', '/EstateSales/attached/agency/2169665055322576.jpg', '就如同生命中某个阶段，花样年华，一切精致、简洁、直接，  户型设计从功能出发，简约自然，小尺寸大容量；  精巧客厅，温馨惬意；  双明亮卧房，良好通风采光，与生活阳台连为一体，视野柔和宽阔；  封闭厨房、畅想操作乐趣  在私享的天空下  邀爱人翩翩起舞，邀明月把酒对酌  生活在此浪漫无比 ', '78', '600000', '402880875e28bd1c015e28ce7f1f0003', '2017-09-01 00:00:00', '激活');

-- ----------------------------
-- Table structure for t_like
-- ----------------------------
DROP TABLE IF EXISTS `t_like`;
CREATE TABLE `t_like` (
  `id` varchar(36) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `buildings_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_like
-- ----------------------------
INSERT INTO `t_like` VALUES ('ff8080815e4f46aa015e4f788df20005', 'ff8080815e4f46aa015e4f74077c0001', '402880875e28bd1c015e28ce7f1f0003', '2017-09-05 00:00:00');

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `id` varchar(36) NOT NULL,
  `content` text,
  `buildings_id` varchar(36) DEFAULT NULL,
  `reply` text,
  `leave_time` datetime DEFAULT NULL,
  `reply_time` datetime DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_message
-- ----------------------------

-- ----------------------------
-- Table structure for t_mission
-- ----------------------------
DROP TABLE IF EXISTS `t_mission`;
CREATE TABLE `t_mission` (
  `id` varchar(36) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `monthes` int(11) DEFAULT NULL,
  `emp_id` varchar(36) DEFAULT NULL,
  `bonus_percent` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mission
-- ----------------------------

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` varchar(36) NOT NULL,
  `t_name` varchar(500) DEFAULT NULL,
  `des` varchar(50) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `p_status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` varchar(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `des` varchar(50) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `r_status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(500) DEFAULT NULL,
  `permission_id` varchar(50) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for t_room
-- ----------------------------
DROP TABLE IF EXISTS `t_room`;
CREATE TABLE `t_room` (
  `id` varchar(36) NOT NULL,
  `house_id` varchar(36) NOT NULL,
  `building_id` varchar(36) DEFAULT NULL,
  `t_name` varchar(50) DEFAULT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_room
-- ----------------------------
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9b1ef0017', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋101', '已售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9b2640018', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋201', '已售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9b29e0019', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋301', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9b2c8001a', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋401', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9b2ea001b', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋501', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9b315001c', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋601', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9b336001d', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋701', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9b379001e', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋801', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9b3ba001f', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋901', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9b3f30020', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋1001', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9b4610021', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋1101', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9b4830022', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋1201', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9d58e0023', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋102', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9d5fd0024', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋202', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9d6360025', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋302', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9d6690026', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋402', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9d6980027', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋502', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9d6c20028', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋602', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9d6ef0029', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋702', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9d71b002a', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋802', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9d746002b', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋902', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9d773002c', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋1002', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9d79f002d', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋1102', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9d7cc002e', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋1202', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9dfe4002f', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋103', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9e0550030', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋203', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9e0750031', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋303', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9e0a20032', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋403', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9e0b70033', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋503', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9e0fb0034', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋603', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9e13f0035', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋703', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9e1690036', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋803', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9e18b0037', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋903', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9e1ab0038', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋1003', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9e1cd0039', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋1103', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9e1ee003a', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋1203', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9e750003b', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋104', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9e801003c', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋204', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9e821003d', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋304', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9e84e003e', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋404', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9e86f003f', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋504', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9e8910040', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋604', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9e8b20041', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋704', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9e8d40042', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋804', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9e8f40043', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋904', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9e9160044', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋1004', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9e9360045', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋1104', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28d9e95a0046', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d434800005', 'A栋1204', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da24280047', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d475610006', 'B栋101', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da24cf0048', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d475610006', 'B栋201', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da24fc0049', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d475610006', 'B栋301', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da2534004a', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d475610006', 'B栋401', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da256b004b', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d475610006', 'B栋501', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da2580004c', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d475610006', 'B栋601', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da25a3004d', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d475610006', 'B栋701', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da25d1004e', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d475610006', 'B栋801', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da25fb004f', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d475610006', 'B栋901', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da26280050', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d475610006', 'B栋1001', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da26490051', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d475610006', 'B栋1101', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da26770052', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d475610006', 'B栋1201', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da2db30053', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d475610006', 'B栋102', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da2e4e0054', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d475610006', 'B栋202', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da2e7b0055', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d475610006', 'B栋302', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da2ee00056', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d475610006', 'B栋402', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da2f0e0057', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d475610006', 'B栋502', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da2f370058', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d475610006', 'B栋602', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da2f570059', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d475610006', 'B栋702', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da2f7a005a', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d475610006', 'B栋802', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da2fa7005b', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d475610006', 'B栋902', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da2fc9005c', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d475610006', 'B栋1002', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da2fff005d', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d475610006', 'B栋1102', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da302c005e', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d475610006', 'B栋1202', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da37c7005f', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d475610006', 'B栋103', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da37ee0060', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d475610006', 'B栋203', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da381c0061', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d475610006', 'B栋303', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da38460062', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d475610006', 'B栋403', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da38750063', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d475610006', 'B栋503', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da38b50064', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d475610006', 'B栋603', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da38fa0065', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d475610006', 'B栋703', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da393a0066', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d475610006', 'B栋803', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da396b0067', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d475610006', 'B栋903', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da39930068', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d475610006', 'B栋1003', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da39c10069', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d475610006', 'B栋1103', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da39f8006a', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d475610006', 'B栋1203', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da43ba006b', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d475610006', 'B栋104', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da43e5006c', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d475610006', 'B栋204', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da4419006d', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d475610006', 'B栋304', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da443d006e', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d475610006', 'B栋404', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da4469006f', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d475610006', 'B栋504', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da44900070', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d475610006', 'B栋604', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da44b70071', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d475610006', 'B栋704', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da44e40072', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d475610006', 'B栋804', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da45040073', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d475610006', 'B栋904', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da45300074', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d475610006', 'B栋1004', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da45680075', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d475610006', 'B栋1104', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da45940076', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d475610006', 'B栋1204', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da98f50077', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d492950007', 'C栋101', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da99510078', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d492950007', 'C栋201', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da998c0079', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d492950007', 'C栋301', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da99b4007a', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d492950007', 'C栋401', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da99d6007b', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d492950007', 'C栋501', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da99f6007c', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d492950007', 'C栋601', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da9a1a007d', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d492950007', 'C栋701', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da9a45007e', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d492950007', 'C栋801', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da9a72007f', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d492950007', 'C栋901', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da9aaa0080', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d492950007', 'C栋1001', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da9acb0081', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d492950007', 'C栋1101', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28da9aec0082', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d492950007', 'C栋1201', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28daa0880083', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d492950007', 'C栋102', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28daa16a0084', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d492950007', 'C栋202', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28daa1bb0085', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d492950007', 'C栋302', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28daa1f20086', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d492950007', 'C栋402', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28daa2280087', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d492950007', 'C栋502', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28daa2780088', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d492950007', 'C栋602', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28daa2ad0089', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d492950007', 'C栋702', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28daa2e4008a', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d492950007', 'C栋802', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28daa341008b', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d492950007', 'C栋902', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28daa3ab008c', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d492950007', 'C栋1002', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28daa3fa008d', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d492950007', 'C栋1102', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28daa427008e', '402880875e28bd1c015e28d8b2e80015', '402880875e28bd1c015e28d492950007', 'C栋1202', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28daac60008f', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d492950007', 'C栋103', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28daac8f0090', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d492950007', 'C栋203', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28daacbc0091', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d492950007', 'C栋303', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28daacf30092', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d492950007', 'C栋403', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28daad1f0093', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d492950007', 'C栋503', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28daad570094', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d492950007', 'C栋603', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28daad830095', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d492950007', 'C栋703', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28daadb10096', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d492950007', 'C栋803', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28daadde0097', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d492950007', 'C栋903', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28daae090098', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d492950007', 'C栋1003', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28daae360099', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d492950007', 'C栋1103', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28daae56009a', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d492950007', 'C栋1203', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dab770009b', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d492950007', 'C栋104', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dab7ac009c', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d492950007', 'C栋204', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dab7d5009d', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d492950007', 'C栋304', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dab801009e', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d492950007', 'C栋404', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dab82e009f', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d492950007', 'C栋504', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dab84f00a0', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d492950007', 'C栋604', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dab87d00a1', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d492950007', 'C栋704', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dab8a800a2', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d492950007', 'C栋804', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dab8d500a3', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d492950007', 'C栋904', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dab90000a4', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d492950007', 'C栋1004', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dab98900a5', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d492950007', 'C栋1104', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dab9b200a6', '402880875e28bd1c015e28d9703b0016', '402880875e28bd1c015e28d492950007', 'C栋1204', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28def85900af', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dbc02100a7', 'A栋101', '已售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28def89800b0', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dbc02100a7', 'A栋201', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28def8c000b1', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dbc02100a7', 'A栋301', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28def8f400b2', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dbc02100a7', 'A栋401', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28def91e00b3', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dbc02100a7', 'A栋501', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28def94500b4', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dbc02100a7', 'A栋601', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28def96700b5', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dbc02100a7', 'A栋701', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28deffa100b6', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dbc02100a7', 'A栋102', '已售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28deffe600b7', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dbc02100a7', 'A栋202', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df001900b8', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dbc02100a7', 'A栋302', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df004a00b9', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dbc02100a7', 'A栋402', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df008400ba', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dbc02100a7', 'A栋502', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df00ad00bb', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dbc02100a7', 'A栋602', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df00e500bc', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dbc02100a7', 'A栋702', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df0c9100bd', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dbc02100a7', 'A栋103', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df0cbd00be', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dbc02100a7', 'A栋203', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df0ce700bf', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dbc02100a7', 'A栋303', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df0d1f00c0', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dbc02100a7', 'A栋403', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df0d4d00c1', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dbc02100a7', 'A栋503', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df0d6c00c2', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dbc02100a7', 'A栋603', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df0d9900c3', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dbc02100a7', 'A栋703', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df195900c4', '402880875e28bd1c015e28dec8dd00ae', '402880875e28bd1c015e28dbc02100a7', 'A栋104', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df198400c5', '402880875e28bd1c015e28dec8dd00ae', '402880875e28bd1c015e28dbc02100a7', 'A栋204', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df19ab00c6', '402880875e28bd1c015e28dec8dd00ae', '402880875e28bd1c015e28dbc02100a7', 'A栋304', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df19cd00c7', '402880875e28bd1c015e28dec8dd00ae', '402880875e28bd1c015e28dbc02100a7', 'A栋404', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df1a0600c8', '402880875e28bd1c015e28dec8dd00ae', '402880875e28bd1c015e28dbc02100a7', 'A栋504', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df1a3000c9', '402880875e28bd1c015e28dec8dd00ae', '402880875e28bd1c015e28dbc02100a7', 'A栋604', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df1a7500ca', '402880875e28bd1c015e28dec8dd00ae', '402880875e28bd1c015e28dbc02100a7', 'A栋704', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df47ed00cb', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dbe1d600a8', 'B栋101', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df485100cc', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dbe1d600a8', 'B栋201', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df489b00cd', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dbe1d600a8', 'B栋301', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df48be00ce', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dbe1d600a8', 'B栋401', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df48df00cf', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dbe1d600a8', 'B栋501', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df490c00d0', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dbe1d600a8', 'B栋601', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df492c00d1', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dbe1d600a8', 'B栋701', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df560700d2', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dbe1d600a8', 'B栋102', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df566400d3', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dbe1d600a8', 'B栋202', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df569300d4', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dbe1d600a8', 'B栋302', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df56bc00d5', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dbe1d600a8', 'B栋402', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df56de00d6', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dbe1d600a8', 'B栋502', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df570100d7', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dbe1d600a8', 'B栋602', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df572e00d8', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dbe1d600a8', 'B栋702', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df638e00d9', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dbe1d600a8', 'B栋103', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df63eb00da', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dbe1d600a8', 'B栋203', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df641500db', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dbe1d600a8', 'B栋303', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df643800dc', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dbe1d600a8', 'B栋403', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df645800dd', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dbe1d600a8', 'B栋503', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df648600de', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dbe1d600a8', 'B栋603', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df649b00df', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dbe1d600a8', 'B栋703', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df709f00e0', '402880875e28bd1c015e28dec8dd00ae', '402880875e28bd1c015e28dbe1d600a8', 'B栋104', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df710100e1', '402880875e28bd1c015e28dec8dd00ae', '402880875e28bd1c015e28dbe1d600a8', 'B栋204', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df712200e2', '402880875e28bd1c015e28dec8dd00ae', '402880875e28bd1c015e28dbe1d600a8', 'B栋304', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df714f00e3', '402880875e28bd1c015e28dec8dd00ae', '402880875e28bd1c015e28dbe1d600a8', 'B栋404', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df71b400e4', '402880875e28bd1c015e28dec8dd00ae', '402880875e28bd1c015e28dbe1d600a8', 'B栋504', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df71df00e5', '402880875e28bd1c015e28dec8dd00ae', '402880875e28bd1c015e28dbe1d600a8', 'B栋604', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df722000e6', '402880875e28bd1c015e28dec8dd00ae', '402880875e28bd1c015e28dbe1d600a8', 'B栋704', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df8fef00e7', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc27f200a9', 'C栋101', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df904e00e8', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc27f200a9', 'C栋201', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df907800e9', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc27f200a9', 'C栋301', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df90a700ea', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc27f200a9', 'C栋401', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df90d100eb', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc27f200a9', 'C栋501', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df90f100ec', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc27f200a9', 'C栋601', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df911300ed', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc27f200a9', 'C栋701', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df9bc800ee', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dc27f200a9', 'C栋102', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df9c2100ef', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dc27f200a9', 'C栋202', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df9c4200f0', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dc27f200a9', 'C栋302', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df9c6500f1', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dc27f200a9', 'C栋402', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df9c9100f2', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dc27f200a9', 'C栋502', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df9cbb00f3', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dc27f200a9', 'C栋602', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28df9cdd00f4', '402880875e28bd1c015e28de1ff500ad', '402880875e28bd1c015e28dc27f200a9', 'C栋702', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfa3c800f5', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc27f200a9', 'C栋103', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfa3f200f6', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc27f200a9', 'C栋203', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfa41b00f7', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc27f200a9', 'C栋303', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfa44400f8', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc27f200a9', 'C栋403', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfa46a00f9', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc27f200a9', 'C栋503', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfa4c200fa', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc27f200a9', 'C栋603', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfa4ec00fb', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc27f200a9', 'C栋703', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfaf3b00fc', '402880875e28bd1c015e28dec8dd00ae', '402880875e28bd1c015e28dc27f200a9', 'C栋104', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfaf7500fd', '402880875e28bd1c015e28dec8dd00ae', '402880875e28bd1c015e28dc27f200a9', 'C栋204', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfafa100fe', '402880875e28bd1c015e28dec8dd00ae', '402880875e28bd1c015e28dc27f200a9', 'C栋304', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfafc200ff', '402880875e28bd1c015e28dec8dd00ae', '402880875e28bd1c015e28dc27f200a9', 'C栋404', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfafe60100', '402880875e28bd1c015e28dec8dd00ae', '402880875e28bd1c015e28dc27f200a9', 'C栋504', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfb0100101', '402880875e28bd1c015e28dec8dd00ae', '402880875e28bd1c015e28dc27f200a9', 'C栋604', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfb03d0102', '402880875e28bd1c015e28dec8dd00ae', '402880875e28bd1c015e28dc27f200a9', 'C栋704', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfcfa50103', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋101', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfd0030104', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋201', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfd0300105', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋301', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfd05c0106', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋401', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfd0930107', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋501', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfd0b50108', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋601', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfd0e00109', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋701', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfd5a4010a', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋102', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfd6a3010b', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋202', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfd6c4010c', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋302', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfd6e7010d', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋402', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfd707010e', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋502', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfd729010f', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋602', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfd74a0110', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋702', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfdcf90111', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋103', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfdd240112', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋203', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfdd450113', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋303', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfdd670114', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋403', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfdd880115', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋503', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfddb50116', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋603', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfdde30117', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋703', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfe3a90118', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋104', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfe40b0119', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋204', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfe440011a', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋304', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfe46f011b', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋404', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfe499011c', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋504', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfe4ba011d', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋604', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28dfe4e5011e', '402880875e28bd1c015e28ddc2c600ac', '402880875e28bd1c015e28dc713700aa', 'D栋704', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea6e1e0126', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋101', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea6e480127', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋201', '已售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea6e740128', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋301', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea6eab0129', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋401', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea6ef9012a', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋501', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea6f1a012b', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋601', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea6f53012c', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋701', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea6f89012d', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋801', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea7004012e', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋901', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea70bb012f', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋1001', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea710f0130', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋1101', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea713c0131', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋1201', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea71730132', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋1301', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea719f0133', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋1401', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea71cb0134', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋1501', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea72240135', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋1601', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea72500136', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋1701', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea727d0137', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋1801', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea72a90138', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋1901', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea72d40139', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋2001', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea741f013a', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋102', '已售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea745b013b', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋202', '已售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea747c013c', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋302', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea74aa013d', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋402', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea74e0013e', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋502', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea7518013f', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋602', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea754f0140', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋702', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea75710141', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋802', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea75a70142', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋902', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea75c90143', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋1002', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea75ec0144', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋1102', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea76160145', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋1202', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea76370146', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋1302', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea767a0147', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋1402', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea76a60148', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋1502', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea76d90149', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋1602', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea770b014a', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋1702', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea7736014b', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋1802', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea7758014c', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋1902', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea7779014d', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e809c70120', 'A栋2002', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea820b014e', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋103', '已售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea82af014f', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋203', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea82d40150', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋303', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea82f50151', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋403', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea83220152', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋503', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea83420153', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋603', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea83650154', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋703', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea839c0155', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋803', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea83bd0156', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋903', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea83e90157', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋1003', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea840e0158', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋1103', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea842d0159', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋1203', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea844d015a', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋1303', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea8479015b', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋1403', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea849d015c', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋1503', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea84c8015d', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋1603', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea84e9015e', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋1703', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea850e015f', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋1803', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea853c0160', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋1903', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea85630161', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋2003', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea8db10162', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋104', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea8de40163', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋204', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea8e110164', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋304', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea8e3a0165', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋404', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea8e660166', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋504', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea8e880167', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋604', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea8ea90168', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋704', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea8eca0169', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋804', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea8ef6016a', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋904', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea8f18016b', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋1004', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea8fb6016c', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋1104', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea8fdf016d', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋1204', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea9000016e', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋1304', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea9022016f', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋1404', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea90430170', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋1504', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea90640171', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋1604', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea90860172', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋1704', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea90be0173', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋1804', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea90ea0174', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋1904', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28ea910b0175', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e809c70120', 'A栋2004', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaa5340176', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e82d3f0121', 'B栋101', '保留');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaa5630177', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e82d3f0121', 'B栋201', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaa5ce0178', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e82d3f0121', 'B栋301', '保留');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaa5ef0179', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e82d3f0121', 'B栋401', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaa610017a', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e82d3f0121', 'B栋501', '保留');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaa63e017b', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e82d3f0121', 'B栋601', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaa669017c', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e82d3f0121', 'B栋701', '保留');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaa680017d', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e82d3f0121', 'B栋801', '保留');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaa6a2017e', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e82d3f0121', 'B栋901', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaa6c4017f', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e82d3f0121', 'B栋1001', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaa6f00180', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e82d3f0121', 'B栋1101', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaa71a0181', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e82d3f0121', 'B栋1201', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaa73c0182', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e82d3f0121', 'B栋1301', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaa75d0183', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e82d3f0121', 'B栋1401', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaa7810184', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e82d3f0121', 'B栋1501', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaa7ac0185', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e82d3f0121', 'B栋1601', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaa7e40186', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e82d3f0121', 'B栋1701', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaa8060187', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e82d3f0121', 'B栋1801', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaa8310188', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e82d3f0121', 'B栋1901', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaa8530189', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e82d3f0121', 'B栋2001', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaafd2018a', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋102', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eab01e018b', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋202', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eab05b018c', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋302', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eab08d018d', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋402', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eab0ae018e', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋502', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eab0cf018f', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋602', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eab0f10190', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋702', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eab11d0191', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋802', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eab14a0192', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋902', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eab1970193', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋1002', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eab1b90194', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋1102', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eab1da0195', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋1202', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eab2080196', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋1302', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eab23e0197', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋1402', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eab25e0198', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋1502', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eab2800199', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋1602', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eab2a2019a', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋1702', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eab2ce019b', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋1802', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eab2fe019c', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋1902', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eab328019d', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋2002', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eabaeb019e', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e82d3f0121', 'B栋103', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eabb2a019f', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e82d3f0121', 'B栋203', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eabb6401a0', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e82d3f0121', 'B栋303', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eabb8601a1', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e82d3f0121', 'B栋403', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eabbab01a2', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e82d3f0121', 'B栋503', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eabbd301a3', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e82d3f0121', 'B栋603', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eabbf401a4', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e82d3f0121', 'B栋703', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eabc1501a5', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e82d3f0121', 'B栋803', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eabc3701a6', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e82d3f0121', 'B栋903', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eabc5901a7', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e82d3f0121', 'B栋1003', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eabc7a01a8', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e82d3f0121', 'B栋1103', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eabca701a9', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e82d3f0121', 'B栋1203', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eabcc701aa', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e82d3f0121', 'B栋1303', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eabce801ab', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e82d3f0121', 'B栋1403', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eabd2001ac', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e82d3f0121', 'B栋1503', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eabd4101ad', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e82d3f0121', 'B栋1603', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eabd6301ae', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e82d3f0121', 'B栋1703', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eabd8f01af', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e82d3f0121', 'B栋1803', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eabdbb01b0', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e82d3f0121', 'B栋1903', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eabddc01b1', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e82d3f0121', 'B栋2003', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eac64c01b2', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋104', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eac67c01b3', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋204', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eac6b501b4', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋304', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eac6e001b5', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋404', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eac70101b6', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋504', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eac73801b7', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋604', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eac79d01b8', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋704', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eac7d401b9', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋804', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eac7f501ba', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋904', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eac82301bb', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋1004', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eac84301bc', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋1104', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eac86501bd', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋1204', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eac88601be', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋1304', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eac8a801bf', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋1404', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eac8c801c0', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋1504', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eac8df01c1', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋1604', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eac90b01c2', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋1704', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eac93801c3', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋1804', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eac95801c4', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋1904', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eac97a01c5', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e82d3f0121', 'B栋2004', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eadfc501c6', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋101', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eadffe01c7', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋201', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eae02401c8', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋301', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eae04a01c9', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋401', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eae07701ca', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋501', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eae0a001cb', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋601', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eae0cb01cc', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋701', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eae0ee01cd', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋801', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eae11901ce', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋901', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eae13b01cf', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋1001', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eae15d01d0', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋1101', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eae17d01d1', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋1201', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eae1b401d2', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋1301', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eae1e201d3', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋1401', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eae20e01d4', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋1501', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eae24501d5', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋1601', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eae26701d6', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋1701', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eae28701d7', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋1801', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eae2a901d8', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋1901', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eae2eb01d9', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋2001', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eae9b101da', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e844610122', 'C栋102', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eae9e701db', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e844610122', 'C栋202', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaea1201dc', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e844610122', 'C栋302', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaea3401dd', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e844610122', 'C栋402', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaea5601de', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e844610122', 'C栋502', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaea8101df', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e844610122', 'C栋602', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaeaad01e0', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e844610122', 'C栋702', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaeacf01e1', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e844610122', 'C栋802', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaeafc01e2', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e844610122', 'C栋902', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaeb1e01e3', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e844610122', 'C栋1002', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaeb4901e4', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e844610122', 'C栋1102', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaeb6a01e5', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e844610122', 'C栋1202', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaeb8b01e6', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e844610122', 'C栋1302', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaebb801e7', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e844610122', 'C栋1402', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaec2801e8', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e844610122', 'C栋1502', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaec7401e9', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e844610122', 'C栋1602', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaecb601ea', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e844610122', 'C栋1702', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaece301eb', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e844610122', 'C栋1802', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaed1001ec', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e844610122', 'C栋1902', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaed3101ed', '402880875e28bd1c015e28e9ad8e0125', '402880875e28bd1c015e28e844610122', 'C栋2002', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaf4cb01ee', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e844610122', 'C栋103', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaf52001ef', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e844610122', 'C栋203', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaf54b01f0', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e844610122', 'C栋303', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaf56c01f1', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e844610122', 'C栋403', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaf58d01f2', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e844610122', 'C栋503', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaf5af01f3', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e844610122', 'C栋603', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaf5d001f4', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e844610122', 'C栋703', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaf5fc01f5', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e844610122', 'C栋803', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaf61e01f6', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e844610122', 'C栋903', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaf63f01f7', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e844610122', 'C栋1003', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaf66c01f8', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e844610122', 'C栋1103', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaf68f01f9', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e844610122', 'C栋1203', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaf6b901fa', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e844610122', 'C栋1303', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaf6da01fb', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e844610122', 'C栋1403', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaf6fb01fc', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e844610122', 'C栋1503', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaf72901fd', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e844610122', 'C栋1603', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaf75501fe', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e844610122', 'C栋1703', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaf78101ff', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e844610122', 'C栋1803', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaf7a20200', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e844610122', 'C栋1903', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaf8120201', '402880875e28bd1c015e28e9454f0124', '402880875e28bd1c015e28e844610122', 'C栋2003', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eafbfd0202', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋104', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eafc5f0203', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋204', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eafc890204', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋304', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eafcab0205', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋404', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eafccc0206', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋504', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eafd050207', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋604', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eafd250208', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋704', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eafd5c0209', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋804', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eafd7d020a', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋904', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eafd9f020b', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋1004', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eafdc0020c', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋1104', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eafde1020d', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋1204', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eafe0e020e', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋1304', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eafe2f020f', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋1404', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eafe500210', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋1504', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eafecc0211', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋1604', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eafef70212', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋1704', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaff180213', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋1804', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaff440214', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋1904', '待售');
INSERT INTO `t_room` VALUES ('402880875e28bd1c015e28eaff660215', '402880875e28bd1c015e28e8cea00123', '402880875e28bd1c015e28e844610122', 'C栋2004', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d1cb30007', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b7679760001', 'A栋101', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d1d120008', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b7679760001', 'A栋201', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d1d3b0009', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b7679760001', 'A栋301', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d1d6b000a', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b7679760001', 'A栋401', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d1d97000b', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b7679760001', 'A栋501', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d1dc0000c', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b7679760001', 'A栋601', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d233c000d', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b7679760001', 'A栋102', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d23a7000e', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b7679760001', 'A栋202', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d23d5000f', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b7679760001', 'A栋302', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d24020010', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b7679760001', 'A栋402', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d242c0011', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b7679760001', 'A栋502', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d245e0012', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b7679760001', 'A栋602', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d2b7f0013', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b7679760001', 'A栋103', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d2be20014', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b7679760001', 'A栋203', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d2c0f0015', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b7679760001', 'A栋303', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d2c3d0016', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b7679760001', 'A栋403', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d2c670017', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b7679760001', 'A栋503', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d2c930018', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b7679760001', 'A栋603', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d31cc0019', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b7679760001', 'A栋104', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d323c001a', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b7679760001', 'A栋204', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d328e001b', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b7679760001', 'A栋304', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d32da001c', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b7679760001', 'A栋404', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d3309001d', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b7679760001', 'A栋504', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d3333001e', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b7679760001', 'A栋604', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d9c8f001f', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b769dbb0002', 'B栋101', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d9cf60020', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b769dbb0002', 'B栋201', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d9d240021', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b769dbb0002', 'B栋301', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d9d500022', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b769dbb0002', 'B栋401', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d9d7a0023', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b769dbb0002', 'B栋501', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9d9da70024', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b769dbb0002', 'B栋601', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9da36f0025', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b769dbb0002', 'B栋102', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9da3d20026', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b769dbb0002', 'B栋202', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9da3f90027', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b769dbb0002', 'B栋302', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9da41f0028', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b769dbb0002', 'B栋402', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9da44a0029', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b769dbb0002', 'B栋502', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9da474002a', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b769dbb0002', 'B栋602', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9da955002b', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b769dbb0002', 'B栋103', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9daa03002c', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b769dbb0002', 'B栋203', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9daa49002d', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b769dbb0002', 'B栋303', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9daa7e002e', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b769dbb0002', 'B栋403', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9daaad002f', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b769dbb0002', 'B栋503', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9daad70030', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b769dbb0002', 'B栋603', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9db0010031', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b769dbb0002', 'B栋104', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9db0620032', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b769dbb0002', 'B栋204', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9db08e0033', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b769dbb0002', 'B栋304', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9db0bb0034', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b769dbb0002', 'B栋404', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9db0e70035', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b769dbb0002', 'B栋504', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9db1120036', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b769dbb0002', 'B栋604', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9dd7450037', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b76baec0003', 'C栋101', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9dd7a80038', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b76baec0003', 'C栋201', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9dd7d00039', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b76baec0003', 'C栋301', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9dd801003a', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b76baec0003', 'C栋401', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9dd82c003b', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b76baec0003', 'C栋501', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9dd859003c', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b76baec0003', 'C栋601', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9dde29003d', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b76baec0003', 'C栋102', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9dde8a003e', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b76baec0003', 'C栋202', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9ddeb5003f', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b76baec0003', 'C栋302', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9ddef00040', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b76baec0003', 'C栋402', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9ddf170041', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b76baec0003', 'C栋502', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9ddf390042', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b76baec0003', 'C栋602', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9de4d10043', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b76baec0003', 'C栋103', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9de5060044', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b76baec0003', 'C栋203', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9de5370045', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b76baec0003', 'C栋303', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9de5640046', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b76baec0003', 'C栋403', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9de58f0047', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b76baec0003', 'C栋503', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9de5ba0048', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b76baec0003', 'C栋603', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9deb830049', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b76baec0003', 'C栋104', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9debf1004a', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b76baec0003', 'C栋204', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9dec20004b', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b76baec0003', 'C栋304', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9dec4b004c', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b76baec0003', 'C栋404', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9dec74004d', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b76baec0003', 'C栋504', '待售');
INSERT INTO `t_room` VALUES ('402880875e2b582e015e2b9deca0004e', '402880875e2b582e015e2b773ada0004', '402880875e2b582e015e2b76baec0003', 'C栋604', '待售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5d4f60000', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A101', '已售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5d5c00001', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A201', '已售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5d5ef0002', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A301', '已售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5d61a0003', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A401', '已售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5d6480004', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A501', '已售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5d6710005', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A601', '待售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5d6ad0006', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A701', '保留');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5d6d60007', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A801', '保留');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5d7120008', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A901', '保留');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5d7530009', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A1001', '待售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5d77d000a', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A1101', '待售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5d7ab000b', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A1201', '待售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5d7d5000c', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A1301', '待售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5d802000d', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A1401', '待售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5d82f000e', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A1501', '待售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5d854000f', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A1601', '待售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5d8a20010', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A1701', '待售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5d8d70011', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A1801', '待售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5d9050012', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A1901', '待售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5d92f0013', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A2001', '待售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5d95f0014', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A2101', '待售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5d98a0015', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A2201', '待售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5d9b60016', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A2301', '待售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5d9df0017', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A2401', '待售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5da190018', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A2501', '待售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5da450019', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A2601', '待售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5da73001a', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A2701', '待售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5da9c001b', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A2801', '待售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5dad8001c', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A2901', '待售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5db17001d', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A3001', '待售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5db47001e', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A3101', '待售');
INSERT INTO `t_room` VALUES ('402880f35e0df442015e0df5db70001f', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A3201', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8d80b0000', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A102', '已售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8d8d70001', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A202', '已售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8d9230002', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A302', '已售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8d94f0003', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A402', '保留');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8d9860004', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A502', '已售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8d9c90005', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A602', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8da4d0006', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A702', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8da910007', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A802', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8dac70008', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A902', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8daf50009', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A1002', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8db2b000a', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A1102', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8db59000b', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A1202', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8db8f000c', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A1302', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8dbbc000d', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A1402', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8dbf3000e', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A1502', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8dc21000f', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A1602', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8dc580010', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A1702', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8dc840011', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A1802', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8dcba0012', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A1902', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8dce80013', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A2002', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8dd200014', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A2102', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8dd580015', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A2202', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8dd840016', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A2302', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8ddb00017', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A2402', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8dddc0018', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A2502', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8de130019', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A2602', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8de42001a', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A2702', '保留');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8de6b001b', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A2802', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8de9a001c', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A2902', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8dec5001d', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A3002', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8def3001e', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A3102', '待售');
INSERT INTO `t_room` VALUES ('402880f35e12da47015e12e8df1d001f', '402880cf5e07d135015e07e32c7b0001', '402880f35dde8705015dde87a4280000', 'A3202', '保留');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d558dca0011', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E101', '已售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d558e0b0012', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E201', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d558e360013', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E301', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d558e780014', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E401', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d558ea50015', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E501', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d558ec90016', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E601', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d558ef20017', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E701', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d558f410018', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E801', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d558f630019', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E901', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d558f9b001a', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E1001', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d558fd3001b', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E1101', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d559015001c', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E1201', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d559042001d', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E1301', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d55906e001e', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E1401', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d5590a3001f', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E1501', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d5590c50020', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E1601', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d5590e50021', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E1701', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d5591070022', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E1801', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d5591280023', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E1901', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d55913f0024', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E2001', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d5591600025', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E2101', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d55918d0026', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E2201', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d5591ad0027', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E2301', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d5591cf0028', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E2401', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d5591fb0029', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E2501', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d559228002a', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E2601', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d559249002b', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E2701', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d55926a002c', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E2801', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d55928b002d', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E2901', '待售');
INSERT INTO `t_room` VALUES ('4028ab3e5e4d2fe1015e4d5592ad002e', '402880f35e03b945015e03ba52320000', '402880f35ddea8c4015ddeac59a70000', 'E3001', '待售');
INSERT INTO `t_room` VALUES ('ff8080815e4f46aa015e4f85d390000b', '402880cf5e07d135015e07e32c7b0001', '402880115e23a1b4015e23b2f9300000', 'C101', '待售');
INSERT INTO `t_room` VALUES ('ff8080815e4f46aa015e4f85d3f5000c', '402880cf5e07d135015e07e32c7b0001', '402880115e23a1b4015e23b2f9300000', 'C201', '待售');

-- ----------------------------
-- Table structure for t_salary
-- ----------------------------
DROP TABLE IF EXISTS `t_salary`;
CREATE TABLE `t_salary` (
  `id` varchar(36) NOT NULL,
  `sum` bigint(255) DEFAULT NULL,
  `percent` varchar(4) DEFAULT NULL,
  `time` varchar(10) DEFAULT NULL,
  `count` int(10) DEFAULT NULL,
  `emp_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_salary
-- ----------------------------
INSERT INTO `t_salary` VALUES ('4028ab3e5e4d2fe1015e4d43b8c10003', '702900', '1', '2017-09', '2', '4028ab3e5e4d2fe1015e4d31cff70000');
INSERT INTO `t_salary` VALUES ('4028ab3e5e4d2fe1015e4d4cda480008', '26100', '2', '2017-09', '2', '402880875e2b582e015e2baf2ee6005b');
INSERT INTO `t_salary` VALUES ('4028ab3e5e4d2fe1015e4d51b5450010', '14400', '2', '2017-09', '1', '402880875e2b582e015e2bb0bc1a005d');

-- ----------------------------
-- Table structure for t_sale
-- ----------------------------
DROP TABLE IF EXISTS `t_sale`;
CREATE TABLE `t_sale` (
  `id` varchar(36) NOT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `sale_time` datetime DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `room_id` varchar(36) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `total_cost` double DEFAULT NULL,
  `emp_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sale
-- ----------------------------
INSERT INTO `t_sale` VALUES ('4028ab3e5e4d2fe1015e4d43b84e0002', '402880875dbfde50015dbfe38d330000', '2017-09-04 00:00:00', '1000', '402880875e28bd1c015e28d9b1ef0017', '0.95', '950', '4028ab3e5e4d2fe1015e4d31cff70000', '2017-09-04 00:00:00', '激活');
INSERT INTO `t_sale` VALUES ('4028ab3e5e4d2fe1015e4d4cd9f60007', '402880875dbfde50015dbfe38d330000', '2017-09-04 00:00:00', '11000', '402880875e28bd1c015e28def85900af', '0.95', '10450', '402880875e2b582e015e2baf2ee6005b', '2017-09-04 00:00:00', '激活');
INSERT INTO `t_sale` VALUES ('4028ab3e5e4d2fe1015e4d4cef6c0009', '402880875dbfde50015dbfe38d330000', '2017-09-04 00:00:00', '18000', '402880875e28bd1c015e28deffa100b6', '0.95', '17100', '402880875e2b582e015e2baf2ee6005b', '2017-09-04 00:00:00', '激活');
INSERT INTO `t_sale` VALUES ('4028ab3e5e4d2fe1015e4d51b50b000f', '402880875dbfde50015dbfe38d330000', '2017-09-04 00:00:00', '16000', '4028ab3e5e4d2fe1015e4d558dca0011', '0.95', '15200', '402880875e2b582e015e2bb0bc1a005d', '2017-09-04 00:00:00', '激活');
INSERT INTO `t_sale` VALUES ('ff8080815e4f46aa015e4f7d2d470007', 'ff8080815e4f46aa015e4f74077c0001', '2017-09-05 00:00:00', '780000', '402880875e28bd1c015e28d9b2640018', '0.88', '686400', '4028ab3e5e4d2fe1015e4d31cff70000', '2017-09-05 00:00:00', '激活');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(36) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `pwd` varchar(64) NOT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `wechat` varchar(50) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `t_name` varchar(20) DEFAULT NULL,
  `headicon` varchar(500) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `introduction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('402880115d81fa52015d82036b5c0002', '546546541@qq.com', '13737284568', 'EE0088C294CD6B1D504CC18E0AB6E04847841B40D58D241905E46475', '546546541', '63541635165', '女', '2017-07-21', '自古深情留不住', '张敏', '/EstateSales/attached/user/30345830954504.jpg', '江西赣州', '我喜欢依山旁水的地方');
INSERT INTO `t_user` VALUES ('402880115d9d8bf0015d9d9083110001', '2922862354@qq.com', '15234567898', 'C2B0E90D71D9F036FCCF39A1817D10ECA3CCC9EE57B6FFB3DB49F582', '2922862354', '15234567895', '男', '1990-08-08', '王者风范', '杨靖', '/EstateSales/attached/user/45779000059769.png', '四川成都', '我来自四川，毕业于武汉大学，我是一个好动的男生，平时喜欢打篮球，我喜欢去探险');
INSERT INTO `t_user` VALUES ('402880125e17169f015e171c7fc10001', '23213@qq.con', '15979734621', '4240FE0839402E5DFECADC0BEF149B76EF6D06779FB4226BB3A30BEC', '123213123', '32213123', '女', '2018-08-01', '王小丽', '老王', '/EstateSales/attached/user/10817026679634.png', '浙江', '1423423423');
INSERT INTO `t_user` VALUES ('402880125e1727f0015e17290cdd0000', null, '15979734622', '7F85548D49CDB19DAD4795FB2218960F7C22386608CE7D3CCF1AF106', null, null, null, null, null, '老王', '/EstateSales/attached/user/27377720712986.jpg', null, null);
INSERT INTO `t_user` VALUES ('402880125e2df7df015e2e1405610000', null, '15979734623', '5B36F527ECA22D6A18EEBA669BE6684B11CFE065885B8504AB237CBE', null, null, null, null, null, '谭大大', null, null, null);
INSERT INTO `t_user` VALUES ('402880125e2df7df015e2e1cdaaa0002', null, '15770783886', '96C13B59D95872E54492BF0DD71D9FBC8CD8EEB0D8D09784AADAFDC7', null, null, null, null, null, '谭芳芳', null, null, null);
INSERT INTO `t_user` VALUES ('402880125e2df7df015e2e1d99570003', '45457452@qq.com', '15770783556', '55E1187A3FE10E29D2D26BE3C6F65F7077885A933002DF39A02018C4', '2225643565', '45456486', '男', '2017-04-11', '进口量大幅升高可见是个', '赖林辉', '/EstateSales/attached/user/2170240488453935.png', 'j江西省赣州市', '45564');
INSERT INTO `t_user` VALUES ('402880125e3d33ed015e3d4985220000', null, '15635654565', 'EE6F19468549429D2209E7B872A3B967B1CC86716DDC480FD9721337', null, null, null, null, null, '冯新星', null, null, null);
INSERT INTO `t_user` VALUES ('402880125e3d33ed015e3d4e65160001', null, '13479758184', '330070A8BA7C9780BCE99D29500B7AF875F93CB0A1D028F5F3EF76E9', null, null, null, null, null, '谢圣宏', null, null, null);
INSERT INTO `t_user` VALUES ('402880125e3d33ed015e3d5d0c230002', null, '13479738185', '2C6CE9CBEFCA09A98116917A539960D0F1EAB5A4B72B70AA1C145CE7', null, null, null, null, null, '朱世红', '/EstateSales/attached/user/44598370596861.jpg', null, null);
INSERT INTO `t_user` VALUES ('402880875dbfde50015dbfe38d330000', '2325324563@qq.com', '15560643568', '63CE97B7828B0DD877D06872B3189207AAA37C50A8F3CBAF8D9FE2A8', '232532459', '15370134026', '女', '2017-08-31', '刹那芳华，烟花暗淡', '王丽鹃', '/EstateSales/attached/user/2169966678640385.jpg', '江西九江市', '毕业中央戏剧学院，从小喜欢戏剧，在各地演出，小有名气，平时还喜欢散步，练太极\r\n毕业中央戏剧学院，从小喜欢戏剧，在各地演出，小有名气，平时还喜欢散步，练太极\r\n');
INSERT INTO `t_user` VALUES ('ff8080815e4f46aa015e4f74077c0001', null, '15270743950', 'D523F0F845AF0987B236466AE66A10FDCDA27BCF23F08C47A23D0F8C', null, null, null, null, null, '丹丹', '/EstateSales/attached/user/2212584355112713.png', null, null);

-- ----------------------------
-- Table structure for zzz
-- ----------------------------
DROP TABLE IF EXISTS `zzz`;
CREATE TABLE `zzz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zzz
-- ----------------------------
INSERT INTO `zzz` VALUES ('1', '李辉');
INSERT INTO `zzz` VALUES ('2', '明台');
INSERT INTO `zzz` VALUES ('3', '武田');
INSERT INTO `zzz` VALUES ('4', '明建');
INSERT INTO `zzz` VALUES ('5', '赵越');
INSERT INTO `zzz` VALUES ('6', '王明');
INSERT INTO `zzz` VALUES ('7', '李旺名');
