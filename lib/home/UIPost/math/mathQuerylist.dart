import 'dart:convert';

import 'package:flutter/material.dart';


import 'package:fyp/home/UIPost/english/engQueryItem.dart';
import 'package:fyp/home/UIPost/math/mathAnswer.dart';
import 'package:fyp/home/UIPost/math/mathQuery.dart';

import 'package:fyp/login/baseurl.dart';

import 'package:http/http.dart';



// ignore: camel_case_types
class MathQueryList extends StatefulWidget {
  @override
  State<MathQueryList> createState() => _MathQueryListState();
}

// ignore: camel_case_types
class _MathQueryListState extends State<MathQueryList> {
  List<MathQuery> mathlistQuery = [];
  Future<Null> getData() async {
    final response =
        await get(Uri.parse(baseUrl + "mathgetQueries.php"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          mathlistQuery.add(MathQuery.fromJson(i));
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
        margin: EdgeInsets.symmetric(vertical: 25),
        height: 540,
        child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 15),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.white,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => MathAnswer(mathlistQuery[index])
                      //builder: (context) => NepAnswer(neplistQuery[index])
                    
                      );
                     
                },
                child: engQueryItem(mathlistQuery[index].mathquery)),
            separatorBuilder: (_, index) => SizedBox(
                  height: 15,
                ),
            itemCount: mathlistQuery.length)
            );
    
  }
}
