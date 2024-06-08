import 'package:app/size_configuration.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:app/configuration.dart';

import 'box_category_service.dart';

class RowSeeMore extends StatelessWidget {
  const RowSeeMore({
    super.key,
    required this.name,
    required this.msg,
    required this.press,
  });
  final String name, msg;
  final GestureCancelCallback press;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BoxCategoryService(name: name, press: press),
        SizedBox(height: getProportionateScreenHeight(5)),
        Row(
          children: [
            textPresentation(
              msg: msg,
              fontWeight: FontWeight.w400,
              size: getProportionateScreenWidth(14),
              color: const Color.fromRGBO(117, 120, 132, 1),
            ),
          ],
        ),
      ],
    );
  }
}
