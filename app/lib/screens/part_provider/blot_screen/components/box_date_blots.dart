import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';

class BoxDateBlots extends StatelessWidget {
  const BoxDateBlots({
    super.key,
    required this.width,
    this.hint,
    required this.controller,
  });
  final double width;
  final TextEditingController controller;
  final hint;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(50),
      width: getProportionateScreenWidth(width),
      decoration: const BoxDecoration(
          border: Border(
        top: BorderSide(),
        //bottom: BorderSide(),
      )),
      child: TextFormField(
        validator: (value) {
          controller.text = value!;
        },
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            hintText: hint,
            contentPadding:
                EdgeInsets.only(left: getProportionateScreenWidth(14))),
      ),
    );
  }
}
