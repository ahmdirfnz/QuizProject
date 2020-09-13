import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_math_project/home.dart';
import 'home.dart';

class resultPage extends StatefulWidget {
  int marks;
  resultPage({Key key, @required this.marks}) : super(key: key);

  @override
  _resultPageState createState() => _resultPageState(marks);
}

class _resultPageState extends State<resultPage> {
  List<String> images = [
    "assets/images/congrats.png",
    "assets/images/good.png",
    "assets/images/tryAgain.png",
  ];

  String message;
  String image;

  @override
  void initState() {
    if (marks < 20) {
      image = images[2];
      message = "Try Again\nYou scored $marks marks";
    } else if (marks < 30) {
      image = images[1];
      message = "Hope you try again\nYou scored $marks marks";
    } else {
      image = images[0];
      message = "Try until it will become a success\nYou scored $marks marks";
    }
    super.initState();
  }

  int marks;
  _resultPageState(this.marks);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Results",
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Material(
              elevation: 10.0,
              child: Container(
                  child: Column(
                children: <Widget>[
                  Material(
                    child: Container(
                      width: 300.0,
                      height: 300.0,
                      child: ClipRect(
                        child: Image(
                          image: AssetImage(
                            image,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 15.0,
                    ),
                    child: Center(
                      child: Text(
                        message,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Homepage(),
                    ));
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  borderSide: BorderSide(width: 5.0, color: Colors.indigo),
                  splashColor: Colors.indigoAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
