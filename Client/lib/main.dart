import 'package:flutter/material.dart';
import 'package:special_lab_dashboard/Pages/WebView/Admin/AdminHomePage.dart';
import 'package:special_lab_dashboard/RouteGenerator.dart';
import 'MyCustomScrollBehaviour.dart';
import 'Pages/AdminLoginPage.dart';
import 'Pages/WebView/Faculty/FacultyHome.dart';
import 'Pages/LoginPage.dart';
import 'Pages/WebView/Student/studenthome.dart';


void main(){
  runApp(
      MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          '/' : (context) => const LoginPage(),
          '/adminlogin':(context) => AdminLoginPage(),
          '/studenthome':(context)=>StudentHome(),
          "/facultyhome":(context)=>FacultyHome(),
          "/adminhome" : (context)=>AdminHomePage()
        },
        // onGenerateRoute: RouteGenerator.generateRoute,
        // home: LoginPage(),
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
    return LoginPage();

  }
}

