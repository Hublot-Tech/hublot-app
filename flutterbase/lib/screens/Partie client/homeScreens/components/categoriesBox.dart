import 'package:flutter/material.dart';

import '../../../../configuration.dart';

class CategoriesBox extends StatelessWidget {
  const CategoriesBox({
    super.key,
    required this.name, required this.press,
  });
  final String name;
  final GestureCancelCallback press;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textPresentation(mesg: name, fontWeight: FontWeight.bold, size: 24),
        GestureDetector(
          onTap: press,
          child: textPresentation(
              mesg: "Voir Tout",
              fontWeight: FontWeight.bold,
              size: 13,
              color: kCategoriecolor ),
        )
      ],
    );
  }
}
