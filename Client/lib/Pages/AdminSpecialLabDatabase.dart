import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:special_lab_dashboard/APIHandler/apiHandler.dart';
import 'package:special_lab_dashboard/Pages/MobileView/Admin/AdminSpecialLabDatabase.dart';

import '../Utilities/Util.dart';
import '../responsive.dart';

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
  void initState() {
    getAllLabdata();
    super.initState();
  }

  var res;


  getAllLabdata() async{
      dynamic result = await getAllspclabs();
      setState(() {
        res = result;
      });
      print(res);
  }


  int pageNo = 1;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height/100;
    var width = size.width/100;
    return (Responsive.isMobile(context))?AdminSpecialLabDatabaseMobile():Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Portal",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, fontSize: 28),
                ),
                Row(
                  children: [
                    CircleAvatar(),
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
              ]
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 100, right: 100),
                    child: Container(
                      width: width * 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Special Lab Database",style: GoogleFonts.poppins(
                              fontSize: 20,fontWeight: FontWeight.bold
                          ),),
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
                  getSizedBox(50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.grey.shade100.withOpacity(0.6),
                          height: height * 7,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                getContainerForTable(width, "S.No", 6, FontWeight.w500, 1.2),
                                Flexible(child: getContainerForTable(width, "Special Lab", 22, FontWeight.w500, 1.2),),
                                getContainerForTable(width, "Lab ID", 9, FontWeight.w500, 1.2),
                                getContainerForTable(width, "Incharge", 9, FontWeight.w500, 1.2),
                                getContainerForTable(width, "Strength", 6, FontWeight.w500, 1.2),
                                getContainerForTable(width, " ", 4, FontWeight.w500, 1.2),
                                getContainerForTable(width, " ", 7.5, FontWeight.w500, 1.2),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          // width: width*100,
                          height: height*55,
                          // color: Colors.red,
                          child: ListView.builder(
                              itemCount: res.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: height * 7,
                                  color: index % 2 == 0 ? Colors.white70 : Colors.grey.shade100.withOpacity(0.6),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        getContainerForTable(width, (index+1).toString()+".", 6, FontWeight.w300, 1),
                                        getContainerForTable(width, res[index]['LAB_NAME'],22, FontWeight.w300, 1),
                                        getContainerForTable(width, res[index]['LAB_ID'].toString(), 9, FontWeight.w300, 1),
                                        getContainerForTable(width, res[index]['FACULTY_NAME'], 9,FontWeight.w300, 1),
                                        getContainerForTable(width, res[index]['LAB_STRENGTH'].toString(), 6, FontWeight.w300, 1),
                                        Container(
                                          width: width*4,
                                          child: Container(
                                            width: 100,
                                            height: 30.0,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    width: 1, color: Color(0xff5749f3)),
                                                borderRadius: BorderRadius.circular(7.5),
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
                                                  onTap:(){},
                                                  child: const Center(child: Text("View"))),
                                            ),
                                          ),
                                        ),
                                        getContainerForTable(width, " ", 7.5, FontWeight.w500, 1.2),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}


