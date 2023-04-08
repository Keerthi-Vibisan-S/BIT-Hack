import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:special_lab_dashboard/APIHandler/apiHandler.dart';
import 'package:special_lab_dashboard/Components.dart';
import 'package:special_lab_dashboard/Models/RequestModel.dart';
import 'package:special_lab_dashboard/Pages/MobileView/Admin/AdminLabSwitch.dart';
import 'package:special_lab_dashboard/responsive.dart';

import '../../../Utilities/Util.dart';

class InchargeSwitch extends StatefulWidget {
  const InchargeSwitch({Key? key}) : super(key: key);

  @override
  State<InchargeSwitch> createState() => _InchargeSwitchState();
}

class _InchargeSwitchState extends State<InchargeSwitch> {
  bool press1 = false;
  bool press2 = true;

  List<RequestModel> requests = [];
  bool _fetching = true;

  List data2 = [
    {"from": "Hackathon", "to": "Blockchain Technology"},
    {"from": "Hackathon", "to": "Blockchain Technology"},
    {"from": "Hackathon", "to": "Blockchain Technology"},
    {"from": "Hackathon", "to": "Blockchain Technology"}
  ];



  getData() async{
    await getAdminRequests().then((value){
      setState(() {
        _fetching = false;
        requests = value;
      });
    });
  }


  refresh(){
    initState();
  }

  @override
  void initState() {
    getData();
  }

