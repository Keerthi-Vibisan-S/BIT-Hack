const express = require("express");
const sql_con = require("../settings/databaseConnection");
const authenticate = require("../helpers/auth_middleware");
const findAdmin = require("../helpers/findAdmin");
const sendUnauthorized = require("../helpers/teacherUnauthorized");
const route = express.Router();


route.get("/", (req, res) => {
    res.send("Admin Route");
  });

  //! Admin Pending GET
  route.get("/getPendingRequests", authenticate, async (req, res) => {
    let admin = await findAdmin(req.email);
    //console.log("logi:", admin);

    if(admin == null || admin == "Error") {
        sendUnauthorized(res);
        return;
    } 

    let q = `SELECT * FROM REQUESTS WHERE FROM_APPROVAL = "OK" AND TO_APPROVAL = "OK" AND HEAD_APPROVAL LIKE "P%"`;

    sql_con.query(q, (err, result) => {
        if(err) {
            console.log("Error Occurred: ",err);
            res.json({
                "Error": err
            }).status(500);
            res.end();
        }
        else {
            res.json(result).status(200);
            res.end();
        }
    })
  })

  //! All Requests Details
  route.get("/getRequests", authenticate, async (req, res) => {
    let admin = await findAdmin(req.email);
    //console.log("logi:", admin);

    if(admin == null || admin == "Error") {
        sendUnauthorized(res);
        return;
    } 

    let q = `SELECT * FROM REQUESTS`;

    sql_con.query(q, (err, result) => {
        if(err) {
            console.log("Error Occurred: ",err);
            res.json({
                "Error": err
            }).status(500);
            res.end();
        }
        else {
            res.json(result).status(200);
            res.end();
        }
    })
  })

  module.exports = route;