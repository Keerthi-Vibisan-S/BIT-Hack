

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Components.dart';
import '../../../Utilities/Util.dart';

class FacultySwitchMobile extends StatefulWidget {
  final joining_data,leaving_data;
  const FacultySwitchMobile(this.joining_data,this.leaving_data,{Key? key}) : super(key: key);

  @override
  State<FacultySwitchMobile> createState() => _FacultySwitchMobileState();
}

class _FacultySwitchMobileState extends State<FacultySwitchMobile> with TickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    _controller = new TabController(length: 2, vsync: this);
  }
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff370d57),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Lab Switch Request",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 250,
                  child: TabBar(
                    indicatorColor: Colors.deepPurple,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12),
                    controller: _controller,
                    tabs: [
                      Tab(
                        child: Text(
                          "Joining",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                      ),
                      Tab(child: Text(
                        "Leaving",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black),
                      ),)
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                  controller: _controller,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(flex:6,child: getStyledTextForProfileCard("Name")),
                              Expanded(flex:1,child:Container()),
                              Expanded(flex:3,child: getStyledTextForProfileCard("Approval")),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                            itemCount: widget.joining_data.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context,int index){
                              return GestureDetector(
                                onTap: (){
                                  showDialog(context: context, builder: (BuildContext context){
                                    return showStudentDetailsDialog(widget.joining_data[index]);
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: index%2==0?Colors.white: Colors.grey.shade100.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(flex:6, child: Text(widget.joining_data[index].stu.stu_name)),
                                        Expanded(flex:1,child:Container()),
                                        Expanded(
                                          flex:3,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ElevatedButton(onPressed: (){}, child: Icon(Icons.check),
                                                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                              ),
                                              ElevatedButton(onPressed: (){}, child: Icon(Icons.close),
                                                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }, separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 10,);
                          },),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(flex:6,child: getStyledTextForProfileCard("Name")),
                              Expanded(flex:1,child:Container()),
                              Expanded(flex:3,child: getStyledTextForProfileCard("Approval")),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                            itemCount: widget.leaving_data.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context,int index){
                              return GestureDetector(
                                onTap: (){
                                  showDialog(context: context, builder: (BuildContext context){
                                    return showStudentDetailsDialog(widget.leaving_data[index]);
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: index%2==0?Colors.white: Colors.grey.shade100.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(flex:6, child: Text(widget.leaving_data[index].stu.stu_name)),
                                        Expanded(flex:1,child:Container()),
                                        Expanded(
                                          flex:3,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ElevatedButton(onPressed: (){}, child: Icon(Icons.check),
                                                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                              ),
                                              ElevatedButton(onPressed: (){}, child: Icon(Icons.close),
                                                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }, separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 10,);
                          },),
                        )
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}