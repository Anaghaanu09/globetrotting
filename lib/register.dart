import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:project2/home.dart';
import 'package:project2/submit.dart';

import 'booking.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var name=TextEditingController();
  var email =TextEditingController();
  var mobile =TextEditingController();
  var user=TextEditingController();
  var password=TextEditingController();
  Future<void> postData() async{
    var data={
      "name":name.text,
    "email":email.text,
    "mobile":mobile.text,
      "user":user.text,
      "password":password.text,
    };
    var response= await post(Uri.parse("http://192.168.0.183/Globe trotting/API/register.php"),body:data);
    if(response.statusCode==200){
      var res = jsonDecode(response.body)["message"];
      if(res=='Added'){
        Fluttertoast.showToast(msg: 'Successfully Registered...');
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return Login();
          },
        ));
      }

    }
    else {
      Fluttertoast.showToast(msg: 'Something went wrong!');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Register Your Account",style: TextStyle(fontSize: 20),),

            Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                        ),
                        labelText: "Name", hintText: "enter your name",
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelText: "Email id", hintText: "enter your email id",
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    keyboardType:TextInputType.number,
                    controller: mobile,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelText: "Mobile number", hintText: "enter your  Mobile number",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: user,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Username", hintText: "enter your Username",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "password", hintText: "enter your Password",
                    ),
                  ),
                ),

                ElevatedButton(onPressed: () {
                  postData();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                }, child: Text("SIGNUP")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
