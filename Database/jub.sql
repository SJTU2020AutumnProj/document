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

 Date: 15/12/2020 18:37:39
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
// Collection structure for check
// ----------------------------
db.getCollection("check").drop();
db.createCollection("check");

// ----------------------------
// Documents of check
// ----------------------------
db.getCollection("check").insert([ {
    _id: ObjectId("5fd8916f6506000015006573"),
    "check_id": 1,
    "check_json": "47BCE5C74F589F4867DBD57E9CA9F808"
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
    _id: ObjectId("5fd8916f6506000015006573"),
    "homework_id": 1,
    "homework_json": "47BCE5C74F589F4867DBD57E9CA9F808"
} ]);