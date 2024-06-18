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
      width: (MediaQuery.of(context).size.width),

      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.5),
        color: const Color.fromRGBO(48, 48, 48, 0.8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                  child: textPresentation(
                msg: name,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(255, 255, 255, 1),
                size: 21,
                overflow: TextOverflow.ellipsis,
              )),
              Flexible(
                  child: textPresentation(
                msg: profession,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(255, 192, 0, 1),
                overflow: TextOverflow.ellipsis,
                size: 21,
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              textPresentation(
                  msg: lieu,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  size: 17),
              textPresentation(
                  msg: distance,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  size: 17,
                  textAlign: TextAlign.start),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
