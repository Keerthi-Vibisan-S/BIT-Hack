const sql_con = require('../settings/databaseConnection');

function findAdmin(email)
{
    // console.log("EMAIL Skill HEAD 🚀🚀 ", email);
    try {
    let q = `SELECT * FROM 	SKILL_HEAD WHERE HEAD_EMAIL="${email}"`;
    return new  Promise((resolve, reject) => {
        sql_con.query(q, (err, result) => {
        if(err) {
            console.log(err);
            reject("Error");
        }
        else {
            //console.log(result);
            if(result.length == 0) resolve(null);
            else resolve(result[0].HEAD_ID);
        }
    })})
    }
    catch(err){
        console.log("An error ------> "+err);
    }
}


module.exports = findAdmin;
