import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_math_project/quizPage(Objective).dart';
import 'package:quiz_math_project/resultPage.dart';

class getJson extends StatelessWidget {

  int i = 0;

  List<String> questionImages = [
    "assets/images/q1Math.png",
    "assets/images/q2Math.png",
    "assets/images/q3Math.png",
    "assets/images/q4Math.png",
    "assets/images/q5Math.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset(questionImages[i]),
            FlatButton(
              color: Colors.indigo,
              textColor: Colors.white,
                onPressed: () {

            },
              child: Text(
                "Next",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
