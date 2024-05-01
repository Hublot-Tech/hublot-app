import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';

class HublotTextWigdet extends StatelessWidget {
  const HublotTextWigdet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Text(
          "HUB",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(25),
              fontWeight: FontWeight.bold),
        ),
        Text(
          "LOTS",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(25),
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 177, 59)),
        ),
        Spacer(),
      ],
    );
  }
}
