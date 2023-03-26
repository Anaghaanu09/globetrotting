import 'package:flutter/material.dart';

class List1 extends StatefulWidget {
  const List1({Key? key}) : super(key: key);

  @override
  State<List1> createState() => _List1State();
}

class _List1State extends State<List1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: ListView.separated(itemBuilder: (context,index){
      return ListTile(title:
      Text("example,${index+1}"),
        subtitle: Text("List"),
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