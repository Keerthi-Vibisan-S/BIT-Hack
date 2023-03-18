const sql_con = require('../settings/databaseConnection');

function findFaculty(email)
{
    console.log("EMAIL LLLLL 🚀🚀 ", email);
    try {
    let q = `SELECT * FROM FACULTY WHERE FACULTY_EMAIL like "${email}"`;
    return new  Promise((resolve, reject) => {
        sql_con.query(q, (err, result) => {
        if(err) {
            console.log(err);
            reject("Error");
        }
        else {
            resolve(result[0].FACULTY_ID);
        }
    })})
}
catch(err){
    console.log("An error ------> "+err);
    res.send("Error").status(500);
    res.end();
}
}


module.exports = findFaculty;
