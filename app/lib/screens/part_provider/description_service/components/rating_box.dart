import 'package:app/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../size_configuration.dart';

class RatingBox extends StatelessWidget {
  const RatingBox({
    super.key,
    required this.imgPath,
    required this.rate,
    required this.color,
  });

  final String imgPath;
  final int rate;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(58.5),
      height: getProportionateScreenHeight(21),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.5),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            imgPath,
            color: Colors.white,
            width: 15,
            height: 15,
          ),
          textPresentation(
              msg: "$rate avis",
              color: Colors.white,
              fontWeight: FontWeight.normal,
              size: 11.16),
        ],
      ),
    );
  }
}
