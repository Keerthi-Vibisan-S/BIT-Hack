
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:special_lab_dashboard/Pages/WebView/Admin/AdminConfirmPage.dart';
import 'package:special_lab_dashboard/Pages/MobileView/Admin/AdminHome.dart';
import 'package:special_lab_dashboard/Pages/MobileView/Admin/AdminLabSwitch.dart';
import 'package:special_lab_dashboard/Pages/MobileView/Admin/AdminSpecialLabDatabase.dart';

import '../../../Components.dart';
import '../../../Utilities/Colors.dart';
import '../../../Utilities/Util.dart';
import '../../WebView/Admin/AdminSpecialLabDatabase.dart';

class AdminHomePageMobile extends StatefulWidget {
  final int pageNo;
  const AdminHomePageMobile(this.pageNo,{Key? key}) : super(key: key);

  @override
  State<AdminHomePageMobile> createState() => _AdminHomePageMobileState();
}

class _AdminHomePageMobileState extends State<AdminHomePageMobile> {
  List<String> labnames = [
    "Cloud Computing",
    "AR VR",
    "IOT",
    "Data Science",
    "Hackathon",
    "Mobile App",
    "Cloud Computing",
    "AR VR",
    "IOT",
    "Data Science",
    "Hackathon",
    "Mobile App"
  ];
  List<int> labStudentsCount = [3, 6, 2, 9, 7, 4, 3, 6, 2, 9, 7, 4];
  List<String> faculties = ["Nataraj","Poornima","Nithya"];
  int selected = 0;

  @override
  void initState() {
    setState(() {
      selected = widget.pageNo;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      AdminHome(labnames, faculties, labStudentsCount),
      AdminSpecialLabDatabase(),
      InchargeSwitch()
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY,
        actions: [
          IconButton(icon:Icon(Icons.logout),onPressed: (){
            showDialog(context: context, builder: (BuildContext context){
              return showLogoutDialog();
            });
          },),
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 250,
                color: Colors.green.shade50,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  onTap: (){
                    setState(() {
                      // print(drawerState[0]);
                      selected = 0;
                    });
                  },
                  textColor:(selected == 0)?Colors.white:Colors.black,
                  tileColor: (selected == 0)?Color(0xff210368):Colors.grey.shade100,
                  title: Text("Dashboard"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8,right:8,bottom: 8),
                child: ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  onTap: (){
                    setState(() {
                      selected = 1;
                    });
                  },
                  textColor:(selected == 1)?Colors.white:Colors.black,
                  tileColor: (selected == 1)?Color(0xff210368):Colors.grey.shade100,
                  title: Text("Database"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8,right:8,bottom: 8),
                child: ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  onTap: (){
                    setState(() {
                      selected = 2;
                    });
                  },
                  textColor:(selected == 2)?Colors.white:Colors.black,
                  tileColor: (selected == 2)?Color(0xff210368):Colors.grey.shade100,
                  title: Text("Switch Requests"),
                ),
              ),
            ],
          ),
        ),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: screens[selected]
        ),
      ),
    );
  }
}


class ShowSpecialLabStatsMobile extends StatefulWidget {
  final labName,studentsCount;
  final List<String> faculties;
  const ShowSpecialLabStatsMobile(this.labName,this.studentsCount,this.faculties,{Key? key}) : super(key: key);

  @override
  State<ShowSpecialLabStatsMobile> createState() => _ShowSpecialLabStatsMobileState();
}

class _ShowSpecialLabStatsMobileState extends State<ShowSpecialLabStatsMobile> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 8),
      child: Container(
          decoration: BoxDecoration(
            color: Color(0xfff5f5f5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ExpansionTile(
              onExpansionChanged: (e){
                if(e)
                {
                  setState(() {
                    isExpanded = e;
                  });
                }
                else
                {
                  setState(() {
                    isExpanded = false;
                  });
                }
              },
              textColor: Colors.black,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.labName.toString()),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      getStyledTextForProfileCard("Total Strength"),
                      SizedBox(width: 30,),
                      (isExpanded)?Container():Text(widget.studentsCount.toString())
                    ],
                  ),
                  (isExpanded)?Animate(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("I year",style: GoogleFonts.poppins(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,)),
                              Text("II year",style: GoogleFonts.poppins(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,)),
                              Text("III year",style: GoogleFonts.poppins(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,)),
                              Text("IV year",style: GoogleFonts.poppins(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,)),
                            ],
                          ),
                          Column(
                            children: [
                              for(int i=0;i<4;i++)
                                Text(" : ")
                            ],
                          ),
                          Column(
                            children: [
                              Text("32",style: GoogleFonts.poppins(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,)),
                              Text("60",style: GoogleFonts.poppins(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,)),
                              Text("72",style: GoogleFonts.poppins(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,)),
                              Text("38",style: GoogleFonts.poppins(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,)),
                            ],
                          )
                        ],
                      ),
                    ),
                    effects: [FadeEffect(duration: Duration(milliseconds: 300),curve: Curves.linear)],
                  ):Container(),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      getStyledTextForProfileCard("Faculty"),
                      SizedBox(width: 30,),
                      (isExpanded)?Container():Text(widget.faculties[0]),
                    ],
                  ),
                ],
              ),
              iconColor: Colors.black,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20,left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nataraj N",style: GoogleFonts.poppins(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,)),
                        Text("Poornima",style: GoogleFonts.poppins(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,)),
                        Text("Nithya",style: GoogleFonts.poppins(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}






