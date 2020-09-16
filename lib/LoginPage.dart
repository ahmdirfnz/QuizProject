import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter your username',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                icon: Icon(Icons.person),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter your password',
                icon: Icon(Icons.lock),
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
