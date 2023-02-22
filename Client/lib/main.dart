import 'package:flutter/material.dart';
import 'package:special_lab_dashboard/Pages/AdminConfirmPage.dart';
import 'package:special_lab_dashboard/Pages/AdminSpecificLabView.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:special_lab_dashboard/Pages/FacultyHome.dart';
import 'package:special_lab_dashboard/Pages/LabSwitch.dart';
import 'package:special_lab_dashboard/Pages/studenthome.dart';
import 'MyCustomScrollBehaviour.dart';
import 'Navigator.dart';
import 'Pages/AdminHomePage.dart';
import 'Pages/LoginPage.dart';

void main() {
  runApp(
      MaterialApp(
          scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: MainPage(),
          )
      )
  );
}


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return AdminHomePage();
  }
}



