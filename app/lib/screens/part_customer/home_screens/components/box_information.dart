import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/configuration.dart';

class BoxInformation extends StatelessWidget {
  const BoxInformation({
    super.key,
    required this.size,
    required this.name,
    required this.profession,
    required this.lieu,
    required this.distance,
  });
  final Size size;
  final String name, profession, lieu, distance;
  @override
  Widget build(BuildContext context) {
    return Container(
      //  margin: EdgeInsets.only(top: size.height * 0.53),
      padding: const EdgeInsets.all(10),
      width: size.width * 0.8,
      height: 86,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.5),
        color: const Color.fromRGBO(48, 48, 48, 0.8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              textPresentation(
                  msg: name,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  size: 21),
              textPresentation(
                msg: profession,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(255, 192, 0, 1),
                size: 21,
              )
            ],
          ),
          Row(
            children: [
              textPresentation(
                  msg: lieu,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  size: 17),
              Container(
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 192, 0, 1),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              textPresentation(
                  msg: distance,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  size: 17),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset("img/certifié.svg"),
              textPresentation(
                msg: "Vérifié",
                fontWeight: FontWeight.normal,
                size: 12,
                color: Colors.white,
              )
            ],
          )
        ],
      ),
    );
  }
}
