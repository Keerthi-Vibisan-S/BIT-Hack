import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminSpecialLabDatabase extends StatefulWidget {
  const AdminSpecialLabDatabase({Key? key}) : super(key: key);

  @override
  State<AdminSpecialLabDatabase> createState() => _AdminSpecialLabDatabaseState();
}

class _AdminSpecialLabDatabaseState extends State<AdminSpecialLabDatabase> {

  List data = [
    {
      "S.No": 1,
      "Spl_lab": "Cloud Computing",
      "Lab_id": "SLB031",
      "Incharge": "Nataraj N",
      "Strength": "137",
    },
    {
      "S.No": 2,
      "Spl_lab": "Mobile and Web",
      "Lab_id": "SLB032",
      "Incharge": "Sundaram",
      "Strength": "230",
    },
    {
      "S.No": 3,
      "Spl_lab": "Hackathon",
      "Lab_id": "SLB034",
      "Incharge": "Nithya",
      "Strength": "98",
    },
    {
      "S.No": 4,
      "Spl_lab": "AR VR",
      "Lab_id": "SLB037",
      "Incharge": "Poornima",
      "Strength": "57",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height/100;
    var width = size.width/100;
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
                              Expanded(child: Text("Portal",style: TextStyle(fontWeight: FontWeight.w900,decoration: TextDecoration.none,color: Colors.black,fontSize: 35),)),
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
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Container(
                            width: 1200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Special Lab Database",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
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
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right:100),
                          child: Container(
                            color: Colors.black12,
                            height: height*5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 50,
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
                                    height: 50,
                                    width: width*9,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Special Lab",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: width*1.2),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: width*12,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Lab ID",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: width*1.2),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: width*22,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Incharge",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: width*1.2),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: width*6,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Strength",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: width*1.2),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: width*20,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: width*1.2),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right:100),
                          child: Container(
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
                                              data[index]['Spl_lab'],
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
                                              data[index]['Lab_id'],
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
                                              data[index]['Incharge'],
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
                                              data[index]['Strength'],
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize:  width*1),
                                            ),
                                          ),
                                          Container(

                                            width: width*20,
                                            alignment: Alignment.center,
                                            // color: Colors.orange,
                                            child: Container(
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    border: Border.all(),

                                                    borderRadius: BorderRadius.circular(5)
                                                ),
                                                child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text("View")))
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
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
