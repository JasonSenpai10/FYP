import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:fyp/home/UIPost/science/Query.dart';
import 'package:fyp/home/UIPost/science/QueryAnswer.dart';
import 'package:fyp/home/UIPost/science/science.dart';
import 'package:fyp/login/baseurl.dart';
import 'package:http/http.dart';

class QueryDetail extends StatefulWidget {
  final Query query;
  QueryDetail(this.query);

  @override
  State<QueryDetail> createState() => _QueryDetailState();
}

class _QueryDetailState extends State<QueryDetail> {
   TextEditingController answer = TextEditingController();
  List<QueryAnswer> listAnswer = [];
  
  Future<Null> getData() async {
    
    final response =
        await get(Uri.parse(baseUrl + "getAnswer.php?qid=" + widget.query.id));
    
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          listAnswer.add(QueryAnswer.fromJson(i));
        }
      });
    }
    
   }


   @override
  void initState() {
    super.initState();
    getData();
  }

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
                title: Text(widget.query.query),
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
                Uri url = Uri.parse(baseUrl + "answer.php");
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
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Science()));
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
           Flexible(
             child: ListView.builder(scrollDirection: Axis.vertical, itemCount: listAnswer.length, itemBuilder: ((context, index) => Column(
               children: [
                 ListTile(
                   title: Text(listAnswer.length > 0
                        ? QueryAnswer(
                                 answer: listAnswer[index].answer, qid: listAnswer[index].qid)
                            .answer
                       : 'No answers'),
                 ),
                //  Text(listAnswer.length > 0
                //      ? QueryAnswer(
                //               answer: listAnswer[index].answer, qid: listAnswer[index].qid)
                //          .answer
                //     : 'No answers'),
               ],
             ) ), shrinkWrap: true, physics: ScrollPhysics(),),
           )
            
              ] ));
            
          
        
  }
}
