const express = require("express");
const sql_con = require("../settings/databaseConnection");
const route = express.Router();
const authenticate = require("../helpers/auth_middleware");

route.get("/", (req, res) => {
  res.send("SpecialLab");
});

//! To get list of faculty in a lab
route.post("/getFaculty", authenticate, (req, res) => {
  const lab_id = req.body.lab_id;
  let q = `select * from FACULTY WHERE LAB_ID = "${lab_id}"`;
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

//! GET ALL LAB HEADS
route.get("/getLabs", (req, res) => {
  //console.log("Now we got ot 🚀🚀🚀🚀");
  let q = `SELECT S.LAB_ID, S.LAB_NAME, L.LAB_HEAD_ID FROM SPECIALLAB AS S, LAB_HEAD AS L WHERE S.LAB_ID = L.LAB_ID AND L.LAB_ID`;
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

module.exports = route;
