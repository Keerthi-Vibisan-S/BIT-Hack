import 'package:flutter/material.dart';
import 'package:special_lab_dashboard/Pages/AdminHomePage.dart';
import 'package:special_lab_dashboard/Pages/FacultyHome.dart';
import 'package:special_lab_dashboard/Pages/LabSwitch.dart';
import 'package:special_lab_dashboard/Pages/LoginPage.dart';
import 'package:special_lab_dashboard/Pages/studenthome.dart';

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
<<<<<<< HEAD
    return AdminHomePage();
=======
    return LabSwitchPage();

>>>>>>> 3c3434f2a4e9dc947045cd76f4bce26c7b246388
  }
}



