import 'package:app/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RowVerifieProvider extends StatelessWidget {
  const RowVerifieProvider({
    super.key,
    required this.imgPath,
    required this.text,
  });
  final String imgPath, text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(imgPath),
        textPresentation(msg: text, fontWeight: FontWeight.normal, size: 20),
      ],
    );
  }
}
