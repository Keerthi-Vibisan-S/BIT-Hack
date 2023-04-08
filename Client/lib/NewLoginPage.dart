import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:special_lab_dashboard/Utilities/Colors.dart';

import 'Utilities/Util.dart';

class NewLoginPage extends StatefulWidget {
  const NewLoginPage({Key? key}) : super(key: key);

  @override
  State<NewLoginPage> createState() => _NewLoginPageState();
}

class _NewLoginPageState extends State<NewLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: PRIMARY,
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: ClipRRect(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                      image: AssetImage("assets/slider.jpg"),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                    color : Colors.cyan,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(
                      height: 300,
                      width: 500,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                          colors: [Colors.white.withOpacity(0.9),Colors.white.withOpacity(0.6),],
                          begin: AlignmentDirectional.topStart,
                          end: AlignmentDirectional.bottomEnd,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          width: 1.5,
                          color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Expanded(flex:3,child: Container()),
                            Expanded(
                              flex: 4,
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  gradient: LinearGradient(
                                    colors: [Color(0xff3c2478),Color(0xff6c599b)]
                                  )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   Image(image: AssetImage("assets/google.png"),width:50,height: 50,),
                                    Text("Sign in with Google",style: TextStyle(color: Colors.white),),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(flex:3,child: Container()),
                          ],
                        ),
                      ),
                  ),
                ),
              ),
          ),
            )
          )
        ],
      )
    );
  }
}
