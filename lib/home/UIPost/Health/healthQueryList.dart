import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:fyp/home/UIPost/Health/healthAnswer.dart';
import 'package:fyp/home/UIPost/Health/healthQuery.dart';

import 'package:fyp/home/UIPost/english/engQueryItem.dart';
import 'package:fyp/login/baseurl.dart';



import 'package:http/http.dart';



// ignore: camel_case_types
class HealthQueryList extends StatefulWidget {
  @override
  State<HealthQueryList> createState() => _HealthQueryListState();
}

// ignore: camel_case_types
class _HealthQueryListState extends State<HealthQueryList> {
  List<HealthQuery> healthlistQuery = [];
  Future<Null> getData() async {
    final response =
        await get(Uri.parse(baseUrl + "healthgetQueries.php"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          healthlistQuery.add(HealthQuery.fromJson(i));
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
                      builder: (context) => HealthAnswer(healthlistQuery[index])
                   
                    
                      );
                     
                },
                child: engQueryItem(healthlistQuery[index].healthquery)),
            separatorBuilder: (_, index) => SizedBox(
                  height: 15,
                ),
            itemCount: healthlistQuery.length)
            );
    
  }
}
