import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:fyp/home/UIPost/math/math.dart';
import 'package:fyp/home/UIPost/math/mathQuery.dart';




import 'package:fyp/login/baseurl.dart';


import 'package:http/http.dart';

class MathAnswer extends StatefulWidget {
  final MathQuery query;
  MathAnswer(this.query);

  @override
  State<MathAnswer> createState() => _MathAnswerState();
}

class _MathAnswerState extends State<MathAnswer> {
  TextEditingController answer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        height: 400,
        child: Column(
          children: [
            Card(
              color: Colors.blue,
              child: ListTile(
                title: Text(widget.query.mathquery),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: answer,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'post your answer'),
                  maxLines: 5,
                         minLines: 1,
            ),
            ElevatedButton(
              onPressed: () async {
                Uri url = Uri.parse(baseUrl + "mathanswer.php");
                var response = await post(url, body: {
                  "answer": answer.text,
                  "qid": widget.query.id,
                });
                // var data = json.decode(response.body);

                final _body = response.body;
                var data = jsonDecode(_body);
                if (answer.text == "") {
                  Fluttertoast.showToast(
                    msg: "Please submit the form",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 3,
                    fontSize: 16.0,
                  );
                } else {
                  //var data = json.decode(response.body);
                  if (data == "Success") {
                    Fluttertoast.showToast(
                        msg: "Submitted",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Math()));
                  } else {
                    Fluttertoast.showToast(
                        msg: "Submit failed",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                }
              },
              child: Text("Submit"),
            ),
            Card(
              color: Colors.blue,
              child: ListTile(
                title: Text('ok'),
              ),
            ),
          ],
        ));
  }
}