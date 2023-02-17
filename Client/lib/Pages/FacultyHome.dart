import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FacultyHome extends StatefulWidget {
  const FacultyHome({Key? key}) : super(key: key);

  @override
  State<FacultyHome> createState() => _FacultyHomeState();
}

class _FacultyHomeState extends State<FacultyHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.deepPurple,
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
                    Container(child: Icon(Icons.dashboard)),
                    SizedBox(height: 20,),
                    Icon(Icons.swap_horiz),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 40,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: MediaQuery.of(context).size.width - 30,
                  color: Color(0xffebebeb),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(80.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Portal", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Cloud Computing", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),),
                                      Text(" - 148 Students", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text("SLB-031", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Student Database", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                                      ),

                                      Container(
                                        width: 200,
                                        child: TextField(

                                          onChanged: (s){

                                          },
                                          decoration:InputDecoration(
                                              suffixIcon:IconButton(
                                                  onPressed: (){

                                                  } , icon: Icon(Icons.search_rounded)
                                              ) ,
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(40)
                                              )
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(80.0),
                            child: Row(
                              children: [
                                CircleAvatar(),
                                SizedBox(width: 24,),
                                Icon(Icons.logout),
                                Text("Logout")
                              ],
                            ),
                          )
                        ],
                      )
                    ],
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


