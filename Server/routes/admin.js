const express = require("express");
const sql_con = require("../settings/databaseConnection");
const authenticate = require("../helpers/auth_middleware");
const findAdmin = require("../helpers/findAdmin");
const sendUnauthorized = require("../helpers/teacherUnauthorized");
const route = express.Router();


route.get("/", (req, res) => {
    res.send("Admin Route");
  });

  //! Admin Pending GET
  route.get("/getPendingRequests", authenticate, async (req, res) => {
    let admin = await findAdmin(req.email);
    //console.log("logi:", admin);

    if(admin == null || admin == "Error") {
        sendUnauthorized(res);
        return;
    } 

    let q = `SELECT REQUESTS.*, STUDENT.STU_NAME, STUDENT.DEPT, STUDENT.YEAR, (SELECT LAB_NAME FROM FACULTY , SPECIALLAB WHERE FACULTY.FACULTY_ID = REQUESTS.FROM_LAB_FAC_ID AND FACULTY.LAB_ID = SPECIALLAB.LAB_ID) AS FROM_LAB, (SELECT LAB_NAME FROM FACULTY , SPECIALLAB WHERE FACULTY.FACULTY_ID = REQUESTS.TO_LAB_FAC_ID AND FACULTY.LAB_ID = SPECIALLAB.LAB_ID) AS TO_LAB FROM REQUESTS, STUDENT WHERE FROM_APPROVAL = "OK" AND TO_APPROVAL = "OK" AND HEAD_APPROVAL LIKE "P%" AND STUDENT.STU_ID = REQUESTS.STU_ID`;

    sql_con.query(q, (err, result) => {
        if(err) {
            console.log("Error Occurred: ",err);
            res.json({
                "Error": err
            }).status(500);
            res.end();
        }
        else {
            res.json(result).status(200);
            res.end();
        }
    })
  })

  //! All Requests Details
  route.get("/getRequests", authenticate, async (req, res) => {
    let admin = await findAdmin(req.email);
    //console.log("logi:", admin);

    if(admin == null || admin == "Error") {
        sendUnauthorized(res);
        return;
    } 

    let q = `SELECT REQUESTS.*, STUDENT.STU_NAME, STUDENT.DEPT, STUDENT.YEAR, (SELECT LAB_NAME FROM FACULTY , SPECIALLAB WHERE FACULTY.FACULTY_ID = REQUESTS.FROM_LAB_FAC_ID AND FACULTY.LAB_ID = SPECIALLAB.LAB_ID) AS FROM_LAB, (SELECT LAB_NAME FROM FACULTY , SPECIALLAB WHERE FACULTY.FACULTY_ID = REQUESTS.TO_LAB_FAC_ID AND FACULTY.LAB_ID = SPECIALLAB.LAB_ID) AS TO_LAB FROM REQUESTS, STUDENT WHERE STUDENT.STU_ID = REQUESTS.STU_ID`;

    sql_con.query(q, (err, result) => {
        if(err) {
            console.log("Error Occurred: ",err);
            res.json({
                "Error": err
            }).status(500);
            res.end();
        }
        else {
            res.json(result).status(200);
            res.end();
        }
    })
  })

//! Admin Accept or Decline request
// 1. Update the data upon admin decision
// 2. Then send emil to Student
// if Confirmed ----> Change Student Lab
// else leave it


  module.exports = route;