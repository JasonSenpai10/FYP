import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/globals.dart';
import 'package:fyp/login/baseurl.dart';
import 'package:http/http.dart' as http;

class Feedbacks extends StatefulWidget {
  const Feedbacks({Key? key}) : super(key: key);

  @override
  _FeedbacksState createState() => _FeedbacksState();
}

class _FeedbacksState extends State<Feedbacks> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController feedback = TextEditingController();

  Future Feedbacks(BuildContext cont) async {
    
    Uri url = Uri.parse(baseUrl + "feedback.php");
    var response = await http.post(url, body: {
      "username": username.text,
      "email": email.text,
      'feedback': feedback.text
    });

    // var data = json.decode(response,body);
    var data = json.decode(response.body);
    if (username.text == "" || email.text == "" || feedback.text == "" ) {
      Fluttertoast.showToast(
        msg: "Please fill up the field! ",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,
      );
    } else {
      if (data == "Error") {
        Fluttertoast.showToast(
            msg: "Something went wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Feedback Success",
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
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/11.jpg'), fit: BoxFit.cover)),
       
        child: Align(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text("Thank you for taking your time to make ASK ME ? better", style: TextStyle(fontSize: 20),),
                SizedBox(height: 20,),
                Text("You can request course, give suggestion or report any bugs", style: TextStyle(fontSize: 20),),
                SizedBox(height: 30,),
                TextField(
                  controller: username,
                          
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                ),
                SizedBox(height: 30,),
                TextField(
                  controller: email,
                          
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                ),
                 SizedBox(height: 30,),
                TextField(
                  
                  controller: feedback,
                          
                         style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Feedback, Suggestion or feature request',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                           maxLines: 5,
                           minLines: 1,
                ),
              
                
                ElevatedButton(onPressed: (){
                    if (username.text == "" || feedback.text == "" || email.text == "") {
                       Fluttertoast.showToast(
                       msg: "Please fill up the field! ",
                       toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                       fontSize: 16.0,
                     );
                    }else{ Feedbacks(context);}
                }, child: Text("Submit")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
