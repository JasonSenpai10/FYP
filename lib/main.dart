import 'package:flutter/material.dart';

import 'package:fyp/login/login.dart';

import 'package:fyp/login/signup.dart';
import 'package:fyp/login/splashScreen.dart';

import 'home/navigation/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'splashScreen',
    routes: {
      'splashScreen': (context) => SplashScreen(),
      'login': (context) => Login(),
      'signup': (context) => Signup(),
      'home': (context) => Home(),
    },
  ));
}
