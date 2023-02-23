const express = require('express');
const sql_con = require('../settings/databaseConnection');
const authenticate = require('../helpers/auth_middleware');
const findUser = require('../helpers/findUser');

const route = express.Router();

route.get("/", (req, res) => {
    res.send("Requests");
})

//! To get list of faculty in a lab
route.post("/addReq", authenticate, async (req, res) => {
    // console.log("EMAIL LLLLL 🚀🚀 ", req.email);
    findUser(req.email).then((result) => {
        let stu_id = result;
        console.log("From REQ PAGE 🚀🚀 ", stu_id);
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
    });
})


module.exports = route;