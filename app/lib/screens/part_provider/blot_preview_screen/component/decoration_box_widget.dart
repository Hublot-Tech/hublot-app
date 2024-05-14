
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';

class DecorationBoxWidget extends StatelessWidget {
  const DecorationBoxWidget({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.havePadding,
    required this.args,
  });
  final double width, height;
  final Widget args;
  final Color color;
  final bool havePadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(width),
      height: getProportionateScreenHeight(height),
      padding: havePadding
          ? EdgeInsets.only(
              left: getProportionateScreenWidth(10),
              right: getProportionateScreenWidth(10))
          : const EdgeInsets.all(0),
      decoration: BoxDecoration(
          color: color,
          border: Border.all(width: 0.5),
          borderRadius: BorderRadius.circular(5)),
      child: args,
    );
  }
}
