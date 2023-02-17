import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

dynamic checkValidUser(String? email) async{
  var res;
  await http.post(Uri.parse("https://b65d-121-200-55-43.in.ngrok.io/authenticate/verify"),
      headers: {
        "content-type" : "application/json"
      },
      body: json.encode({
        "email": email
      })
  ).then((value) async {

    res = value;
    // print(value);
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.setString("user-id", value);
  }).catchError((err)=>{
    print(err)
  });

  return json.decode(res.body.substring(1, res.body.length-1));
}