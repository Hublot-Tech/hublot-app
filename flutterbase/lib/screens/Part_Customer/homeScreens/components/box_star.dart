import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterbase/configuration.dart';

class BoxStar extends StatelessWidget {
  const BoxStar({
    super.key,
    required this.size,
    required this.icon,
    required this.nbrOfStar,
  });

  final Size size;
  final String icon, nbrOfStar;

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.only(right: 25),
      padding: const EdgeInsets.all(8),
      width: size.width * 0.2,
      height: size.height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromRGBO(10, 17, 40, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(icon),
          textPresentation(
              msg: nbrOfStar,
              fontWeight: FontWeight.normal,
              color: Colors.white,
              size: 22)
        ],
      ),
    );
  }
}
