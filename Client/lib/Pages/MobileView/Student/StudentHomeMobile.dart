
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Components.dart';
import '../../../Utilities/Colors.dart';
import '../../../responsive.dart';
import '../../WebView/Student/LabSwitch.dart';

class StudentHomeMobile extends StatefulWidget {
  final userdetails;
  final inchargeDetails;
  final myLab;
  final ScrollController sc;
  final facultyObjects,isFetchingSwitch, specialLabsNames, details;
  final Function changeScreen;
  const StudentHomeMobile(this.userdetails,this.inchargeDetails,this.myLab,this.sc,this.facultyObjects,this.isFetchingSwitch,this.specialLabsNames,this.details,this.changeScreen,{Key? key}) : super(key: key);

  @override
  State<StudentHomeMobile> createState() => _StudentHomeMobileState();
}

class _StudentHomeMobileState extends State<StudentHomeMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY,
        leading: Container(),
        actions: [
          IconButton(icon:Icon(Icons.logout),onPressed: (){
            showDialog(context: context, builder: (BuildContext context){
              return showLogoutDialog();
            });
          },),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Profile",style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,fontSize: 20,decoration: TextDecoration.none,color: Colors.black,
                    ),),
                  ],
                ),
              ),
              Card(
                child: renderStudentDetailsCard(widget.userdetails, widget.inchargeDetails, widget.myLab),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Special Lab Faculties",style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,fontSize: 20,decoration: TextDecoration.none,color: Colors.black,
                    ),),
                  ],
                ),
              ),
              renderLabFaculties(widget.sc, widget.facultyObjects,Responsive.isMobile(context))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: PRIMARY,
        onPressed: (){
          // widget.changeScreen();
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Material(child: LabSwitchPage(widget.userdetails, widget.isFetchingSwitch, widget.specialLabsNames, widget.details, widget.myLab, widget.inchargeDetails))));
        },child: Icon(Icons.swap_horiz,color: Colors.white,),),
    );
  }
}
