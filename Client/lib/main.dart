import 'package:flutter/material.dart';
import 'package:special_lab_dashboard/Pages/FacultyHome.dart';
import 'package:special_lab_dashboard/Pages/studenthome.dart';

import 'Navigator.dart';
import 'Pages/AdminHomePage.dart';
import 'Pages/LoginPage.dart';

void main() {
  runApp(
      const MaterialApp(
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
    return FacultyHome();
  }
}



