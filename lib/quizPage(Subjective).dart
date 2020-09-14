import 'package:flutter/material.dart';
import 'package:quiz_math_project/home.dart';
import 'package:photo_view/photo_view.dart';
import 'package:slider_button/slider_button.dart';

class SubjQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Subjective",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: QuestionUpdater(title: 'Subjective Question'),
    );
  }
}

class QuestionUpdater extends StatefulWidget {
  QuestionUpdater({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _QuestionUpdaterState createState() => _QuestionUpdaterState();
}

class _QuestionUpdaterState extends State<QuestionUpdater> {
  List<String> questionImages = [
    "assets/images/q1Math.png",
    "assets/images/q2Math.png",
    "assets/images/q3Math.png",
    "assets/images/q4Math.png",
    "assets/images/q5Math.png",
  ];

  // Widget answerHidden() {
  //   return Container(
  //     child: Text(
  //       "The answer",
  //       style: TextStyle(
  //         color: Colors.black,
  //         fontWeight: FontWeight.bold,
  //       ),
  //     ),
  //   );
  // }

  int i = 0;

  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 300.0,
              width: 350.0,
              child: PhotoView(
                imageProvider: AssetImage(questionImages[i]),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    if (i < questionImages.length - 1 && i > 0) {
                      setState(() {
                        i--;
                        print(i);
                      });
                    } else {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Homepage()));
                    }
                  },
                  child: Text(
                    "Prev",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                VerticalDivider(
                  thickness: 10.0,
                ),
                FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    if (i < questionImages.length - 1) {
                      setState(() {
                        i++;
                        print(i);
                      });
                    } else {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Homepage()));
                    }
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AnimatedOpacity(
                  opacity: _visible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child: Text(
                    "This is answer",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                VerticalDivider(
                  thickness: 10.0,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _visible = !_visible;
                    });
                  },
                  tooltip: 'Press to reveal the answer',
                  child: Icon(Icons.flip),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
