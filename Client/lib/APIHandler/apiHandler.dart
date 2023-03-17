import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:special_lab_dashboard/Models/FacultyModel.dart';
import 'package:special_lab_dashboard/Models/SpecialLabModel.dart';

const API_LINK = "http://10.10.237.157/";

dynamic checkValidUser(String? email, String? idToken) async{
  var res;
  await http.post(Uri.parse("${API_LINK}authenticate/verify"),
      headers: {
        "content-type" : "application/json",
      },
      body: json.encode({
        "email": email,
        "token": idToken!
      })
  ).then((value) async {
    res = value;
    // print(value);
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.setString("user-id", value);
  }).catchError((err){
    print("Error: " +err.toString());
    return "Error";
  });

  return json.decode(res.body);
}

dynamic postRequestToChangeSP(String? fromFacId, String? toFacId, String? head_id, String? reason) async{
  var res;
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? token = preferences.getString("token");
  await http.post(Uri.parse("${API_LINK}request/addReq"),
      headers: {
        "content-type" : "application/json",
        "Authorization" : "Bearer "+token!
      },
      body: json.encode({
        "from_lab_faculty_id": fromFacId,
        "to_lab_faculty_id": toFacId,
        "head_id": "1000",
        "reason": reason
      })
  ).then((value) async {
    print("inrerwerfwefwer");
    res = value;
    print(value);
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.setString("user-id", value);
  }).catchError((err){
    print(err);
    return err;
  });

  return json.decode(res.body);
}

Future<List<SpecialLab>> getSpecialLabs() async{
  var res;
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? token = preferences.getString("token");
  // print("Token : "+token.toString());
  print("Call");
  await http.get(Uri.parse("${API_LINK}labs/getLabs"),
      headers: {
        "content-type" : "application/json",
        "Authorization" : "Bearer "+token!,
      },
  ).then((value) async {
    print("IN");
    res = value.body;
    print("data-------------");
    print(res.toString());
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.setString("user-id", varlue);
  }).catchError((err){
    print("Error ----> :${err}");
  });
  List<SpecialLab> slobjs= [];
  var ans = json.decode(res);
  for(var sl in ans)
    {
      slobjs.add(SpecialLab(sl["LAB_ID"], sl["LAB_NAME"], sl["LAB_HEAD_ID"]));
    }
  return slobjs;

  // return json.decode(res.body);
}


getLabFacultyDetails(String? lab_id, String inchargeId) async
{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var token = preferences.getString("token");
  http.Response response =  await http.post(
      Uri.parse("${API_LINK}labs/getFaculty"),
      headers: {
        "Access-Control-Allow-Origin":"*",
        "Content-Type":"application/json",
        "Authorization": "Bearer "+token!,
      },
      body: json.encode({
        "lab_id": lab_id
      })
  );

  List<FacultyOfLab> fac_of_lab= [];
  // List<FacultyOfLab> facultyObjects = [];
  var ans = json.decode(response.body);
  for(var fac in ans) {
    fac_of_lab.add(FacultyOfLab(fac["FACULTY_ID"], fac["FACULTY_NAME"], fac["FACULTY_EMAIL"], fac["CONTACT"], fac["LAB_ID"]));

  }
    // if(inchargeId == fac["FACULTY_ID"])

  return fac_of_lab;

  // print("Faculty details: --->");
  // print(response.body);

}