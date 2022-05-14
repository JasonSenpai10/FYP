import 'package:flutter/material.dart';
import 'package:fyp/home/UIPost/nepali/nepQuery.dart';




class SocialQueryItem extends StatelessWidget {
  final String query;
  SocialQueryItem(this.query);
  List<NepQuery> soiallistQuery = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 100,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blueAccent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [Text(query)],
              )
            ],
          ),
        ],
      ),
    );
  }
}
