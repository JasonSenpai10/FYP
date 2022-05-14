import 'package:flutter/material.dart';


import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import 'baseurl.dart';
import 'package:fyp/globals.dart' as global;



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future login() async {
    Uri url = Uri.parse(baseUrl + 'login.php');
    var response = await http.post(url, body: {
      "username": user.text,
      "password": pass.text,
    });

    final _body = response.body;
    var data = jsonDecode(_body);
    if (user.text == "" || pass.text == "") {
      Fluttertoast.showToast(
        msg: "Please fill up the field! ",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        fontSize: 16.0,
      );
    } else {
      if (data != "Error") {
        global.username = data.toString();
       
     
     
        // await FlutterSession().set('token', user.text);
        Fluttertoast.showToast(
            msg: "Login Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pushNamed(context, "home");
      } else {
        Fluttertoast.showToast(
            msg: "Username or password incorrect",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
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
                  left: MediaQuery.of(context).size.width * 0.3,
                  top: MediaQuery.of(context).size.height * 0.9),
              // child: Text(
              //   "Ask me?",
              //   style: TextStyle(color: Colors.white, fontSize: 40),
              // ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    left: 40,
                    right: 40,
                    top: MediaQuery.of(context).size.height * 0.4),
                child: Column(
                  children: [
                    Text("Ask me?",
                        style: TextStyle(color: Colors.white, fontSize: 40)),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: user,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Username',
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MaterialButton(
                          color: Colors.blueAccent,
                         // shape: CircleBorder(),
                          onPressed: () {
                            login();
                            //Navigator.pushNamed(context, "home");
                          },
                          child: Text("Login"),
                          //icon: Icon(Icons.arrow_forward),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'signup');
                          },
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Not created an account?"),
                              SizedBox(width: 10,),
                              Text(
                                'Sign up',
                                style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
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
