

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:special_lab_dashboard/Components.dart';
import 'package:special_lab_dashboard/Pages/AdminSpecialLabDatabase.dart';
import 'package:special_lab_dashboard/Pages/AdminSpecificLabView.dart';
import 'package:special_lab_dashboard/Pages/AdminConfirmPage.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  List<String> labnames = ["Cloud Computing","AR VR","IOT","Data Science","Hackathon","Mobile App"];
  var pageNo = 1;
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
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height/100;
    var width = size.width/100;
    List<Widget> screens = [getAdminHomePage(), AdminSpecialLabDatabase(), InchargeSwitch()];
    return Scaffold(
      body: Container(
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
                  padding:
                  const EdgeInsets.only(left: 100, top: 40, right: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Portal",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600, fontSize: 28),
                            ),
                            Row(
                              children: const [
                                CircleAvatar(),
                                SizedBox(
                                  width: 24,
                                ),
                                Icon(Icons.logout),
                                Text("Logout")
                              ],
                            )
                          ]
                      ),
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
  List<String> labnames = ["Cloud Computing","AR VR","IOT","Data Science","Hackathon","Mobile App"];
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      flex: 40,
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Analysis",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,decoration : TextDecoration.none,color: Colors.black,),),
                SizedBox(width: 20,),
                Text(". 1278 Students", style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,decoration : TextDecoration.none,color: Colors.black,),)
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                renderCards("No. of Special Labs", 27,0xff1e1492,0xffaba8d6),
                renderCards("No. of Students Enrolled",1175,0xffff8a1d,0xffffd7b2),
                renderCards("No. of Students not Enrolled", 103,0xff191919,0xff787878),
                // Expanded(flex: 2,child: Container())
              ],
            ),
            SizedBox(height: 30,),
            Text("Special Lab Details",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context,int index){
                                return renderLabAnanlysisBar(labnames[index],index+1,index);
                              },
                              itemCount: labnames.length,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Expanded(flex:1,child: Container()),
                Expanded(
                  flex: 3,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Cloud Computing",style: TextStyle(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,),),
                          SizedBox(height: 30,),
                          Text("127 Students",style: TextStyle(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,),),
                          SizedBox(height: 20,),
                          Text("I year : 37",style: TextStyle(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,)),
                          Text("II year : 45",style: TextStyle(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,)),
                          Text("III year : 26",style: TextStyle(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,)),
                          Text("IV year : 16",style: TextStyle(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,)),
                          SizedBox(height: 30,),
                          Text("Faculties",style: TextStyle(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,),),
                          SizedBox(height: 20,),
                          Text("Nataraj N",style: TextStyle(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,)),
                          Text("Poornima",style: TextStyle(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,)),
                          Text("Nithya",style: TextStyle(decoration : TextDecoration.none,fontSize: 15,color: Colors.black,)),

                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(flex: 3,child: Container())
              ],
            )
          ],
        ),
      ),
    );
  }
}



