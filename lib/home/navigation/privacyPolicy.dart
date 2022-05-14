import 'package:flutter/material.dart';

class Privacy extends StatefulWidget {
  const Privacy({ Key? key }) : super(key: key);

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/11.jpg'), fit: BoxFit.cover)),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Row(
            children: [
              Icon(Icons.admin_panel_settings_rounded, color: Colors.black, size: 100,),
              Text(" Our Privacy Principle", style: TextStyle(fontSize: 30, color: Colors.black),)
            ],
          ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text("At ask me, we make your privacy a priority. we know your trust is earned every time  you use ask me? or any of our other products. – that’s why we treat your information differently than most other tech companies.We don’t stockpile your question or feedback, and we don’t publicly showcase a timeline of everything you’ve ever posted. Even though our products are constantly evolving, our privacy principles remain unchanged:", style: TextStyle(fontSize: 20),),
                  SizedBox(height: 15,),
                  Text("It’s hard to have a sense of privacy if you don’t feel safe and secure, too. That’s why we provide you with features like Login to secure your account and why we take considerable efforts to secure our own infrastructure.To make your account secure please use unique and difficult to crack passwords to keep your ASK ME? account especially secure:", style: TextStyle(fontSize:20 ),)
                ],
              ),
              
              )
        ],
      ),
    );
  }
}