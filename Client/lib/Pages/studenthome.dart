import 'dart:convert';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:special_lab_dashboard/Components.dart';
import 'package:special_lab_dashboard/Pages/LabSwitch.dart';
import 'package:http/http.dart' as http;
import 'package:special_lab_dashboard/responsive.dart';

import '../Utilities/Util.dart';

class StudentHome extends StatefulWidget {
  final dynamic userdetails;
  const StudentHome(this.userdetails,{Key? key, }) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {

  var press1 = true;
  var press2 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff210368),
      child: Row(
        children: [
          (Responsive.isDesktop(context))?Expanded(
            flex: 2,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      color: press1 ? Colors.white : Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              if (press1 == true) {
                                press1 = false;
                                press2 = true;
                              } else {
                                press1 = true;
                                press2 = false;
                              }
                            });
                          },
                          icon: Icon(
                            Icons.dashboard,
                            size: 25,
                            color: press1 ? Colors.black : Colors.white,
                          )),
                    ),
                  ),
                  getSizedBox(20),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      color: press2 ? Colors.white : Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (press2 == true) {
                              press2 = false;
                              press1 = true;
                            } else {
                              press2 = true;
                              press1 = false;
                            }
                          });
                        },
                        icon: Icon(Icons.swap_horiz,
                            size: 25, color: press2 ? Colors.black : Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ):Container(),
          (press1)?getStudentHome(widget.userdetails):LabSwitchPage()
        ],
      ),

    );
  }


}

class getStudentHome extends StatefulWidget {
  final userdetails;
  const getStudentHome(this.userdetails,{Key? key}) : super(key: key);

  @override
  State<getStudentHome> createState() => _getStudentHomeState();
}

class _getStudentHomeState extends State<getStudentHome> {
  getLabFacultyDetails() async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("idToken");
    http.Response response =  await http.post(Uri.parse("http://6a40-121-200-55-43.in.ngrok.io/labs/getFaculty")
        ,headers: {
          "Access-Control-Allow-Origin":"*",
          "Content-Type":"application/json",
          "Authorization": "Bearer "+token!,
        },body: json.encode(
            {"lab_id": "1"}));

    print("Faculty details");
    print(response.body);

  }

  var leftClick = false;
  var rightClick = true;

  var data = " ";
  ScrollController sc = new ScrollController();

  void _scrollRight()
  {
    // if(sc.hasClients)
    sc.animateTo(sc.offset+370, duration: Duration(milliseconds: 500), curve: Curves.linear);
  }

  void _scrollLeft()
  {
    // if(sc.hasClients)
    sc.animateTo(sc.offset-370, duration: Duration(milliseconds: 500), curve: Curves.linear);
  }

  getUserDetails ()
  async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      print("photoooo");
      data =  preferences.getString("user")!;
      print(data);
    });
  }

  @override
  void initState() {
    // getUserDetails();
    // getLabFacultyDetails();
    print(widget.userdetails);
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Expanded(
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
                  getSizedBox(50),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      (Responsive.isDesktop(context))?Expanded(
                        flex:6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (Responsive.isDesktop(context))?Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // SizedBox(height: 20,),
                                Container(
                                  width: w * 0.5,
                                  height: h * 0.48,

                                  child: Card(
                                    // elevation: 200,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: SizedBox.expand(
                                            child: Image.network('assets/cloudcomputing.jpg',fit: BoxFit.cover),
                                          ),
                                        ),
                                        Positioned(
                                          child: Text(
                                              "Cloud Computing",
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  decoration: TextDecoration.none,
                                                  color: Colors.white,
                                                  fontSize: 20
                                              )
                                          ),
                                          top: 20,
                                          left: 20,
                                        ),
                                        Positioned(
                                          child: Text(
                                              "SLB008",
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  decoration: TextDecoration.none,
                                                  color: Colors.white,
                                                  fontSize: 17.5
                                              )
                                          ),
                                          top: 60,
                                          left: 20,
                                        ),
                                        Positioned(
                                          left: 20,
                                          bottom: 20,
                                          child: Align(
                                            // top: h * 0.35,
                                            // left: 20,
                                            alignment: Alignment.bottomLeft,
                                            child: Container(
                                              width: w * 0.4,
                                              child: Text(
                                                  "Cloud computing is the on-demand availability of computer system resources, especially data storage and computing power, without direct active management by the user. Large clouds often have functions.",
                                                  maxLines: 4,
                                                  style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w300,
                                                    decoration: TextDecoration.none,
                                                    color: Colors.white.withOpacity(0.85),
                                                    fontSize: 15,
                                                  )
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ):Text("Mobile view"),
                            SizedBox(
                                height:45
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Special Lab Faculties",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,decoration: TextDecoration.none,color: Colors.black,),),
                                getSizedBox(20),
                                SizedBox(
                                  // width: 1200,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 130,
                                          child: Scrollbar(
                                            // thumbVisibility: true,
                                            // trackVisibility: true,
                                            controller: sc,
                                            interactive: true,
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                controller: sc,
                                                itemCount: 5,
                                                scrollDirection: Axis.horizontal,
                                                itemBuilder: (BuildContext context,int index){
                                                  return Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 9.0),
                                                    child: getFacultyCard(),
                                                  );
                                                }),
                                          ),
                                        ),
                                      ),
                                      // GestureDetector(
                                      //   onTap: (){
                                      //     _scrollRight();
                                      //     leftClick = true;
                                      //     setState(() {
                                      //
                                      //     });
                                      //   },
                                      //   child: CircleAvatar(
                                      //     child: Icon(Icons.arrow_right),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            )

                          ],
                        ),
                      ):renderStudentDetailsCard(),
                      getExpanded(1),
                      Expanded(
                          flex:3,
                          child:Column(
                            children: [
                              // SizedBox(height: 20,),
                              (Responsive.isDesktop(context))?
                              Hero(tag: "sjai", child: renderStudentDetailsCard())
                                  :SizedBox(
                                // width: 1200,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 130,
                                        child: Scrollbar(
                                          // thumbVisibility: true,
                                          // trackVisibility: true,
                                          controller: sc,
                                          interactive: true,
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              controller: sc,
                                              itemCount: 5,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (BuildContext context,int index){
                                                return Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 9.0),
                                                  child: getFacultyCard(),
                                                );
                                              }),
                                        ),
                                      ),
                                    ),
                                    // GestureDetector(
                                    //   onTap: (){
                                    //     _scrollRight();
                                    //     leftClick = true;
                                    //     setState(() {
                                    //
                                    //     });
                                    //   },
                                    //   child: CircleAvatar(
                                    //     child: Icon(Icons.arrow_right),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          )
                      ),
                      getExpanded(1)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
