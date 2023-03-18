const express = require('express');
const route = express.Router();
const sql_con = require('../settings/databaseConnection');
const authenticate = require('../helpers/auth_middleware');


route.get("/", (req, res) => {
    res.send("Counting Route");
})

//! No of STU, NO OF faculty, NO of labs
route.get("/get", authenticate, (req, res) => {
    const facultyQuery = 'SELECT count(*) AS NO_OF_FACULTY  FROM FACULTY;';
    const labsQuery = 'SELECT count(*) AS NO_OF_LABS FROM SPECIALLAB;';
    const studentsQuery = 'SELECT count(*) AS NO_OF_STUDENTS  FROM STUDENT;';
    try {
        sql_con.query(`${facultyQuery}${studentsQuery}${labsQuery}`, (err, result) => {
            if(err) {
                console.log(err);
                res.send("Error at our Side").status(500);
            }
            else {
                const data = {};
                data.NO_OF_LABS = result[2][0].NO_OF_LABS;
                data.NO_OF_STUDENTS = result[1][0].NO_OF_STUDENTS;
                data.NO_OF_FACULTY = result[0][0].NO_OF_FACULTY;
                console.log(data);
                res.json(data).status(200);
            }
        }) 
    }
    catch(err) {
        console.log("Error Occurred ---> ",err);
    }
})

//! Number of students present in a lab
route.get("/get/:id", authenticate, (req, res) => {
    const query = `SELECT count(*) as NO_OF_STUDENTS from STUDENT where LAB_ID = ${req.params.id};`;
    //console.log(query);
    try {
        sql_con.query(query, (err, result) => {
            if(err) {
                console.log(err);
                res.send("Error at our Side").status(500);
            }
            else {
                
                res.json(result[0]).status(200);
            }
        }) 
    }
    catch(err) {
        console.log("Error Occurred ---> ",err);
    }
})

module.exports = route;