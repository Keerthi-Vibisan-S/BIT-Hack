import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:special_lab_dashboard/Models/FacultyModel.dart';
import 'package:special_lab_dashboard/Models/RequestModel.dart';
import 'package:special_lab_dashboard/Models/SpecialLabModel.dart';
import 'package:special_lab_dashboard/Models/StudentModel.dart';

const API_LINK = "http://127.0.0.1:3000/";
// const API_LINK = "http://10.10.176.69/";
// const LOCALHOST = "http://localhost:80/";

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
    print("Error: $err");
    return "Error";
  });

  return json.decode(res.body);
}

dynamic checkValidFacultyUser(String? email, String? idToken) async{
  var res;
  await http.post(Uri.parse("${API_LINK}authenticate/facultyverify"),
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
    print("Error: $err");
    return err;
  });

  return json.decode(res.body);
}

dynamic postRequestToChangeSP(String? fromFacId, String? toFacId, String? head_id, String? reason, String? from_lab, String? to_lab) async{
  print(fromFacId.toString()+toFacId.toString()+head_id.toString()+reason.toString()+from_lab.toString()+to_lab.toString());
  var res;
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? token = preferences.getString("token");
  print("Token : "+token.toString());
  await http.post(Uri.parse("${API_LINK}request/addReq"),
      headers: {
        "content-type" : "application/json",
        "Authorization" : "Bearer ${token!}"
      },
      body: json.encode({
        "from_lab_faculty_id": fromFacId,
        "to_lab_faculty_id": toFacId,
        "head_id": "1000",
        "reason": reason,
        // "from_lab_name" : from_lab,
        // "to_lab_name" : to_lab
      })
  ).then((value) async {
    res = value;
  }).catchError((err){
    print(err);
    return err;
  });
}

Future<List<SpecialLab>> getSpecialLabs() async{
  var res;
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? token = preferences.getString("token");
  // print("Token : "+token.toString());
  await http.get(Uri.parse("${API_LINK}labs/getLabs"),
      headers: {
        "content-type" : "application/json",
        "Authorization" : "Bearer ${token!}",
      },
  ).then((value) async {
    res = value.body;
  }).catchError((err){
    print("Error ----> :${err}");
  });
  List<SpecialLab> slobjs= [];
  var ans = json.decode(res);
  for(var sl in ans) {
    slobjs.add(SpecialLab(sl["LAB_ID"], sl["LAB_NAME"], sl["LAB_HEAD_ID"]));
  }
  return slobjs;

  // return json.decode(res.body);
}

getLabFacultyDetails(String? lab_id) async
{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var token = preferences.getString("token");
  http.Response response =  await http.post(
      Uri.parse("${API_LINK}labs/getFaculty"),
      headers: {
        "Access-Control-Allow-Origin":"*",
        "Content-Type":"application/json",
        "Authorization": "Bearer ${token!}",
      },
      body: json.encode({
        "lab_id": lab_id
      })
  );

  return json.decode(response.body);
}

getAllStudentUnderFaculty(String? fac_id) async
{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var token = preferences.getString("token") ?? "";
  http.Response response =  await http.get(
      Uri.parse("${API_LINK}faculty/getStudents/$fac_id"),
      headers: {
        "Access-Control-Allow-Origin":"*",
        "Content-Type":"application/json",
        "Authorization": "Bearer $token",
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
    Uri.parse("${API_LINK}faculty/getReqStudents/$fac_id"),
    headers: {
      "Access-Control-Allow-Origin":"*",
      "Content-Type":"application/json",
      "Authorization": "Bearer $token",
    },
  );
  List<RequestModel> joiningRequests = [];
  List<RequestModel> leavingRequests = [];
  var ans = json.decode(response.body);

  for(var req in ans){
    StudentModel stu = await getHistoryOfStudent(req["STU_ID"]);
    if(req["FROM_LAB_FAC_ID"] == fac_id){
      leavingRequests.add(RequestModel(req["R_ID"].toString(), stu, req["FROM_LAB_FAC_ID"], req["TO_LAB_FAC_ID"], req["FROM_APPROVAL"], req["TO_APPROVAL"], req["HEAD_ID"].toString(), req["HEAD_APPROVAL"], req["REASON"], req["FROM_LAB"], req["TO_LAB"]));

    }
    if(req["TO_LAB_FAC_ID"] == fac_id){
      joiningRequests.add(RequestModel(req["R_ID"].toString(), stu, req["FROM_LAB_FAC_ID"], req["TO_LAB_FAC_ID"], req["FROM_APPROVAL"], req["TO_APPROVAL"], req["HEAD_ID"].toString(), req["HEAD_APPROVAL"], req["REASON"], req["FROM_LAB"], req["TO_LAB"]));
    }
  }

  return {"joining": joiningRequests, "leaving" : leavingRequests};
}


getHistoryOfStudent(String? stu_id) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var token = preferences.getString("token") ?? "";
  http.Response response =  await http.get(
    Uri.parse("${API_LINK}faculty/getHistory/$stu_id"),
    headers: {
      "Access-Control-Allow-Origin":"*",
      "Content-Type":"application/json",
      "Authorization": "Bearer $token",
    },
  );

  var ans = (json.decode(response.body))[0];
  return StudentModel.forRequests(ans["STU_ID"],ans["STU_NAME"], ans["COUNT"].toString(), ans["DEPT"], ans["YEAR"]);
}