import 'package:app/configuration.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShadowBoxDiscussion extends StatelessWidget {
  const ShadowBoxDiscussion({
    super.key,
    required this.imgPath,
    required this.nbre,
  });

  final String imgPath;
  final int nbre;
  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        width: getProportionateScreenWidth(50.75),
        height: getProportionateScreenHeight(50.75),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: kyellowColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                blurRadius: 2,
                offset: const Offset(0.0, 4.0),
                spreadRadius: 2.0,
              ),
              const BoxShadow(
                color: Colors.white,
                blurRadius: 15,
                offset: Offset(-4.0, -4.0),
                spreadRadius: 1.0,
              )
            ]),
        child: Center(
          child: SvgPicture.asset(imgPath),
        ),
      ),
      Positioned(
        left: getProportionateScreenWidth(37),
        top: getProportionateScreenWidth(33),
        child: Container(
          width: getProportionateScreenWidth(19.75),
          height: getProportionateScreenHeight(19.75),
          decoration: BoxDecoration(
            color: kprimaryColor,
            borderRadius: BorderRadius.circular(18.75),
          ),
          child: Center(
            child: textPresentation(
                color: Colors.white,
                msg: '$nbre',
                fontWeight: FontWeight.normal,
                size: 10),
          ),
        ),
      ),
    ]);
  }
}
