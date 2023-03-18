
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:special_lab_dashboard/Models/FacultyModel.dart';
import 'package:special_lab_dashboard/Utilities/Util.dart';
import 'package:special_lab_dashboard/responsive.dart';

import 'APIHandler/apiHandler.dart';

getFacultyCard(FacultyOfLab faculty,wid)
{
  return Align(
    alignment: AlignmentDirectional.center,
    child: Container(
      width: wid,
      // color: Colors.white,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 15, left: 30),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 35,
                    child: Icon(Icons.account_circle , size: 70),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      faculty.lab_id ?? "ID",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.black.withOpacity(0.75),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getSizedBox(7.5),
                  Text(faculty.fac_name ?? "Name",style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,fontSize: 15.5
                  ),),
                  SizedBox(height: 10,),
                  Text(
                    faculty.fac_email ?? "Email",
                    style: GoogleFonts.poppins(
                        fontSize: 12.5,
                        color: Colors.black.withOpacity(0.5)
                    )
                  ),
                  Text(
                    faculty.fac_phNo ?? "Contact",
                    style: GoogleFonts.poppins(
                        fontSize: 12.5,
                        color: Colors.black.withOpacity(0.5)
                    )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}


renderStudentDetailsCard(userdetails, FacultyOfLab incharge,String mylab) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12.withOpacity(0.1),
                  blurRadius: 50,
                  offset: Offset(0, 0)
              )
            ]
        ),
        height: 550,
        child:
          Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              // backgroundImage: NetworkImage(
              //
              // ),
              radius: 50,
            ),
            Column(
                children: [
                  Text(userdetails["name"],style: GoogleFonts.poppins(
                      fontSize: 17.5,fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 10,),
                  Text(userdetails["email"],
                  style: GoogleFonts.poppins(
                    color: Colors.black.withOpacity(0.7)
                  ),
                  ),
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getStyledTextForProfileCard("Year"), getSizedBox(15),
                      getStyledTextForProfileCard("Department"),getSizedBox(15),
                      getStyledTextForProfileCard("Special Lab"),getSizedBox(15),
                      getStyledTextForProfileCard("Lab Code"),getSizedBox(15),
                      getStyledTextForProfileCard("Incharge"),getSizedBox(15),
                      getStyledTextForProfileCard("Joined Date"),getSizedBox(15),
                      getStyledTextForProfileCard("History Of Change"),getSizedBox(15),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getStyledTextForProfileCard(":"), getSizedBox(15),
                      getStyledTextForProfileCard(":"),getSizedBox(15),
                      getStyledTextForProfileCard(":"),getSizedBox(15),
                      getStyledTextForProfileCard(":"),getSizedBox(15),
                      getStyledTextForProfileCard(":"),getSizedBox(15),
                      getStyledTextForProfileCard(":"),getSizedBox(15),
                      getStyledTextForProfileCard(":"),getSizedBox(15),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      getStyledTextForProfileCard(userdetails["details"][0]["YEAR"]), getSizedBox(15),
                      getStyledTextForProfileCard("CSE"),getSizedBox(15),
                      getStyledTextForProfileCard(mylab),getSizedBox(15),
                      getStyledTextForProfileCard(userdetails["details"][0]["LAB_ID"].toString()),getSizedBox(15),
                      getStyledTextForProfileCard(incharge.fac_name ?? ""),getSizedBox(15),
                      getStyledTextForProfileCard("29.08.20 "),getSizedBox(15),
                      getStyledTextForProfileCard(userdetails["details"][0]["COUNT"].toString()),getSizedBox(15),

                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ],
  );
}

renderCardsForAdminPage(title,count,startcolor,endcolor,height,width,fontsize,countFontSize,double padding,double radius)
{
  return Padding(
    padding: EdgeInsets.only(left: padding,right: 20,bottom: 8),
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(startcolor),Color(endcolor)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.1),
            blurRadius: 50,
            offset: Offset(0, 0), // Shadow position
          ),
        ],
        borderRadius: BorderRadius.circular(radius)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left:20,top:20,bottom:10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(title.toString(),style: GoogleFonts.poppins(
                    fontSize: fontsize,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                  ),),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5.5),
                        child: Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(count.toString(),style: GoogleFonts.poppins(
                              fontSize: countFontSize,fontWeight: FontWeight.w500
                          ),),
                        ),
                      )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}


