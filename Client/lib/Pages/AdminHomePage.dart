

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  var pageNo = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [getAdminHomePage(), AdminSpecialLabDatabase(), AdminSpecificLabView(), InchargeSwitch()];
    return Scaffold(
      body: Container(
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
                        height: 50,
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: Colors.white,

                        ),
                        child:  IconButton(
                            onPressed: (){
                              pageNo=0;
                              setState(() {

                              });
                            },
                            icon: Icon(Icons.home),
                            color:Color(0xff210368)
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 50,
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: Colors.white,

                        ),
                        child: IconButton(
                          onPressed: (){
                            pageNo=1;
                            setState(() {

                            });
                          },
                          icon: Icon(Icons.dashboard),
                            color:Color(0xff210368)
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 50,
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color:  Colors.white,

                        ),
                        child: IconButton(
                            onPressed: (){
                              pageNo=2;
                              setState(() {

                              });
                            },
                            icon: Icon(Icons.swap_horiz),
                            color:Color(0xff210368)
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 50,
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color:  Colors.white,

                        ),
                        child: IconButton(
                            onPressed: (){
                              pageNo=3;
                              setState(() {

                              });
                            },
                            icon: Icon(Icons.confirmation_num_rounded),
                            color:Color(0xff210368)
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
           screens[pageNo]
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
        padding: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: MediaQuery.of(context).size.width - 30,
            color: Color(0xfffdfeff),
            child: Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.only(right:10,bottom: 10,top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(child: Text("Portal",style: TextStyle(fontWeight: FontWeight.w900,decoration: TextDecoration.none,color: Colors.black,fontSize: 30),)),
                        CircleAvatar(),
                        SizedBox(width: 20,),
                        Padding(
                          padding: const EdgeInsets.only(right: 80),
                          child: Row(
                            children: [
                              Icon(Icons.logout),
                              Text("Logout",style: TextStyle(decoration: TextDecoration.none,fontSize: 15,color: Colors.black,),)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 40,),
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
                      Expanded(flex: 2,child: Container())
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
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //   children: [
                            //     Container(
                            //       width: 250,
                            //     ),
                            //     Container(
                            //       width: 250,
                            //     ),
                            //     Container(
                            //       width: 250,
                            //     ),Container(
                            //       width: 250,
                            //     ),
                            //     Container(
                            //       width: 250,
                            //     ),
                            //     Container(
                            //       width: 250,
                            //     ),
                            //     Container(
                            //       width: 250,
                            //     ),
                            //
                            //   ],
                            // )
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
          ),
        ),
      ),
    );
  }
}



