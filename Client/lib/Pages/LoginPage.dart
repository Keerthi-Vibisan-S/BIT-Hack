import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:special_lab_dashboard/APIHandler/apiHandler.dart';
import 'package:special_lab_dashboard/Navigator.dart';
import 'package:special_lab_dashboard/Pages/FacultyHome.dart';

import 'package:special_lab_dashboard/Pages/studenthome.dart';
import 'package:special_lab_dashboard/responsive.dart';

import 'AdminHomePage.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  GoogleSignIn? _googleSignIn;
  Future<Map> _handleSignIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var details= {"email":"", "idToken":""};

    if(preferences.getString("idToken") == null || preferences.getString("idToken") == "") {
      try {
        await _googleSignIn?.signIn().then((value) async {
          details["email"] = value?.email ?? "email";
          await value?.authentication.then((token) async {
            details["idToken"] = token.idToken.toString();
            preferences.setString("token", details["idToken"]!);
          }).then((value) {
            return details;
          });
        });
      } catch (error) {
        print(error);
      }
    }
    else{
      var user = json.decode(preferences.getString("user") ?? "");
      details["email"] = user["email"];
      details["idToken"] = preferences.getString("idToken") ?? "";
    }
    return details;
  }
  var userDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 20,
          child: Container(
              height: 450,
              width: 750,
              color: Colors.grey,
              child: Row(
                children: [
                  (Responsive.isMobile(context))?Container():Expanded(child: Container(
                    child: Image.asset("assets/login_banner1.jpg"),
                  )),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 250,
                            child: Column(
                              children: [
                                Image.asset("assets/login_sl_logo.jpg"),
                                TextField(
                                  controller: emailController,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                    hintStyle: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black54
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                TextField(
                                  obscureText: true,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black54
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                ElevatedButton(onPressed: (){
                                  // var userDetails = "{\"email\":\"balasuriya.cs20@bitsathy.ac.in\",\"verify\":true,\"name\":\"BALASURIYA K A\",\"img\":\"https://lh3.googleusercontent.com/a/AGNmyxZdo8m7KpccPALmjk2YYWqtTzhZlAbYtLzDBtwegQ=s96-c\",\"details\":[{\"STU_ID\":\"201CS130\",\"STU_NAME\":\"BALA SURIYA K A\",\"STU_EMAIL\":\"balasuriya.cs20@bitsathy.ac.in\",\"STU_CONTACT\":\"9782315975\",\"LAB_ID\":\"5\",\"FACULTY_ID\":\"105\",\"COUNT\":0,\"LAST_UPDATED_DATE\":\"2023-02-17T18:30:00.000Z\",\"DEPT\":\"COMPUTER SCIENCE ENGINEERING\",\"YEAR\":\"3rd Year\"}]}";
                                  // print(userDetails);
                                  // if(emailController.text == "Student")
                                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => StudentHome(userDetails)));
                                  //
                                  // else if(emailController.text == "Teacher")
                                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => FacultyHome()));
                                  //
                                  // else
                                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHomePage()));
                                  // var userDetails = "{\"email\":\"balasuriya.cs20@bitsathy.ac.in\",\"verify\":true,\"name\":\"BALASURIYA K A\",\"img\":\"https://lh3.googleusercontent.com/a/AGNmyxZdo8m7KpccPALmjk2YYWqtTzhZlAbYtLzDBtwegQ=s96-c\",\"details\":[{\"STU_ID\":\"201CS130\",\"STU_NAME\":\"BALA SURIYA K A\",\"STU_EMAIL\":\"balasuriya.cs20@bitsathy.ac.in\",\"STU_CONTACT\":\"9782315975\",\"LAB_ID\":\"5\",\"FACULTY_ID\":\"105\",\"COUNT\":0,\"LAST_UPDATED_DATE\":\"2023-02-17T18:30:00.000Z\",\"DEPT\":\"COMPUTER SCIENCE ENGINEERING\",\"YEAR\":\"3rd Year\"}]}";
                                  // if(emailController.text == "Student")
                                  //   {
                                  //     // Navigator.pushNamed(context, "/student_home");
                                  //     Navigator.push(context, MaterialPageRoute(builder: (context) => StudentHome(userDetails)));
                                  //   }

                                  //
                                  //
                                  // else if(emailController.text == "Teacher")
                                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => FacultyHome(userDetails)));
                                  //
                                  // else
                                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHomePage()));

                                },
                                  child: Text("Login", style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white
                                  ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                ElevatedButton(onPressed: () async {
                                  _googleSignIn = GoogleSignIn(
                                    clientId: "852762241490-gr45nghc45rkvjp5bs3uqvr4q0qkp80h.apps.googleusercontent.com",
                                    scopes: [
                                      'email',
                                    ],
                                  );

                                  // While Testing for Faculty Comment section 1 and Uncomment Section 2 (Since Google Sign for Faculty is not Set

                                  // Permanent Google Sign In Method - Section 1
                                  // var details = await _handleSignIn();
                                  // print(details.toString());
                                  // var userDetails;
                                  // if(details["idToken"] != null && details["idToken"]!="") {
                                  //   RegExp re = new RegExp(
                                  //       r"^\w+\.?(\w\w)?(\d\d)?@bitsathy\.ac\.in$");
                                  //   var iter = re.firstMatch(details["email"]!);
                                  //   var match = iter?.groups([1, 2]);
                                  //   var role = "Teacher";
                                  //   if (match?[0] != null) {
                                  //     role = "Student";
                                  //     print("Student");
                                  //     await checkValidUser(details["email"],details["idToken"]?.toString()).then((v) async {
                                  //       print("---------");
                                  //       print(v.toString());
                                  //       if (v != "Error") {
                                  //         userDetails = await v;
                                  //         print(v);
                                  //         SharedPreferences preferences = await SharedPreferences
                                  //             .getInstance();
                                  //         preferences.setString(
                                  //             "user", json.encode(userDetails));
                                  //         // Navigator.pushNamed(context, "/student_home",arguments: userDetails);
                                  //         Navigator.push(
                                  //             context, MaterialPageRoute(
                                  //             builder: (context) =>
                                  //                 NavigatorPage(
                                  //                     "Student")));
                                  //       }
                                  //     });
                                  //   }
                                  //   else {
                                  //     await checkValidFacultyUser(
                                  //         details["email"],
                                  //         details["idToken"]?.toString()).then((
                                  //         v) async {
                                  //       if (v != "Error") {
                                  //         userDetails = await v;
                                  //         print(v);
                                  //         SharedPreferences preferences = await SharedPreferences
                                  //             .getInstance();
                                  //         preferences.setString(
                                  //             "user", json.encode(userDetails));
                                  //         Navigator.push(
                                  //             context, MaterialPageRoute(
                                  //             builder: (context) =>
                                  //                 NavigatorPage(
                                  //                     role)));
                                  //       }
                                  //     });
                                  //   }
                                  // }
                                  // String email_id = details["email"].toString().toLowerCase();
                                  // if(!email_id.contains("@bitsathy.ac.in"))
                                  // {
                                  //   showDialog(context: context, builder: (BuildContext context){
                                  //     return AlertDialog(
                                  //       content: Text("Logging with bitsathy email id"),
                                  //     );
                                  //   });
                                  //   return;
                                  // }




                                  // Temporary - Section 2
                                  var details = {"email":  emailController.text, "idToken": "aa"};
                                  print("details"+details.toString());
                                  var userDetails;
                                  if(details["idToken"] != null && details["idToken"]!="") {
                                    RegExp re = new RegExp(
                                        r"^\w+\.?(\w\w)?(\d\d)?@bitsathy\.ac\.in$");
                                    var iter = re.firstMatch(details["email"]!);
                                    var match = iter?.groups([1, 2]);
                                    var role = "Teacher";
                                    if (match?[0] != null) {
                                      role = "Student";
                                      await checkValidUser(details["email"],details["idToken"]?.toString()).then((v) async {
                                        if (v != "Error") {
                                          userDetails = await v;
                                          print(v);
                                          SharedPreferences preferences = await SharedPreferences
                                              .getInstance();
                                          preferences.setString(
                                              "user", json.encode(userDetails));
                                          // Navigator.pushNamed(context, "/student_home",arguments: userDetails);
                                          Navigator.push(
                                              context, MaterialPageRoute(
                                              builder: (context) =>
                                                  NavigatorPage(
                                                      role)));
                                        }
                                      });
                                    }
                                    else {
                                      print("Teacher");
                                      await checkValidFacultyUser(
                                          details["email"],
                                          details["idToken"]?.toString()).then((
                                          v) async {
                                        if (v != "Error") {
                                          userDetails = await v;
                                          print(v);
                                          SharedPreferences preferences = await SharedPreferences
                                              .getInstance();
                                          preferences.setString(
                                              "user", json.encode(userDetails));
                                          Navigator.push(
                                              context, MaterialPageRoute(
                                              builder: (context) =>
                                                  NavigatorPage(
                                                      "Teacher")));
                                        }
                                      });
                                    }
                                  }
                                  String email_id = details["email"].toString().toLowerCase();
                                  if(!email_id.contains("@bitsathy.ac.in"))
                                  {
                                    showDialog(context: context, builder: (BuildContext context){
                                      return AlertDialog(
                                        content: Text("Logging with bitsathy email id"),
                                      );
                                    });
                                    return;
                                  }
                                  // var userDetails;
                                  try{
                                    if(details["idToken"] != null && details["idToken"]!="") {
                                      RegExp re = new RegExp(
                                          r"^\w+\.?(\w\w)?(\d\d)?@bitsathy\.ac\.in$");
                                      var iter = re.firstMatch(details["email"]!);
                                      var match = iter?.groups([1, 2]);
                                      var role = "Teacher";
                                      if (match?[0] != null) {
                                        role = "Student";
                                        await checkValidUser(details["email"],details["idToken"]?.toString()).then((v) async {
                                          if (v != "Error") {
                                            userDetails = await v;
                                            print(v);
                                            SharedPreferences preferences = await SharedPreferences
                                                .getInstance();
                                            preferences.setString(
                                                "user", json.encode(userDetails));
                                            // Navigator.pushNamed(context, "/student_home",arguments: userDetails);
                                            Navigator.push(
                                                context, MaterialPageRoute(
                                                builder: (context) =>
                                                    NavigatorPage(
                                                        role)));
                                          }

                                        });
                                      }
                                      else {
                                        await checkValidFacultyUser(
                                            details["email"],
                                            details["idToken"]?.toString()).then((
                                            v) async {
                                          if (v != "Error") {
                                            userDetails = await v;
                                            print(v);
                                            SharedPreferences preferences = await SharedPreferences
                                                .getInstance();
                                            preferences.setString(
                                                "user", json.encode(userDetails));
                                            Navigator.push(
                                                context, MaterialPageRoute(
                                                builder: (context) =>
                                                    NavigatorPage(
                                                        "Teacher")));
                                          }

                                        });
                                      }
                                    }
                                  }
                                  catch(e)
                                  {
                                    showDialog(context: context, builder: (BuildContext context){
                                        return AlertDialog(
                                          content: Text("Logging with bitsathy email id"),
                                        );
                                    });
                                  }



                                  // Temporary - Section 2
                                  // var details = {"email":  emailController.text, "idToken": ""};
                                  // // var userDetails;
                                  //   RegExp re = new RegExp(
                                  //       r"^\w+\.?(\w\w)?(\d\d)?@bitsathy\.ac\.in$");
                                  //   var iter = re.firstMatch(details["email"]!);
                                  //   var match = iter?.groups([1, 2]);
                                  //   var role = "Teacher";
                                  //   if (match?[0] != null) {
                                  //     role = "Student";
                                  //     await checkValidUser(details["email"],
                                  //         details["idToken"]?.toString()).then((
                                  //         v) async {
                                  //       if (v != "Error") {
                                  //         userDetails = await v;
                                  //         print(v);
                                  //         SharedPreferences preferences = await SharedPreferences
                                  //             .getInstance();
                                  //
                                  //         preferences.setString("user", json.encode(userDetails));
                                  //         Navigator.push(
                                  //             context, MaterialPageRoute(
                                  //             builder: (context) =>
                                  //                 NavigatorPage(
                                  //                     role)));
                                  //       }
                                  //     });
                                  //   }
                                  //   else {
                                  //     await checkValidFacultyUser(
                                  //         details["email"],
                                  //         details["idToken"]?.toString()).then((
                                  //         v) async {
                                  //       if (v != "Error") {
                                  //         userDetails = await v;
                                  //         print(v);
                                  //         SharedPreferences preferences = await SharedPreferences
                                  //             .getInstance();
                                  //         preferences.setString(
                                  //             "user", json.encode(userDetails));
                                  //         // Navigator.pushNamed(context, "/faculty_home",arguments: "Testing arguments feature!!!");
                                  //         Navigator.push(
                                  //             context, MaterialPageRoute(
                                  //             builder: (context) =>
                                  //                 NavigatorPage(
                                  //                     role)));
                                  //       }
                                  //     });
                                  //   }

                                }, child: Text("Sign in Google",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white
                                  ),
                                )
                                ),

                                // Text("Forget Password"),
                                // SizedBox(height: 20,),
                                // Text("Or continue with Google"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
}



