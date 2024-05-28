import 'package:app/size_configuration.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../configuration.dart';

class BoxCategoryService extends StatelessWidget {
  const BoxCategoryService({
    super.key,
    required this.name,
    required this.press,

    ///sert ici tout simplement
  });
  final String name;
  final GestureCancelCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textPresentation(msg: name, fontWeight: FontWeight.bold, size: 24),
          GestureDetector(
            onTap: press,
            child: textPresentation(
                msg: "Voir Tout",
                fontWeight: FontWeight.bold,
                size: getProportionateScreenWidth(13),
                color: kCategoriecolor),
          )
        ],
      ),
    );
  }
}
