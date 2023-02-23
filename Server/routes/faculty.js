const express = require('express');
const sql_con = require('../settings/databaseConnection');
const authenticate = require('../helpers/auth_middleware');
const route = express.Router();

route.get("/", (req, res) => {
    res.send("Faculty");
})

// route.post("/getStu")

module.exports = route;