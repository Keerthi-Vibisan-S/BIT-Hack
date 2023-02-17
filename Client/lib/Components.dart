

import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

getFacultyCard()
{
  return Card(
    elevation: 10,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("CH10372",style: TextStyle(fontSize: 10),),
                  )
                ],
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nathan Drake",style: TextStyle(fontWeight: FontWeight.w800),),
                  SizedBox(height: 10,),
                  Text("Chemistry Department",style: TextStyle(fontWeight: FontWeight.w100,fontSize: 11),),
                  Text("Ph. No : 8964093829",style: TextStyle(fontWeight: FontWeight.w100,fontSize: 11),)
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}


renderStudentDetailsCard() {
  return Container(

    color: Colors.grey.shade50,
    // elevation: 10,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(),
            Column(
              children: [
                Text("Student name"),
                SizedBox(height: 10,),
                Text("mail id"),
              ],
            ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.end,
            //       children: [
            //         Text("Year"),
            //         Text("Dept"),
            //         Text("Special Lab"),
            //         Text("Lab code"),
            //         Text("Incharge"),
            //         Text("Joined Date"),
            //         Text("History Of Change")
            //       ],
            //     ),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text("3rd year"),
            //         Text("IT"),
            //         Text("Cloud Computing"),
            //         Text("SLB-031"),
            //         Text("Nataraj N"),
            //         Text("29.08.22"),
            //         Text("0")
            //       ],
            //     )
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Year"),
                      SizedBox(height:10),
                      Text("Department"),
                      SizedBox(height:10),
                      Text("Special Lab"),
                      SizedBox(height:10),
                      Text("Lab Code"),
                      SizedBox(height:10),
                      Text("Incharge"),
                      SizedBox(height:10),
                      Text("Joined Date"),
                      SizedBox(height:10),
                      Text("History Of Change"),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(":"),
                      SizedBox(height:10),
                      Text(":"),
                      SizedBox(height:10),
                      Text(":"),
                      SizedBox(height:10),
                      Text(":"),
                      SizedBox(height:10),
                      Text(":"),
                      SizedBox(height:10),
                      Text(":"),
                      SizedBox(height:10),
                      Text(":"),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("3rd Year"),
                      SizedBox(height:10),
                      Text("Information Tech"),
                      SizedBox(height:10),
                      Text("Cloud Computing"),
                      SizedBox(height:10),
                      Text("SLB-031"),
                      SizedBox(height:10),
                      Text("Nataraj N"),
                      SizedBox(height:10),
                      Text("29.08.22"),
                      SizedBox(height:10),
                      Text("0"),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}


