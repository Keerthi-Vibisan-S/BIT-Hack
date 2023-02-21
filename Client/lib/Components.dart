import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:special_lab_dashboard/Utilities/Util.dart';

getFacultyCard()
{
  return Align(
    alignment: AlignmentDirectional.center,
    child: Container(
      width: 300,
      color: Colors.white,
      child: Card(
        elevation: 20,
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
                      "CH10372",
                      style: TextStyle(
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
                  Text("Nathan Drake",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.5),),
                  SizedBox(height: 10,),
                  Text(
                    "Chemistry Department",
                    style: TextStyle(
                      fontSize: 12.5,
                      color: Colors.black.withOpacity(0.5)
                    ),
                  ),
                  Text(
                    "Ph. No : 8964093829",
                    style: TextStyle(
                        fontSize: 12.5,
                        color: Colors.black.withOpacity(0.5)
                    ),
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


renderStudentDetailsCard()
{

  return Column(
    children: [
      Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Container(
            // color: Colors.red,
            height: 550,
            child:
              Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage("https://lh3.googleusercontent.com/a/AEdFTp4Rp8ovWbCc4j8KiPba5PwXrCicVUT_B7NzhGCmMA=s96-c"),
                  radius: 50,
                ),
                Column(
                    children: [
                      Text("Balasuriya K A",style: TextStyle(fontSize: 17.5,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text("balasuriya.cs20@bitsathy.ac.in", 
                      style: TextStyle(
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
                          getStyledTextForProfileCard("3rd Year"), getSizedBox(15),
                          getStyledTextForProfileCard("CS"),getSizedBox(15),
                          getStyledTextForProfileCard("Cloud Computing"),getSizedBox(15),
                          getStyledTextForProfileCard("1"),getSizedBox(15),
                          getStyledTextForProfileCard("Nataraj N"),getSizedBox(15),
                          getStyledTextForProfileCard("29.08.20 "),getSizedBox(15),
                          getStyledTextForProfileCard("0"),getSizedBox(15),

                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

renderCards(title,count,startcolor,endcolor)
{
  return Container(
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
              Text(title.toString(),style: TextStyle(color: Colors.white,fontSize: 18),),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,top:8,bottom: 8),
                    child: Text(count.toString(),style: TextStyle(color: Colors.black,fontSize: 24),),
                  )
              )
            ],
          )
        ],
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
      Expanded(flex:2,child: Text(labname,style: TextStyle(fontWeight: FontWeight.bold),)),
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

