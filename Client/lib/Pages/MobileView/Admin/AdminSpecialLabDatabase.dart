import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:special_lab_dashboard/Utilities/Util.dart';

class AdminSpecialLabDatabaseMobile extends StatefulWidget {
  const AdminSpecialLabDatabaseMobile({Key? key}) : super(key: key);

  @override
  State<AdminSpecialLabDatabaseMobile> createState() => _AdminSpecialLabDatabaseMobileState();
}

class _AdminSpecialLabDatabaseMobileState extends State<AdminSpecialLabDatabaseMobile> {
  List data = [
    {
      "S.No": 1,
      "Spl_lab": "Cloud Computing",
      "Lab_id": "SLB031",
      "Incharge": "Nataraj N",
      "Strength": "137",
    },
    {
      "S.No": 2,
      "Spl_lab": "Mobile and Web",
      "Lab_id": "SLB032",
      "Incharge": "Sundaram",
      "Strength": "230",
    },
    {
      "S.No": 3,
      "Spl_lab": "Hackathon",
      "Lab_id": "SLB034",
      "Incharge": "Nithya",
      "Strength": "98",
    },
    {
      "S.No": 4,
      "Spl_lab": "AR VR",
      "Lab_id": "SLB037",
      "Incharge": "Poornima",
      "Strength": "57",
    },
    {
      "S.No": 1,
      "Spl_lab": "Cloud Computing",
      "Lab_id": "SLB031",
      "Incharge": "Nataraj N",
      "Strength": "137",
    },
    {
      "S.No": 2,
      "Spl_lab": "Mobile and Web",
      "Lab_id": "SLB032",
      "Incharge": "Sundaram",
      "Strength": "230",
    },
    {
      "S.No": 3,
      "Spl_lab": "Hackathon",
      "Lab_id": "SLB034",
      "Incharge": "Nithya",
      "Strength": "98",
    },
    {
      "S.No": 4,
      "Spl_lab": "AR VR",
      "Lab_id": "SLB037",
      "Incharge": "Poornima",
      "Strength": "57",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getStyledTextForProfileCard("Special Lab Database"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(flex:1,child: getStyledTextForProfileCard("S.No")),
              Expanded(flex:6,child: getStyledTextForProfileCard("Special Lab")),
              Expanded(flex:1,child:Container()),
              Expanded(flex:3,child: getStyledTextForProfileCard("Strength")),
            ],
          ),
        ),
        ListView.separated(
          itemCount: data.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context,int index){
            return GestureDetector(
              onTap: (){

              },
              child: Container(
                decoration: BoxDecoration(
                  color: index%2==0?Colors.white: Colors.grey.shade100.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(flex:1,child: Text((index+1).toString()),),
                      Expanded(flex:6, child: Text(data[index]["Spl_lab"])),
                      Expanded(flex:1,child:Container()),
                      Expanded(flex:3, child: Text(data[index]["Strength"])),
                    ],
                  ),
                ),
              ),
            );
          }, separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 10,);
        },),
      ],
    );
  }
}
