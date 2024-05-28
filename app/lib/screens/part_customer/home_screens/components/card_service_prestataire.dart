import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/configuration.dart';

import 'box_information.dart';
import 'box_star.dart';

class CardServicePrestataire extends StatelessWidget {
  const CardServicePrestataire({
    super.key,
    required this.note,
    required this.name,
    required this.profession,
    required this.localization,
    required this.distance,
    required this.img,
  });
  final String note, name, profession, localization, distance, img;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: getProportionateScreenWidth(330),
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: ksecondaryColor, borderRadius: BorderRadius.circular(23)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  width: getProportionateScreenWidth(40),
                  height: getProportionateScreenHeight(40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color.fromRGBO(255, 192, 0, 1),
                  ),
                  child: SvgPicture.asset("img/icons8_thumbs_up_1 1.svg"),
                ),
                BoxStar(
                  size: size,
                  icon: 'img/icons8_star 2.svg',
                  nbrOfStar: note,
                )
              ],
            ),
          ),
          BoxInformation(
            size: size,
            name: name,
            profession: profession,
            lieu: localization,
            distance: distance,
          ),
        ],
      ),
    );
  }
}
