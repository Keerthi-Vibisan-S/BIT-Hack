import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:special_lab_dashboard/Models/RequestModel.dart';

import '../Utilities/Util.dart';
// import 'package:google_fonts/google_fonts.dart';

class FacultySwitch extends StatefulWidget {
  final userDetails, isFetching, data;
  const FacultySwitch(this.userDetails, this.isFetching, this.data, {Key? key}) : super(key: key);

  @override
  State<FacultySwitch> createState() => _FacultySwitchState();
}

class _FacultySwitchState extends State<FacultySwitch> {
  bool press1 = false;
  bool press2 = true;

  int selec = 0;

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
                            widget.userDetails["details"][0]["LAB_NAME"],
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500, fontSize: 24),
                          ),
                          (!widget.isFetching)?Text(
                            " - " + widget.data.length.toString() + " students",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ):CircularProgressIndicator()
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        widget.userDetails["details"][0]["LAB_ID"],
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
                        children: [table(widget.data["joining"], "From"), table(widget.data["leaving"], "To")],
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

  Widget table(List<RequestModel> data, String where) {
    var size = MediaQuery.of(context).size;
    var height = size.height / 100;
    var width = size.width / 100;

    return (data.length!=0)?Container(
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
                  getContainerForTable(width, "Department", 12, FontWeight.w500, 1.2),
                  getContainerForTable(width, "Year", 7, FontWeight.w500, 1.2),
                  getContainerForTable(width, "History", 4.5, FontWeight.w500, 1.2),
                  getContainerForTable(width, where, 6, FontWeight.w500, 1.2),
                  getContainerForTable(width, "Reason", 5, FontWeight.w500, 1.2),
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
                          getContainerForTable(width,data[index].stu!.stu_id.toString(), 8, FontWeight.w300, 1),
                          getContainerForTable(width,data[index].stu!.stu_name, 11, FontWeight.w300, 1),
                          getContainerForTable(width,data[index].stu!.dept, 12, FontWeight.w300, 1),
                          getContainerForTable(width,data[index].stu!.year, 7, FontWeight.w300, 1),
                          getContainerForTable(width,data[index].stu!.count, 4.5, FontWeight.w300, 1),
                          getContainerForTable(width,(where == "From")?data[index].from_lab_name.toString():data[index].to_lab_name.toString(), 6, FontWeight.w300, 1),
                          Container(
                            width: width*5,
                            child: Container(
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
                                              padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                                              child: Text(
                                                  'Reason',
                                                  style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.bold,
                                                  )
                                              ),
                                            ),
                                            content: Padding(
                                              padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                                              child: Text(
                                                  '${data[index].reason} ',
                                                  style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w700,
                                                  )
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Center(child: Text("View",))),
                              ),
                            ),
                          ),
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
    ):Container(
      width: width * 100,
      height: height * 60,
      child: Center(child: (where=='From')?Text("No Joining Requests Available",  style: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      )):Text("No Leaving Requests Available", style: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      )))
    );
  }
}