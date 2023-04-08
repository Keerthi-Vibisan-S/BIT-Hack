
import 'dart:convert';

import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../APIHandler/apiHandler.dart';
import '../../../Components.dart';
import '../../../Models/FacultyModel.dart';
import '../../../Models/StudentModel.dart';
import '../../../Utilities/Colors.dart';
import '../../../Utilities/Util.dart';
import '../../../responsive.dart';
import '../../WebView/Faculty/FacultySwitch.dart';

class FacultyHomeMobile extends StatefulWidget {
  final List<StudentModel> data;
  final switch_req;
  final userDetails;
  final isFetching;
  final refresh;

  const FacultyHomeMobile(this.data,this.userDetails,this.switch_req,this.isFetching,this.refresh,{Key? key}) : super(key: key);

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
    print("In mobile view");
    print(widget.data.toString());
    getCurrentUserLabId();
  }
  @override
  Widget build(BuildContext context) {
    var width = 40.toDouble();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY,
        leading: Container(),
        actions: [
          IconButton(icon:Icon(Icons.logout),onPressed: (){
            showDialog(context: context, builder: (BuildContext context){
              return showLogoutDialog(false);
            });
          },),
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
                        getStyledTextForProfileCard(widget.userDetails["details"][0]["LAB_NAME"]),
                        SizedBox(height: 20,),
                        getStyledTextForProfileCard(widget.userDetails["details"][0]["LAB_ID"]),
                        SizedBox(height: 20,),
                        getStyledTextForProfileCard(widget.data.length.toString()),
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
                      child: CustomDropdownButton2(
                          buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: null
                          ),
                          hint: "Choose Database",
                          value: value,
                          dropdownItems: dropdownItems,
                          onChanged: onChanged)
                  ),
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
                        Expanded(flex:1,child: customizedTextStyle("S.No", 14, FontWeight.w400),),
                        Expanded(flex:4,child: customizedTextStyle("Name", 14, FontWeight.w400),),
                        Expanded(flex:5,child: customizedTextStyle("Department", 14, FontWeight.w400),),
                      ],
                    ),
                    for(int index=0;index<widget.data.length;index++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: 50),
                          child: Container(
                            color: index%2==0?Colors.white: Colors.grey.shade100.withOpacity(0.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(flex:1,child: customizedTextStyle((index+1).toString(), 14, FontWeight.w300),),
                                Expanded(flex:4,child: customizedTextStyle(widget.data[index].stu_name.toString(), 14, FontWeight.w300),),
                                Expanded(flex:5,child: customizedTextStyle(widget.data[index].dept.toString(), 14, FontWeight.w300)),
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
      floatingActionButton: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Material(child: FacultySwitch(widget.userDetails, widget.isFetching, widget.switch_req,widget.refresh))));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient:  LinearGradient(
                  colors: [Color(0xff6a2f96),Color(0xff77449e),Color(0xffbbb5ff)]
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Switch Req",style: TextStyle(color: Colors.white),),
          ),
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

