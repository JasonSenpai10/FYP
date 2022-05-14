import 'dart:convert';

import 'package:flutter/material.dart';


import 'package:fyp/home/UIPost/english/engQueryItem.dart';

import 'package:fyp/home/UIPost/other/otherAmswer.dart';

import 'package:fyp/home/UIPost/other/otherQuery.dart';
import 'package:fyp/login/baseurl.dart';

import 'package:http/http.dart';



// ignore: camel_case_types
class OtherQueryList extends StatefulWidget {
  @override
  State<OtherQueryList> createState() => _OtherQueryListState();
}

// ignore: camel_case_types
class _OtherQueryListState extends State<OtherQueryList> {
  List<OtherQuery> otherstQuery = [];
  Future<Null> getData() async {
    final response =
        await get(Uri.parse(baseUrl + "othergetQueries.php"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          otherstQuery.add(OtherQuery.fromJson(i));
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
                      builder: (context) => OtherAnswer(otherstQuery[index])
                     
                    
                      );
                     
                },
                child: engQueryItem(otherstQuery[index].otherquery)),
            separatorBuilder: (_, index) => SizedBox(
                  height: 15,
                ),
            itemCount: otherstQuery.length)
            );
    
  }
}
