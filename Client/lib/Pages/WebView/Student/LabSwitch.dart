import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:special_lab_dashboard/APIHandler/apiHandler.dart';
import 'package:special_lab_dashboard/responsive.dart';

import '../../../Components.dart';
import '../../../Utilities/Colors.dart';
import '../../MobileView/Student/StudentLabSwitchMobile.dart';

class LabSwitchPage extends StatefulWidget {
  var userDetails, specialLabsNames, details, myLab, inchargeDetails, isFetchingLab;
  LabSwitchPage(this.userDetails, this.isFetchingLab, this.specialLabsNames, this.details, this.myLab, this.inchargeDetails,{Key? key}) : super(key: key);
  LabSwitchPage.empty();
  @override
  State<LabSwitchPage> createState() => _LabSwitchPageState();
}

class _LabSwitchPageState extends State<LabSwitchPage> {
  var reason = TextEditingController();
  String id2 = "";
  String? switTo;

  getToLabID(String labname){
    for(int i=0;i<widget.details.length;i++) {
      if(labname==widget.details[i]['labname']){
        setState(() {
          id2 = widget.details[i]['headid'];
        });
      }
    }
  }

  refresh()
  {
    // print("Refreshing");
    // initState();
  }

  @override
  Widget build(BuildContext context) {
    return (Responsive.isMobile(context))
        ?LabSwitchMobile(widget.isFetchingLab, widget.myLab, widget.userDetails, getToLabID, id2, widget.specialLabsNames, switTo,widget.details)
        :Expanded(
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
                                  child: studentLabSwithcForm(widget.isFetchingLab, widget.myLab, switTo, widget.specialLabsNames, getToLabID, widget.userDetails, id2,widget.details,refresh)
                                ),
                              ),
                              Expanded(flex:1,child: Container()),
                              // SizedBox(width: 10,),
                              Expanded(
                                  flex:6,
                                  child: (!widget.isFetchingLab)?Hero(tag: "sjai", child: renderStudentDetailsCard(widget.userDetails, widget.inchargeDetails, widget.myLab)):Center(child: CircularProgressIndicator(),)
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

