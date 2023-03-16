import 'dart:convert';

import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:special_lab_dashboard/APIHandler/apiHandler.dart';
import 'package:special_lab_dashboard/Components.dart';
import 'package:special_lab_dashboard/Models/StudentModel.dart';
import 'package:special_lab_dashboard/Pages/FacultySwitch.dart';
import 'package:special_lab_dashboard/Utilities/Util.dart';

import '../APIHandler/apiHandler.dart';
import '../Models/FacultyModel.dart';
import '../responsive.dart';

class FacultyHome extends StatefulWidget {
  final userDetails;
  const FacultyHome(this.userDetails, {Key? key}) : super(key: key);

  @override
  State<FacultyHome> createState() => _FacultyHomeState();
}

class _FacultyHomeState extends State<FacultyHome> {
  bool press1 = true;
  bool press2 = false;
  List<StudentModel> data = [];
  var requests;
  bool isFetchingStudents = true, isFetchingRequests = true;

  getStudentsUnderFac() async {
    data = await getAllStudentUnderFaculty(widget.userDetails["details"][0]["FACULTY_ID"]);
    setState(() {
      isFetchingStudents = false;
    });
  }

  getRequests() async{
    await getAllStudentRequestsUnderFaculty(widget.userDetails["details"][0]["FACULTY_ID"]).then((v){
      setState(() {
        print(v);
        requests = v;
        isFetchingRequests = false;
      });
    });

  }

  @override
  void initState() {
    getStudentsUnderFac();
    getRequests();

  }

  @override
  Widget build(BuildContext context) {
    return (Responsive.isMobile(context))?
        FacultyHomeMobile(data)
        :Scaffold(
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
          (press1)?getHomePage(widget.userDetails, isFetchingStudents, data):FacultySwitch(widget.userDetails, isFetchingRequests, requests)
        ],
      )),
    );
  }
}

class getHomePage extends StatefulWidget {
  final userDetails, isFetching, data;
  const getHomePage(this.userDetails, this.isFetching, this.data, {Key? key}) : super(key: key);

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
                          widget.userDetails["details"][0]["LAB_NAME"],
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, fontSize: 24),
                        ),
                        (!widget.isFetching)?Text(
                          " - " + widget.data.length.toString() + " students",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ):CircularProgressIndicator()
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      widget.userDetails["details"][0]["LAB_ID"],
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

                          child: (!widget.isFetching)?ListView.builder(
                              itemCount: widget.data.length,
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
                                        getContainerForTable(width,widget.data[index].stu_id.toString(), 9, FontWeight.w300, 1),
                                        getContainerForTable(width,widget.data[index].stu_name.toString(), 12, FontWeight.w300, 1),
                                        getContainerForTable(width,widget.data[index].dept.toString(), 20, FontWeight.w300, 1),
                                        getContainerForTable(width,"Male", 7, FontWeight.w300, 1),
                                        getContainerForTable(width,widget.data[index].stu_email.toString(), 20, FontWeight.w300, 1),
                                      ],
                                    ),
                                  ),
                                );
                              }):Center(child: CircularProgressIndicator()),
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



class FacultyHomeMobile extends StatefulWidget {
  final data;
  const FacultyHomeMobile(this.data,{Key? key}) : super(key: key);

  @override
  State<FacultyHomeMobile> createState() => _FacultyHomeMobileState();
}

class _FacultyHomeMobileState extends State<FacultyHomeMobile> {
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
  List<String> dropdownItems = [
    "Student Database",
    "Faculties"
  ];

  String value = "Student Database";

  onChanged(e){
    setState(() {
      if(e == "Student Database")
        selected = 0;
      else
        selected = 1;
      value = e;
    });
  }
  int selected = 0;
  String lab_id = "0";
  String fac_id = "0";
  getCurrentUserLabId() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var val = pref.getString("user");
    var userDetails = jsonDecode(val.toString());
    setState(() {
      lab_id = userDetails["details"][0]["LAB_ID"];
      fac_id = userDetails["details"][0]["FACULTY_ID"];
    });
    // print(userDetails["details"][0]["LAB_ID"]);
  }

  @override
  void initState() {
    getCurrentUserLabId();
  }
  @override
  Widget build(BuildContext context) {
    var width = 40.toDouble();
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(flex:1,child: Container()),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getStyledTextForProfileCard("Lab Name"),
                        SizedBox(height: 20,),
                        getStyledTextForProfileCard("Lab Code"),
                        SizedBox(height: 20,),
                        getStyledTextForProfileCard("No Of Students"),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Text(":"),
                          SizedBox(height: 20,),
                          Text(":"),
                          SizedBox(height: 20,),
                          Text(":")
                        ],
                      )),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getStyledTextForProfileCard("Cloud"),
                        SizedBox(height: 20,),
                        getStyledTextForProfileCard("1"),
                        SizedBox(height: 20,),
                        getStyledTextForProfileCard("97"),
                      ],
                    ),
                  )

                ],
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 250,
                      child: CustomDropdownButton2(hint: "Choose Database", value: value, dropdownItems: dropdownItems, onChanged: onChanged)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: (selected == 0)?Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getContainerForTable(width, "S.No", 2, FontWeight.w500, 0.4),
                      getContainerForTable(width, "Name", 5, FontWeight.w500, 0.4),
                      getContainerForTable(width, "Department", 4, FontWeight.w500, 0.4),
                    ],
                  ),
                  for(int index=0;index<data.length;index++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: 50),
                        child: Container(
                          color: index%2==0?Colors.white: Colors.grey.shade100.withOpacity(0.5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getContainerForTable(width,(index+1).toString(), 2, FontWeight.w300, 0.4),
                              getContainerForTable(width,data[index]["Name"].toString(), 5, FontWeight.w300, 0.4),
                              getContainerForTable(width,data[index]["Department"].toString(), 4, FontWeight.w300, 0.4),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ):LabFaculty(lab_id, fac_id)
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient:  LinearGradient(
              colors: [Color(0xff2b18ff),Color(0xff7165ff),Color(0xffbbb5ff)]
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text("Switch Req",style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}


class LabFaculty extends StatefulWidget {
  final labid;
  final fac_id;
  const LabFaculty(this.labid,this.fac_id,{Key? key}) : super(key: key);

  @override
  State<LabFaculty> createState() => _LabFacultyState();
}

class _LabFacultyState extends State<LabFaculty> {
  List<FacultyOfLab> fac_of_lab= [];
  FacultyOfLab? inchargeDetails;
  getFaculties (String? inchargeId) async {
    var facultyObjects = await getLabFacultyDetails(widget.labid.toString());

    for(var fac in facultyObjects) {
      fac_of_lab.add(FacultyOfLab(fac["FACULTY_ID"], fac["FACULTY_NAME"], fac["FACULTY_EMAIL"], fac["CONTACT"], fac["LAB_ID"]));
      if(inchargeId == fac["FACULTY_ID"]) {
        inchargeDetails = fac_of_lab.last;
      }
    }
    setState(() {

    });
  }
  @override
  void initState() {
    getFaculties(widget.fac_id);
  }
  @override
  Widget build(BuildContext context) {
    // return Center(child:Text("Faculties"));
    return renderLabFaculties(new ScrollController(), fac_of_lab, Responsive.isMobile(context));
  }
}


