/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : 192.168.43.35:3306
 Source Schema         : online_exam

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 24/10/2023 10:56:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for question_manage
-- ----------------------------
DROP TABLE IF EXISTS `question_manage`;
CREATE TABLE `question_manage`  (
  `qu_id` int(0) NOT NULL COMMENT '问题序号',
  `qu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '问题内容',
  `qu_role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自测为1，他测为2',
  PRIMARY KEY (`qu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_manage
-- ----------------------------
INSERT INTO `question_manage` VALUES (1, '我会花时间和精力来确定同事们按已经达成一致的原则和标准工作。									\r\n我会花时间和精力来确定同事们按已经达成一致的原则和标准工作。', '1');
INSERT INTO `question_manage` VALUES (2, '我会努力让他人接受对组织运营最为有利的价值体系。', '1');
INSERT INTO `question_manage` VALUES (3, '我对自己的领导理念非常清楚。', '1');
INSERT INTO `question_manage` VALUES (4, '在要求他人之前我会以身作则。', '1');
INSERT INTO `question_manage` VALUES (5, '我履行我做出的誓言和承诺。', '1');
INSERT INTO `question_manage` VALUES (6, '我就我的行为如何影响他人的表现征询反馈意见。', '1');
INSERT INTO `question_manage` VALUES (7, '我同他人探讨未来的发展对我们现在工作的影响。', '1');
INSERT INTO `question_manage` VALUES (8, '我能描绘出令人信服的我们的未来愿景。', '1');
INSERT INTO `question_manage` VALUES (9, '我向大家展示他们的长期利益是可以在共同的目标和愿景下实现的。', '1');
INSERT INTO `question_manage` VALUES (10, '我呼吁他人与我一起分享对美好未来的憧憬。', '1');
INSERT INTO `question_manage` VALUES (11, '我能勾画出我们渴望实现的宏伟蓝图。', '1');
INSERT INTO `question_manage` VALUES (12, '我向大家阐述我们所做工作的深远意义和目的，并对自己所说的确信不疑。', '1');
INSERT INTO `question_manage` VALUES (13, '我会打破部门或组织之间的界限，在部门或组织之外寻找创新的方法来改进工作。', '1');
INSERT INTO `question_manage` VALUES (14, '我会寻找具有挑战性的机会来检验自己的技能和才干。', '1');
INSERT INTO `question_manage` VALUES (15, '即使有失败的可能，我也勇于尝试和冒险。', '1');
INSERT INTO `question_manage` VALUES (16, '我要求员工在所做的工作中尝试创新。', '1');
INSERT INTO `question_manage` VALUES (17, '当事情同我们的预期发展不一样时，我会问“我们能从中学到什么？”', '1');
INSERT INTO `question_manage` VALUES (18, '对正在执行的计划和项目我能够确保设定可实现的目标，制定具体的计划，并设立可衡量的标准。', '1');
INSERT INTO `question_manage` VALUES (19, '我可以和同事建立起良好的合作关系。', '1');
INSERT INTO `question_manage` VALUES (20, '我乐于倾听各种不同人的见解。', '1');
INSERT INTO `question_manage` VALUES (21, '我尊重他人的尊严。', '1');
INSERT INTO `question_manage` VALUES (22, '我会适当放权支持他人独立做出决定。', '1');
INSERT INTO `question_manage` VALUES (23, '我给与员工充分的空间去决定如何进行他们的工作。', '1');
INSERT INTO `question_manage` VALUES (24, '我确保员工能通过学习新的技能在工作成长，并得到自身发展。', '1');
INSERT INTO `question_manage` VALUES (25, '我会及时表扬对工作完成得好的人员。', '1');
INSERT INTO `question_manage` VALUES (26, '我让团队的同事知道我对他们胜任工作的能力充满信心。', '1');
INSERT INTO `question_manage` VALUES (27, '我确保以富有创意的方式对项目中做出突出贡献的员工进行奖励。', '1');
INSERT INTO `question_manage` VALUES (28, '我会当众表彰那些为实现共同价值而奋斗的人。', '1');
INSERT INTO `question_manage` VALUES (29, '我会用不同的方法为我们取得的成果进行庆祝。', '1');
INSERT INTO `question_manage` VALUES (30, '我对员工所做的贡献给许多表扬和支持。', '1');
INSERT INTO `question_manage` VALUES (31, '我积极地寻找创新的方法来改进我们的工作。', '1');
INSERT INTO `question_manage` VALUES (32, '让大家参与制定那些直接影响他们工作绩效的决策。', '1');
INSERT INTO `question_manage` VALUES (33, '能识别出可量化的里程碑以推动项目进度。', '1');
INSERT INTO `question_manage` VALUES (34, '我讲述他人出色完成工作的励志事迹。', '1');
INSERT INTO `question_manage` VALUES (35, '我能积极主动地预见和应对变化。', '1');
INSERT INTO `question_manage` VALUES (36, '我争取机会帮助员工提高技能，关心他们的发展和提升。', '1');
INSERT INTO `question_manage` VALUES (37, '我以正直、诚恳的态度待人，信任人。', '1');
INSERT INTO `question_manage` VALUES (38, '我注重在任务执行过程中鼓动员工的情绪，使他们产生热情。', '1');
INSERT INTO `question_manage` VALUES (39, '我根据员工的个性特点恰当用人。', '1');
INSERT INTO `question_manage` VALUES (40, '我鼓励团队成员之间当面、直接、坦诚地沟通。', '1');
INSERT INTO `question_manage` VALUES (41, '我用公平公正、毫无偏见的态度对待所有同事。', '1');
INSERT INTO `question_manage` VALUES (42, '我能可靠地履行承诺，对所承担的工作敢于负完全责任。', '1');
INSERT INTO `question_manage` VALUES (43, '我会经常性地组织参与员工的集体活动。', '1');
INSERT INTO `question_manage` VALUES (44, '我努力让大家的工作环境变得和谐有趣。', '1');
INSERT INTO `question_manage` VALUES (45, '我在面对困境时能迅速找到出路，摆脱困境。', '1');
INSERT INTO `question_manage` VALUES (46, '领导者会花时间和精力来确定下属按已经达成一致的原则和标准工作。', '2');
INSERT INTO `question_manage` VALUES (47, '领导者会努力让他人接受对组织运营最为有利的价值体系。', '2');
INSERT INTO `question_manage` VALUES (48, '领导者对自己的领导理念非常清楚。', '2');
INSERT INTO `question_manage` VALUES (49, '在要求他人之前领导者会以身作则。', '2');
INSERT INTO `question_manage` VALUES (50, '领导者履行他本人做出的誓言和承诺。', '2');
INSERT INTO `question_manage` VALUES (51, '领导者就他本人的行为如何影响团队成员的表现征询反馈意见。', '2');
INSERT INTO `question_manage` VALUES (52, '领导者同他人探讨未来的发展对当前工作的影响。', '2');
INSERT INTO `question_manage` VALUES (53, '领导者能描绘出令人信服的未来愿景。', '2');
INSERT INTO `question_manage` VALUES (54, '领导者向大家展示员工的长期利益是可以在共同的目标和愿景下实现的。', '2');
INSERT INTO `question_manage` VALUES (55, '领导者呼吁你们与他一起分享对美好未来的憧憬。', '2');
INSERT INTO `question_manage` VALUES (56, '领导者能勾画出员工渴望实现的宏伟蓝图。', '2');
INSERT INTO `question_manage` VALUES (57, '领导者向大家阐述大家所做工作的深远意义和目的，并对他本人所说的确信不疑。', '2');
INSERT INTO `question_manage` VALUES (58, '领导者会打破部门或组织之间的界限，在部门或组织之外寻找创新的方法来改进工作。', '2');
INSERT INTO `question_manage` VALUES (59, '领导者会寻找具有挑战性的机会来检验他本人的技能和才干。', '2');
INSERT INTO `question_manage` VALUES (60, '即使有失败的可能，领导者也勇于尝试和冒险。', '2');
INSERT INTO `question_manage` VALUES (61, '领导者要求员工在所做的工作中尝试创新。', '2');
INSERT INTO `question_manage` VALUES (62, '当事情同大家的预期发展不一样时，领导者会问“我们能从中学到什么？”', '2');
INSERT INTO `question_manage` VALUES (63, '对正在执行的计划和项目，领导者能够确保设定可实现的目标，制定具体的计划，并设立可衡量的标准。', '2');
INSERT INTO `question_manage` VALUES (64, '领导者可以和同事建立起良好的合作关系。', '2');
INSERT INTO `question_manage` VALUES (65, '领导者乐于倾听各种不同人的见解。', '2');
INSERT INTO `question_manage` VALUES (66, '领导者尊重他人的尊严。', '2');
INSERT INTO `question_manage` VALUES (67, '领导者会适当放权，支持他人独立做出决定。', '2');
INSERT INTO `question_manage` VALUES (68, '领导者给与员工充分的空间去决定如何进行他们的工作。', '2');
INSERT INTO `question_manage` VALUES (69, '领导者确保员工能通过学习新的技能在工作成长，并得到自身发展。', '2');
INSERT INTO `question_manage` VALUES (70, '领导者会及时表扬对工作完成得好的人员。', '2');
INSERT INTO `question_manage` VALUES (71, '领导者让团队的同事知道他对大家胜任工作的能力充满信心。', '2');
INSERT INTO `question_manage` VALUES (72, '领导者以富有创意的方式对项目中做出突出贡献的员工进行奖励。', '2');
INSERT INTO `question_manage` VALUES (73, '领导者会当众表彰那些为实现共同价值而奋斗的人。', '2');
INSERT INTO `question_manage` VALUES (74, '领导者会用不同的方法为我们取得的成果进行庆祝。', '2');
INSERT INTO `question_manage` VALUES (75, '领导者对员工所做的贡献给许多表扬和支持。', '2');
INSERT INTO `question_manage` VALUES (76, '领导者积极地寻找创新的方法来改进我们的工作。', '2');
INSERT INTO `question_manage` VALUES (77, '领导者乐于让大家参与制定那些直接影响他们工作绩效的决策。', '2');
INSERT INTO `question_manage` VALUES (78, '领导者能识别出可量化的里程碑以推动项目进度。', '2');
INSERT INTO `question_manage` VALUES (79, '领导者乐于讲述他人出色完成工作的励志事迹。', '2');
INSERT INTO `question_manage` VALUES (80, '领导者能积极主动地预见和应对变化。', '2');
INSERT INTO `question_manage` VALUES (81, '领导者争取机会帮助员工提高技能，关心他们的发展和提升。', '2');
INSERT INTO `question_manage` VALUES (82, '领导者以正直、诚恳的态度待人，信任人。', '2');
INSERT INTO `question_manage` VALUES (83, '领导者注重在任务执行过程中鼓动员工的情绪，使他们产生热情。', '2');
INSERT INTO `question_manage` VALUES (84, '领导者根据员工的个性特点恰当用人。', '2');
INSERT INTO `question_manage` VALUES (85, '领导者鼓励团队成员之间当面、直接、坦诚地沟通。', '2');
INSERT INTO `question_manage` VALUES (86, '领导者用公平公正、毫无偏见的态度对待所有同事。', '2');
INSERT INTO `question_manage` VALUES (87, '领导者能可靠地履行承诺，对所承担的工作敢于负完全责任。', '2');
INSERT INTO `question_manage` VALUES (88, '领导者经常性地组织参与员工的集体活动。', '2');
INSERT INTO `question_manage` VALUES (89, '领导者努力让大家的工作环境变得和谐有趣。', '2');
INSERT INTO `question_manage` VALUES (90, '领导者在面对困境时能迅速找到出路，摆脱困境。', '2');

SET FOREIGN_KEY_CHECKS = 1;
