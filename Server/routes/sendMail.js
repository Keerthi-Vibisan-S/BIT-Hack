const router = require("express").Router();
const { encode } = require("../middleware/crypt");
const nodemailer = require("nodemailer");
const config = require("config");

//Email Validater
// function validateemail(email) {
//   const tempschema = Joi.object({
//     email: Joi.string().min(5).max(255).required().email(),
//     type: Joi.string(),
//   });

//   return tempschema.validate(email);
// }

router.post("/send", async (req, res, next) => {
  try {
    // const { error } = validateemail(req.body);
    // if (error) return res.status(404).send(error.details[0].message);

    const { email, type } = req.body;
    let email_subject, email_message;

    if (!email) {
      const response = { Status: "Failure", Details: "Email not provided" };
      return res.status(400).send(response);
    }
    if (!type) {
      const response = { Status: "Failure", Details: "Type not provided" };
      return res.status(400).send(response);
    }

    // Create details object containing the email and otp id
    const now = new Date();
    var details = {
      timestamp: now,
      check: email,
      success: true,
      message: "Email sent to user",
    };

    // Encrypt the details object
    const encoded = await encode(JSON.stringify(details));

    //Choose message template according type requestedconst encoded= await encode(JSON.stringify(details))
    if (type) {
      if (type == "CONFIRMATION") {
        const {
          message,
          subject_mail,
        } = require("../templates/email_verification");
        email_message = message("");
        email_subject = subject_mail;
      } else {
        const response = {
          Status: "Failure",
          Details: "Incorrect Type Provided",
        };
        return res.status(400).send(response);
      }
    }

    // Create nodemailer transporter
    const transporter = nodemailer.createTransport({
      host: "smtp.gmail.com",
      port: 465,
      secure: true,
      auth: {
        user: config.get("Official_Mail"),
        pass: config.get("Off_Mail_Password"),
      },
    });

    const mailOptions = {
      from: `"BITHACKS Admin"<${config.get("Official_Mail")}>`,
      to: email,
      subject: email_subject,
      text: email_message,
    };

    await transporter.verify();

    //Send Email
    await transporter.sendMail(mailOptions, (err, response) => {
      if (err) {
        return res.status(400).send({ Status: "Failure", Details: err });
      } else {
        return res.send({ Status: "Success", Details: encoded });
      }
    });
  } catch (err) {
    const response = { Status: "Failure", Details: err.message };
    return res.status(400).send(response);
  }
});

module.exports = router;
