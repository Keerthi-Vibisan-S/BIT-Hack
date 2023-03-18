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
        res.send("Server ERROR").status(500);
      } else {
        res.json(result);
      }
    });
  } catch (err) {
    console.log("An error ------> " + err);
    res.send("Server ERROR").status(500);
  }
});

//! GET ALL LAB HEADS
route.get("/getLabs", authenticate, (req, res) => {
  //console.log("Now we got ot 🚀🚀🚀🚀");
  let q = `SELECT S.LAB_ID, S.LAB_NAME, L.LAB_HEAD_ID FROM SPECIALLAB AS S, LAB_HEAD AS L WHERE S.LAB_ID = L.LAB_ID AND L.LAB_ID`;
  try {
    sql_con.query(q, (err, result) => {
      if (err) {
        console.log(err);
        res.send("Server ERROR").status(500);
      } else {
        res.json(result);
      }
    });
  } catch (err) {
    console.log("An error ------> " + err);
    res.send("Server ERROR").status(500);
  }
});

//? Combined Route
//! GET student details and teachers names
route.get("/getFullLab/:id", authenticate, (req, res) => {
    const id = req.params.id;
    let facultyQuery = `SELECT FACULTY_NAME from FACULTY where LAB_ID = ${id};`;
    let studentQuery = `select * from STUDENT WHERE LAB_ID = "${id}";`;
    try {
        sql_con.query(`${facultyQuery}${studentQuery}`, (err, result) => {
            if(err) {
                console.log(err);
                res.send("Server ERROR").status(500);
            }
            else {
                const data = {};
                data.student = result[1];
                data.facultyName = result[0];
                res.json(data);
            }
        })
    }
    catch(err){
        console.log("An error ------> "+err);
        res.send("Server ERROR").status(500);
    }
})


//! GET ALL DETAILS IN A SINGLE GO
route.get("/getAllLabsDetail", authenticate, (req, res) => {
  const query = "SELECT FACULTY.LAB_ID, (SELECT LAB_NAME FROM SPECIALLAB WHERE LAB_ID = LAB_HEAD.LAB_ID) AS LAB_NAME,FACULTY.FACULTY_NAME, (SELECT COUNT(LAB_ID) FROM STUDENT WHERE STUDENT.LAB_ID = LAB_HEAD.LAB_ID) AS LAB_STRENGTH FROM LAB_HEAD, FACULTY WHERE FACULTY.FACULTY_ID = LAB_HEAD.LAB_HEAD_ID;";
  try {
      sql_con.query(query, (err, result) => {
          if(err) {
              console.log(err);
              res.send("Server ERROR").status(500);
          }
          else {
              res.json(result).status(200);
          }
      })
  }
  catch(err){
      console.log("An error ------> "+err);
      res.send("Server ERROR").status(500);
  }
})

module.exports = route;

