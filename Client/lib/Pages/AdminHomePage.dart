import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:special_lab_dashboard/APIHandler/apiHandler.dart';
import 'package:special_lab_dashboard/Components.dart';
import 'package:special_lab_dashboard/Pages/AdminSpecialLabDatabase.dart';
import 'package:special_lab_dashboard/Pages/AdminSpecificLabView.dart';
import 'package:special_lab_dashboard/Pages/AdminConfirmPage.dart';
import 'package:special_lab_dashboard/Utilities/Util.dart';
import 'package:special_lab_dashboard/responsive.dart';

import '../Utilities/Colors.dart';
import 'MobileView/Admin/AdminHomePageMobile.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  List<String> labnames = ["Cloud Computing","AR VR","IOT","Data Science","Hackathon","Mobile App"];
  var pageNo = 0;
  int labsCount = 0;
  List data = [
    {
      "S.No": 1,
      "Roll No": "202CT141",
      "Name": "VENKAT RAMAN S P",
      "Department": "COMPUTER TECHNOLOGY",
      "Gender": "Male",
      "Mail ID": "venkatraman.ct20@bitsathy.ac.in"
    },
    {
      "S.No": 2,
      "Roll No": "202CT141",
      "Name": "VENKAT RAMAN S P",
      "Department": "COMPUTER TECHNOLOGY",
      "Gender": "Male",
      "Mail ID": "venkatraman.ct20@bitsathy.ac.in"
    },
    {
      "S.No": 3,
      "Roll No": "202CT141",
      "Name": "VENKAT RAMAN S P",
      "Department": "COMPUTER SCIENCE AND BUSSINESS SYSTEMS",
      "Gender": "Male",
      "Mail ID": "venkatraman.ct20@bitsathy.ac.in"
    },
    {
      "S.No": 4,
      "Roll No": "202CT141",
      "Name": "VENKAT RAMAN S P",
      "Department": "COMPUTER TECHNOLOGY",
      "Gender": "Male",
      "Mail ID": "venkatraman.ct20@bitsathy.ac.in"
    }
  ];


  getData() async
  {
    await getDataForAdminDashboard();
  }

  @override
  void initState() {
    getData();
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height/100;
    var width = size.width/100;
    List<Widget> screens = [getAdminHomePage(), AdminSpecialLabDatabase(), InchargeSwitch()];
    return (Responsive.isMobile(context))?AdminHomePageMobile():Material(
      child: Container(
        color: Color(0xff210368),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(flex:2,child: Container()),
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: (pageNo == 0)?Colors.white:null,

                      ),
                      child:  IconButton(
                          onPressed: (){
                            pageNo=0;
                            setState(() {

                            });
                          },
                          icon: Icon(Icons.home),
                          color:(pageNo==0)?Color(0xff210368):Colors.white
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: (pageNo == 1)?Colors.white:null,

                      ),
                      child: IconButton(
                          onPressed: (){
                            pageNo=1;
                            setState(() {

                            });
                          },
                          icon: Icon(Icons.dashboard),
                          color:(pageNo==1)?Color(0xff210368):Colors.white
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: (pageNo == 2)?Colors.white:null,

                      ),
                      child: IconButton(
                          onPressed: (){
                            pageNo=2;
                            setState(() {

                            });
                          },
                          icon: Icon(Icons.swap_horiz),
                          color:(pageNo==2)?Color(0xff210368):Colors.white
                      ),
                    ),
                    Expanded(flex:3,child: Container()),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 40,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    // color: Colors.orange,
                    width: MediaQuery.of(context).size.width - 30,
                    color: Colors.white,

                    child: Padding(
                      padding: EdgeInsets.only(top: 40,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 100),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Portal",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600, fontSize: 28),
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(),
                                      SizedBox(
                                        width: 24,
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.pop(context);
                                        },
                                        child: Row(
                                          children: [
                                            Icon(Icons.login_outlined),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("Logout", style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400,
                                                decoration: TextDecoration.none,
                                                color: Colors.black,
                                                fontSize: 17.5
                                            ),)
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ]
                            ),
                          ),
                          getSizedBox(20),
                          screens[pageNo]
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class getAdminHomePage extends StatefulWidget {
  const getAdminHomePage({Key? key}) : super(key: key);

  @override
  State<getAdminHomePage> createState() => _getAdminHomePageState();
}

