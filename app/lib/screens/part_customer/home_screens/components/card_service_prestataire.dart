import 'package:app/configuration.dart';
import 'package:app/controller/interfaces/services.dart';
//import 'package:app/modules/shipping_services/page/shipping_service_screen.dart';
import 'package:app/size_configuration.dart';
//import 'package:app/utilitis/navigations/Nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'box_information.dart';
import 'box_star.dart';

class CardServicePrestataire extends StatelessWidget {
  const CardServicePrestataire({
    super.key,
    required this.serviceData,
  });

  final Services serviceData;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      //width 353 with size
      width: size.width * 0.85,
      height: size.height * 0.53,
      margin: const EdgeInsets.only(right: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(23)),
      child: Stack(children: [
        SizedBox(
          width: 353,
          height: 435,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(23),
            child: Image.network(serviceData.img, fit: BoxFit.cover),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.width * 0.8,
              margin: EdgeInsets.only(
                  top: size.height * 0.025, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 serviceData.isSponsorite==true? Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 13, vertical: 2),
                    decoration: BoxDecoration(
                      color: kyellowColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: textPresentation(
                        msg: 'Sponsorisé',
                        fontWeight: FontWeight.normal,
                        size: 14,
                        color: Colors.white),
                  ):SizedBox.shrink(),
                  // Spacer(),
                  BoxStar(
                    size: size,
                    serviceData: serviceData,
                  )
                ],
              ),
            ),
            Expanded(
              child: GestureDetector(
                // onTap: () => Nav.toReplacement(
                //     context, ShippingServices(data: serviceData)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BoxInformation(
                      size: size,
                      name: serviceData.name,
                      profession: serviceData.profession,
                      lieu: serviceData.lieu,
                      distance: serviceData.distance,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

class LikeComponent extends StatefulWidget {
  const LikeComponent({super.key, required this.serviceData});
  final Services serviceData;

  @override
  State<StatefulWidget> createState() => _LikeComponentState();
}

class _LikeComponentState extends State<LikeComponent> {
  bool like = false;

  @override
  Widget build(BuildContext context) {
    Services serviceData = widget.serviceData;

    return GestureDetector(
      onTap: () {
        setState(() {
          serviceData.like = !serviceData.like;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        width: getProportionateScreenWidth(40),
        height: getProportionateScreenHeight(40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: const Color.fromRGBO(255, 192, 0, 1),
        ),
        child: serviceData.like
            ? SvgPicture.asset("img/icons8_thumbs_up_1 1.svg")
            : SvgPicture.asset("img/icons8_thumbs_up_lite.svg"),
      ),
    );
  }
}
