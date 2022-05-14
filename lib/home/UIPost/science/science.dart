import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:fyp/login/baseurl.dart';
import 'package:http/http.dart' as http;

import 'query_list.dart';

class Science extends StatefulWidget {
  const Science({Key? key}) : super(key: key);

  @override
  State<Science> createState() => _ScienceState();
}

class _ScienceState extends State<Science> {
  TextEditingController queries = TextEditingController();

  Future postQueries() async {
    Uri url = Uri.parse(baseUrl + "queries.php");
    var response = await http.post(url, body: {
      "queries": queries.text,
    });

    final _body = response.body;
    var data = jsonDecode(_body);
    if (queries.text == "") {
      Fluttertoast.showToast(
        msg: "Please fill up the field! ",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        fontSize: 16.0,
      );
    } else {
      if (data == "Success") {
        Fluttertoast.showToast(
            msg: "Submitted",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Science()));
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

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
        backgroundColor: Colors.blueAccent,
       //title: Text("Ask me? ?"),
      ));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
            child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                title: Text('Science'),
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Ask  your science question'),
                controller: queries,
                maxLines: 5,
                         minLines: 1,
              ),
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: () {
                    postQueries();
                  },
                  child: Text("Submit"),
                ),
              ),
              QueryList(),
            ],
          ),
        ))
      ],
    ));
  }
}