renderLabAnanlysisBar(labname,int width,int index)
{
  var startcolor = 0xff0249ff;
  var endcolor = 0xffa9c1ff;
  if(index%2 !=0 )
  {
    startcolor = 0xff0610ff;
    endcolor = 0xff9ca0ff;
  }
  return Row(
    children: [
      Expanded(flex:2,child: Text(labname,style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600
      ),)),
      Expanded(flex:1,child: Container()),
      Expanded(
        flex: width,
        child: ClipRRect(
          borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(startcolor),Color(endcolor)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
            ),
            alignment: Alignment.centerLeft,
            height: 50,
            width: width.toDouble(),
          ),
        ),
      ),
      Expanded(
          flex: 10-width,
          child: Container())
    ],

  );
}

renderLabFaculties(ScrollController sc,List<dynamic> facultyObjects,bool isMobile) {
  return (isMobile)?Padding(
    padding: const EdgeInsets.symmetric(horizontal: 9.0),
    child: Column(
      children: [
        for(int i=0;i<facultyObjects.length;i++)
            getFacultyCard(facultyObjects[i],350),
      ],
    )
  ):Container(
    height: 130,
    child: Scrollbar(
      // thumbVisibility: true,
      // trackVisibility: true,
      controller: sc,
      interactive: true,
      child: ListView.builder(
          shrinkWrap: true,
          controller: sc,
          itemCount: facultyObjects.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context,int index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.0),
              child: getFacultyCard(facultyObjects[index],300),
            );
          }),
    ),
  );
}


studentLabSwithcForm(bool isFetchingLab,myLab,switTo,specialLabsNames,getToLabID,userDetails,id2,details)
{
  var reason = new TextEditingController();
  return StatefulBuilder(
    builder: (BuildContext context, void Function(void Function()) setState) {
      return Column(
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
                controller: TextEditingController(text: (!isFetchingLab)?myLab:""),
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
                hint: switTo??"Select Lab",
                dropdownWidth: 200,
                dropdownItems: (!isFetchingLab)?specialLabsNames:[],
                value: switTo,
                onChanged: (value) {
                  // print(value);
                  setState(() {
                    print("Switch to : "+value.toString());
                    switTo = value;
                    for(int i=0;i<details.length;i++) {
                      if(value.toString()==details[i]['labname']){
                        setState(() {
                          id2 = details[i]['headid'];
                        });
                      }
                    }
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
                    onPressed: (!isFetchingLab)?() async{
                      if(reason.text.isEmpty){setState(() {
                        reason.text = '';
                      });
                      }
                      // print("id1 "+v.toString());
                      // print("id2 "+id2.toString());
                      // print("reason "+reason.text);
                      await postRequestToChangeSP(userDetails["details"][0]["FACULTY_ID"].toString(), id2.toString(), "1000", reason.text, myLab, switTo);
                    }:(){

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
      );
    },
  );
}


renderRowForDialog(String title,String value)
{
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex:4,child: customizedTextStyle(title, 14, FontWeight.w400),),
        Expanded(flex:1,child: customizedTextStyle(":", 14, FontWeight.w400),),
        Expanded(flex:5,child: customizedTextStyle(value, 14, FontWeight.w400),),
      ],
    ),
  );
}


showStudentDetailsDialog(data)
{
  return AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        renderRowForDialog("Name",data.stu.stu_name),
        renderRowForDialog("Roll No",data.stu.stu_id.toString(),),
        renderRowForDialog("Email",data.stu.stu_email.toString()),
        renderRowForDialog("Dept",data.stu.dept.toString(),),
        renderRowForDialog("Year",data.stu.year.toString(),),
        renderRowForDialog("Contact",data.stu.stu_contact.toString(),),
        renderRowForDialog("Reason",data.reason.toString(),),
      ],
    ),
  );
}



