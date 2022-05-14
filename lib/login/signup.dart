import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

import 'baseurl.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future register(BuildContext cont) async {
    // var url = "http://192.168.1.72/registers.php";
    Uri url = Uri.parse(baseUrl + "register.php");
    var response = await http.post(url, body: {
      "username": user.text,
      "password": pass.text,
    });

    // var data = json.decode(response,body);
    var data = json.decode(response.body);
    if (user.text == "" || pass.text == "") {
      Fluttertoast.showToast(
        msg: "Please fill up the field! ",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,
      );
    } else {
      if (data == "Error") {
        Fluttertoast.showToast(
            msg: "The user already exists",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Registration Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/11.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.25,
                  top: MediaQuery.of(context).size.height * 0.2),
              child: Text(
                "Sign up",
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    left: 40,
                    right: 40,
                    top: MediaQuery.of(context).size.height * 0.3),
                child: Column(
                  children: [
                    TextField(
                      //controller: user,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        //     labelText: "Username",
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),),
                      SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: user,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        //     labelText: "Username",
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'User Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                     SizedBox(
                      height: 10,
                    ),
                    TextField(
                      //controller: user,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        //     labelText: "Username",
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: pass,
                      obscureText: true,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'login');
                          },
                          child: Text(
                            'Sign in Instead',
                            style: TextStyle(color: Colors.blue, fontSize: 18),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            register(context);
                          },
                          child: Text(
                            'Continue',
                            style: TextStyle(color: Colors.blue, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
