const sql_con = require('../settings/databaseConnection');

function updateLab(stu_id, fac_id, lab_id)
{
    //console.log("EMAIL Skill HEAD 🚀🚀 ", email);
    try {
    let q = `UPDATE STUDENT SET LAB_ID = "${lab_id}", FACULTY_ID = "${fac_id}" WHERE STU_ID = "${stu_id}";`;
    return new  Promise((resolve, reject) => {
        sql_con.query(q, (err, result) => {
        if(err) {
            console.log(err);
            reject("Error");
        }
        else {
            //console.log(result);
            if(result.length == 0) resolve(null);
            else resolve("Done");
        }
    })})
    }
    catch(err){
        console.log("An error ------> "+err);
    }
}


module.exports = updateLab;
