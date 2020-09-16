import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';

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

  int i = 0;

  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
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
                      i = 0;
                    }
                    _visible = false;
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
                      i = 0;
                    }
                    _visible = false;
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
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _visible = !_visible;
                    });
                  },
                  tooltip: 'Press to reveal the answer',
                  child: Icon(Icons.flip),
                ),
                VerticalDivider(
                  thickness: 10.0,
                ),
                AnimatedOpacity(
                  opacity: _visible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child: Text(
                    "This is the answer",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
