import 'dart:convert';

import 'package:flutter/material.dart';


import 'package:fyp/home/UIPost/english/engQueryItem.dart';

import 'package:fyp/home/UIPost/social/socialAnswer.dart';
import 'package:fyp/home/UIPost/social/socialQuery.dart';
import 'package:fyp/login/baseurl.dart';

import 'package:http/http.dart';



// ignore: camel_case_types
class SocialQueryList extends StatefulWidget {
  @override
  State<SocialQueryList> createState() => _SocialQueryListState();
}

// ignore: camel_case_types
class _SocialQueryListState extends State<SocialQueryList> {
  List<SocialQuery> sociallistQuery = [];
  Future<Null> getData() async {
    final response =
        await get(Uri.parse(baseUrl + "socialgetQueries.php"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          sociallistQuery.add(SocialQuery.fromJson(i));
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
                      builder: (context) => SocialAnswer(sociallistQuery[index])
                      
                      
                    
                      );
                     
                },
                child: engQueryItem(sociallistQuery[index].socialquery)),
            separatorBuilder: (_, index) => SizedBox(
                  height: 15,
                ),
            itemCount: sociallistQuery.length)
            );
    
  }
}
