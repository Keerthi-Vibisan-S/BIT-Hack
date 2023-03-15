import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:special_lab_dashboard/Pages/FacultySwitch.dart';
import 'package:special_lab_dashboard/Utilities/Util.dart';

import '../APIHandler/apiHandler.dart';

class FacultyHome extends StatefulWidget {
  const FacultyHome({Key? key}) : super(key: key);

  @override
  State<FacultyHome> createState() => _FacultyHomeState();
}

class _FacultyHomeState extends State<FacultyHome> {
  bool press1 = true;
  bool press2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBackground(Row(
        children: [
          Column(
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
          (press1)?getHomePage():FacultySwitch()
        ],
      )),
    );
  }
}

class getHomePage extends StatefulWidget {
  const getHomePage({Key? key}) : super(key: key);

  @override
  State<getHomePage> createState() => _getHomePageState();
}

class _getHomePageState extends State<getHomePage> {
  List<dynamic> data = [
    {
      "S.No": 1,
      "Roll No": "202CT141",
      "Name": "VENKAT RAMAN S P",
      "Department": "COMPUTER TECHNOLOGY",
      "Gender": "Male",
      "Mail ID": "venkatraman.ct20@bitsathy.ac.in"
    },
    {
      "S.No": 1,
      "Roll No": "202CT141",
      "Name": "VENKAT RAMAN S P",
      "Department": "COMPUTER TECHNOLOGY",
      "Gender": "Male",
      "Mail ID": "venkatraman.ct20@bitsathy.ac.in"
    },
    {
      "S.No": 1,
      "Roll No": "202CT141",
      "Name": "VENKAT RAMAN S P",
      "Department": "COMPUTER SCIENCE AND BUSSINESS SYSTEMS",
      "Gender": "Male",
      "Mail ID": "venkatraman.ct20@bitsathy.ac.in"
    },
    {
      "S.No": 1,
      "Roll No": "202CT141",
      "Name": "VENKAT RAMAN S P",
      "Department": "COMPUTER TECHNOLOGY",
      "Gender": "Male",
      "Mail ID": "venkatraman.ct20@bitsathy.ac.in"
    },
    {
      "S.No": 1,
      "Roll No": "202CT141",
      "Name": "VENKAT RAMAN S P",
      "Department": "COMPUTER TECHNOLOGY",
      "Gender": "Male",
      "Mail ID": "venkatraman.ct20@bitsathy.ac.in"
    },
    {
      "S.No": 1,
      "Roll No": "202CT141",
      "Name": "VENKAT RAMAN S P",
      "Department": "COMPUTER TECHNOLOGY",
      "Gender": "Male",
      "Mail ID": "venkatraman.ct20@bitsathy.ac.in"
    },
    {
      "S.No": 1,
      "Roll No": "202CT141",
      "Name": "VENKAT RAMAN S P",
      "Department": "COMPUTER SCIENCE AND BUSSINESS SYSTEMS",
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
    }
  ];

  void getData() async{
    await getMyStudents().then((value){
        setState(() {
          data = value;
        });
    });
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
    return Expanded(
      flex: 40,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: MediaQuery.of(context).size.width - 30,
            color: Colors.white,
            child: Padding(
              padding:
              const EdgeInsets.only(left: 100, top: 30, right: 100),
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
                          children: [
                            CircleAvatar(
                              radius: 25,
                            ),
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
                      ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Cloud Computing",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, fontSize: 24),
                        ),
                        Text(
                          " - 148 Students",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "SLB-031",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Container(
                      width: width*100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Student Database",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                          Material(
                            elevation: 10,
                            shadowColor: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30)
                            ),
                            child: Container(

                              width: width*15,
                              child: TextField(
                                  onChanged: (s) {},
                                  decoration: InputDecoration(
                                    hintText: "Search...",
                                    contentPadding: EdgeInsets.all(18.0),
                                    suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                          Icons.search_rounded),

                                    ),
                                    border: InputBorder.none,
                                  )
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  getSizedBox(30),
                  Material(
                    borderRadius: BorderRadius.circular(7),
                    // elevation: 8,
                    child: Column(
                      children: [
                        Container(
                          color: Colors.grey.shade100.withOpacity(0.5),
                          height: height*7,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                getContainerForTable(width, "S.No", 5, FontWeight.w500, 1.2),
                                getContainerForTable(width, "Roll No", 9, FontWeight.w500, 1.2),
                                getContainerForTable(width, "Name", 12, FontWeight.w500, 1.2),
                                getContainerForTable(width, "Department", 20, FontWeight.w500, 1.2),
                                getContainerForTable(width, "Contact", 7, FontWeight.w500, 1.2),
                                getContainerForTable(width, "Mail Id", 20, FontWeight.w500, 1.2),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: width*100,
                          height: height*50,

                          child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: height*7,
                                  color: index%2==0?Colors.white: Colors.grey.shade100.withOpacity(0.5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        getContainerForTable(width,(index+1).toString(), 5, FontWeight.w300, 1),
                                        getContainerForTable(width,data[index]['STU_ID'].toString(), 9, FontWeight.w300, 1),
                                        getContainerForTable(width,data[index]['STU_NAME'].toString(), 12, FontWeight.w300, 1),
                                        getContainerForTable(width,data[index]['DEPT'].toString(), 20, FontWeight.w300, 1),
                                        getContainerForTable(width,data[index]['STU_CONTACT'].toString(), 7, FontWeight.w300, 1),
                                        getContainerForTable(width,data[index]['STU_EMAIL'].toString(), 20, FontWeight.w300, 1),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
