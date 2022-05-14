import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Aboutus extends StatefulWidget {
  const Aboutus({ Key? key }) : super(key: key);

  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About us"),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/11.jpg'), fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                child: Text("Ask me?", style: TextStyle(fontSize: 40),),
              ),
              Text("Ask me? is developed with the intent to assist student to learn and to do homework smoothly without the guidence of seniours or taking tution classes.", style: TextStyle(fontSize: 20),),
              SizedBox(height: 20,),
              Text("About Myself", style: TextStyle(fontSize: 40),),
              SizedBox(height: 10,),
              Text("I am a undergratduate student of Informatics college Pokhara. With this application i would like to contribute to the students who wants to learn. You are welcme to let me know if you have any similar interest, a passion, any suggestion or feedback, new concepts, so we can work jointly for the students. You can find me on facebook, instagram, mail or phone by clicking below link. Feel free to contact  " ,style: TextStyle(fontSize: 20),),
             SizedBox(height: 20,),
              TextButton(onPressed: () async {
                        launch('https://www.facebook.com/');
                        String url = "https://www.facebook.com/za.son.100/";
                        if (!await launch(url)) throw 'Could not launch $url';
                      }, child: Row(
                        children: [
                          Icon(Icons.facebook),
                          SizedBox(width: 5,),
                          Text("Facebook", style: TextStyle(fontSize: 20),),
                        ],
                      )),
                   // SizedBox(height: 5,),
              TextButton(onPressed: () async {
                        launch('https://www.instagram.com/');
                        String url = "https://www.instagram.com/mj.easion/";
                        if (!await launch(url)) throw 'Could not launch $url';
                      }, child: Row(
                        children: [
                          Icon(Icons.camera_alt,),
                          SizedBox(width: 5,),
                          Text("Instagram", style: TextStyle(fontSize: 20),),
                        ],
                      )),  
            ],
        ),
          )),
      ),
    );
  }
}