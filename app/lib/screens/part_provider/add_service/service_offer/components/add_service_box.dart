import 'package:app/configuration.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AddServiceBox extends StatelessWidget {
  const AddServiceBox({
    super.key,
    required this.msg,
    required this.press,
  });
  final String msg;
  final GestureCancelCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textPresentation(
              msg: msg,
              fontWeight: FontWeight.normal,
              size: getProportionateScreenWidth(20)),
          Image.asset("img/addService.png"),
        ],
      ),
    );
  }
}
