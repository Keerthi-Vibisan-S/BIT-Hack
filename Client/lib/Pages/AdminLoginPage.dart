import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:special_lab_dashboard/APIHandler/apiHandler.dart';

import '../responsive.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({Key? key}) : super(key: key);

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  var emailController = TextEditingController();
  GoogleSignIn? _googleSignIn;

  Future<Map> _handleSignIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var details= {"email":"", "token":""};
    await _googleSignIn?.signIn().then((value) async {
      details["email"] = value?.email ?? "email";
      await value?.authentication.then((token) async {
        details["token"] = token.idToken.toString();
        preferences.setString("token", details["token"]!);
      }).then((value) {
        return details;
      });
    });
    return details;
  }

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
                                  print("Clicked");
                                  _googleSignIn = GoogleSignIn(
                                    clientId: "852762241490-gr45nghc45rkvjp5bs3uqvr4q0qkp80h.apps.googleusercontent.com",
                                    scopes: [
                                      'email',
                                    ],
                                  );
                                  var details = await _handleSignIn();
                                  print(details);
                                  await adminLogin(details).then((v)
                                  {
                                      Navigator.pushNamed(context, "/adminhome") ;
                                  }).catchError((err){
                                        print("Error");
                                  });
                                }, child: Text("Login"))
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
