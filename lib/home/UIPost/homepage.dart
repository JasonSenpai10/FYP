import 'package:flutter/material.dart';
import 'package:fyp/home/UIPost/Gk/GK.dart';
import 'package:fyp/home/UIPost/Health/Health.dart';
import 'package:fyp/home/UIPost/math/math.dart';
import 'package:fyp/home/UIPost/nepali/nepali.dart';
import 'package:fyp/home/UIPost/science/science.dart';
import 'package:fyp/home/UIPost/social/social.dart';
import 'package:fyp/home/navigation/text.dart';

import '../navigation/img.dart';
import 'english/english.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              secondaryColor,
              tertiaryColor,
            ])),
        child: Column(
          children: [
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: destination.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: destinationCard(
                      context, destination[index]['imagePath']!),
                ),
              ),
            ),
            SizedBox(height: kDefaultPadding),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: kDefaultPadding, horizontal: kDefaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWidget(
                      text: 'Our Subjects', size: 27, color: Colors.white),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 70,
                          width: 170,
                          color: Color(0XFFD82148),
                          child: InkWell(
                            child: Container(
                              
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: Color(0xffEFFF89A),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.03),
                              child: Text(
                                'SCIENCE',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Science()));
                            },
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 170,
                          color: Color(0xffAD62AA),
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: Color(0XFFFF9F45),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.03),
                              child: Text(
                                'ENGLISH',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => English()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 70,
                          width: 170,
                          color: Color(0xffC6DE41),
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: Color(0XFF91C483),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.03),
                              child: Text(
                                'नेपाली',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Nepali()));
                            },
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 170,
                          color: Color(0xff071C21),
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: Color(0XFFCCD1E4),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.03),
                              child: Text(
                                'SOCIAL',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Social ()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                    SizedBox(height: 30,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 70,
                          width: 170,
                          color: Colors.amber,
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: Color(0XFF6867AC),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.03),
                              child: Text(
                                'MATH',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Math()));
                            },
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 170,
                          color: Color(0xffF70776),
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: Color(0XFFA267AC),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.03),
                              child: Text(
                                ' ENVIRONMENT & HEALTH',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Health ()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(height: 30,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 70,
                          width: 170,
                          color: Color(0xff14FFEC),
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: Color(0XFFCE7BB0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.03),
                              child: Text(
                                'GENERAL KNOWLEDGE',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Gk()));
                            },
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 170,
                          color: Color(0xffBEF992),
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: Color(0XFFFE7E6D),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.03),
                              child: Text(
                                'OTHER',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Health ()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                
              ),
            ),
            SizedBox(height: kDefaultPadding),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: kDefaultPadding, horizontal: kDefaultPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 15),
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget destinationCard(BuildContext context, String imagePath) {
    return GestureDetector(
      onTap: () => {},
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Opacity(
              opacity: 0.7,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width - 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [secondaryColor, Colors.transparent],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
