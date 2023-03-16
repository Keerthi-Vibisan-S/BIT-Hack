const nodeMailer = require('nodemailer');
const { mailId, passwd } = require('../settings/EmailCred');

const transporter = nodeMailer.createTransport({
  service: 'gmail', 
  auth: {
    user: mailId,
    pass: passwd
  }
})

function sendEmail(toEmail) {
  const options = {
    from: mailId,
    to: toEmail,
    subject: "Regarding Lab Change",
    text: "Sample mail Send Check"
  };
  
  transporter.sendMail(options, (err, info) => {
    if(err) {
      console.log("Error --> ", err);
      return;
    }
    console.log(info);
  })
}

module.exports = sendEmail;