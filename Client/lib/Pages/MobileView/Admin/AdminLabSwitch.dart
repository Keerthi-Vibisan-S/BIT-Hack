import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:special_lab_dashboard/Utilities/Util.dart';

class AdminLabSwitch extends StatefulWidget {
  const AdminLabSwitch({Key? key}) : super(key: key);

  @override
  State<AdminLabSwitch> createState() => _AdminLabSwitchState();
}

class _AdminLabSwitchState extends State<AdminLabSwitch> {
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context,int index){
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpansionTile(
                  textColor: Colors.black,
                  iconColor: Colors.black,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(data[index]["Name"], style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.bold)),
                          SizedBox(width: 5,),
                          Text("-", style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.normal)),
                          SizedBox(width: 5,),
                          Text(data[index]["Roll No"], style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Text(data[index]["From"], style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.normal)),
                          Icon(Icons.arrow_right_alt),
                          Text(data[index]["To"], style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.normal)),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Text("History : ", style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.normal)),
                          Text(data[index]["History"].toString(), style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.normal))
                        ],
                      )

                    ],
                  ),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(onPressed: (){}, child: Icon(Icons.check),style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), backgroundColor: Colors.green),),
                        SizedBox(width: 20,),
                        ElevatedButton(onPressed: (){}, child: Icon(Icons.close),style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),backgroundColor: Colors.red),),
                      ],
                    ),
                  ],
                ),
              ),
            );
        }, separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10,);
        },)
      ],
    );
  }
}
