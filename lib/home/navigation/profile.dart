import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                    Text("Edit Profle", style: TextStyle(fontSize: 20),),
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_circle_right_rounded, size: 40,))
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
                    Text("Change Password", style: TextStyle(fontSize: 20),),
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_circle_right_rounded, size: 40,))
                  ],
                ),
                 Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
                
                
                Image(
                image: const AssetImage('assets/images/logo.png'),
                height: 300,
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
