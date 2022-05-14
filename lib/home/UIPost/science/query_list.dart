import 'dart:convert';



import 'package:flutter/material.dart';
import 'package:fyp/home/UIPost/science/answer.dart';
import 'package:fyp/login/baseurl.dart';
import 'package:http/http.dart';

import 'Query.dart';
import 'queryItem.dart';

class QueryList extends StatefulWidget {
  @override
  State<QueryList> createState() => _QueryListState();
}

class _QueryListState extends State<QueryList> {
  List<Query> listQuery = [];
  Future<Null> getData() async {
    final response =
        await get(Uri.parse(baseUrl + "getQueries.php"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          listQuery.add(Query.fromJson(i));
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
                      builder: (contxt) => QueryDetail(listQuery[index]));
                },
                child: QueryItem(listQuery[index].query)),
            separatorBuilder: (_, index) => SizedBox(
                  height: 15,
                ),
            itemCount: listQuery.length));
  }
}
