import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../APIHandler/apiHandler.dart';
import '../Utilities/Util.dart';
// import 'package:google_fonts/google_fonts.dart';

class FacultySwitch extends StatefulWidget {
  const FacultySwitch({Key? key}) : super(key: key);

  @override
  State<FacultySwitch> createState() => _FacultySwitchState();
}

class _FacultySwitchState extends State<FacultySwitch> {
  bool press1 = false;
  bool press2 = true;

  List<dynamic> data = [
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

  void getData() async{
    await getRequests().then((v){
      setState(() {
        data = v;
      });
    });
  }

  @override
  void initState() {
      getData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height / 100;
    var width = size.width / 100;

    return Expanded(
      flex: 40,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            // color: Colors.orange,
            width: MediaQuery.of(context).size.width - 30,
            color: Colors.white,
            child: Padding(
              padding:
              const EdgeInsets.only(left: 100, top: 30, right: 100),
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
                    getSizedBox(3),
                    Container(
                      width: width * 100,
                      height: height * 53,
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
    );
  }

  Widget table(List data, String where) {
    var size = MediaQuery.of(context).size;
    var height = size.height / 100;
    var width = size.width / 100;

    return Container(
      width: width * 100,
      height: height * 60,
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
                  getContainerForTable(width, "S.No", 6, FontWeight.w500, 1.2),
                  getContainerForTable(width, "Roll No", 8, FontWeight.w500, 1.2),
                  getContainerForTable(width, "Name", 11, FontWeight.w500, 1.2),
                  getContainerForTable(width, "Department", 17, FontWeight.w500, 1.2),
                  getContainerForTable(width, "Year", 7, FontWeight.w500, 1.2),
                  getContainerForTable(width, "History", 4.5, FontWeight.w500, 1.2),
                  getContainerForTable(width, where, 6, FontWeight.w500, 1.2),
                  getContainerForTable(width, "Approval", 15, FontWeight.w500, 1.2),
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
                    color: index%2==0?Colors.white:Colors.grey.shade100.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getContainerForTable(width,(index+1).toString(), 6, FontWeight.w300, 1),
                          getContainerForTable(width,data[index]['STU_ID'].toString(), 8, FontWeight.w300, 1),
                          getContainerForTable(width,"NAME".toString(), 11, FontWeight.w300, 1),
                          getContainerForTable(width,"DEPARTMENT".toString(), 17, FontWeight.w300, 1),
                          getContainerForTable(width,"YEAR".toString(), 7, FontWeight.w300, 1),
                          getContainerForTable(width,"COUNT".toString(), 4.5, FontWeight.w300, 1),
                          getContainerForTable(width,"FROM", 6, FontWeight.w300, 1),
                          Container(
                            width: width * 15,
                            alignment: Alignment.centerLeft,
                            // color: Colors.orange,
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 25.0,
                                  child: Material(
                                      borderRadius: BorderRadius.circular(5),
                                    color: Colors.red,
                                    child: InkWell(
                                        onTap: () {},
                                        child: const Center(
                                          child: Icon(
                                            Icons.close,
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
                                  child: Material(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xff5749f3),
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