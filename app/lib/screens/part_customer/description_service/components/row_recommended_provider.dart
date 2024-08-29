import 'package:app/configuration.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RowRecommandedProvider extends StatelessWidget {
  const RowRecommandedProvider({
    super.key,
    required this.imgPath,
    required this.text,
  });
  final String imgPath, text;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
            padding: const EdgeInsets.all(4),
            // width: getProportionateScreenWidth(30.8),
            // height: getProportionateScreenHeight(30.6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: kprimaryColor.withOpacity(0.2)),
            child: SvgPicture.asset(imgPath)),
        SizedBox(width: getProportionateScreenWidth(5)),
        SizedBox(
            width: size.width * 0.4,
            child: textPresentation(
                overflow: TextOverflow.ellipsis,
                msg: text,
                fontWeight: FontWeight.normal,
                size: 17)),
      ],
    );
  }
}