class _getAdminHomePageState extends State<getAdminHomePage> {
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
  String labName = "";
  bool changed = false;

  double x = 0.0;
  double y = 0.0;
  bool isHover = false;

  ScrollController _scrollController = new ScrollController();
  double _scrollPosition = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    var height = size.height / 100;
    var width = size.width / 100;
    return Expanded(
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
            padding: const EdgeInsets.only(top: 25, left: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Analysis", style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.bold
                  ),),
                  SizedBox(width: 20,),
                  Text("\u2022 1278 Students", style: GoogleFonts.poppins(
                      fontSize: 15,
                      // fontWeight: FontWeight.w500,
                      color: Colors.black54
                  ))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        renderCardsForAdminPage("Special Labs", 27, 0xff1e1492, 0xffaba8d6,150,300,18,24,8,15),
                        renderCardsForAdminPage("Faculties Working", 54, 0xffff8a1d,0xffffd7b2,150,300,18,24,8,15),
                        renderCardsForAdminPage("Students Enrolled", 1175, 0xff024d19, 0xff66cc85,150,300,18,24,8,15),
                        renderCardsForAdminPage("Students not Enrolled", 103, 0xffff0000,0xffe892a1,150,300,18,24,8,15),
                        // Expanded(flex: 2,child: Container())
                      ],
                    ),
              SizedBox(height: 30,),
              Text("Special Lab Details", style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.w800
              ),),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue.withOpacity(0.1),
                          spreadRadius: 15,
                          blurRadius: 50,
                          offset: Offset(0, 0),

                      )
                    ]
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Expanded(flex:1,child: Container()),
                      SizedBox(width: width * 5,),
                      Expanded(
                        flex: 8,
                        child: Row(
                          children: [
                            Expanded(
                              child: Stack(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    physics: BouncingScrollPhysics(),
                                    // physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (BuildContext context,
                                        int index) {
                                      return MouseRegion(
                                        onExit: (PointerExitEvent exit) {
                                          setState(() {
                                            isHover = false;
                                          });
                                        },
                                        onHover: (PointerEvent details) {
                                          // print(_scrollController.position.pixels)
                                          setState(() {
                                            isHover = true;
                                            x = details.position.dx;
                                            y = details.position.dy +
                                                (_scrollController.position
                                                    .pixels);
                                            this.labName = labnames[index];
                                          });
                                        },
                                        child: Container(
                                          child: renderLabAnanlysisBar(
                                              labnames[index],
                                              labStudentsCount[index], index),
                                        ),
                                      );
                                    },
                                    itemCount: labnames.length,
                                  ),
                                  (isHover) ? Transform(
                                      transform: Matrix4.translationValues(
                                          x - 250, y - 750, 0),
                                      child: ShowSpecialLabStats(labName)
                                  ) : SizedBox()
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(flex: 3, child: Container())
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // // Programatically display tooltip after two seconds
    // Future.delayed(const Duration(seconds: 2), () {
    //   tooltipController.showTooltip(immediately: false);
    // });
    //
    // tooltipController.addListener(() {
    //   // Prints the enum value of [TooltipStatus.isShowing] or [TooltipStatus.isHiding]
    //   print('controller: ${tooltipController.value}');
    // });
  }
}

class ShowSpecialLabStats extends StatelessWidget {
  final labname;
  const ShowSpecialLabStats(this.labname,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black12.withOpacity(0.1),
                blurRadius: 50,
                offset: Offset(0,0,)
            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(labname,style: GoogleFonts.poppins(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,),),

              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("127 Students",style: GoogleFonts.poppins(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,),),
              ],
            ),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Faculties",style: GoogleFonts.poppins(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,),),
              ],
            ),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nataraj N",style: GoogleFonts.poppins(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,)),
                  Text("Poornima",style: GoogleFonts.poppins(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,)),
                  Text("Nithya",style: GoogleFonts.poppins(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,)),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}












