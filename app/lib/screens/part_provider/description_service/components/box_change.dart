import 'package:app/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BoxChange extends StatelessWidget {
  const BoxChange({
    super.key,
    this.msg = "Modifié",
    required this.press,
  });
  final String msg;
  final GestureCancelCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Row(
        children: [
          textPresentation(
              msg: msg,
              fontWeight: FontWeight.normal,
              size: 14,
              color: Colors.white),
          SvgPicture.asset("img/icons8_edit_2 1.svg")
        ],
      ),
    );
  }
}
