import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:special_lab_dashboard/Components.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  var titles = ["Year", "Department", "Special Lab", "Lab Code", "Incharge", "Joined Date", "History of Change"];
  var values = ["3rd Year", "Infomation Tech", "Cloud Computing", "SLB-031", "Nataraj N", "29.08.22", "0"];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left:8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.dashboard,color: Colors.white,),
                    SizedBox(height: 20,),
                    Icon(Icons.swap_horiz,color: Colors.white,),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 40,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width: MediaQuery.of(context).size.width - 30,
                  color: Color(0xfffdfeff),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(child: Text("Portal",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 30),)),
                            CircleAvatar(),
                            SizedBox(width: 20,),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Row(
                                children: [
                                  Icon(Icons.logout),
                                  Text("Logout")
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 80,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Special Lab",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                      SizedBox(height: 20,),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Expanded(
                                          child: Container(
                                            // width: 650,
                                            height: 250,
                                            color: Colors.blueGrey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 60,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Special Lab Faculties",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                      Container(
                                        height: 130,
                                        child: Expanded(

                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: 5,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (BuildContext context,int index){
                                                return Padding(padding: EdgeInsets.all(10),
                                                  child: getFacultyCard(),
                                                );

                                              }),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(flex: 1, child: Container(),),
                            Expanded(
                                flex: 3,
                                child: renderStudentDetailsCard()
                            ),
                            Expanded(flex: 1, child: Container(),)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}