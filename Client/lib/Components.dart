
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:special_lab_dashboard/Models/FacultyModel.dart';
import 'package:special_lab_dashboard/Utilities/Util.dart';

getFacultyCard(FacultyOfLab faculty)
{
  return Align(
    alignment: AlignmentDirectional.center,
    child: Container(
      width: 300,
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


renderStudentDetailsCard(userdetails) {
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
                      getStyledTextForProfileCard("Cloud Computing"),getSizedBox(15),
                      getStyledTextForProfileCard(userdetails["details"][0]["LAB_ID"].toString()),getSizedBox(15),
                      getStyledTextForProfileCard("Nataraj N"),getSizedBox(15),
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

renderCards(title,count,startcolor,endcolor)
{
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 150,
      width: 280,
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
        borderRadius: BorderRadius.circular(15)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left:20,top:20,bottom:20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(title.toString(),style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                ),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                      child: Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(count.toString(),style: GoogleFonts.poppins(
                            fontSize: 24,fontWeight: FontWeight.w500
                        ),),
                      ),
                    )
                )
              ],
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

