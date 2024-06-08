import 'package:app/controller/interfaces/services.dart';
import 'package:app/modules/shipping_services/page/shipping_service_screen.dart';
import 'package:app/size_configuration.dart';
import 'package:app/utilitis/navigations/Nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/configuration.dart';

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
                LikeComponent(serviceData: serviceData),
                BoxStar(
                  size: size,
                  serviceData: serviceData,
                )
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => Nav.toReplacement(
                  context, ShippingServices(data: serviceData)),
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
