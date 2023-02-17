const express = require('express');
const sql_con = require('../settings/databaseConnection');
const route = express.Router();

route.get("/", (req, res) => {
    res.send("working");
})

route.post("/verify", (req, res) => {
    const email = req.body.email;
    let q = `SELECT * FROM STUDENT WHERE STU_EMAIL="${email}";`;
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