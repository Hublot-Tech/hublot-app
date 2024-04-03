import 'package:flutter/material.dart';

const kCategoriecolor = Color.fromRGBO(30, 136, 229, 1);
const kyellowColor = Color.fromRGBO(255, 192, 0, 1);
const kprimaryColor = Color.fromRGBO(10, 17, 40, 1);
const ksecondaryColor = Color.fromRGBO(100, 100, 100, 1);
Text textPresentation(
    {required String msg,
    double size = 30,
    Color color = kprimaryColor,
    required FontWeight fontWeight}) {
  return Text(
    msg,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontWeight: fontWeight,
      color: color,
      fontSize: size,
    ),
  );
}

class EspaceMenuWidget extends StatelessWidget {
  const EspaceMenuWidget({
    super.key,
    this.taille = 20,
  });
  final double taille;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: taille);
  }
}