//
// // Figma Flutter Generator Desktop1Widget - FRAME
// Container(
// width: 1440,
// height: 1024,
// decoration: BoxDecoration(
// color : Color.fromRGBO(255, 255, 255, 0.8500000238418579),
// ),
// child: Stack(
// children: <Widget>[
// Positioned(
// top: 295,
// left: 391,
// child: Container(
// width: 657,
// height: 433,
//
// child: Stack(
// children: <Widget>[
// Positioned(
// top: 0,
// left: 1,
// child: Container(
// width: 656,
// height: 433,
// decoration: BoxDecoration(
// borderRadius : BorderRadius.only(
// topLeft: Radius.circular(1),
// topRight: Radius.circular(1),
// bottomLeft: Radius.circular(1),
// bottomRight: Radius.circular(1),
// ),
// boxShadow : [BoxShadow(
// color: Color.fromRGBO(0, 0, 0, 0.05000000074505806),
// offset: Offset(0,0),
// blurRadius: 0
// )],
// color : Color.fromRGBO(238, 238, 238, 1),
// )
// )
// ),
// Positioned(
// top: 0,
// left: 0,
// child: Container(
// width: 329,
// height: 433,
// decoration: BoxDecoration(
// color : Color.fromRGBO(217, 217, 217, 1),
// )
// )
// ),
// Positioned(
// top: 308,
// left: 446,
// child: Text('Forgot Password?',
// textAlign: TextAlign.left,
// style: GoogleFonts.poppins(
//
// fontFamily: 'Inter',
// fontSize: 9.5,
// letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
// fontWeight: FontWeight.normal,
// height: 1
// ),)
// ),Positioned(
// top: 253,
// left: 389,
// child: Container(
// decoration: BoxDecoration(
// color : Color.fromRGBO(255, 138, 138, 1),
// ),
// padding: EdgeInsets.symmetric(horizontal: 82, vertical: 14),
// child: Row(
// mainAxisSize: MainAxisSize.min,
//
// children: <Widget>[
// Text('LOGIN', textAlign: TextAlign.left, style: GoogleFonts.poppins(
// color: Color.fromRGBO(0, 0, 0, 1),
// fontFamily: 'Inter',
// fontSize: 10,
// letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
// fontWeight: FontWeight.normal,
// height: 1
// ),),
//
// ],
// ),
// )
// ),Positioned(
// top: 355,
// left: 421,
// child: Text('Or Continue With', textAlign: TextAlign.left, style: GoogleFonts.poppins(
// color: Color.fromRGBO(0, 0, 0, 1),
// fontFamily: 'Inter',
// fontSize: 10,
// letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
// fontWeight: FontWeight.normal,
// height: 1
// ),)
// ),Positioned(
// top: 159,
// left: 388,
// child: Container(
// width: 205,
// height: 15,
//
// child: Stack(
// children: <Widget>[
// Positioned(
// top: 0,
// left: 1,
// child: TextField()
// ),Positioned(
// top: 15,
// left: 0,
// child: Divider(
// color: Color.fromRGBO(0, 0, 0, 1),
// thickness: 0.5
// )
//
// ),
// ]
// )
// )
// ),Positioned(
// top: 205,
// left: 389,
// child: Container(
// width: 204,
// height: 15,
//
// child: Stack(
// children: <Widget>[
// Positioned(
// top: 0,
// left: 0.995121955871582,
// child: TextField()
// ),Positioned(
// top: 15,
// left: 0,
// child: Divider(
// color: Color.fromRGBO(0, 0, 0, 1),
// thickness: 0.5
// )
//
// ),
// ]
// )
// )
// ),Positioned(
// top: 56,
// left: 452,
// child: Container(
// width: 87.87602996826172,
// height: 37,
//
// child: Stack(
// children: <Widget>[
// Positioned(
// top: 9,
// left: 0,
// child: Text('Camps', textAlign: TextAlign.left, style: GoogleFonts.poppins(
// color: Color.fromRGBO(0, 0, 0, 1),
// fontFamily: 'Paprika',
// fontSize: 20,
// letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
// fontWeight: FontWeight.normal,
// height: 1
// ),)
// ),Positioned(
// top: 0,
// left: 59.9635009765625,
// child: Transform.rotate(
// angle: -21.49999928013559 * (3.14 / 180),
// child: Container(
// width: 29.999996185302734,
// height: 18.999998092651367,
// decoration: BoxDecoration(
// image : DecorationImage(
// image: AssetImage('assets/images/Pngwing1.png'),
// fit: BoxFit.fitWidth
// ),
// )
// ),
// )
// ),
// ]
// )
// )
// ),Positioned(
// top: 343,
// left: 509,
// child: Container(
// width: 35,
// height: 35,
//
// child: Stack(
// children: <Widget>[
// Positioned(
// top: 0,
// left: 0,
// child: Container(
// width: 35,
// height: 35,
// decoration: BoxDecoration(
// borderRadius : BorderRadius.only(
// topLeft: Radius.circular(20),
// topRight: Radius.circular(20),
// bottomLeft: Radius.circular(20),
// bottomRight: Radius.circular(20),
// ),
// boxShadow : [BoxShadow(
// color: Color.fromRGBO(0, 0, 0, 0.05000000074505806),
// offset: Offset(0,0),
// blurRadius: 0
// )],
// color : Color.fromRGBO(242, 242, 242, 1),
// )
// )
// ),Positioned(
// top: 4,
// left: 4,
// child: Container(
// width: 27,
// height: 27,
// decoration: BoxDecora
