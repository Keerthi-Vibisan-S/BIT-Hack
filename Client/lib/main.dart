import 'package:flutter/material.dart';
import 'package:special_lab_dashboard/Pages/LoginPage.dart';
import 'package:special_lab_dashboard/Pages/studenthome.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Color(0xff200269),
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
    return StudentHome();
  }
}



