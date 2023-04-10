import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:special_lab_dashboard/NewLoginPage.dart';
import 'package:special_lab_dashboard/Pages/WebView/Admin/AdminHomePage.dart';
import 'package:special_lab_dashboard/RouteGenerator.dart';
import 'MyCustomScrollBehaviour.dart';
import 'Pages/AdminLoginPage.dart';
import 'Pages/WebView/Faculty/FacultyHome.dart';
import 'Pages/LoginPage.dart';
import 'Pages/WebView/Student/studenthome.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name : 'BITSHACK',
    options: FirebaseOptions(
        apiKey: "AIzaSyBR1vYJ5NuA987XE7Aj3Ensfl4vX8LDAGA", appId: "1:52819779871:android:5bc420788f75b849d9502a", messagingSenderId: "52819779871", projectId: "bitshack-507d8")
  );
  
  runApp(
      MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          '/' : (context) => const LoginPage(),
          "/newLogin":(context)=>NewLoginPage(),
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

