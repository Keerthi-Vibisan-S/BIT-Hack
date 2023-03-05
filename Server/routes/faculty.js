const express = require('express');
const sql_con = require('../settings/databaseConnection');
const authenticate = require('../helpers/auth_middleware');
const route = express.Router();

route.get("/", (req, res) => {
    res.send("Faculty");
})

//! Get List of Students under a faculty
route.get("/getStudents/:fid", authenticate, (req, res) => {
    //! 🫣🫣🫣 Faculty id must be taken dynamically from DB ⚠️⚠️⚠️⚠️⚠️⚠️⚠️ 
    let f_id = req.params.fid;
    let q = `select * from STUDENT where FACULTY_ID="${f_id}"`;
    
    try {
        sql_con.query(q, (err, result) => {
            if(err) {
                console.log("Error ---> ", err);
                res.send("Error").status(500);
            }
            else {
                res.json(result).status(200);
            }
        })
    }
    catch(err) {
        console.log("Something error ---> ", err);
        res.send("Error").status(500);
    }

})

//! Students REQUESTEDTO TEACHER TO CHANGE THE LAB
route.get("/getReqStudents/:fid", authenticate, (req, res) => {
    //! 💀💀 Faculty id must be taken dynamically from DB ⚠️ 
    let f_id = req.params.fid;
    let q = `SELECT * FROM REQUESTS WHERE FROM_LAB_FAC_ID ="${f_id}" OR TO_LAB_FAC_ID ="${f_id}";`;
  
    try {
        sql_con.query(q, (err, result) => {
            if(err) {
                console.log("Error ---> ", err);
                res.send("Error").status(500);
            }
            else {
                res.json(result).status(200);
            }
        })
    }
    catch(err) {
        console.log("Something error ---> ", err);
        res.send("Error").status(500);
    }

})

module.exports = route;