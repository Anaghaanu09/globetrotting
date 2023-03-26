import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Notfic extends StatefulWidget {
  const Notfic({Key? key}) : super(key: key);

  @override
  State<Notfic> createState() => _NotficState();
}

class _NotficState extends State<Notfic> {
  Future<dynamic> getData() async {
    var response=await get(Uri.parse("http://192.168.0.183/Globe trotting/API/view_notification.php"));
    var res=jsonDecode(response.body);
    return res;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(

          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data![index]['title']),
                      subtitle: Text(snapshot.data![index]['content']),
// trailing: Text('date'),
                    );
                  }

              );
            }
            else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(),);
            }
            else {
              return Center(child: Text('No Notifications'));
            }
          }
      ),
    );
  }}