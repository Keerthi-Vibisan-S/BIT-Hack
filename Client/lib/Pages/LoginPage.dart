import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:special_lab_dashboard/APIHandler/apiHandler.dart';
import 'package:special_lab_dashboard/Navigator.dart';
import 'package:special_lab_dashboard/Pages/WebView/Faculty/FacultyHome.dart';
import 'package:special_lab_dashboard/responsive.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    // print(preferences.getString("token"));
    var details= {"email":"", "idToken":""};

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
    print(details);
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
                                ElevatedButton(onPressed: () async {
                                  _googleSignIn = GoogleSignIn(
                                    // serverClientId: "852762241490-gr45nghc45rkvjp5bs3uqvr4q0qkp80h.apps.googleusercontent.com",
                                    // clientId: "852762241490-gr45nghc45rkvjp5bs3uqvr4q0qkp80h.apps.googleusercontent.com",
                                    scopes: [
                                      'email',
                                    ],
                                  );

                                  // While Testing for Faculty Comment section 1 and Uncomment Section 2 (Since Google Sign for Faculty is not Set

                                  // Permanent Google Sign In Method - Section 1
                                  var details = await _handleSignIn();
                                  // print(details.toString());
                                  var userDetails;
                                  if(details["idToken"] != null && details["idToken"]!="") {
                                    RegExp re = new RegExp(r"^\w+\.?(\w\w)?(\d\d)?@bitsathy\.ac\.in$");
                                    var iter = re.firstMatch(details["email"]!);
                                    var match = iter?.groups([1, 2]);
                                    var role = "Teacher";
                                    if (match?[0] != null) {
                                      role = "Student";
                                      print("Student");
                                      // print(details.toString());
                                      await checkValidUser(details["email"],details["idToken"]?.toString()).then((v) async {
                                        print(v);
                                        if (v != "Error") {
                                          userDetails = await v;
                                          SharedPreferences preferences = await SharedPreferences
                                              .getInstance();
                                          preferences.setString(
                                              "user", json.encode(userDetails));
                                          // Navigator.pushNamed(context, "/student_home",arguments: userDetails);
                                          Navigator.pushNamed(context,"/studenthome");
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
                                          SharedPreferences preferences = await SharedPreferences
                                              .getInstance();
                                          preferences.setString(
                                              "user", json.encode(userDetails));
                                          Navigator.pushNamed(context,"/facultyhome");
                                        }
                                      });
                                    }
                                  }




                                  // Temporary - Section 2
                                  // var details = {"email":"cloud@bitsathy.ac.in","idToken":"eyJhbGciOiJSUzI1NiIsImtpZCI6IjFhYWU4ZDdjOTIwNThiNWVlYTQ1Njg5NWJmODkwODQ1NzFlMzA2ZjMiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiYXpwIjoiODUyNzYyMjQxNDkwLWdyNDVuZ2hjNDVya3ZqcDViczN1cXZyNHEwcWtwODBoLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwiYXVkIjoiODUyNzYyMjQxNDkwLWdyNDVuZ2hjNDVya3ZqcDViczN1cXZyNHEwcWtwODBoLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwic3ViIjoiMTE0Nzg0NTkzNTcwNDE4ODk1NTAxIiwiaGQiOiJiaXRzYXRoeS5hYy5pbiIsImVtYWlsIjoiY2xvdWRAYml0c2F0aHkuYWMuaW4iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiYXRfaGFzaCI6InZWMnFVY1l3bGJkTUF0b0RGeU03Q2ciLCJuYW1lIjoiQ0xPVUQgTEFCIEJJVCIsInBpY3R1cmUiOiJodHRwczovL2xoMy5nb29nbGV1c2VyY29udGVudC5jb20vYS9BR05teXhZUC1MYk5YMVVDTUp5N1o2YVQ1dGFlNTN2UWtjMEJQOXFIazVRSj1zOTYtYyIsImdpdmVuX25hbWUiOiJDTE9VRCBMQUIiLCJmYW1pbHlfbmFtZSI6IkJJVCIsImxvY2FsZSI6ImVuIiwiaWF0IjoxNjgwNTA5NjczLCJleHAiOjE2ODA1MTMyNzMsImp0aSI6Ijc3OGE5NTZhZDNhMTQyNzhkOGFlZWIzYzRhYjBjOTFhYjAyZTc3MTcifQ.kOEnSqL3iZ1fn3ltTpm59XJ94cEIT5R9vYnlIoQXbPOawi-RIDd86tqJW4mJ30M4FaBYd9ou1JgrGIZ8SslR6SnF6XKIBt7cvr-qH5o-WRnLqqNetSHYmroTTqPplKBu6ieLaedS9BdXM17ZZAZt1flKTNZJ588KegRgaAYcV4oqJj4f0HDQ-tYa4wM9sImpizrQTZSpy6eKh79PnmWRcZfAxSP-ZOCRd70m0m90b4ybHLexvMT2jXPAOady1cv9cv8aiK1VGUoNCKrhMH-8f_75taSYIjSoAtHFU-1FFq6AYe9G7MIJ3RVEbTHN7w8byJGrKkI-LCHysDiOcMqQZQ"};
                                  // // var details = {"email":"cloud@bitsathy.ac.in","details":[{"FACULTY_ID":"1001","FACULTY_NAME":"Clouds","FACULTY_EMAIL":\"cloud@bitsathy.ac.in\",\"CONTACT\":\"9655997760\",\"LAB_ID\":\"1\",\"LAB_NAME\":\"Cloud Computing\"}]};
                                  // print("details"+details.toString());
                                  // var userDetails;
                                  // if(details["idToken"] != null && details["idToken"]!="") {
                                  //   RegExp re = new RegExp(
                                  //       r"^\w+\.?(\w\w)?(\d\d)?@bitsathy\.ac\.in$");
                                  //   var iter = re.firstMatch(details["email"]!);
                                  //   var match = iter?.groups([1, 2]);
                                  //   var role = "Teacher";
                                  //   if (match?[0] != null) {
                                  //     print("Student");
                                  //     role = "Student";
                                  //     await checkValidUser(details["email"],details["idToken"]?.toString()).then((v) async {
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
                                  //                     role)));
                                  //       }
                                  //     });
                                  //   }
                                  //   else {
                                  //     print("Teacher");
                                  //     await checkValidFacultyUser(
                                  //         details["email"],
                                  //         details["idToken"]?.toString()).then((v) async {
                                  //           print("Response"+v.toString());
                                  //       if (v != "Error") {
                                  //         userDetails = await v;
                                  //         print(v);
                                  //         SharedPreferences preferences = await SharedPreferences
                                  //             .getInstance();
                                  //         preferences.setString(
                                  //             "user", json.encode(userDetails));
                                  //         preferences.setString("token", details["idToken"].toString());
                                  //         Navigator.push(
                                  //             context, MaterialPageRoute(
                                  //             builder: (context) =>
                                  //                 NavigatorPage(
                                  //                     "Teacher")));
                                  //       }
                                  //     });
                                  //   }
                                  // }
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

