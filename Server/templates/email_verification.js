const subject_mail = "OTP: For Email Verification";

const message = (student_details) => {
  return (
    `Lab Change Regarding, \n\n` +
    "The Following Student mentioned below is admitted to switch special Lab" +
    ```Name: ${student_details.stu_name}
       From-Lab: ${student_details.from_lab}
       To-Lab: ${student_details.to_lab}
    ```+
    "This is a auto-generated email. Please do not reply to this email.\n\n" +
    "Regards\n" +
    "Team BITHACKS\n\n"
  );
};

module.exports = { subject_mail, message };
