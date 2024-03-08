import 'package:flutter/material.dart';
import 'package:flutterbase/configuration.dart';

import 'categoriesBox.dart';

class ColumnVoirPlus extends StatelessWidget {
  const ColumnVoirPlus({
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
        CategoriesBox(name: name, press: press),
        SizedBox(height: 5),
        Row(
          children: [
            textPresentation(
              mesg: msg,
              fontWeight: FontWeight.w400,
              size: 14,
              color: Color.fromRGBO(117, 120, 132, 1),
            ),
          ],
        ),
      ],
    );
  }
}
