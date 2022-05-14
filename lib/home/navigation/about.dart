import 'package:flutter/material.dart';
import 'package:fyp/home/aboutus.dart';



class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/11.jpg'), fit: BoxFit.cover)),
       
        child: Align(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("About Us", style: TextStyle(fontSize: 20),),
                    IconButton(onPressed: (){
                      Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Aboutus()));
                    }, icon: Icon(Icons.arrow_circle_right_rounded, size: 40,))
                  ],
                ),
                Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Open Source Libraries", style: TextStyle(fontSize: 20),),
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_circle_right_rounded, size: 40,))
                  ],
                ),
                 Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Support us", style: TextStyle(fontSize: 20),),
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_circle_right_rounded, size: 40,))
                  ],
                ),
                Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
                Image(
                image: const AssetImage('assets/images/logo.png'),
                height: 200,
                width: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.contain,
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
