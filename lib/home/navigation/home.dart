

import 'package:flutter/material.dart';
import 'package:fyp/home/navigation/about.dart';
import 'package:fyp/home/navigation/contact.dart';
import 'package:fyp/home/navigation/feedback.dart';
import 'package:fyp/home/navigation/header.dart';

import 'package:fyp/home/UIPost/homepage.dart';
import 'package:fyp/home/navigation/privacyPolicy.dart';
import 'package:fyp/home/navigation/profile.dart';




import '../UIPost/science/Query.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentPage = DrawerSection.homepage;
  List<Query> listQuery = [];
  

  @override
  void initState() {
    super.initState();
    // getData();
  }

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSection.homepage) {
      container = Homepage();
    }else if (currentPage == DrawerSection.profile) {
      container = Profile();}
    
     else if (currentPage == DrawerSection.privacy) {
      container = Privacy();
    }  else if (currentPage == DrawerSection.contact) {
      container = Contact();
    } else if (currentPage == DrawerSection.feedback) {
      container = Feedbacks();
    }
    else {
      container = About();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Ask me ?"),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Header(),
                Drawerlist(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Drawerlist() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          menuItem(1, "Home", Icons.home,
              currentPage == DrawerSection.homepage ? true : false),
              menuItem(2, "Profile", Icons.account_circle_rounded,
              currentPage == DrawerSection.profile ? true : false),
          menuItem(3, "Privacy Principle", Icons.admin_panel_settings_rounded,
              currentPage == DrawerSection.privacy ? true : false),
          menuItem(4, "Contact", Icons.contact_page_outlined,
              currentPage == DrawerSection.contact ? true : false),
          menuItem(5, "Feedback", Icons.feedback,
              currentPage == DrawerSection.feedback ? true : false),
          menuItem(6, "About Us", Icons.person_pin_rounded,
              currentPage == DrawerSection.about ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSection.homepage;
            } else if (id == 2) {
              currentPage = DrawerSection.profile;}
             else if (id == 3) {
              currentPage = DrawerSection.privacy;
            }  else if (id == 4) {
              currentPage = DrawerSection.contact;
            } else if (id == 5) {
              currentPage = DrawerSection.feedback;
            } else {
              currentPage = DrawerSection.about;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  title,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSection {
  homepage,
  profile,
  privacy,
  contact,
  feedback,
  about,
}
