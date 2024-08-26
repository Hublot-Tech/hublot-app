import 'package:app/controller/interfaces/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/configuration.dart';

class BoxStar extends StatelessWidget {
  const BoxStar({
    super.key,
    required this.size,
    required this.serviceData,
  });

  final Size size;
  final Services serviceData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      // width: size.width * 0.2,
      // height: size.height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromRGBO(10, 17, 40, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          serviceData.favorite
              ? SvgPicture.asset('img/icons8_star 2.svg', height: 3)
              : SvgPicture.asset('img/icons8_star_white.svg'),
          SizedBox(width: 8),
          textPresentation(
              msg: serviceData.note,
              fontWeight: FontWeight.normal,
              color: Colors.white,
              size: 19)
        ],
      ),
    );
  }
}
