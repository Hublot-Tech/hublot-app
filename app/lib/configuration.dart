import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';

const kCategoriecolor = Color.fromRGBO(30, 136, 229, 1);
const kyellowColor = Color.fromRGBO(255, 192, 0, 1);
const kprimaryColor = Color.fromRGBO(10, 17, 40, 1);
const ksecondaryColor = Color.fromRGBO(100, 100, 100, 1);
const kbottonColor = Color.fromRGBO(100, 100, 100, 40);
const ktransparentColor = Color.fromRGBO(217, 217, 217, 1);
const kgreenColor = Color.fromRGBO(51, 196, 129, 1);
const kredColor = Color.fromRGBO(229, 57, 53, 1);
const kcolorBoxService = Color.fromRGBO(10, 17, 40, 0.1);
Text textPresentation(
    {required String msg,
    double size = 30,
    Color color = kprimaryColor,
    TextAlign textAlign = TextAlign.center,
    required FontWeight fontWeight}) {
  return Text(
    msg,
    textAlign: textAlign,
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
    SizeConfig().init(context);
    return SizedBox(height: getProportionateScreenHeight(taille));
  }
}
