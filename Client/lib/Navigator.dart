import 'package:flutter/cupertino.dart';
import 'package:special_lab_dashboard/Pages/FacultyHome.dart';
import 'package:special_lab_dashboard/Pages/studenthome.dart';

class NavigatorPage extends StatefulWidget {
  final role, userDetails;
  const NavigatorPage(this.role, this.userDetails,{Key? key} ) : super(key: key);

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {

  @override
  Widget build(BuildContext context) {
    return (widget.role == "Student")
        ? StudentHome(widget.userDetails)
        : FacultyHome();
  }
}
