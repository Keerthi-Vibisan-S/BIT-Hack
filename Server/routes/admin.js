const express = require("express");
const sql_con = require("../settings/databaseConnection");
const authenticate = require("../helpers/auth_middleware");
const { route } = require("./requests");

route.get("/", (req, res) => {
    res.send("Admin Route");
  });

//   //! Admin Login 
//   route.post("/login", (req, res) => {
//     let 
//   })