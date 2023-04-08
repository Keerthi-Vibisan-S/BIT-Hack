import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:special_lab_dashboard/Models/FacultyModel.dart';
import 'package:special_lab_dashboard/Models/RequestModel.dart';
import 'package:special_lab_dashboard/Models/SpecialLabModel.dart';
import 'package:special_lab_dashboard/Models/StudentModel.dart';


// const API_LINK = "http://10.30.10.10:3001/";
// const API_LINK = "http://127.0.0.1:3000/";
// http://10.30.10.10:3001/
// const API_LINK = "http://localhost:3000/";

const API_LINK = "http://10.10.237.157:3000/";

// const API_LINK = "http://10.10.237.157/";
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
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.setString("user-id", value);
  }).catchError((err){
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
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.setString("user-id", value);
  }).catchError((err){
    return err;
  });

  return json.decode(res.body);
}

dynamic postRequestToChangeSP(String? fromFacId, String? toFacId, String? head_id, String? reason, String? from_lab, String? to_lab) async{
  var res;
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? token = preferences.getString("token");
  // print({
  //   "from_lab_faculty_id": fromFacId,
  //   "to_lab_faculty_id": toFacId,
  //   "head_id": "1000",
  //   "reason": reason,
  //   // "from_lab_name" : from_lab,
  //   // "to_lab_name" : to_lab
  // });
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
    return "Success";
  }).catchError((err){
    return "Error";
  });
}

getSpecialLabs() async{
  var res;
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? token = preferences.getString("token");
  http.Response? response ;
  try{
    response = await http.get(Uri.parse("${API_LINK}labs/getLabs"),
      headers: {
        "content-type" : "application/json",
        "Authorization" : "Bearer ${token!}",
      },
    );
    res = response.body;
    List<SpecialLab> slobjs= [];
    var ans = json.decode(res);
    for(var sl in ans) {
      slobjs.add(SpecialLab(sl["LAB_ID"], sl["LAB_NAME"], sl["LAB_HEAD_ID"]));
    }
    return slobjs;
  }catch(err){
    if(response?.statusCode == 401){
      print("session expired");
      return [];
    }
  }

  // return json.decode(res.body);
}

getDataForAdminDashboard() async{
  int res = 0;
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? token = preferences.getString("token");
  http.Response response = await http.get(
      Uri.parse("${API_LINK}getAllCount/get"),
    headers: {
    "Access-Control-Allow-Origin":"*",
    "Content-Type":"application/json",
    "Authorization": "Bearer ${token!}",
  },);
  print(response.statusCode.toString());
  if(response.statusCode == 401){
    return {"error":"session expired"};
  }
  return jsonDecode(response.body);
}

getAllspclabs() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? token = preferences.getString("token");
  http.Response response = await http.get(
    Uri.parse("${API_LINK}labs/getAllLabsDetail"),
    headers: {
      "Access-Control-Allow-Origin":"*",
      "Content-Type":"application/json",
      "Authorization": "Bearer ${token!}",
    },);
  return jsonDecode(response.body);
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
  print("Token : "+token);
  http.Response response =  await http.get(
      Uri.parse("${API_LINK}faculty/getStudents"),
      headers: {
        "Access-Control-Allow-Origin":"*",
        "Content-Type":"application/json",
        "Authorization": "Bearer $token",
      },
  );

  print("getAllStudentUnderFaculty response "+response.body);

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
    Uri.parse("${API_LINK}faculty/getReqStudents"),
    headers: {
      "Access-Control-Allow-Origin":"*",
      "Content-Type":"application/json",
      "Authorization": "Bearer $token",
    },
  );
  List<RequestModel> joiningRequests = [];
  List<RequestModel> leavingRequests = [];
  print("All requests : "+response.body);
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



postApprovalOfLabFaculty(String where,String req_id,String stu_id,String decision) async
{
  SharedPreferences pref = await SharedPreferences.getInstance();
  var token = pref.getString("token");
  print("token "+token.toString());
  // print({
  //   "r_id": req_id.toString(),
  //   "stu_id": stu_id,
  //   "decision":decision
  // });
  http.Response response = await http.patch(
    Uri.parse("${API_LINK}request/$where"),
    headers: {
      "Access-Control-Allow-Origin":"*",
      "Content-Type":"application/json",
      "Authorization": "Bearer $token",
    },
    body: json.encode({
        "r_id": req_id.toString(),
        "stu_id": stu_id,
        "decision":decision
    })
  );
  print("Decision respone");
  // print(response.body);
}




adminLogin(var details) async {
  // print(json.encode(details));
  await http.post(
    Uri.parse("${API_LINK}authenticate/adminverify"),
    headers: {
      "content-type" : "application/json",
    },
    body:json.encode(details),
  ).then((v)
  {
    return json.decode(v.body.toString());
  }).catchError((err){
    return err;
  });
}


Future<List<RequestModel>> getAdminRequests() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  var token = pref.getString("token");
  List<RequestModel> requests = [];
  await http.get(
    Uri.parse("${API_LINK}admin/getPendingRequests"),
    headers: {
      "Access-Control-Allow-Origin":"*",
      "Content-Type":"application/json",
      "Authorization": "Bearer $token",
    },
  ).then((value){
    try{
      var res = json.decode(value.body);
      for(var i in res){
        StudentModel student =  StudentModel.forRequests(i["STU_ID"], i["STU_NAME"], 0.toString(), i["DEPT"], i["YEAR"]);
        RequestModel request = new RequestModel.forAdmin(i["R_ID"].toString(), student, i["FROM_LAB_FAC_ID"], i["TO_LAB_FAC_ID"], i["FROM_APPROVAL"], i["TO_APPROVAL"],i["FROM_LAB"],i["TO_LAB"],i["HEAD_ID"], i["HEAD_APPROVAL"], i["REASON"]);
        requests.add(request);
      }
    }
    catch(err){
      print("Error");
    }

  });
  return requests;
}


adminDecision(String reqId,String studentId,String toLabFacId,String decision) async{
  // print("in function");
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");
    http.Response response = await http.post(
      Uri.parse("${API_LINK}admin/adminDecision"),
      headers: {
        "Access-Control-Allow-Origin":"*",
        "Content-Type":"application/json",
        "Authorization": "Bearer $token",
      },
      body:json.encode({
        "req_id": reqId,
        "stu_id": studentId,
        "decision":decision,
        "to_lab_fac_id": toLabFacId
      })
    );
    print(response.body);
}
