import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project2/home.dart';
import 'package:project2/register.dart';
import 'package:project2/submit.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var username=TextEditingController();
  var password=TextEditingController();

  Future<void> postData()async{
    var data={
      "username":username.text,
      "password":password.text,
    };
    var response=await post(Uri.parse('http:// 192.168.0.183/Globe trotting/API/login.php'),body:data);
    var res=jsonDecode(response.body);
    print(res);
    if(response.statusCode==200){
    Fluttertoast.showToast(msg: " User Successfully Loggedin");
      Navigator.push(context, MaterialPageRoute(
          builder: (context) {
        return Booking();
      },
    ));
    }
    else{
      Fluttertoast.showToast(msg: 'Invalid username or password');
    }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("LogIn",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: username,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  labelText: "username", hintText: "enter your username",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  labelText: "password", hintText: "enter your user password",
                ),
                obscureText: true,
              ),
            ),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
              postData();
            },child: Text("Login")),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
            }, child: Text("Don't have an account Register Here!")),
          ],
        ),
      ),
    );
  }
}

