import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:special_lab_dashboard/Components.dart';

class StudentHome extends StatefulWidget {
  final dynamic userdetails;
  const StudentHome(this.userdetails,{Key? key, }) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff210368),
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
                    Container(
                      width: 30,
                      color: Colors.white,
                      child: Icon(Icons.dashboard,color: Color(0xff210368),)
                    ),
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
                            Expanded(child: Text("Portal",style: TextStyle(fontWeight: FontWeight.w900,decoration: TextDecoration.none,color: Colors.black,fontSize: 30),)),
                            CircleAvatar(),
                            SizedBox(width: 20,),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Row(
                                children: [
                                  Icon(Icons.logout),
                                  Text("Logout",style: TextStyle(decoration: TextDecoration.none,fontSize: 15,color: Colors.black,),)
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
                                      Text("Special Lab - Cloud Computing",style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.none,color: Colors.black,fontSize: 20),),
                                      SizedBox(height: 20,),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset('assets/cloudcomputing.jpg',height: 300,),

                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 60,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Special Lab Faculties",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,decoration: TextDecoration.none,color: Colors.black,),),
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
                                child: renderStudentDetailsCard(widget.userdetails)
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

  @override
  void initState() {
    print(widget.userdetails);
  }
}