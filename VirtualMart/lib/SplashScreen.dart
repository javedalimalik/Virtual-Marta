import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hoja/SignIn.dart';
import 'package:hoja/tabScreen.dart';

import 'TabPages/profile.dart';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>signInScreen()));
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text("Virtual Mart",
              style: TextStyle(
                fontFamily: "cursive",
                  fontSize: 28.0,color: Colors.deepOrange),
            )
        )
    );
  }
}
