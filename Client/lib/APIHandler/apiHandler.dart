import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:special_lab_dashboard/Models/FacultyModel.dart';
import 'package:special_lab_dashboard/Models/RequestModel.dart';
import 'package:special_lab_dashboard/Models/SpecialLabModel.dart';
import 'package:special_lab_dashboard/Models/StudentModel.dart';

const API_LINK = "http://10.10.176.69/";
const LOCALHOST = "http://localhost:80/";

dynamic checkValidUser(String? email, String? idToken) async{
  var res;
  await http.post(Uri.parse("${LOCALHOST}authenticate/verify"),
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

dynamic checkValidFacultyUser(String? email, String? idToken) async{
  var res;
  await http.post(Uri.parse("${LOCALHOST}authenticate/facultyverify"),
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
    return err;
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
    res = value;
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
  await http.get(Uri.parse("${LOCALHOST}labs/getLabs"),
      headers: {
        "content-type" : "application/json",
        "Authorization" : "Bearer "+token!,
      },
  ).then((value) async {
    res = value.body;
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
      Uri.parse("${LOCALHOST}labs/getFaculty"),
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
  var ans = json.decode(response.body);
  for(var fac in ans) {
    fac_of_lab.add(FacultyOfLab(fac["FACULTY_ID"], fac["FACULTY_NAME"], fac["FACULTY_EMAIL"], fac["CONTACT"], fac["LAB_ID"]));
  }
    // if(inchargeId == fac["FACULTY_ID"])

  return fac_of_lab;
}

getAllStudentUnderFaculty(String? fac_id) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var token = preferences.getString("token") ?? "";
  http.Response response =  await http.get(
      Uri.parse("${LOCALHOST}faculty/getStudents/${fac_id}"),
      headers: {
        "Access-Control-Allow-Origin":"*",
        "Content-Type":"application/json",
        "Authorization": "Bearer "+token,
      },
  );
  
  List<StudentModel> students_under_fac = [];
  var ans = json.decode(response.body);
  for(var stu in ans){
    students_under_fac.add(StudentModel(stu["STU_ID"], stu["STU_NAME"], stu["STU_EMAIL"], stu["STU_CONTACT"], stu["LAB_ID"], stu["FACULTY_ID"], stu["COUNT"].toString(), stu["LAST_UPDATED_DATE"], stu["DEPT"], stu["YEAR"]));
  }

  return students_under_fac;
}

getAllStudentRequestsUnderFaculty(String? fac_id) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var token = preferences.getString("token") ?? "";
  http.Response response =  await http.get(
    Uri.parse("${LOCALHOST}faculty/getReqStudents/${fac_id}"),
    headers: {
      "Access-Control-Allow-Origin":"*",
      "Content-Type":"application/json",
      "Authorization": "Bearer "+token,
    },
  );

  List<RequestModel> joiningRequests = [];
  List<RequestModel> leavingRequests = [];
  var ans = json.decode(response.body);
  // print(ans);
  for(var req in ans){
    if(req["FROM_LAB_FAC_ID"] == fac_id){
      joiningRequests.add(RequestModel(req["R_ID"].toString(), req["STU_ID"], req["FROM_LAB_FAC_ID"], req["TO_LAB_FAC_ID"], req["FROM_APPROVAL"], req["TO_APPROVAL"], req["HEAD_ID"].toString(), req["HEAD_APPROVAL"], req["REASON"]));
    }
    if(req["TO_LAB_FAC_ID"] == fac_id){
      leavingRequests.add(RequestModel(req["R_ID"].toString(), req["STU_ID"], req["FROM_LAB_FAC_ID"], req["TO_LAB_FAC_ID"], req["FROM_APPROVAL"], req["TO_APPROVAL"], req["HEAD_ID"].toString(), req["HEAD_APPROVAL"], req["REASON"]));
    }
  }

  return {"joining": joiningRequests, "leaving" : leavingRequests};
}