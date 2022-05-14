import 'package:flutter/material.dart';
import 'package:fyp/login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Container(
            child: Column(
              children: [
                Image(
                  image: const AssetImage('assets/images/logo.png'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Just ask me "),
              ],
            ),
          ),
        ),
      ),
    );
    //super.initState();
  }
}
