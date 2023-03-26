import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2/not2.dart';
import 'package:project2/submit.dart';

import 'Notification.dart';
import 'booking.dart';
import 'history.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
            children:[ Container(
            child:Column(
            children:[Padding(
              padding: const EdgeInsets.only(right: 150.0),
              child: Image.asset("assets/image/slides-1.jpg",width: 150,height: 100,),
            ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0,right: 25),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Name",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:25.0,right: 25),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "About",
                  ),
                ),
              ),
              SizedBox(
                height:9,
                width:15,
              ),
              Padding(
                padding: const EdgeInsets.only(left:100.0),
                child: ElevatedButton(style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking()));
                    }, child: Text("View more")),
              ),
            ]
            ),

            ),
              Container(
                child:Column(
                    children:[
                      Padding(
                        padding: const EdgeInsets.only(right:150.0),
                        child: Image.asset("assets/image/slides-3.jpg",width: 150,height: 100,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0,right: 25),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Name",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0,right: 25),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "About",
                          ),
                        ),
                      ),
                      SizedBox(
                        height:9,
                        width:15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:100.0),
                        child: ElevatedButton(style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking()));
                            }, child: Text("View more")),
                      ),
                    ]
                ),

              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Notfic()));
                      }, child: Text("Notification")),
                  OutlinedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Book()));
                  }, child: Text("Booking")),
                  OutlinedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Hist()));
                  }, child: Text("View History")),

                ],
              ),

    ]

    ),
      ),
      );

  }
}
