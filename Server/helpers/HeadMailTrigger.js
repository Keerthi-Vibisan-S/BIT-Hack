const sql_con = require('../settings/databaseConnection'); 
const sendEmail = require('../templates/mailTemplate');

function checkApprovals(r_id) {
    console.log("❤️❤️❤️❤️ ---> ", r_id);
    try {
        const q = `SELECT * FROM REQUESTS WHERE R_ID = ${r_id} AND FROM_APPROVAL = "OK" AND TO_APPROVAL="OK";`;
        return new  Promise((resolve, reject) => {
            sql_con.query(q, (err, result) => {
            if(err) {
                console.log(err);
                reject("Error");
            }
            else {
                console.log(result);
                if(result.length == 1){
                    console.log("🔫 Triggered");
                    sendEmail("keerthivibisan2211@gmail.com", "Both Labs", "Approved");
                } 
                resolve("Done");
            }
        })})
    }
    catch(err){
        console.log("An error ------> "+err);
        return("Error");
    }
}

module.exports = checkApprovals;