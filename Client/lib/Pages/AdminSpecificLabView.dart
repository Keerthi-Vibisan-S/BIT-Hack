import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminSpecificLabView extends StatefulWidget {
  const AdminSpecificLabView({Key? key}) : super(key: key);

  @override
  State<AdminSpecificLabView> createState() => _AdminSpecificLabViewState();
}

class _AdminSpecificLabViewState extends State<AdminSpecificLabView> {
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
      "S.No": 2,
      "Roll No": "202CT141",
      "Name": "VENKAT RAMAN S P",
      "Department": "COMPUTER TECHNOLOGY",
      "Gender": "Male",
      "Mail ID": "venkatraman.ct20@bitsathy.ac.in"
    },
    {
      "S.No": 3,
      "Roll No": "202CT141",
      "Name": "VENKAT RAMAN S P",
      "Department": "COMPUTER SCIENCE AND BUSSINESS SYSTEMS",
      "Gender": "Male",
      "Mail ID": "venkatraman.ct20@bitsathy.ac.in"
    },
    {
      "S.No": 4,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            color: Colors.white,
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: height*7,
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
    );
  }
}
