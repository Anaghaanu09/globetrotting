import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Listview extends StatefulWidget {
  const Listview({Key? key}) : super(key: key);

  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(itemBuilder: (context,index){
        return ListTile(title:
        Text("Name,${index+1}"),
          subtitle: Text("about"),
          onTap: (){
            print("on tap pressed");
          },
        );
      },
          separatorBuilder: (context,index){
            return Divider();
          },
          itemCount: 40),
    );

  }
}
