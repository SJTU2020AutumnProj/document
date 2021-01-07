/*
 Navicat Premium Data Transfer

 Source Server         : Amazon_MySQL
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : ec2-107-21-195-229.compute-1.amazonaws.com:3306
 Source Schema         : jub

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 08/01/2021 06:45:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer`  (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `commit_time` datetime NOT NULL,
  PRIMARY KEY (`answer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answer
-- ----------------------------

-- ----------------------------
-- Table structure for check
-- ----------------------------
DROP TABLE IF EXISTS `check`;
CREATE TABLE `check`  (
  `check_id` int(11) NOT NULL AUTO_INCREMENT,
  `check_time` datetime NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`check_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of check
-- ----------------------------

-- ----------------------------
-- Table structure for courseclass
-- ----------------------------
DROP TABLE IF EXISTS `courseclass`;
CREATE TABLE `courseclass`  (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `introduction` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `text_books` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courseclass
-- ----------------------------
INSERT INTO `courseclass` VALUES (1, 'CSE', '计算机工程原理', 'Com. Sys. Eng.', '2020-10-26 00:00:00', '2020-12-03 00:00:00', 1);

-- ----------------------------
-- Table structure for homework
-- ----------------------------
DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework`  (
  `homework_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `title` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `answer_id` int(11) NULL DEFAULT -1,
  `score` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`homework_id`) USING BTREE,
  INDEX `hwUserIdIndex`(`user_id`) USING BTREE,
  INDEX `hwCourseIdIndex`(`course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of homework
-- ----------------------------

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_time` datetime NOT NULL,
  `message_type` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `title` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`message_id`) USING BTREE,
  INDEX `msCourseIdIndex`(`course_id`) USING BTREE,
  INDEX `msUserIdIndex`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for take
-- ----------------------------
DROP TABLE IF EXISTS `take`;
CREATE TABLE `take`  (
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`user_id`, `course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of take
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` int(11) NOT NULL DEFAULT 1,
  `user_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `school` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ID` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `usernameIndex`(`user_name`) USING BTREE,
  INDEX `passwordIndex`(`password`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 1, 'teacher', 'teacher', 'SJTU', '001', '54749110', 'sjtu@sjtu.edu.cn', '沈老师');
INSERT INTO `user` VALUES (2, 2, 'student', 'student', 'SJTU', '518021910000', '134567832532', 'stu@sjtu.edu.cn', '王同学');

-- ----------------------------
-- Table structure for user_homework
-- ----------------------------
DROP TABLE IF EXISTS `user_homework`;
CREATE TABLE `user_homework`  (
  `homework_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `answer_id` int(11) NULL DEFAULT -1,
  `check_id` int(11) NULL DEFAULT -1,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`homework_id`, `user_id`) USING BTREE,
  INDEX `UHanswerIdIndex`(`answer_id`) USING BTREE,
  INDEX `UHcheckIdIndex`(`check_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_homework
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
