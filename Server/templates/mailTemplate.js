const nodeMailer = require('nodemailer');
const { mailId, passwd } = require('../settings/EmailCred');

const transporter = nodeMailer.createTransport({
  service: 'gmail', 
  auth: {
    user: mailId,
    pass: passwd
  }
})

function sendEmail(toEmail, author, decision) {
  const options = {
    from: mailId,
    to: toEmail,
    subject: "Regarding Lab Change",
    text: `Sample mail Send Check, your lab change request ${decision} by ${author}`
  };
  
  transporter.sendMail(options, (err, info) => {
    if(err) {
      console.log("Error --> ", err);
      return false;
    }
   // console.log(info);
    return true;
  })
}

module.exports = sendEmail;