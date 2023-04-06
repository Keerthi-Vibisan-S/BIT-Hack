const sql_con = require('../settings/databaseConnection');

function findUser(email)
{
    console.log("EMAIL LLLLL 🚀🚀 ", email);
    try {
    let q = `SELECT * FROM STUDENT WHERE STU_EMAIL like "${email}"`;
    return new  Promise((resolve, reject) => {
        sql_con.query(q, (err, result) => {
        if(err) {
            console.log(err);
            reject("Error");
        }
        else {
            if(result.length == 0) resolve(null);
            else resolve(result[0].STU_ID);
        }
    })})
}
catch(err){
    console.log("An error ------> "+err);
    res.send("Error").status(500);
    res.end();
}
}


module.exports = findUser;
