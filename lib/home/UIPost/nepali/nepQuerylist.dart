import 'dart:convert';

import 'package:flutter/material.dart';


import 'package:fyp/home/UIPost/english/engQueryItem.dart';
import 'package:fyp/home/UIPost/nepali/nepAnswer.dart';
import 'package:fyp/home/UIPost/nepali/nepQuery.dart';
import 'package:fyp/login/baseurl.dart';

import 'package:http/http.dart';



// ignore: camel_case_types
class NepQueryList extends StatefulWidget {
  @override
  State<NepQueryList> createState() => _NepQueryListState();
}

// ignore: camel_case_types
class _NepQueryListState extends State<NepQueryList> {
  List<NepQuery> neplistQuery = [];
  Future<Null> getData() async {
    final response =
        await get(Uri.parse(baseUrl + "nepgetQueries.php"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          neplistQuery.add(NepQuery.fromJson(i));
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
                      builder: (context) => NepAnswer(neplistQuery[index])
                      //builder: (context) => NepAnswer(neplistQuery[index])
                    
                      );
                     
                },
                child: engQueryItem(neplistQuery[index].nepquery)),
            separatorBuilder: (_, index) => SizedBox(
                  height: 15,
                ),
            itemCount: neplistQuery.length)
            );
    
  }
}
