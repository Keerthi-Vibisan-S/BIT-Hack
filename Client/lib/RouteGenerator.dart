import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:special_lab_dashboard/Pages/LabSwitch.dart';
import 'package:special_lab_dashboard/Pages/LoginPage.dart';
import 'package:special_lab_dashboard/Pages/studenthome.dart';

import 'Pages/FacultyHome.dart';
import 'RouteNames.dart';


class RouteGenerator {

  static getUserDetails() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  return sp.getString("user");
}
  static _GeneratePageRoute generateRoute(RouteSettings settings)  {
    var userDetails = getUserDetails();
    print("user details "+userDetails.toString());
    switch (settings.name) {
      case RouteNames.STUDENT_HOME_PAGE:
        return _GeneratePageRoute(
            widget: StudentHome(userDetails), routeName: settings.name.toString());
      case RouteNames.FACULTY_HOME_PAGE:
        return _GeneratePageRoute(
            widget: FacultyHome(userDetails), routeName: settings.name.toString(),
        );
      default:
        return _GeneratePageRoute(
            widget: LoginPage(), routeName: settings.name.toString());
    }
  }
}

class _GeneratePageRoute extends PageRouteBuilder {
  final Widget widget;
  final String routeName;
  _GeneratePageRoute({required this.widget, required this.routeName})
      : super(
      settings: RouteSettings(name: routeName),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return widget;
      },
   );
}
