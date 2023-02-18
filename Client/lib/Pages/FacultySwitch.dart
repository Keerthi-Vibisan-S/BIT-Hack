import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';

class FacultySwitch extends StatefulWidget {
  const FacultySwitch({Key? key}) : super(key: key);

  @override
  State<FacultySwitch> createState() => _FacultySwitchState();
}

class _FacultySwitchState extends State<FacultySwitch> {
  bool press1 = false;
  bool press2 = true;

  List data = [
    {
      "S.No": 1,
      "Roll No": "202CT141",
      "Name": "VENKAT RAMAN S P",
      "Department": "COMPUTER TECHNOLOGY",
      "Year": "III",
      "History": 5,
      "From": "Cloud Lab"
    },
    {
      "S.No": 1,
      "Roll No": "202CT141",
      "Name": "VENKAT RAMAN S P",
      "Department": "COMPUTER TECHNOLOGY",
      "Year": "III",
      "History": 5,
      "From": "Cloud Lab"
    },
    {
      "S.No": 1,
      "Roll No": "202CT141",
      "Name": "VENKAT RAMAN S P",
      "Department": "COMPUTER TECHNOLOGY",
      "Year": "III",
      "History": 5,
      "From": "Cloud Lab"
    },
    {
      "S.No": 1,
      "Roll No": "202CT141",
      "Name": "VENKAT RAMAN S P",
      "Department": "COMPUTER TECHNOLOGY",
      "Year": "III",
      "History": 5,
      "From": "Cloud Lab"
    },
    {
      "S.No": 1,
      "Roll No": "202CT141",
      "Name": "VENKAT RAMAN S P",
      "Department": "COMPUTER TECHNOLOGY",
      "Year": "III",
      "History": 5,
      "From": "Cloud Lab"
    },
  ];
  int selec = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height / 100;
    var width = size.width / 100;

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
          Expanded(
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
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Portal",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 28),
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
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24),
                                ),
                                Text(
                                  " - 148 Students",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
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
                              width: width * 100,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
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
                                                icon: const Icon(
                                                    Icons.search_rounded)),
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
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: height * 5,
                            width: width * 16,
                            child: Container(
                              child: TabBar(
                                indicatorColor: Colors.deepPurple,
                                indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black12),
                                tabs: [
                                  Tab(
                                    child: Text(
                                      "Joining",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      "Leaving",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: width * 100,
                            height: height * 50,
                            child: TabBarView(
                              children: [table(data, "From"), table(data, "To")],
                            ),
                          ),
                        ],
                      ),
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

  Widget table(List data, String where) {
    var size = MediaQuery.of(context).size;
    var height = size.height / 100;
    var width = size.width / 100;

    return Container(
      width: width * 100,
      height: height * 54,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: Colors.black12,
            height: height * 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 3,
                    alignment: Alignment.center,
                    child: Text(
                      "S.No",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: width * 1.2),
                    ),
                  ),
                  Container(
                    width: width * 9,
                    alignment: Alignment.center,
                    child: Text(
                      "Roll No",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: width * 1.2),
                    ),
                  ),
                  Container(
                    width: width * 12,
                    alignment: Alignment.center,
                    child: Text(
                      "Name",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: width * 1.2),
                    ),
                  ),
                  Container(
                    width: width * 22,
                    alignment: Alignment.center,
                    child: Text(
                      "Department",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: width * 1.2),
                    ),
                  ),
                  Container(
                    width: width * 3,
                    alignment: Alignment.center,
                    child: Text(
                      "Year",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: width * 1.2),
                    ),
                  ),
                  Container(
                    width: width * 4.5,
                    alignment: Alignment.center,
                    child: Text(
                      "History",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: width * 1.2),
                    ),
                  ),
                  Container(
                    width: width * 6,
                    alignment: Alignment.center,
                    child: Text(
                      where,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: width * 1.2),
                    ),
                  ),
                  Container(
                    width: width * 15,
                    alignment: Alignment.center,
                    child: Text(
                      "Approval",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: width * 1.2),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: height*45,
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: height * 7,
                    color: index % 2 == 0 ? Colors.white70 : Colors.black12,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: width * 3,
                            alignment: Alignment.center,
                            // color: Colors.orange,
                            child: Text(
                              data[index]['S.No'].toString(),
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: width * 1),
                            ),
                          ),
                          Container(
                            width: width * 9,
                            alignment: Alignment.center,
                            // color: Colors.orange,
                            child: Text(
                              data[index]['Roll No'],
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: width * 1),
                            ),
                          ),
                          Container(
                            // color: Colors.orange,
                            width: width * 12,
                            alignment: Alignment.center,
                            child: Text(
                              data[index]['Name'],
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: width * 1),
                            ),
                          ),
                          Container(
                            // color: Colors.orange,
                            width: width * 22,
                            alignment: Alignment.center,
                            child: Text(
                              data[index]['Department'],
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: width * 1),
                            ),
                          ),
                          Container(
                            width: width * 3,
                            alignment: Alignment.center,
                            // color: Colors.orange,
                            child: Text(
                              data[index]['Year'],
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: width * 1),
                            ),
                          ),
                          Container(
                            width: width * 4.5,
                            alignment: Alignment.center,
                            // color: Colors.orange,
                            child: Text(
                              data[index]['History'].toString(),
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: width * 1),
                            ),
                          ),
                          Container(
                            width: width * 6,
                            alignment: Alignment.center,
                            // color: Colors.orange,
                            child: Text(
                              data[index]['From'],
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: width * 1),
                            ),
                          ),
                          Container(
                            width: width * 15,
                            alignment: Alignment.centerRight,
                            // color: Colors.orange,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                ),
                                Container(
                                  width: 60,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.1, color: Color(0xffFF0000)),
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                        colors: <Color>[
                                          Color(0xff001AFF),
                                          Colors.white24
                                        ],
                                      ),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(0.0, 1.5),
                                          blurRadius: 1.5,
                                        ),
                                      ]),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                        onTap: () {},
                                        child: const Center(
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          ),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 60,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.1, color: Color(0xffFF0000)),
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                        colors: <Color>[
                                          Color(0xffFF0000),
                                          Colors.white24
                                        ],
                                      ),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(0.0, 1.5),
                                          blurRadius: 1.5,
                                        ),
                                      ]),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                        onTap: () {},
                                        child: const Center(
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          ),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}