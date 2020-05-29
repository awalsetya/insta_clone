import 'package:flutter/material.dart';

class BillabongText extends StatelessWidget {
  final String text;
  final double fontsize;
  BillabongText(this.text, {this.fontsize});
  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontsize,
        fontFamily: "Billabong",
      ),
    );
  }
}
