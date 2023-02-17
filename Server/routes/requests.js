const express = require('express');
const sql_con = require('../settings/databaseConnection');
const route = express.Router();

route.get("/", (req, res) => {
    res.send("Requests");
})

//! To get list of faculty in a lab
route.post("/addReq", (req, res) => {
    const stu_id = req.body.stu_id;
    const from_id = req.body.from_lab_faculty_id;
    const to_id = req.body.to_lab_faculty_id;
    const approval_default = "Pending";
    const head_id = req.body.head_id;
    const reason = req.body.reason;

    let q = `INSERT INTO REQUESTS VALUES(NULL,"${stu_id}", "${from_id}", "${to_id}", "${approval_default}", "${approval_default}", "${head_id}", "${approval_default}", "${reason}")`;
    try {
        sql_con.query(q, (err, result) => {
            if(err) {
                console.log(err);
            }
            else {
                res.json(result);
            }
        })
    }
    catch(err){
        console.log("An error ------> "+err);
    }
})


module.exports = route;