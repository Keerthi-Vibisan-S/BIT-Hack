const {OAuth2Client} = require('google-auth-library');

const CLIENT_ID = '852762241490-gr45nghc45rkvjp5bs3uqvr4q0qkp80h.apps.googleusercontent.com';
const client = new OAuth2Client(CLIENT_ID);

function CheckUser(req, res, next)
{
    const bearerToken = req.headers.authorization;
    //console.log("BEARER ---------------");
    //console.log(bearerToken);
    const token = bearerToken && bearerToken.split(' ')[1];
    //console.log(token);

    let user = {};
    
    async function verify() {
      const ticket = await client.verifyIdToken({
          idToken: token,
          audience: CLIENT_ID
      });
      const payload = ticket.getPayload();
      const userid = payload['sub'];
      console.log(payload);
      user.email = payload.email;
      user.verify = payload.email_verified;
      user.name = payload.name;
      user.img = payload.picture;
    }
    verify().then(() => {
        if(user.verify)
        {
            req.email = user.email;
            next();
        }
        else
        {
            res.sendStatus(401);
            res.end();
        }
      })
      .catch((err) => {
        res.sendStatus(401);
        res.end();
        console.log(err);
      });
}

module.exports = CheckUser;