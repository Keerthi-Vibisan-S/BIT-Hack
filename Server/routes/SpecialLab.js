const express = require('express');
const sql_con = require('../settings/databaseConnection');
const route = express.Router();

route.get("/", (req, res) => {
    res.send("SpecialLab");
})

//! To get list of faculty in a lab
route.post("/getFaculty", (req, res) => {
    const lab_id = req.body.lab_id;
    let q = `select * from FACULTY WHERE LAB_ID = "${lab_id}"`;
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