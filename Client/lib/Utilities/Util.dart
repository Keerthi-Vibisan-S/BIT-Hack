import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

getBackground(Row row){
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xff370d57), Color(0xff3800AA)],
      ),
    ),
    child: row,
  );
}

getSizedBox(double height){
  return SizedBox(
    height: height,
  );
}

getContainerForTable(double width, String text, double widthScale, FontWeight wgt, double fontScale){
  return Container(
    width: width*widthScale,
    alignment: Alignment.centerLeft,
    child: Text(
      text[0].toUpperCase() + text.substring(1).toLowerCase(),
      style: GoogleFonts.poppins(
          fontWeight: wgt,
          fontSize: width*fontScale -1.8
      ),
    ),
  );
}

getExpanded(int flex){
  return Expanded(
    flex: flex,
    child:Container()
  );
}
getStyledTextForProfileCard(String text){
  return Text(text,style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,);
}