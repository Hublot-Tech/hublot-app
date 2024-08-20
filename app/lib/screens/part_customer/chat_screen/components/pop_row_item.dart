import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/configuration.dart';

class PopRowItem extends StatelessWidget {
  const PopRowItem({
    this.color = kprimaryColor,
    super.key,
    required this.icons,
    required this.mesg,
  });
  final String icons;
  final String mesg;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: SvgPicture.asset(icons),
        ),
        textPresentation(
            msg: mesg, fontWeight: FontWeight.w400, size: 14, color: color),
      ],
    );
  }
}
