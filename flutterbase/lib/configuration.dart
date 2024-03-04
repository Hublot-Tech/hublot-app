import 'package:flutter/material.dart';

const kprimaryColor = Color.fromRGBO(10, 17, 40, 1);
const ksecondaryColor = Color.fromRGBO(100, 100, 100, 1);
Text textPresentation(
    {required String mesg,
    double size = 30,
    Color color = kprimaryColor,
    required FontWeight fontWeight}) {
  return Text(
    mesg,
    textAlign: TextAlign.center,
    style: TextStyle(
      
      fontWeight: fontWeight,
      color: color,
      fontSize: size,
    ),
  );
}
