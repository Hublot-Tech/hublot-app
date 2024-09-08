
import 'package:app/configuration.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OrderBoton extends StatelessWidget {
  const OrderBoton({
    super.key,
    required this.size,
    required this.name,
    required this.asset,
    required this.press,
    this.fontSize = 20,
  });

  final Size size;
  final String name;
  final String asset;
  final double? fontSize;
  final GestureCancelCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(right: 10),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(12), boxShadow: [
        BoxShadow(
          color: Colors.grey.shade500,
          blurRadius: 4,
          offset: const Offset(0, 3),
          spreadRadius: 1.0,
        ),
        const BoxShadow(
          color: Colors.white,
          blurRadius: 1,
          offset: Offset(-4.0, -4.0),
          spreadRadius: 0,
        )
      ]),
      child: TextButton(
          onPressed: press,
          style: TextButton.styleFrom(
              backgroundColor: kyellowColor,
              padding: EdgeInsets.symmetric(
                  vertical: 15, horizontal: size.width * 0.1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(asset),
              const SizedBox(width: 10),
              textPresentation(
                  msg: name, fontWeight: FontWeight.bold, size: fontSize!),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset('img/Rectangle 12.png'),
              ),
            ],
          )),
    );
  }
}
