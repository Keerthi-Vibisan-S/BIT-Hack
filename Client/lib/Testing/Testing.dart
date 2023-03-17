import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:special_lab_dashboard/Utilities/Util.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ElevatedButton(
            onPressed: (){
              showDialog(context: context, builder: (BuildContext context){
                return AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customizedTextStyle("Name",14,FontWeight.w400),
                                customizedTextStyle("Roll No",14,FontWeight.w400),
                                customizedTextStyle("Email",14,FontWeight.w400),
                                customizedTextStyle("Dept",14,FontWeight.w400),
                                customizedTextStyle("Year",14,FontWeight.w400),
                                customizedTextStyle("Contact",14,FontWeight.w400),
                                customizedTextStyle("Reason",14,FontWeight.w400),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                for(int i=0;i<7;i++)
                                  customizedTextStyle(":",14,FontWeight.w400),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customizedTextStyle("stu.stu_name",14,FontWeight.w400),
                                customizedTextStyle("stu.stu_id".toString(),14,FontWeight.w400),
                                customizedTextStyle("stu.stu_email".toString(),14,FontWeight.w400),
                                customizedTextStyle("stu.dept".toString(),14,FontWeight.w400),
                                customizedTextStyle("stu.year".toString(),14,FontWeight.w400),
                                customizedTextStyle("stu.stu_contact".toString(),14,FontWeight.w400),
                                customizedTextStyle("reason.toString",14,FontWeight.w400),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              });
          },child: Text("Click"),),
        ),
      ),
    );
  }
}
