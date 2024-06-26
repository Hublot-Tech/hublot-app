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
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        width: size.width,
        child: Stack(
          children: [
            Container(
              width: size.width * 0.9,
              height: size.height * 0.39,
              decoration: BoxDecoration(
                  color: ksecondaryColor,
                  borderRadius: BorderRadius.circular(23)),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                img,
                width: 354,
                height: 436,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 18, top: 20),
                  padding: const EdgeInsets.all(8),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color.fromRGBO(255, 192, 0, 1),
                  ),
                  child: SvgPicture.asset("img/icons8_thumbs_up_1 1.svg"),
                ),
                const Spacer(),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.64, top: 10, right: size.width * 0.01),
              child: BoxStar(
                size: size,
                icon: 'img/icons8_star 2.svg',
                nbrOfStar: note,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.3, left: 22),
              child: BoxInformation(
                size: size,
                name: name,
                profession: profession,
                lieu: localization,
                distance: distance,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
