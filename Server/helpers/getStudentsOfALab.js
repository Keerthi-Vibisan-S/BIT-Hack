const sql_con = require('../settings/databaseConnection');

function getStudents(labId) {
    let q = `select * from STUDENT WHERE LAB_ID = "${labId}"`;
    try {
        sql_con.query(q, (err, result) => {
            if(err) {
                console.log(err);
                return("Error");
            }
            else {
                return(result);
            }
        })
    }
    catch(err){
        console.log("An error ------> "+err);
    }
}

module.exports = getStudents;