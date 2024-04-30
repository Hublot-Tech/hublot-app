import 'package:flutter/material.dart';

class HublotTextWigdet extends StatelessWidget {
  const HublotTextWigdet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Spacer(),
        Text(
          "HUB",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Text(
          "LOT",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 177, 59)),
        ),
        Spacer(),
      ],
    );
  }
}
