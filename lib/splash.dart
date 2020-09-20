import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_math_project/home.dart';
import 'package:quiz_math_project/pages/login/login_page.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoginPage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Text(
          "Calculus",
          style: TextStyle(
            fontSize: 55.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
