
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:special_lab_dashboard/APIHandler/loginPage.dart';
import 'package:special_lab_dashboard/Navigator.dart';
import 'package:special_lab_dashboard/Pages/studenthome.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 20,
        child: Container(
          height: 450,
          width: 750,
          color: Colors.grey,
          child: Row(
            children: [
              Expanded(child: Container(

              )),
              Expanded(
                child: Container(
                  color: Color(0xffeeeeee),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 250,
                        child: Column(
                            children: [
                              SizedBox(height: 20,),
                              TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: "Email  "
                                ),
                              ),
                              SizedBox(height: 20,),
                              TextField(
                                decoration: InputDecoration(
                                    hintText: "Password"
                                ),
                              ),
                              SizedBox(height: 20,),
                              ElevatedButton(onPressed: () async {
                                RegExp re = new RegExp(r"^\w+\.?(\w\w)?(\d\d)?@bitsathy\.ac\.in$");
                                var iter = re.firstMatch(emailController.text);
                                var match = iter?.groups([1, 2]);
                                var role;
                                if(match?[0] != null) {
                                  role = "Student";
                                  await checkValidUser(emailController.text).then((v) =>{
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentHome(v)))
                                  });
                                }
                                else
                                  role = "Teacher";

                                Navigator.push(context, MaterialPageRoute(builder: (context) => NavigatorPage(role)));

                              }, child: Text("Login")),
                              SizedBox(height: 20,),
                              Text("Forget Password"),
                              SizedBox(height: 20,),
                              Text("Or continue with Google"),
                            ],
                          ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}



//
// // Figma Flutter Generator Desktop1Widget - FRAME
// Container(
// width: 1440,
// height: 1024,
// decoration: BoxDecoration(
// color : Color.fromRGBO(255, 255, 255, 0.8500000238418579),
// ),
// child: Stack(
// children: <Widget>[
// Positioned(
// top: 295,
// left: 391,
// child: Container(
// width: 657,
// height: 433,
//
// child: Stack(
// children: <Widget>[
// Positioned(
// top: 0,
// left: 1,
// child: Container(
// width: 656,
// height: 433,
// decoration: BoxDecoration(
// borderRadius : BorderRadius.only(
// topLeft: Radius.circular(1),
// topRight: Radius.circular(1),
// bottomLeft: Radius.circular(1),
// bottomRight: Radius.circular(1),
// ),
// boxShadow : [BoxShadow(
// color: Color.fromRGBO(0, 0, 0, 0.05000000074505806),
// offset: Offset(0,0),
// blurRadius: 0
// )],
// color : Color.fromRGBO(238, 238, 238, 1),
// )
// )
// ),
// Positioned(
// top: 0,
// left: 0,
// child: Container(
// width: 329,
// height: 433,
// decoration: BoxDecoration(
// color : Color.fromRGBO(217, 217, 217, 1),
// )
// )
// ),
// Positioned(
// top: 308,
// left: 446,
// child: Text('Forgot Password?',
// textAlign: TextAlign.left,
// style: TextStyle(
//
// fontFamily: 'Inter',
// fontSize: 9.5,
// letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
// fontWeight: FontWeight.normal,
// height: 1
// ),)
// ),Positioned(
// top: 253,
// left: 389,
// child: Container(
// decoration: BoxDecoration(
// color : Color.fromRGBO(255, 138, 138, 1),
// ),
// padding: EdgeInsets.symmetric(horizontal: 82, vertical: 14),
// child: Row(
// mainAxisSize: MainAxisSize.min,
//
// children: <Widget>[
// Text('LOGIN', textAlign: TextAlign.left, style: TextStyle(
// color: Color.fromRGBO(0, 0, 0, 1),
// fontFamily: 'Inter',
// fontSize: 10,
// letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
// fontWeight: FontWeight.normal,
// height: 1
// ),),
//
// ],
// ),
// )
// ),Positioned(
// top: 355,
// left: 421,
// child: Text('Or Continue With', textAlign: TextAlign.left, style: TextStyle(
// color: Color.fromRGBO(0, 0, 0, 1),
// fontFamily: 'Inter',
// fontSize: 10,
// letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
// fontWeight: FontWeight.normal,
// height: 1
// ),)
// ),Positioned(
// top: 159,
// left: 388,
// child: Container(
// width: 205,
// height: 15,
//
// child: Stack(
// children: <Widget>[
// Positioned(
// top: 0,
// left: 1,
// child: TextField()
// ),Positioned(
// top: 15,
// left: 0,
// child: Divider(
// color: Color.fromRGBO(0, 0, 0, 1),
// thickness: 0.5
// )
//
// ),
// ]
// )
// )
// ),Positioned(
// top: 205,
// left: 389,
// child: Container(
// width: 204,
// height: 15,
//
// child: Stack(
// children: <Widget>[
// Positioned(
// top: 0,
// left: 0.995121955871582,
// child: TextField()
// ),Positioned(
// top: 15,
// left: 0,
// child: Divider(
// color: Color.fromRGBO(0, 0, 0, 1),
// thickness: 0.5
// )
//
// ),
// ]
// )
// )
// ),Positioned(
// top: 56,
// left: 452,
// child: Container(
// width: 87.87602996826172,
// height: 37,
//
// child: Stack(
// children: <Widget>[
// Positioned(
// top: 9,
// left: 0,
// child: Text('Camps', textAlign: TextAlign.left, style: TextStyle(
// color: Color.fromRGBO(0, 0, 0, 1),
// fontFamily: 'Paprika',
// fontSize: 20,
// letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
// fontWeight: FontWeight.normal,
// height: 1
// ),)
// ),Positioned(
// top: 0,
// left: 59.9635009765625,
// child: Transform.rotate(
// angle: -21.49999928013559 * (3.14 / 180),
// child: Container(
// width: 29.999996185302734,
// height: 18.999998092651367,
// decoration: BoxDecoration(
// image : DecorationImage(
// image: AssetImage('assets/images/Pngwing1.png'),
// fit: BoxFit.fitWidth
// ),
// )
// ),
// )
// ),
// ]
// )
// )
// ),Positioned(
// top: 343,
// left: 509,
// child: Container(
// width: 35,
// height: 35,
//
// child: Stack(
// children: <Widget>[
// Positioned(
// top: 0,
// left: 0,
// child: Container(
// width: 35,
// height: 35,
// decoration: BoxDecoration(
// borderRadius : BorderRadius.only(
// topLeft: Radius.circular(20),
// topRight: Radius.circular(20),
// bottomLeft: Radius.circular(20),
// bottomRight: Radius.circular(20),
// ),
// boxShadow : [BoxShadow(
// color: Color.fromRGBO(0, 0, 0, 0.05000000074505806),
// offset: Offset(0,0),
// blurRadius: 0
// )],
// color : Color.fromRGBO(242, 242, 242, 1),
// )
// )
// ),Positioned(
// top: 4,
// left: 4,
// child: Container(
// width: 27,
// height: 27,
// decoration: BoxDecoration(
// image : DecorationImage(
// image: AssetImage('assets/images/Googlelogo98081.png'),
// fit: BoxFit.fitWidth
// ),
// )
// )
// ),
// ]
// )
// )
// ),
// ]
// )
// )
// ),
// ]
// )
// );