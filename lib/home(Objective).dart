import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_math_project/quizPage(Objective).dart';

 class HomepageObj extends StatefulWidget {
   @override
   _HomepageObjState createState() => _HomepageObjState();
 }

 class _HomepageObjState extends State<HomepageObj> {

   List<String> images = [

     "assets/images/differentiation.png",
     "assets/images/integration.png",
     "assets/images/trigonometry.png",

   ];

   Widget customcard(String subtopic,String image) {
      return Padding(
          padding: EdgeInsets.all(
              20.0,
          ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => getJson(),
            ));
          },
          child: Material(
            color: Colors.greenAccent,
            elevation: 10.0,
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(100.0),
                      child: Container(
                        height: 200.0,
                        width: 200.0,
                        child: ClipOval(
                          child: Image(
                            fit: BoxFit.contain,
                            image: AssetImage(
                                image
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "$subtopic",
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
   }

   @override
   Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([

       DeviceOrientation.portraitDown, DeviceOrientation.portraitUp

     ]);
     return Scaffold(
       appBar: AppBar(
         title: Center(
           child: Text(
               "Objective Quiz"
           ),
         ),
       ),
       body: ListView(
         children: <Widget>[
           customcard("Trigonometry", images[2]),
           customcard("Differentiation", images[0]),
           customcard("Integration", images[1]),
         ],
       ),
     );
   }
 }
