import 'package:flutter/material.dart';

getFacultyCard()
{
  return Card(
    elevation: 10,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("CH10372",style: TextStyle(fontSize: 10),),
                  )
                ],
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nathan Drake",style: TextStyle(fontWeight: FontWeight.w800),),
                  SizedBox(height: 10,),
                  Text("Chemistry Department",style: TextStyle(fontWeight: FontWeight.w100,fontSize: 11),),
                  Text("Ph. No : 8964093829",style: TextStyle(fontWeight: FontWeight.w100,fontSize: 11),)
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}


renderStudentDetailsCard(dynamic userdetails)
{
  return Card(
    elevation: 10,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 50,
            ),
            Column(
              children: [
                Text("Balasuriya",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text("balasuriya.cs20@bitsathy.ac.in"),
              ],
            ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.end,
            //       children: [
            //         Text("Year"),
            //         Text("Dept"),
            //         Text("Special Lab"),
            //         Text("Lab code"),
            //         Text("Incharge"),
            //         Text("Joined Date"),
            //         Text("History Of Change")
            //       ],
            //     ),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text("3rd year"),
            //         Text("IT"),
            //         Text("Cloud Computing"),
            //         Text("SLB-031"),
            //         Text("Nataraj N"),
            //         Text("29.08.22"),
            //         Text("0")
            //       ],
            //     )
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Year"),
                      SizedBox(height:10),
                      Text("Department"),
                      SizedBox(height:10),
                      Text("Special Lab"),
                      SizedBox(height:10),
                      Text("Lab Code"),
                      SizedBox(height:10),
                      Text("Incharge"),
                      SizedBox(height:10),
                      Text("Joined Date"),
                      SizedBox(height:10),
                      Text("History Of Change"),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(":"),
                      SizedBox(height:10),
                      Text(":"),
                      SizedBox(height:10),
                      Text(":"),
                      SizedBox(height:10),
                      Text(":"),
                      SizedBox(height:10),
                      Text(":"),
                      SizedBox(height:10),
                      Text(":"),
                      SizedBox(height:10),
                      Text(":"),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("3rd Year"),
                      SizedBox(height:10),
                      Text("CS"),
                      SizedBox(height:10),
                      Text("Cloud Computing"),
                      SizedBox(height:10),
                      Text("1"),
                      SizedBox(height:10),
                      Text("Nataraj N"),
                      SizedBox(height:10),
                      Text("29.08.22"),
                      SizedBox(height:10),
                      Text("0"),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}

renderCards(title,count,startcolor,endcolor)
{
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Card(
      elevation: 10,
      child: Container(
        height: 150,
        width: 300,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(startcolor),Color(endcolor)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(title.toString(),style: TextStyle(color: Colors.white,fontSize: 18),),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(count.toString(),style: TextStyle(color: Colors.white,fontSize: 18),)
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}


renderLabAnanlysisBar(labname,int width,int index)
{
  var startcolor = 0xff0249ff;
  var endcolor = 0xffa9c1ff;
  if(index%2 !=0 )
  {
    startcolor = 0xff0610ff;
    endcolor = 0xff9ca0ff;
  }
  return Row(
    children: [
      Expanded(
        flex: width,
        child: ClipRRect(
          borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(startcolor),Color(endcolor)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(labname,style: TextStyle(decoration : TextDecoration.none,fontSize: 15,color: Colors.white,),),
            ),
            alignment: Alignment.centerLeft,
            height: 50,
            width: width.toDouble(),
          ),
        ),
      ),
      Expanded(
          flex: 10-width,
          child: Container())
    ],
  );
}

