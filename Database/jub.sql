/*
 Navicat Premium Data Transfer

 Source Server         : jub
 Source Server Type    : MongoDB
 Source Server Version : 40402
 Source Host           : localhost:27017
 Source Schema         : jub

 Target Server Type    : MongoDB
 Target Server Version : 40402
 File Encoding         : 65001

 Date: 08/12/2020 19:01:24
*/


// ----------------------------
// Collection structure for answer
// ----------------------------
db.getCollection("answer").drop();
db.createCollection("answer");

// ----------------------------
// Documents of answer
// ----------------------------
db.getCollection("answer").insert([ {
    _id: ObjectId("5fcf5cb64130000012000a73"),
    "answer_id": 1,
    "answer_json": "\t9F6E6800CFAE7749EB6C486619254B9C"
} ]);

// ----------------------------
// Collection structure for homework
// ----------------------------
db.getCollection("homework").drop();
db.createCollection("homework");

// ----------------------------
// Documents of homework
// ----------------------------
db.getCollection("homework").insert([ {
    _id: ObjectId("5fcf5cda4130000012000a74"),
    "homework_id": 1,
    "homework_json": "\t9F6E6800CFAE7749EB6C486619254B9C"
} ]);
