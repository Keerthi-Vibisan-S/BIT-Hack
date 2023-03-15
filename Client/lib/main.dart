import 'package:flutter/material.dart';
import 'MyCustomScrollBehaviour.dart';
import 'Pages/LoginPage.dart';

void main() {
  runApp(
      MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
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

