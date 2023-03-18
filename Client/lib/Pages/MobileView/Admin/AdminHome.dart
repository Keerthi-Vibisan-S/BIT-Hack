import 'package:flutter/cupertino.dart';

import '../../../Components.dart';
import '../../../Utilities/Util.dart';
import 'AdminHomePageMobile.dart';

class AdminHome extends StatefulWidget {
  final List<String> labnames;
  final List<String> faculties;
  final List<int> labStudentsCount;
  const AdminHome(this.labnames,this.faculties,this.labStudentsCount,{Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left:8,right: 8,bottom: 8,top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              getStyledTextForProfileCard("Special Lab Stats"),
            ],
          ),
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            renderCardsForAdminPage("Special Labs", 27, 0xff1e1492, 0xffaba8d6,115,200,14,18,0,10),
            renderCardsForAdminPage("Faculties Working", 54, 0xffff8a1d,0xffffd7b2,115,200,14,18,0,10),
            renderCardsForAdminPage("Students Enrolled", 1175, 0xff024d19, 0xff66cc85,115,200,14,18,0,10),
            renderCardsForAdminPage("Students not Enrolled", 103, 0xffff0000,0xffe892a1,115,200,14,18,0,10),
          ],
        ),
        Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                getStyledTextForProfileCard("Special Lab Details"),
              ],
            )
        ),
        for(int index=0;index<widget.labnames.length;index++)
          Padding(padding: EdgeInsets.only(bottom: 10),
            child: ShowSpecialLabStatsMobile(widget.labnames[index],widget.labStudentsCount[index],widget.faculties),
          ),
        Container(
            width: double.infinity
        )
      ],
    );
  }
}
