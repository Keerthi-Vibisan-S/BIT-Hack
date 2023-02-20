import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:special_lab_dashboard/Pages/FacultySwitch.dart';

class FacultyHome extends StatefulWidget {
  const FacultyHome({Key? key}) : super(key: key);

  @override
  State<FacultyHome> createState() => _FacultyHomeState();
}

class _FacultyHomeState extends State<FacultyHome> {
  bool press1 = false;
  bool press2 = true;



  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [getHomePage(),FacultySwitch()];
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff200061), Color(0xff3800AA)],
        ),
      ),
      child: Row(
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
              const SizedBox(
                height: 20,
              ),
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
      ),
    );
  }
}



class getHomePage extends StatefulWidget {
  const getHomePage({Key? key}) : super(key: key);

  @override
  State<getHomePage> createState() => _getHomePageState();
}

class _getHomePageState extends State<getHomePage> {
  List data = [
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
            // color: Colors.orange,
            width: MediaQuery.of(context).size.width - 30,
            color: const Color(0xffebebeb),
            child: Padding(
              padding:
              const EdgeInsets.only(left: 100, top: 70, right: 100),
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
                            elevation: 15,
                            borderRadius: BorderRadius.circular(40),
                            child: Container(
                              width: 210,
                              child: TextField(
                                onChanged: (s) {},
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.search_rounded)),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(40))),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    color: Colors.black12,
                    height: height*5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: width*3,
                            alignment: Alignment.center,
                            child: Text(
                              "S.No",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width*1.2),
                            ),
                          ),
                          Container(
                            width: width*9,
                            alignment: Alignment.center,
                            child: Text(
                              "Roll No",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width*1.2),
                            ),
                          ),
                          Container(
                            width: width*12,
                            alignment: Alignment.center,
                            child: Text(
                              "Name",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width*1.2),
                            ),
                          ),
                          Container(
                            width: width*22,
                            alignment: Alignment.center,
                            child: Text(
                              "Department",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width*1.2),
                            ),
                          ),
                          Container(
                            width: width*5,
                            alignment: Alignment.center,
                            child: Text(
                              "Gender",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width*1.2),
                            ),
                          ),
                          Container(
                            width: width*20,
                            alignment: Alignment.center,
                            child: Text(
                              "Mail ID",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width*1.2),
                            ),
                          ),
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
                            height: height*4.5,
                            color: index%2==0?Colors.white70:Colors.black12,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: width*3,
                                    alignment: Alignment.center,
                                    // color: Colors.orange,
                                    child: Text(
                                      data[index]['S.No'].toString(),
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize:  width*1),
                                    ),
                                  ),
                                  Container(
                                    width: width*9,
                                    alignment: Alignment.center,
                                    // color: Colors.orange,
                                    child: Text(
                                      data[index]['Roll No'],
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize:  width*1),
                                    ),
                                  ),
                                  Container(
                                    // color: Colors.orange,
                                    width: width*12,
                                    alignment: Alignment.center,
                                    child: Text(
                                      data[index]['Name'],
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize:  width*1),
                                    ),
                                  ),
                                  Container(
                                    // color: Colors.orange,
                                    width: width*22,
                                    alignment: Alignment.center,
                                    child: Text(
                                      data[index]['Department'],
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize:  width*1),
                                    ),
                                  ),
                                  Container(
                                    width: width*5,
                                    alignment: Alignment.center,
                                    // color: Colors.orange,
                                    child: Text(
                                      data[index]['Gender'],
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize:  width*1),
                                    ),
                                  ),
                                  Container(
                                    width: width*20,
                                    alignment: Alignment.center,
                                    // color: Colors.orange,
                                    child: Text(
                                      data[index]['Mail ID'],
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize:  width*1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
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
