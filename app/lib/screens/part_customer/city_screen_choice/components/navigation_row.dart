import 'package:app/configuration.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NavigationRow extends StatelessWidget {
  const NavigationRow({
    super.key,
    required this.press,
    required this.name,
  });
  final GestureCancelCallback press;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(width: 20),
        IconButton(
            onPressed: press, icon: const Icon(Icons.arrow_back_ios_sharp)),
        const SizedBox(width: 40),
        textPresentation(
          msg: name,
          fontWeight: FontWeight.bold,
          size: 24,
        ),
        const Spacer(),
      ],
    );
  }
}
