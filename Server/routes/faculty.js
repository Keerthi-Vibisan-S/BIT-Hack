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
    console.log(q);
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