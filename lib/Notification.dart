import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Notfi extends StatefulWidget {
  const Notfi({Key? key}) : super(key: key);

  @override
  State<Notfi> createState() => _NotfiState();
}

class _NotfiState extends State<Notfi> {
  Future<dynamic> getData() async {
    var response=await get(Uri.parse("http://192.168.0.183/Globe trotting/API/view_notification.php"));
    var res=jsonDecode(response.body);
    return res;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: 4,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("title"),
            subtitle: Text("content"),
          );
        },

      ),



    );
  }
}
