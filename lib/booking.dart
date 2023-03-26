import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

class Book extends StatefulWidget {
  const Book({Key? key}) : super(key: key);

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  var amount=TextEditingController();
  var date=TextEditingController();
  void getData() {
    var data ={
      "amount":amount.text,
    "date":date.text,
  };
    var response=post(Uri.parse("http://192.168.0.183/Globe trotting/API/add_booking.php"),body:data);
    print(response);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking"),
        centerTitle: true,
      ),
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0,top: 25,right:25),
              child: TextField(
                decoration: InputDecoration(labelText: "Amount"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left:25.0,top:25,right: 25),
              child: TextField(
                controller: date,
                decoration: InputDecoration(

                    labelText: "Date"),
                onTap: ()async{
                  DateTime? datepick=await showDatePicker(context: context,
                      initialDate: DateTime.now(),
                      firstDate:DateTime(2000),
                      lastDate:DateTime(2025));
                  if(datepick!=null){
                    print('Date selected:${datepick.year}-${datepick.month}-${datepick.day}');
                  }
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(onPressed: (){
              Fluttertoast.showToast(msg: "Bookking Confirmed");
            }, child: Text("Book")),


              ],
        ),
    );
  }
}
