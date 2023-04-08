const express = require("express");
const sql_con = require("../settings/databaseConnection");
const authenticate = require("../helpers/auth_middleware");
const findUser = require("../helpers/findUser");
const sendEmail = require("../templates/mailTemplate");
const checkApprovals = require("../helpers/HeadMailTrigger");
const findFaculty = require("../helpers/findFaculty");
const sendUnauthorized = require("../helpers/teacherUnauthorized");

const route = express.Router();

route.get("/", (req, res) => {
  res.send("Requests");
});

//! To get list of faculty in a lab
route.post("/addReq", authenticate, async (req, res) => {
  //console.log("EMAIL LLLLL 🚀🚀 ", req.email);
  findUser(req.email).then((result) => {
    let stu_id = result;
    if(stu_id == null || stu_id == "Error") {
      sendUnauthorized(res);
      return;
    }
    //console.log("From REQ PAGE 🚀🚀 ", stu_id);
    const from_id = req.body.from_lab_faculty_id;
    const to_id = req.body.to_lab_faculty_id;
    const approval_default = "Pending";
    const head_id = req.body.head_id;
    const reason = req.body.reason;

    let q = `INSERT INTO REQUESTS VALUES(NULL,"${stu_id}", "${from_id}", "${to_id}", "${approval_default}", "${approval_default}", "${head_id}", "${approval_default}", "${reason}")`;
    try {
      sql_con.query(q, (err, result) => {
        if (err) {
          console.log(err);
        } else {
          res.json(result);
        }
      });
    } catch (err) {
      console.log("An error ------> " + err);
    }
  });
});

//! FROM LAB FACULTY APPROVAL
route.patch("/fromDecision", authenticate, async (req, res) => {
  let f_id = await findFaculty(req.email); 
  console.log(f_id);
  if(f_id == null || f_id == "Error") {
    sendUnauthorized(res);
    return;
  }
  console.log("Error Here");
  console.log(req.body);
  let s_id = req.body.stu_id;
  let r_id = req.body.r_id;
  let decision = req.body.decision;
  let q = `UPDATE REQUESTS SET FROM_APPROVAL = "${decision}" WHERE FROM_LAB_FAC_ID = "${f_id}" AND R_ID = "${r_id}";`;
  let stu_q = `SELECT STU_EMAIL FROM STUDENT where STU_ID = "${s_id}";`;
  try {
    sql_con.query(`${q}${stu_q}`, (err, result) => {
      if(err) {
        console.log("An error ---> ", err);
        res.send("Server side error").status(500);
      }
      else {
        // 1. Trigger mail send function
        // 2. Response to frontend
       
        //! Sending email to Student
        sendEmail(result[1][0].STU_EMAIL, "From lab", decision);
        checkApprovals(r_id);
        res.send("Your Decision Updated").status(200);

        //! Wen need to check for both approval so we can send mail to HEAD
      }
    })
  } catch (error) {
    console.log(error);
    res.send("Server side error").status(500);
  }

})


//! To lab approval
route.patch("/toDecision", authenticate, async (req, res) => {
  let f_id = await findFaculty(req.email); 

  if(f_id == null || f_id == "Error") {
    sendUnauthorized(res);
    return;
  }

  let s_id = req.body.stu_id;
  let r_id = req.body.r_id;
  let decision = req.body.decision;
  let q = `UPDATE REQUESTS SET TO_APPROVAL = "${decision}" WHERE TO_LAB_FAC_ID = "${f_id}" AND R_ID = "${r_id}";`;
  let stu_q = `SELECT STU_EMAIL FROM STUDENT where STU_ID = "${s_id}";`;
  try {
    sql_con.query(`${q}${stu_q}`, (err, result) => {
      if(err) {
        console.log("An error ---> ", err);
        res.send("Server side error").status(500);
      }
      else {
        sendEmail(result[1][0].STU_EMAIL, "To lab", decision);
        checkApprovals(r_id);
        res.send("Your Decision Updated").status(200);

        //! Wen need to check for both approval so we can send mail to HEAD
      }
    })
  } catch (error) {
    console.log(error);
    res.send("Server side error").status(500);
  }
})

module.exports = route;
