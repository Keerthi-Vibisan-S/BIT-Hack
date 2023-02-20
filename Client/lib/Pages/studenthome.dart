import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:special_lab_dashboard/Components.dart';
import 'package:special_lab_dashboard/Pages/LabSwitch.dart';

class StudentHome extends StatefulWidget {
  final dynamic userdetails;
  const StudentHome(this.userdetails,{Key? key, }) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {

  ScrollController sc = new ScrollController();

  void _scrollRight()
  {
    // if(sc.hasClients)
      sc.animateTo(sc.offset+350, duration: Duration(milliseconds: 500), curve: Curves.linear);
  }

  void _scrollLeft()
  {
    // if(sc.hasClients)
    sc.animateTo(sc.offset-350, duration: Duration(milliseconds: 500), curve: Curves.linear);
  }

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
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LabSwitchPage()));
                      },
                        child: Icon(Icons.swap_horiz,color: Colors.white,)
                    ),
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
                        SizedBox(height: 50,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex:7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Text("Special Lab - Cloud Computing",style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.none,color: Colors.black,fontSize: 20),),
                                      SizedBox(height: 20,),
                                      // CircleAvatar(
                                      //   radius: 150,
                                      //   child: Image.asset(),
                                      // ),
                                      ClipRRect(

                                        borderRadius: BorderRadius.circular(20), // Image border
                                        child: SizedBox.fromSize(

                                          size: Size.fromRadius(190), // Image radius
                                          child: Image.network('assets/cloudcomputing.jpg',fit: BoxFit.cover),
                                        ),
                                      )
                                      // ClipRRect(
                                      //   borderRadius: BorderRadius.circular(10),
                                      //   child: ,height:350
                                      //   ,fit: BoxFit.cover,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  SizedBox(
                                    height:45
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Special Lab Faculties",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,decoration: TextDecoration.none,color: Colors.black,),),
                                      SizedBox(
                                        width: 900,
                                        child: Row(
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.arrow_left),
                                              onPressed: _scrollLeft,
                                            ),
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
                                                        return Padding(padding: EdgeInsets.all(10),
                                                          child: getFacultyCard(),
                                                        );

                                                      }),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                                icon: Icon(Icons.arrow_right),
                                                onPressed: _scrollRight
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex:1,
                              child:Container()
                            ),
                            Expanded(
                              flex:4,
                              child:renderStudentDetailsCard(widget.userdetails),
                            ),
                            Expanded(
                              flex:2,
                              child:Container()
                            )
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