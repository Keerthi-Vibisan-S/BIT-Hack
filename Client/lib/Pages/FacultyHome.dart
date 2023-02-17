import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FacultyHome extends StatefulWidget {
  const FacultyHome({Key? key}) : super(key: key);

  @override
  State<FacultyHome> createState() => _FacultyHomeState();
}

class _FacultyHomeState extends State<FacultyHome> {
  bool press1 = false;
  bool press2 = true;

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
      "Department": "COMPUTER SCIENCE AND BUSSINESS SYSTEM",
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
                            width: 1200,
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
                          height: 40,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "S.No",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                SizedBox(width: 50,),
                                Text(
                                  "Roll No",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                SizedBox(width: 150,),
                                Text(
                                  "Name",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                SizedBox(width: 220,),
                                Text(
                                  "Department",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                SizedBox(width: 130,),
                                Text(
                                  "Gender",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                SizedBox(width: 130,),
                                Text(
                                  "Mail ID",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 1200,
                          height: 420,
                          color: Colors.white,
                          child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 40,
                              color: index%2==0?Colors.white70:Colors.black12,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      alignment: Alignment.center,
                                      // color: Colors.orange,
                                      child: Text(
                                        data[index]['S.No'].toString(),
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      alignment: Alignment.center,
                                      // color: Colors.orange,
                                      child: Text(
                                        data[index]['Roll No'],
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Container(
                                      // color: Colors.orange,
                                      width: 270,
                                      alignment: Alignment.center,
                                      child: Text(
                                        data[index]['Name'],
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Container(
                                      // color: Colors.orange,
                                      width: 300,
                                      alignment: Alignment.center,
                                      child: Text(
                                        data[index]['Department'],
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      alignment: Alignment.center,
                                      // color: Colors.orange,
                                      child: Text(
                                        data[index]['Gender'],
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Container(
                                      width: 280,
                                      alignment: Alignment.center,
                                      // color: Colors.orange,
                                      child: Text(
                                        data[index]['Mail ID'],
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
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
          )
        ],
      ),
    );
  }
}
