import 'package:flutter/material.dart';

import '../../globals.dart' as globals;


class Header extends StatefulWidget {
  @override
  _HeaderDrawerState createState() => _HeaderDrawerState();
}

class _HeaderDrawerState extends State<Header> {
  void logout() {
    setState(() {
      globals.username = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: double.infinity,
      height: 170,
      padding: EdgeInsets.only(top: 20.0),
      child: 
           Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                //margin: EdgeInsets.all(10),
                height: 90,
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 50,
                  child: Text(
                    globals.username.substring(0, 1).toUpperCase(),
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 38),
                child: Column(
                  
                  children: [
                    Row(
                      children: [
                        Text("Hello", style: TextStyle(color: Colors.white, fontSize: 20),),
                        SizedBox(width: 10,),
                    Text(
                      globals.username,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                      ],
                    ),
                    
                    MaterialButton(
                      color: Colors.greenAccent,
                      height: 25,
                      child: Text(
                        'LogOut',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "login");
                      },
                    ),
                  ],
                ),
              ),
            ]),
          
    );
  }
}
