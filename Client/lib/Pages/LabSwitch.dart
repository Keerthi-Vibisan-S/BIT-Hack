// import 'package:cool_dropdown/cool_dropdown.dart';
import 'dart:convert';

import 'package:dropdown_button2/custom_dropdown_button2.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:special_lab_dashboard/APIHandler/apiHandler.dart';
import 'package:special_lab_dashboard/Models/SpecialLabModel.dart';

import '../Components.dart';

class LabSwitchPage extends StatefulWidget {
  final userDetails;
  const LabSwitchPage(this.userDetails, {Key? key}) : super(key: key);

  @override
  State<LabSwitchPage> createState() => _LabSwitchPageState();
}

class _LabSwitchPageState extends State<LabSwitchPage> {
  var switfrom = TextEditingController();
  var reason = TextEditingController();
  var specialLabs;
  List<String> specialLabsNames = [];
  List details = [];
  String id1 ="";
  String id2 = "";
  String? selectedValue;

  getSL() async {
    specialLabs = await getSpecialLabs();
    for(SpecialLab i in specialLabs) {
       specialLabsNames.add(i.labname ?? "");
       details.add({"labid":i.labid,"labname":i.labname, "headid":i.labheadid});
    }
    // print(details);
    setState(() {

    });
    getuser();
    // print("OUT");
  }

  void getuser() async{
    SharedPreferences preferences = await SharedPreferences
        .getInstance();
    var users = await jsonDecode(preferences.getString("user")!);
    var labname;
    // print(users['details'][0]['LAB_ID']);
    for(int i=0;i<details.length;i++){
      if(users['details'][0]['LAB_ID'].toString()==details[i]['labid']){
          labname = details[i]['labname'];
      }
    }
    setState(() {
      switfrom.text = labname;
      id1 = users['details'][0]['FACULTY_ID'];
    });

}

geID(String labname){
  for(int i=0;i<details.length;i++) {
    if(labname==details[i]['labname']){
      setState(() {
        id2 = details[i]['headid'];
      });
    }
  }
}


  @override
  void initState() {
    print("Started to get Special Lab");
    getSL();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              const EdgeInsets.only(left: 100, top: 40, right: 100),
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
                          children: [
                            CircleAvatar(

                              child: ClipRRect(
                                child: Image.network(widget.userDetails["img"] ?? ""),
                                borderRadius: BorderRadius.circular(20),
                              )
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
                      ]
                  ),
                  SizedBox(height: 70,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 2, child: Container(),),
                      Expanded(
                        flex: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12.withOpacity(0.1),
                                blurRadius: 50,
                                offset: Offset(0, 0), // Shadow position
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                flex:7,
                                child: Padding(
                                  padding: const EdgeInsets.all(56.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Switching From"),
                                      SizedBox(height: 10,),
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        child: Container(
                                          color: Color(0xffefefef),
                                          child: TextField(
                                            controller: switfrom,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(20))
                                              ),
                                            ),
                                            style: GoogleFonts.poppins(fontSize: 15),
                                            readOnly: true,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20,),
                                      Text("Switching To"),
                                      SizedBox(height: 10,),
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                        child: Container(
                                          color: Color(0xffefefef),
                                          child: CustomDropdownButton2(
                                            hint: selectedValue??"Select Lab",
                                            dropdownWidth: 200,
                                            dropdownItems: specialLabsNames,
                                            value: selectedValue,
                                            onChanged: (value) {
                                              // print(value);
                                              setState(() {
                                                selectedValue = value;
                                                geID(selectedValue!);
                                              });
                                            },
                                            buttonWidth: 400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20,),
                                      Text("Reason"),
                                      SizedBox(height: 10,),
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        child: Container(
                                          color: Color(0xffefefef),
                                          child: TextField(
                                            controller: reason,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                              ),
                                              hintText: "Write here..."
                                            ),
                                            maxLines: 5,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Color(0xff5749f3)
                                                ),
                                                onPressed: () async{
                                                  if(reason.text.isEmpty){setState(() {
                                                    reason.text = '';
                                                  });


                                                  }
                                                  print("id1 "+id1.toString());
                                                  print("id2 "+id2.toString());
                                                  print("reason "+reason.text);
                                                   var response = await postRequestToChangeSP(id1.toString(), id2.toString(), "1000", reason.text);
                                                   if(!response){
                                                     print("iN");
                                                   }
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.all(12),
                                                  child: Text("Submit"),
                                                )
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(flex:1,child: Container()),
                              // SizedBox(width: 10,),
                              Expanded(
                                  flex:6,
                                  child: Hero(tag: "sjai", child: renderStudentDetailsCard(widget.userDetails))
                              ),
                            ],
                          ),
                        )
                      ),
                      Expanded(flex: 2, child: Container(),)
                    ],
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
