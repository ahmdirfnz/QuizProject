import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_math_project/home(Objective).dart';
import 'package:quiz_math_project/home(Subjective).dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.black,
              textColor: Colors.tealAccent,
              child: Text(
                "Objective",
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => HomepageObj(),
                ));
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              color: Colors.black,
              textColor: Colors.tealAccent,
              child: Text(
                "Subjective",
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => HomepageSub(),
                ));
              },
            ),
          ]),
    );
  }
}
