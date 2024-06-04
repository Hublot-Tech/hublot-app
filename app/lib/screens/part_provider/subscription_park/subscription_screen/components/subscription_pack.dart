
import 'package:app/configuration.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SubscriptionPack extends StatelessWidget {
  const SubscriptionPack({
    super.key,
    required this.name,
    required this.offerList,
  });
  final String name;
  final List<Map<String, String>> offerList;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        Container(
          width: 271,
          height: 49,
          decoration: BoxDecoration(
              color: kprimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(getProportionateScreenWidth(20)),
                topRight: Radius.circular(getProportionateScreenWidth(20)),
              )),
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: textPresentation(
                msg: name,
                fontWeight: FontWeight.bold,
                size: 20,
                color: Colors.white),
          ),
        ),
        const EspaceMenuWidget(),
        Column(
          children: List.generate(
            offerList.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(90),
                  bottom: getProportionateScreenWidth(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(offerList[index]['icon']!),
                  const SizedBox(width: 15),
                  textPresentation(
                      msg: offerList[index]['offer']!,
                      fontWeight: FontWeight.bold,
                      size: 20),
                ],
              ),
            ),
          ),
        ),
        const EspaceMenuWidget(),
        Container(
          width: 271,
          height: 49,
          decoration: const BoxDecoration(
              color: kCategoriecolor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: textPresentation(
                msg: "Pack actif",
                fontWeight: FontWeight.bold,
                size: 20,
                color: Colors.white),
          ),
        )
      ],
    );
  }
}
