import 'package:flutter/material.dart';

import '../Components.dart';

class LabSwitchPage extends StatefulWidget {
  const LabSwitchPage({Key? key}) : super(key: key);

  @override
  State<LabSwitchPage> createState() => _LabSwitchPageState();
}

class _LabSwitchPageState extends State<LabSwitchPage> {
  var switfrom = TextEditingController(text: "Cloud Computing");
  var switto = TextEditingController();

  List specialLabs = [
    "AR/ VR",
    "Mobile And App",
    "Ind Auto",
    "IoT"
  ];


  // @override
  // void initState() {
  //
  //   for (var i = 0; i < specialLabs.length; i++) {
  //     specialLabs.add(
  //       {
  //         'label': i,
  //         'value': i,
  //         'icon': Container(
  //           // key: UniqueKey(),
  //           height: 20,
  //           width: 20,
  //
  //           ),
  //         'selectedIcon': Container(
  //           key: UniqueKey(),
  //           width: 20,
  //           height: 20,
  //         ),
  //       },
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff210368),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left:8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.dashboard,color: Colors.white,),
                    SizedBox(height: 20,),
                    Icon(Icons.swap_horiz,color: Colors.white,),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 40,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width: MediaQuery.of(context).size.width - 30,
                  color: Color(0xfffdfeff),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(child: Text("Portal",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 30),)),
                            CircleAvatar(),
                            SizedBox(width: 20,),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Row(
                                children: [
                                  Icon(Icons.logout),
                                  Text("Logout")
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 80,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 2, child: Container(),),
                            Expanded(
                              flex: 4,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(56.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Switching From"),
                                      SizedBox(height: 10,),
                                      Container(
                                        color: Colors.grey,
                                        child: TextField(
                                          controller: switfrom,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(15))
                                            ),
                                          ),
                                          style: TextStyle(fontSize: 12.5),
                                          readOnly: true,
                                        ),
                                      ),
                                      SizedBox(height: 20,),
                                      Text("Switching To"),
                                      SizedBox(height: 10,),
                                      // Container(
                                      //   color: Colors.grey,
                                      //   child: CoolDropdown(dropdownList: specialLabs, onChange: (selectedItem) {
                                      //     print(selectedItem);
                                      //   })
                                      // ),
                                      SizedBox(height: 20,),
                                      Text("Reason"),
                                      SizedBox(height: 10,),
                                      Container(
                                        color: Colors.grey,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(15))
                                            ),
                                            hintText: "Write here..."
                                          ),
                                          maxLines: 5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ),

                            Expanded(flex: 3, child: Container(),)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
