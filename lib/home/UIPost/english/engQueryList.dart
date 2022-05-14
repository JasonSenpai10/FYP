import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:fyp/home/UIPost/english/engAnswer.dart';
import 'package:fyp/home/UIPost/english/engQuery.dart';
import 'package:fyp/home/UIPost/english/engQueryItem.dart';
import 'package:fyp/login/baseurl.dart';

import 'package:http/http.dart';



// ignore: camel_case_types
class engQueryList extends StatefulWidget {
  @override
  State<engQueryList> createState() => _engQueryListState();
}

// ignore: camel_case_types
class _engQueryListState extends State<engQueryList> {
  List<engQuery> englistQuery = [];
  Future<Null> getData() async {
    final response =
        await get(Uri.parse(baseUrl + "enggetQueries.php"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          englistQuery.add(engQuery.fromJson(i));
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
                      builder: (context) => engQueryDetail(englistQuery[index])
                    
                      );
                     
                },
                child: engQueryItem(englistQuery[index].engquery)),
            separatorBuilder: (_, index) => SizedBox(
                  height: 15,
                ),
            itemCount: englistQuery.length)
            );
    
  }
}
