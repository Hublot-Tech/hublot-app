
import 'package:app/configuration.dart';
import 'package:flutter/material.dart';

class RowInfo extends StatelessWidget {
  const RowInfo(
      {super.key,
      required this.name,
      required this.profession,
      this.value,
      this.valu = 88});
  final String name, profession;
  final String? value;
  final double? valu;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textPresentation(msg: name, fontWeight: FontWeight.w600, size: 24),
            textPresentation(
                msg: profession, fontWeight: FontWeight.w300, size: 15),
          ],
        ),
        value == null
            ? SizedBox.shrink()
            : Column(
                children: [
                  textPresentation(
                      msg: value!, fontWeight: FontWeight.w600, size: 15),
                  Container(width: valu, height: 2, color: kyellowColor)
                ],
              )
      ],
    );
  }
}
