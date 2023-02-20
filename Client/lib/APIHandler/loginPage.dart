import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

dynamic checkValidUser(String? email, String? idToken) async{
  var res;
  await http.post(Uri.parse("https://6a40-121-200-55-43.in.ngrok.io/authenticate/verify"),
      headers: {
        "content-type" : "application/json",
      },
      body: json.encode({
        "email": email,
        "token": idToken
      })
  ).then((value) async {
    res = value;
    print("dshsdhdsiuhds ${value.body}");
    return json.decode(res.body);
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.setString("user-id", value);
  }).catchError((err)=>{
    print(err)
  });


}

sendMail(String s, Map map) {

}