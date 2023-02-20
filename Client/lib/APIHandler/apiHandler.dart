import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:special_lab_dashboard/SpecialLab.dart';

dynamic checkValidUser(String? email, String? idToken) async{
  var res;
  await http.post(Uri.parse("https://6a40-121-200-55-43.in.ngrok.io/authenticate/verify"),
      headers: {
        "content-type" : "application/json",
      },
      body: json.encode({
        "email": email,
        "token": idToken!
      })
  ).then((value) async {
    res = value;
    print(value);
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.setString("user-id", value);
  }).catchError((err)=>{
    print(err)
  });

  return json.decode(res.body);
}

dynamic postRequestToChangeSP(String? fromFacId, String? toFacId, String? head_id, String? reason) async{
  var res;
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? token = preferences.getString("idToken");
  await http.post(Uri.parse("https://6a40-121-200-55-43.in.ngrok.io/authenticate/verify"),
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
    print(value);
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.setString("user-id", value);
  }).catchError((err)=>{
    print(err)
  });

  return json.decode(res.body);
}

Future<List<SpecialLab>> getSpecialLabs() async{
  var res;
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? token = preferences.getString("idToken");
  print("Token : "+token.toString());
  await http.get(Uri.parse("https://6a40-121-200-55-43.in.ngrok.io/labs/getLabs"),
      headers: {
        "content-type" : "application/json",
        "Authorization" : "Bearer "+token!
      },
  ).then((value) async {
    print("IN");
    res = value;
    print(value);
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.setString("user-id", value);
  }).catchError((err)=>{
    print(err)
  });
  List<SpecialLab> slobjs= [];
  var ans = json.decode(res);
  for(var sl in ans)
    {
      slobjs.add(new SpecialLab(sl["LAB_ID"], sl["LAB_NAME"], sl["LAB_HEAD_ID"]));
    }
  return slobjs;

  // return json.decode(res.body);
}