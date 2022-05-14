import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

import 'contactButoon.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/11.jpg'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Image(
                  image: const AssetImage('assets/images/logo.png'),
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.8,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 40),
                CustomButtonBlue(
                    label: 'Call',
                    onPressed: () async {
                      launch('tel:+917005467');
                      String url = "tel:+9779819182787";
                      if (!await launch(url)) throw 'Could not launch $url';
                    }),
                const SizedBox(height: 10),
                CustomButtonBlue(
                    label: 'Email',
                    onPressed: () async {
                      String url =
                          "mailto:jason.kc1910@gmail.com?subject=nice&body=ook,%20Mj.easion";
                      if (!await launch(url)) throw 'Could not launch $url';
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
