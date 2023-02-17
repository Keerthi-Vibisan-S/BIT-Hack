const express = require('express');
const sql_con = require('../settings/databaseConnection');
const {OAuth2Client} = require('google-auth-library');

const CLIENT_ID = '852762241490-gr45nghc45rkvjp5bs3uqvr4q0qkp80h.apps.googleusercontent.com';
const client = new OAuth2Client(CLIENT_ID);

const route = express.Router();



route.get("/", (req, res) => {
    res.send("working");
})

route.post("/verify", (req, res) => {
    const token = req.body.token;
    const email = req.body.email;
    let user = {};
    
    async function verify() {
      const ticket = await client.verifyIdToken({
          idToken: token,
          audience: CLIENT_ID
      });

      const payload = ticket.getPayload();
      const userid = payload['sub'];
      console.log("PAYLOAD: ", payload);
      user.email = payload.email;
      user.verify = payload.email_verified;
      user.name = payload.name;
      user.img = payload.picture;
    }
    verify().then(async () => {
        if(user.email == email)
        {
            let q = `SELECT * FROM STUDENT WHERE STU_EMAIL="${user.email}"`;
            try {
                sql_con.query(q, (err, result) => {
                    if(err) {
                        console.log(err);
                        res.send("Error").status(500);
                        res.end();
                    }
                    else {
                        user.details = result;
                        res.send(user).status(200);
                        res.end();
                    }
                })
            }
            catch(err){
                console.log("An error ------> "+err);
            }
        }
    });
})

module.exports = route;