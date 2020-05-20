import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Text("Instagram",textAlign: TextAlign.center, 
            style: TextStyle(
              fontSize: 60,fontFamily: "Billabong",
            ),),
          ],
        ),
      ),
    );
  }
}