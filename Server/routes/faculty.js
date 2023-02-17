const express = require('express');
const sql_con = require('../settings/databaseConnection');
const route = express.Router();

route.get("/", (req, res) => {
    res.send("Faculty");
})


module.exports = route;