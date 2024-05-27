import 'package:app/configuration.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';

class CancelButtom extends StatelessWidget {
  const CancelButtom({
    super.key,
    required this.press,
  });
  final GestureCancelCallback press;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        height: getProportionateScreenHeight(50),
        width: size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(7),
          // color: ,
        ),
        child: Center(
          child: textPresentation(
              msg: "Annuler",
              fontWeight: FontWeight.normal,
              size: 20,
              color: Colors.black),
        ),
      ),
    );
  }
}
