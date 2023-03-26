import 'package:flutter/material.dart';
import 'package:project2/register.dart';
import 'package:project2/submit.dart';
import 'package:project2/viemore2.dart';

import 'booking.dart';
import 'home.dart';
import 'listview.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:Login(),
    );
  }
}
