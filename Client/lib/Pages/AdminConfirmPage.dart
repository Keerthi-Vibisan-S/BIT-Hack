import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InchargeSwitch extends StatefulWidget {
  const InchargeSwitch({Key? key}) : super(key: key);

  @override
  State<InchargeSwitch> createState() => _InchargeSwitchState();
}

class _InchargeSwitchState extends State<InchargeSwitch> {
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
      "From": "Cloud Lab",
      "To": "Data Science"
    },
    {
      "S.No": 1,
      "Roll No": "202CT141",
      "Name": "VENKAT RAMAN S P",
      "Department": "COMPUTER TECHNOLOGY",
      "Year": "III",
      "History": 5,
      "From": "Cloud Lab",
      "To": "Data Science"
    },
    {
      "S.No": 1,
      "Roll No": "202CT141",
      "Name": "VENKAT RAMAN S P",
      "Department": "COMPUTER TECHNOLOGY",
      "Year": "III",
      "History": 5,
      "From": "Cloud Lab",
      "To": "Data Science"
    },
    {
      "S.No": 1,
      "Roll No": "202CT141",
      "Name": "VENKAT RAMAN S P",
      "Department": "COMPUTER TECHNOLOGY",
      "Year": "III",
      "History": 5,
      "From": "Cloud Lab",
      "To": "Data Science"
    },
    {
      "S.No": 1,
      "Roll No": "202CT141",
      "Name": "VENKAT RAMAN S P",
      "Department": "COMPUTER TECHNOLOGY",
      "Year": "III",
      "History": 5,
      "From": "Cloud Lab",
      "To": "Data Science"
    },
  ];
  List data2 = [
    {"from": "Hackathon", "to": "Blockchain Technology"},
    {"from": "Hackathon", "to": "Blockchain Technology"},
    {"from": "Hackathon", "to": "Blockchain Technology"},
    {"from": "Hackathon", "to": "Blockchain Technology"}
  ];
  Map<String, String> convert = {
    "COMPUTER TECHNOLOGY": "CT",
    "INFORMATION TECHNOLOGY": "IT"
  };
  Map<String, String> data3 = {
    "from": "Blockchain Technology",
    "to": "Cloud Computing Lab"
  };

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
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: width * 120,
                      height: height * 55,
                      child: table(data),
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

  Widget table(List data) {
    var size = MediaQuery.of(context).size;
    var height = size.height / 100;
    var width = size.width / 100;

    return Container(
      // color: Colors.blue,
      width: width * 120,
      height: height * 70,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: Colors.black12,
            height: height * 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 3,
                    alignment: Alignment.center,
                    child: Text(
                      "S.No",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: width * 1.2),
                    ),
                  ),
                  Container(
                    width: width * 9,
                    alignment: Alignment.center,
                    child: Text(
                      "Roll No",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: width * 1.2),
                    ),
                  ),
                  Container(
                    width: width * 12,
                    alignment: Alignment.center,
                    child: Text(
                      "Name",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: width * 1.2),
                    ),
                  ),
                  Container(
                    width: width * 6,
                    alignment: Alignment.center,
                    child: Text(
                      "Dept",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: width * 1.2),
                    ),
                  ),
                  Container(
                    width: width * 3,
                    alignment: Alignment.center,
                    child: Text(
                      "Year",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: width * 1.2),
                    ),
                  ),
                  Container(
                    width: width * 8,
                    alignment: Alignment.center,
                    child: Text(
                      "From",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: width * 1.2),
                    ),
                  ),
                  Container(
                    width: width * 8,
                    alignment: Alignment.center,
                    child: Text(
                      "To",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: width * 1.2),
                    ),
                  ),
                  Container(
                    width: width * 4.5,
                    alignment: Alignment.center,
                    child: Text(
                      "History",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: width * 1.2),
                    ),
                  ),
                  Container(
                    width: width * 15,
                    alignment: Alignment.center,
                    child: Text(
                      "Approval",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: width * 1.2),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: height * 45,
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
                                  fontWeight: FontWeight.w400,
                                  fontSize: width * 1),
                            ),
                          ),
                          Container(
                            width: width * 9,
                            alignment: Alignment.center,
                            // color: Colors.orange,
                            child: Text(
                              data[index]['Roll No'],
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: width * 1),
                            ),
                          ),
                          Container(
                            // color: Colors.orange,
                            width: width * 12,
                            alignment: Alignment.center,
                            child: Text(
                              data[index]['Name'],
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: width * 1),
                            ),
                          ),
                          Container(
                            // color: Colors.orange,
                            width: width * 6,
                            alignment: Alignment.center,
                            child: Text(
                              convert[data[index]['Department']]!,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: width * 1),
                            ),
                          ),
                          Container(
                            width: width * 3,
                            alignment: Alignment.center,
                            // color: Colors.orange,
                            child: Text(
                              data[index]['Year'],
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: width * 1),
                            ),
                          ),
                          Container(
                            width: width * 8,
                            alignment: Alignment.center,
                            // color: Colors.orange,
                            child: Text(
                              data[index]['From'],
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: width * 1),
                            ),
                          ),
                          Container(
                            width: width * 8,
                            alignment: Alignment.center,
                            // color: Colors.orange,
                            child: Text(
                              data[index]['To'],
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: width * 1),
                            ),
                          ),
                          Container(
                            width: width * 4.5,
                            alignment: Alignment.center,
                            // color: Colors.orange,
                            child: Text(
                              data[index]['History'].toString(),
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: width * 1),
                            ),
                          ),
                          Container(
                            width: width * 15,
                            alignment: Alignment.centerRight,
                            // color: Colors.orange,
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 0.1, color: Color(0xffFF0000)),
                                      borderRadius: BorderRadius.circular(10),
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
                                              return Container(
                                                height: height*100,
                                                width: width*100,
                                                child: AlertDialog(
                                                  title: Text(
                                                    '${data[index]["Name"]}  -  ${data[index]["Roll No"]}  -  ${convert[data[index]['Department']]}  -  ${data[index]['Year']}',
                                                    style: GoogleFonts.poppins(
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontSize: width * 1),
                                                  ),
                                                  content: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "History",
                                                        style:
                                                        GoogleFonts.poppins(
                                                            fontWeight:
                                                            FontWeight
                                                                .w500,
                                                            fontSize:
                                                            width * 1),
                                                      ),
                                                      Container(
                                                        height: height*30,
                                                        width: width*50,
                                                        child: ListView.builder(
                                                            itemCount:
                                                            data2.length,
                                                            itemBuilder:
                                                                (BuildContext
                                                            context,
                                                                int index) {
                                                              return Padding(
                                                                padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                                child: ListTile(
                                                                  leading: Text(
                                                                      (index + 1)
                                                                          .toString()),
                                                                  title: Text(
                                                                      data2[index]
                                                                      [
                                                                      'from']),
                                                                  trailing: Text(
                                                                      data2[index]
                                                                      ['to']),
                                                                ),
                                                              );
                                                            }),
                                                      ),
                                                      SizedBox(height: 20,),
                                                      Text(
                                                        "Request",
                                                        style: GoogleFonts.poppins(
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: width * 1),
                                                      ),
                                                      SizedBox(height: 20,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                              (data2.length + 1)
                                                                  .toString()),
                                                          Text(
                                                              data3['from']!
                                                          ),
                                                          Text(
                                                              data3['to']!
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('CANCEL'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () async {
                                                        // await sendMail("balasuriya.cs20@bitsathy.ac.in", {
                                                        //   "stu_name":"Balasuriya K A",
                                                        //   "from_lab":"Cloud Computing",
                                                        //   "to_lab":"No Lab Interested"
                                                        // });
                                                      },
                                                      child: Text('ACCEPT'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child:
                                        const Center(child: Text("View"))),
                                  ),
                                ),
                                SizedBox(
                                  width: 25,
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