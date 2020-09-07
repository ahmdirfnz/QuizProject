import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_math_project/resultPage.dart';

class getJson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString("jsonFile/differentiation.json"),
        builder: (context, snapshot) {
          var myData = json.decode(snapshot.data.toString());
          if (myData == null) {
            return Scaffold(
              body: Center(
                child: Text(
                  "Loading...",
                ),
              ),
            );
          } else {
            return quizPage(myData: myData);
          }
        });
  }
}

class quizPage extends StatefulWidget {
  var myData;

  quizPage({Key key, @required this.myData}) : super(key: key);

  @override
  _quizPageState createState() => _quizPageState(myData);
}

class _quizPageState extends State<quizPage> {
  var myData;
  _quizPageState(this.myData);

  Color colorToShow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 1;
  int timer = 30;
  String showTimer = "30";

  Map<String, Color> btnColor = {
    "a": Colors.indigoAccent,
    "b": Colors.indigoAccent,
    "c": Colors.indigoAccent,
    "d": Colors.indigoAccent,
  };

  bool cancelTimer = false;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() async {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextQuestion();
        } else if (cancelTimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showTimer = timer.toString();
      });
    });
  }

  void nextQuestion() {
    cancelTimer = false;
    timer = 30;
    setState(() {
      if (i < 10) {
        i++;
      } else {
        Navigator.of(this.context).pushReplacement(MaterialPageRoute(
          builder: (context) => resultPage(marks: marks),
        ));
      }
      btnColor["a"] = Colors.indigoAccent;
      btnColor["b"] = Colors.indigoAccent;
      btnColor["c"] = Colors.indigoAccent;
      btnColor["d"] = Colors.indigoAccent;
    });
    startTimer();
  }

  void checkAnswer(String k) {
    if (myData[2]["1"] == myData[1]["1"][k]) {
      marks = marks + 5;
      colorToShow = right;
    } else {
      colorToShow = wrong;
    }
    setState(() {
      btnColor[k] = colorToShow;
      cancelTimer = true;
    });

    Timer(Duration(seconds: 1), nextQuestion);
  }

  Widget choiceButton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkAnswer(k),
        child: Text(
          myData[1][i.toString()][k],
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
          maxLines: 1,
        ),
        color: btnColor[k],
        splashColor: Colors.indigoAccent[700],
        highlightColor: Colors.indigo[700],
        minWidth: 200.0,
        height: 45.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "Quiz Calculus",
                  ),
                  content: Text(
                    "You can answer if yu want",
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Ok",
                      ),
                    ),
                  ],
                ));
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomCenter,
                child: Text(
                  myData[0][i.toString()],
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    choiceButton('a'),
                    choiceButton('b'),
                    choiceButton('c'),
                    choiceButton('d'),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,
                child: Center(
                  child: Text(
                    showTimer,
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
