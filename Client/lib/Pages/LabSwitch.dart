// import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  var switfrom = TextEditingController(text: "Cloud Computing");
  var reason = TextEditingController();
  var specialLabs;
  List<String> specialLabsNames = [];

  String? selectedValue;

  getSL() async {
    specialLabs = await getSpecialLabs();
    for(SpecialLab i in specialLabs)
        specialLabsNames.add(i.labname ?? "");

    setState(() {

    });
  }

  @override
  void initState() {
    print("Started to get Special Lab");
    getSL();
    setState(() {

    });
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
                              child: Image.network(widget.userDetails["img"] ?? ""),
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
                                              selectedValue = value;
                                              // print(value);
                                              setState(() {

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
                                                onPressed: (){
                                                  selectedValue = null;
                                                   reason.text = '';

                                                   setState(() {

                                                   });
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
                                  flex:5,
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
