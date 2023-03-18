
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Components.dart';
import '../../../Utilities/Colors.dart';

class LabSwitchMobile extends StatefulWidget {
  final isFetchingLab,myLab,switTo,specialLabsNames,getToLabID,userDetails,id2,details;
  const LabSwitchMobile(this.isFetchingLab,this.myLab,this.userDetails,this.getToLabID,this.id2,this.specialLabsNames,this.switTo,this.details,{Key? key}) : super(key: key);

  @override
  State<LabSwitchMobile> createState() => _LabSwitchMobileState();
}

class _LabSwitchMobileState extends State<LabSwitchMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            studentLabSwithcForm(widget.isFetchingLab, widget.myLab, widget.switTo, widget.specialLabsNames, widget.getToLabID, widget.userDetails, widget.id2,widget.details)
          ],
        ),
      ),
    );
  }
}