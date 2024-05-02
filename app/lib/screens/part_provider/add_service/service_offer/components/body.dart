import 'package:app/configuration.dart';
import 'package:app/screens/authentification/registration_screen/component/button_custom.dart';
import 'package:app/screens/part_provider/add_service/description_service/components/background_add_service.dart';
import 'package:app/screens/part_provider/add_service/detail_offer/detail_offer_screen.dart';
import 'package:app/screens/part_provider/description_service/description_service_screen.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'add_service_box.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return BackgroundAddService(
      widget: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 21, top: 21),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, DescriptionService.routeName);
                  },
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: SvgPicture.asset("img/croix.svg"),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(150)),
          textPresentation(
              msg: "Offre concernant le service",
              fontWeight: FontWeight.bold,
              size: getProportionateScreenWidth(24.2)),
          textPresentation(
              msg: "Vous devez inserer au moins une offre pour ce service ",
              fontWeight: FontWeight.normal,
              size: getProportionateScreenWidth(11)),
          SizedBox(height: getProportionateScreenHeight(20)),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Container(
                  height: getProportionateScreenHeight(50),
                  width: getProportionateScreenWidth(290),
                  decoration: const BoxDecoration(
                      border: Border(
                    top: BorderSide(),
                    bottom: BorderSide(),
                  )),
                  child: AddServiceBox(msg: "Ajouter une offre ",press: (){},),
                ),
                const EspaceMenuWidget(taille: 300),
                ButtomCustom(
                    press: () {
                      Navigator.pushNamed(context, DetailOfferScreen.routeName);
                    },
                    msg: "Confirmer",
                    isValided: true)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