  int selec = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height / 100;
    var width = size.width / 100;
    int pageNo = 2;
    return (Responsive.isMobile(context))?AdminLabSwitch():Column(
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
                        showDialog(context: context, builder: (BuildContext context){
                          return showLogoutDialog(true);
                        });
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
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Student Database",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
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
                  getSizedBox(50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: (_fetching)?Center(child: CircularProgressIndicator(),):table(requests),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget table(List<RequestModel> data) {
    var size = MediaQuery.of(context).size;
    var height = size.height / 100;
    var width = size.width / 100;

    return Column(
      children: [
        Container(
          color: Colors.grey.shade100.withOpacity(0.6),
          height: height * 7,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getContainerForTable(width, "S.No", 3, FontWeight.w500, 1.2),
                getContainerForTable(width, "Roll No", 4, FontWeight.w500, 1.2),
                getContainerForTable(width, "Name", 8, FontWeight.w500, 1.2),
                getContainerForTable(width, "Department", 10, FontWeight.w500, 1.2),
                getContainerForTable(width, "Year", 3, FontWeight.w500, 1.2),
                getContainerForTable(width, "From", 10.5, FontWeight.w500, 1.2),
                getContainerForTable(width, "To", 10.5, FontWeight.w500, 1.2),
                getContainerForTable(width, "History", 7.5, FontWeight.w500, 1.2),
                getContainerForTable(width, "Approval", 12, FontWeight.w500, 1.2),
              ],
            ),
          ),
        ),
        Container(
          // width: width*100,
          height: height*55,
          // color: Colors.red,
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: height * 7,
                  color: index % 2 == 0 ? Colors.white70 : Colors.grey.shade100.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getContainerForTable(width,(index+1).toString(), 3, FontWeight.w300, 1),
                        getContainerForTable(width,requests[index].stu?.stu_id ?? " ", 4, FontWeight.w300, 1),
                        getContainerForTable(width,requests[index].stu?.stu_name ?? " ", 8, FontWeight.w300, 1),
                        getContainerForTable(width,requests[index].stu?.dept ?? " ", 10, FontWeight.w300, 1),
                        getContainerForTable(width,requests[index].stu?.year ?? " ", 3, FontWeight.w300, 1),
                        getContainerForTable(width,requests[index].from_lab_name.toString(), 10.5, FontWeight.w300, 1),
                        getContainerForTable(width,requests[index].to_lab_name.toString(), 10.5, FontWeight.w300, 1),
                        Container(
                          width: width*7.5,
                          child: Row(
                            children: [
                              Text(
                                "<>".toString(),
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w300,
                                    fontSize: width*1 -1.8
                                ),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Container(
                                width: 60,
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
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Padding(
                                                padding: const EdgeInsets.only(top: 32.0, left: 32.0, right: 32.0),
                                                child: Row(
                                                  children: [
                                                    // Text(
                                                    //     '${data[index]["Name"]} ',
                                                    //     style: GoogleFonts.poppins(
                                                    //     fontWeight: FontWeight.bold,
                                                    //   )
                                                    // ),
                                                    // Text('\u2022  ${data[index]["Roll No"]}  \u2022  ${convert[data[index]['Department']]} \u2022 ${data[index]['Year']}',
                                                    //     style: GoogleFonts.poppins(
                                                    //       fontWeight: FontWeight.normal,
                                                    //       color: Colors.black54,
                                                    //       fontSize: 17.5
                                                    //     )
                                                    // )
                                                  ],
                                                ),
                                              ),
                                              content: Padding(
                                                padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      "History",
                                                        style: GoogleFonts.poppins(
                                                          fontWeight: FontWeight.w700,
                                                          fontSize: 17.5,
                                                        )
                                                    ),
                                                    getSizedBox(10),
                                                    Container(
                                                      height: 200,
                                                      width: 500,
                                                      child: ListView.builder(
                                                          itemCount:
                                                          data2.length,
                                                          itemBuilder:
                                                              (BuildContext context, int index) {
                                                            return Padding(
                                                              padding:
                                                              const EdgeInsets.only( bottom: 18.0, top: 18.0),
                                                              child:
                                                                Row(
                                                                  children: [
                                                                    Flexible(
                                                                      flex:1,
                                                                      child: Text((index + 1).toString()+".", style: GoogleFonts.poppins(
                                                                        fontWeight: FontWeight.bold
                                                                      ),),
                                                                    ),
                                                                    Flexible(flex:2, child: Container()),
                                                                    Flexible(
                                                                      child: Text("Industrial Web And App Development",
                                                                          softWrap:true,
                                                                          style: GoogleFonts.poppins(
                                                                            fontWeight: FontWeight.bold,
                                                                          )
                                                                      ),
                                                                      flex: 5,
                                                                    ),
                                                                    Flexible(child: Container()),
                                                                    Flexible(
                                                                        flex: 2,
                                                                        child: Icon(Icons.arrow_forward_rounded)),
                                                                    Flexible(flex:2, child: Container()),
                                                                    Flexible(
                                                                      flex:5,
                                                                      child: Text(data2[index]['to'], style: GoogleFonts.poppins(
                                                                fontWeight: FontWeight.bold
                                                                )),
                                                                    )
                                                                  ]
                                                                )
                                                            );
                                                          }),
                                                    ),
                                                    SizedBox(height: 20,),
                                                    Text(
                                                      "Request",
                                                        style: GoogleFonts.poppins(
                                                          fontWeight: FontWeight.w700,
                                                          fontSize: 17.5,
                                                        )
                                                    ),
                                                    SizedBox(height: 20,),
                                                    Container(
                                                      width: 400,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Flexible(
                                                            flex:1,
                                                            child: Text((data2.length + 1).toString()+".", style: GoogleFonts.poppins(
                                                                fontWeight: FontWeight.bold
                                                            ),),
                                                          ),
                                                          Flexible(flex:2, child: Container()),
                                                          Flexible(
                                                            child: Text(data2[index]['to'],
                                                                softWrap:true,
                                                                style: GoogleFonts.poppins(
                                                                  fontWeight: FontWeight.bold,
                                                                )
                                                            ),
                                                            flex: 5,
                                                          ),
                                                          Flexible(child: Container()),
                                                          Flexible(
                                                              flex: 2,
                                                              child: Icon(Icons.arrow_forward_rounded)),
                                                          Flexible(flex:2, child: Container()),
                                                          Flexible(
                                                            flex:5,
                                                            child: Text(data2[index]['from'], style: GoogleFonts.poppins(
                                                                fontWeight: FontWeight.bold
                                                            )),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              actions: [
                                                Padding(
                                                  padding: const EdgeInsets.only(bottom: 32.0, left: 32.0),
                                                  child: Container(
                                                    width: 90,
                                                    height: 40,
                                                    child: Material(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: Colors.red,
                                                      child: InkWell(
                                                          onTap: () async {

                                                          },
                                                          child: Center(
                                                            child:  Text(
                                                              'Decline',
                                                              style: GoogleFonts.poppins(
                                                                  color: Colors.white
                                                              ),
                                                            ),
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(bottom: 32.0, left: 16.0, right: 48.0),
                                                  child: Container(
                                                    width: 90,
                                                    height: 40,
                                                    child: Material(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: Color(0xff5749f3),
                                                      child: InkWell(
                                                          onTap: () async {

                                                          },
                                                          child: Center(
                                                            child:  Text('Accept',
                                                              style: GoogleFonts.poppins(
                                                                  color: Colors.white
                                                              ),
                                                            ),
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Center(child: Text("View",))),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: width * 12,
                          alignment: Alignment.centerRight,
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
                                      onTap: () async{
                                        await adminDecision(requests[index].r_id.toString(), requests[index].stu?.stu_id,requests[index].to_lab_fac_id,"CANCEL").then((v){
                                          refresh();
                                        });
                                      },
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
                                      onTap: () async {
                                        await adminDecision(requests[index].r_id.toString(), requests[index].stu?.stu_id, requests[index].to_lab_fac_id,"OK").then((v){
                                          refresh();
                                        });
                                      },
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
    );
  }
}