import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project2/viewmore.dart';

import 'booking.dart';


class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  var name = TextEditingController();
  var about = TextEditingController();
  var amount = TextEditingController();
  var details = TextEditingController();
  Future<void> getData() async {
    var data= {
    "Name":name.text,
    "About":about.text,
    "Amount":amount.text,
      "Details":details.text,
  };
    var response=await post(Uri.parse("http:// 192.168.0.183/Globe trotting/place_view.php"),body:data);
    print(response.body);
    var res = jsonDecode(response.body);
    print(res);
    return res;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Book your package"),
          centerTitle: true,
        ),
        body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset("assets/image/news-1.jpg",
                    width: 250,height: 200,),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                         hintText: "Name",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: about,
                      decoration: InputDecoration(
                         hintText: "About",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: amount,
                      decoration: InputDecoration(
                         hintText: "Amount",
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: details,
                      decoration: InputDecoration(
                        hintText: "Details",
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Facility:Room,Transportation,Meals",style: TextStyle(fontSize: 20),),

                  ),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Book()),
                    );
                  },child: Text("Book Now")),
                ],
              ),
            )
        )
    );
  }
}
