import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Hist extends StatefulWidget {
  const Hist({Key? key}) : super(key: key);

  @override
  State<Hist> createState() => _HistState();
}

class _HistState extends State<Hist> {
  Future<dynamic>getData()async{
    var response=await get(Uri.parse("http://192.168.0.183/Globe trotting/API/booking_history.php"));
    var res=jsonDecode(response.body);
    return res;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        centerTitle: true,
      ),
      body:Center(
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: 4,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("Place"),
              subtitle: Text("Amount"),
              trailing: Text("Date"),
            );
          },

        ),
      ),
    );
  }
}
