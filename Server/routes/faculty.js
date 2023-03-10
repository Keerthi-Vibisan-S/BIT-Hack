const express = require("express");
const sql_con = require("../settings/databaseConnection");
const authenticate = require("../helpers/auth_middleware");
const route = express.Router();

route.get("/", (req, res) => {
  res.send("Faculty");
});

//! Get List of Students under a faculty
route.get("/getStudents/:fid", (req, res) => {
  //! 🫣🫣🫣 Faculty id must be taken dynamically from DB ⚠️⚠️⚠️⚠️⚠️⚠️⚠️
  let f_id = req.params.fid;
  let q = `select * from STUDENT where FACULTY_ID="${f_id}"`;

  try {
    sql_con.query(q, (err, result) => {
      if (err) {
        console.log("Error ---> ", err);
        res.send("Error").status(500);
      } else {
        res.json(result).status(200);
      }
    });
  } catch (err) {
    console.log("Something error ---> ", err);
    res.send("Error").status(500);
  }
});

//! Students REQUESTEDTO TEACHER TO CHANGE THE LAB
route.get("/getReqStudents/:fid", (req, res) => {
  //! 💀💀 Faculty id must be taken dynamically from DB ⚠️
  let f_id = req.params.fid;
  let q = `SELECT *, (SELECT LAB_NAME FROM FACULTY , SPECIALLAB WHERE FACULTY.FACULTY_ID = REQUESTS.FROM_LAB_FAC_ID AND FACULTY.LAB_ID = SPECIALLAB.LAB_ID) AS FROM_LAB, (SELECT LAB_NAME FROM FACULTY , SPECIALLAB WHERE FACULTY.FACULTY_ID = REQUESTS.TO_LAB_FAC_ID AND FACULTY.LAB_ID = SPECIALLAB.LAB_ID) AS TO_LAB FROM REQUESTS WHERE FROM_LAB_FAC_ID ="${f_id}" OR TO_LAB_FAC_ID ="${f_id}";`;

  try {
    sql_con.query(q, (err, result) => {
      if (err) {
        console.log("Error ---> ", err);
        res.send("Error").status(500);
      } else {
        res.json(result).status(200);
      }
    });
  } catch (err) {
    console.log("Something error ---> ", err);
    res.send("Error").status(500);
  }
});

//! Student history for faculty page
route.get("/getHistory/:sid", (req, res) => {
  //! 💀💀 Faculty id must be taken dynamically from DB ⚠️
  let f_id = req.params.sid;
  let q = `SELECT * FROM STUDENT, REQUESTS WHERE STUDENT.STU_ID = "${f_id}" AND STUDENT.STU_ID=REQUESTS.STU_ID`;

  try {
    sql_con.query(q, (err, result) => {
      if (err) {
        console.log("Error ---> ", err);
        res.send("Error").status(500);
      } else {
        res.json(result).status(200);
      }
    });
  } catch (err) {
    console.log("Something error ---> ", err);
    res.send("Error").status(500);
  }
});

module.exports = route;
