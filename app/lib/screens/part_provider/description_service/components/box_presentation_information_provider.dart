import 'package:app/configuration.dart';
import 'package:app/screens/part_provider/add_service/description_service/description_screen.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BoxPresentationInformation extends StatelessWidget {
  const BoxPresentationInformation({
    super.key,
    required this.name,
    required this.profession,
    required this.lieu,
    required this.distance,
  });
  final String name, profession, lieu, distance;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            textPresentation(msg: name, fontWeight: FontWeight.bold, size: 21),
            textPresentation(
              msg: profession,
              fontWeight: FontWeight.bold,
              color: const Color.fromRGBO(255, 192, 0, 1),
              size: 21,
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: getProportionateScreenWidth(6)),
          child: Row(
            children: [
              textPresentation(
                  msg: lieu, fontWeight: FontWeight.w600, size: 17),
              Container(
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 192, 0, 1),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              textPresentation(
                  msg: distance, fontWeight: FontWeight.w600, size: 17),
            ],
          ),
        ),
      ],
    );
  }
}

class RatingVotingBox extends StatelessWidget {
  const RatingVotingBox({
    super.key,
    required this.rating,
    required this.vote,
  });
  final double rating;
  final int vote;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset("img/icons8_star 4.svg"),
        textPresentation(msg: '$rating', fontWeight: FontWeight.bold, size: 19),
        textPresentation(
            msg: "($vote vote)", fontWeight: FontWeight.normal, size: 19)
      ],
    );
  }
}

class Testd extends StatelessWidget {
  const Testd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: getProportionateScreenWidth(430),
            height: getProportionateScreenHeight(283),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              child: Image.asset(
                "img/backona.png",
                fit: BoxFit.cover,
              ),
            )),
        Padding(
          padding: EdgeInsets.only(top: getProportionateScreenWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 20),
                  padding: EdgeInsets.only(
                      top: getProportionateScreenWidth(00),
                      left: getProportionateScreenWidth(4),
                      bottom: getProportionateScreenWidth(4)),
                  width: getProportionateScreenWidth(34),
                  height: getProportionateScreenHeight(34),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(34),
                    color: ktransparentColor,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, DescriptionScreen.routeName);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  )),

              Container(
                width: getProportionateScreenWidth(102),
                height: getProportionateScreenHeight(32),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    color: kprimaryColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset("img/share.svg"),
                    textPresentation(
                        msg: "En ligne",
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        size: 18),
                  ],
                ),
              ),
              //Spacer(),
              Container(
                padding: EdgeInsets.only(
                  right: getProportionateScreenWidth(10),
                  left: getProportionateScreenWidth(10),
                ),
                margin: const EdgeInsets.only(right: 20),
                width: getProportionateScreenWidth(34),
                height: getProportionateScreenHeight(34),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34),
                  color: kprimaryColor,
                ),
                child: SvgPicture.asset(
                  "img/icons8_heart 1.svg",
                  width: 16,
                  height: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
