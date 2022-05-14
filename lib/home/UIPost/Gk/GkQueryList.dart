import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp/home/UIPost/Gk/GkAnswer.dart';
import 'package:fyp/home/UIPost/Gk/GkQuery.dart';



import 'package:fyp/home/UIPost/english/engQueryItem.dart';
import 'package:fyp/login/baseurl.dart';



import 'package:http/http.dart';



// ignore: camel_case_types
class GkQueryList extends StatefulWidget {
  @override
  State<GkQueryList> createState() => _GkQueryListState();
}

// ignore: camel_case_types
class _GkQueryListState extends State<GkQueryList> {
  List<GkQuery> gklistQuery = [];
  Future<Null> getData() async {
    final response =
        await get(Uri.parse(baseUrl + "gkgetQueries.php"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          gklistQuery.add(GkQuery.fromJson(i));
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
                      builder: (context) => GkAnswer(gklistQuery[index])
                      //builder: (context) => GkAnswer(gklistQuery[index])
                   
                    
                      );
                     
                },
                child: engQueryItem(gklistQuery[index].gkquery)),
            separatorBuilder: (_, index) => SizedBox(
                  height: 15,
                ),
            itemCount: gklistQuery.length)
            );
    
  }
}
