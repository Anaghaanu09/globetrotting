import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewMore extends StatefulWidget {
  const ViewMore({Key? key}) : super(key: key);

  @override
  State<ViewMore> createState() => _ViewMoreState();
}

class _ViewMoreState extends State<ViewMore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Image.asset(""),
                Text("Name"),
                SizedBox(
                  height: 15,
                ),
                Text("About"),
                Text("Details"),
                Text("Amount"),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Text("Fecility"),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
