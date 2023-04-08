import 'package:flutter/cupertino.dart';
import 'package:special_lab_dashboard/Pages/WebView/Faculty/FacultyHome.dart';

import 'Pages/WebView/Student/studenthome.dart';

class NavigatorPage extends StatefulWidget {
  final role;
  const NavigatorPage(this.role,{Key? key} ) : super(key: key);

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {

  @override
  Widget build(BuildContext context) {
    return (widget.role == "Student")
        ? StudentHome()
        : FacultyHome();
  }
}
