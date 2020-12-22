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

 Date: 22/12/2020 21:18:02
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
    _id: ObjectId("5fe1f039ab200000a3007ea2"),
    "answer_id": 1,
    content: "2758F67AAC0E2835",
    note: "2758F67AAC0E2835"
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
    _id: ObjectId("5fe1f190ab200000a3007ea3"),
    "check_id": 1,
    description: "2758F67AAC0E2835",
    comment: "2758F67AAC0E2835"
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
    _id: ObjectId("5fe1f1bfab200000a3007ea4"),
    description: "2758F67AAC0E2835",
    content: "2758F67AAC0E2835",
    note: "2758F67AAC0E2835",
    "homework_id": 1
} ]);

// ----------------------------
// Collection structure for message
// ----------------------------
db.getCollection("message").drop();
db.createCollection("message");

// ----------------------------
// Documents of message
// ----------------------------
db.getCollection("message").insert([ {
    _id: ObjectId("5fe1f1fbab200000a3007ea5"),
    "message_id": 1,
    content: "通知通知"
} ]);
