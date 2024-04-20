import 'package:app/configuration.dart';
import 'package:app/screens/authentification/registration_screen/component/button_custom.dart';
import 'package:app/screens/part_provider/add_service/description_service/components/background_add_service.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../description_service/description_screen.dart';

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
                    Navigator.pushNamed(context, DescriptionScreen.routeName);
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
                  decoration: BoxDecoration(
                      border: Border(
                    top: BorderSide(),
                    bottom: BorderSide(),
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textPresentation(
                          msg: "Ajouter une offre ",
                          fontWeight: FontWeight.normal,
                          size: getProportionateScreenWidth(20)),
                      Image.asset("img/addService.png"),
                    ],
                  ),
                ),
                EspaceMenuWidget(taille: 300),
                ButtomCustom(press: () {}, msg: "Confirmer", isValided: true)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
