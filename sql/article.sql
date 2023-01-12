/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : localhost:3306
 Source Schema         : article

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 12/01/2023 15:35:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account_pwd` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `face_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`) USING BTREE,
  UNIQUE INDEX `account_name`(`account_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (19, '吕长建', '0000', '20200610112216029645.jpg');
INSERT INTO `account` VALUES (20, '嘉诚', '0000', NULL);
INSERT INTO `account` VALUES (21, 'admin', 'admin', NULL);

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_name` int(255) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`admin_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1001, '0000');
INSERT INTO `admin` VALUES (1002, '0000');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `article_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `article_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `article_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publish_date` datetime NOT NULL,
  `article_author_id` int(255) NOT NULL COMMENT '物理外键关联作者表',
  `article_click_count` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('000001', '11', '11', '2020-06-09 08:06:07', 11, 111111111);
INSERT INTO `article` VALUES ('001', '干净味', '没有耐心，情人节和520竟然送的都是玫瑰花，也不陪我看综艺。还嫌弃我胖，把电话昵称从“小甜甜”改为“老李”，旅行就只知道逛公园和爬山，没有一点情趣。常常和同事们去喝酒，给我谎称是客户。你的工作，哪里需要陪客户？将我一个人丢家里，又饥又饿，还不管不顾。你结婚时的誓言是怎么说的·····妻子脸上皱纹日渐增多，脾气比结婚时大几个水桶腰，眼泪花花往下流', '2018-09-23 15:25:21', 1, 100);
INSERT INTO `article` VALUES ('002', '故人归', '她敬我酒，说我是带她入门的师父，我就多喝了几杯。然后，就醉了。什么都不记得了。一大早起来，只看见妻子就坐在床边，不是家里的床，是医院的床。她问我，送我来医院那个女的是谁？为什么我在微信里叫她“小娜娜”，还让她在生理期多喝热水？她说过不下去了。又在耳边历数我的罪过。幸亏是医院，她才没有太放肆，更没有动手。我说，要不就离婚吧。我以为她会崩溃，她会挽留，毕竟这是我常年都在用的杀手锏。没想到这次，玩砸了', '2019-08-22 18:50:48', 2, 1000);
INSERT INTO `article` VALUES ('003', '听风吹', 'Word和PPT是何物，也不必弄得太清楚，就说你大学四年追剧、打游戏、挂科，告诉他们这是学长学姐们留下的传统：university，有你玩四年。不加班，坚决不加班，不能接受加班的工作。这个世界上怎么还有要加班的工作？字写得再丑一点。字写得越丑，人越好看，这是个看脸的时代，又不是看字的时代。索性看开一点，“我字很丑但是我很温柔呀。”工资太低的工作，可千万别干。想想你自己名牌院校毕业，还当过学生会主席，', '2018-03-11 22:51:04', 3, 10000);
INSERT INTO `article` VALUES ('004', '过路人', '长文案要找准一个切入点。找到一个故事，一个新颖的角度，这样才能构思出长文案的基本写作逻辑。如果手上有笔和纸，可以简单画下写作的脉络。第一篇是情感故事切入，第二篇是面试技巧切入，用的又全部是反语。这就是不同的切入点。写下一个吸引力的标题，让受众能跟着你的节奏读进去。Neil French为贝克啤酒写的一则长文案是这样写标题的：“今天早上你觉得有点灰心？看下去，中饭的时候你好去自杀了。”你会对这则广告描述的状态感到新奇，然后认真读下去。这就是一个好标题的吸引力。内文必须有趣或者有用。可读性是第一原则，让你的文案充满吸引力魔法，可以借助故事、知识、段子等具有传播性的内容来实现。', '2020-05-13 18:35:55', 4, 100000);
INSERT INTO `article` VALUES ('005', '唯青山', '小丑在哥谭市的失落世界里，向过路的行人表演自己的，之后，一个人孤单谢幕。在世界上的另一个时空，长文案因为篇幅过长而淡出历史舞台。在灰暗的角落里，我们想起它娓娓道来的经典形式，不禁感叹一个时代的终结。你还记得这项古老的手艺吗？现在，一一剖析开来给你看。切西瓜要先开一刀，长文案要找准一个切入点。找到一个故事，一个新颖的角度，这样才能构思出长文案的基本写作逻辑。如果手上有笔和纸，可以简单画下写作的脉络。第一篇是情感故事切入，第二篇是面试技巧切入，用的又全部是反语。这就是不同的切入点。写下一个吸引力的标题，让受众能跟着你的节奏读进去。Neil French为贝克啤酒写的一则长文案是这样写标题的：“今天早上你觉得有点灰心？看下去，中饭的时候你好去自杀了。”', '2020-05-29 13:14:38', 5, 100000);
INSERT INTO `article` VALUES ('006', '一场空', '不加班，坚决不加班，不能接受加班的工作。这个世界上怎么还有要加班的工作？字写得再丑一点。字写得越丑，人越好看，这是个看脸的时代，又不是看字的时代。索性看开一点，“我字很丑但是我很温柔呀。”工资太低的工作，可千万别干。想想你自己名牌院校毕业，还当过学生会主席，每年喜迎新生晚会上都有节目表演，才貌双绝，怎么才给几千块钱？都不够一个月化妆品的钱。离家太远也不行，挤地铁多折腾啊。每天的时间全部浪费在路上，夏天满车厢都是人，臭汗太难闻了。公司必须是世界500强，初创企业不考虑，公司人数最起码1000人以上，有点规模。也不能太多，太多又勾心斗角。', '2020-06-01 13:53:00', 5, 1000000);
INSERT INTO `article` VALUES ('007', '与卿同', '签吧！我昨晚喝多了，胃出血。签字的时候，手不自觉地抖动。我缓缓地写下“屈太浪”三个字，又写了一遍，一式两份。我看着妻子的眼睛，她刚才的泪水刷一下就不见了。瞬间，我明白了什么。不必注重着装，最好就趿拉着拖鞋去，反正面试官不拘一格降人才，不会在意你脚臭的细节。最好也别洗头，任由头皮屑掉在面试表格上，你可以告诉面试官，这像雪花在飘，多么诗意。还有，你不是神经病。最好不用敬辞，为了彰显个性，你可以每句话都加个“FXXK”或者“我艹”，这些俚语会迅速凸显你爱自由的性格。一个包容的好企业，一定会接受你这种性格，你可以迅速成为该公司的话题。一传十十传百，全公司的人都要争着看你的简历，并感叹“人才啊！”只是，没人敢聘用你。可以炫耀你的中国心，告诉他们，为了不受西方文化洗脑，所以英语四级没过，分不清woman与man的区别。逃课12门，不知英语老师是女郎。强调你是一张白纸，可以随便让人描画。什么都不会，比什么都会强，纯粹嘛。Word和PPT是何物，也不必弄得太清楚，就说你大学四年追剧、打游戏、挂科，告诉他们这是学长学姐们留下的传统：university，有你玩四年。', '2020-05-29 13:16:23', 4, 100002777);
INSERT INTO `article` VALUES ('008', '一俗人', '我真替她高兴。当初，她毕业来公司，一个小菜鸟，什么都不懂。跟我学，我毫无保留地将自己所学教授给她，还为此专门开设一个专栏《文案24讲》，让她更加全面系统地了解文案怎么写。她确实悟性高，写出的文案深受总经理喜欢，不断地升职加薪，很快就超过了我。昨晚，她敬我酒，说我是带她入门的师父，我就多喝了几杯。然后，就醉了。什么都不记得了。一大早起来，只看见妻子就坐在床边，不是家里的床，是医院的床。她问我，送我来医院那个女的是谁？为什么我在微信里叫她“小娜娜”，还让她在生理期多喝热水？她说过不下去了。又在耳边历数我的罪过。幸亏是医院，她才没有太放肆，更没有动手。我说，要不就离婚吧。我以为她会崩溃，她会挽留，毕竟这是我常年都在用的杀手锏。没想到这次，玩砸了。离婚协议书就在病床头，笔帽打开，她递给我一支笔，轻描淡写地说', '2020-05-29 13:18:00', 3, 10);

-- ----------------------------
-- Table structure for author
-- ----------------------------
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author`  (
  `article_author_id` int(11) NOT NULL AUTO_INCREMENT,
  `author_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`article_author_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of author
-- ----------------------------
INSERT INTO `author` VALUES (1, '吕长建');
INSERT INTO `author` VALUES (2, '嘉诚');
INSERT INTO `author` VALUES (3, '吕云飞');
INSERT INTO `author` VALUES (4, '文宇');
INSERT INTO `author` VALUES (5, '春雨');

SET FOREIGN_KEY_CHECKS = 1;
