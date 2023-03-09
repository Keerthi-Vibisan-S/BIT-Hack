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

