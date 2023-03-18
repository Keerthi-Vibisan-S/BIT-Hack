const express = require('express');
const sql_con = require('../settings/databaseConnection');
const route = express.Router();



//!! 💀💀 NOT ROUTED


route.get("/", (req, res) => {
    res.send("Lab_Head");
})

//! To get list of faculty in a lab
// route.post("/getFaculty",  (req, res) => {
//     const fac_id = req.body.faculty_id;
//     let q = `select * from FACULTY WHERE FACULTY_ID = "${lab_id}"`;
//     try {
//         sql_con.query(q, (err, result) => {
//             if(err) {
//                 console.log(err);
//             }
//             else {
//                 res.json(result);
//             }
//         })
//     }
//     catch(err){
//         console.log("An error ------> "+err);
//     }
// })


module.exports = route;