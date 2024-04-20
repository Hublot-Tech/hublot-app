import 'package:app/configuration.dart';
import 'package:app/screens/part_provider/add_service/service_offer/service_offer_screen.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../authentification/registration_screen/component/button_custom.dart';
import '../../../home_screen/home_screen.dart';
import 'background_add_service.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameService = TextEditingController();
    TextEditingController descriptionService = TextEditingController();
    bool isValided;
    return BackgroundAddService(
      widget: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 21, top: 21),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, HomeScreen.routeName);
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
              msg: "Description du services",
              fontWeight: FontWeight.bold,
              size: getProportionateScreenWidth(24.2)),
          textPresentation(
              msg: "Pour  faciliter l’échange avec vos potentiels ",
              fontWeight: FontWeight.normal,
              size: getProportionateScreenWidth(11)),
          EspaceMenuWidget(),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Form(
                child: Column(
              children: [
                TextField(
                  controller: nameService,
                  onSubmitted: (value) {
                    setState(() {
                      isValided = isSubmitted(nameService, descriptionService);
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Nom du service ",
                    contentPadding: EdgeInsets.only(left: 30, top: 30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                EspaceMenuWidget(),
                TextField(
                  controller: descriptionService,
                  maxLines: 14,
                  onSubmitted: (value) {
                    setState(() {
                      isValided = isSubmitted(nameService, descriptionService);
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Description du service ",
                    contentPadding: EdgeInsets.only(left: 30, top: 32),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                EspaceMenuWidget(taille: 30),
                ButtomCustom(
                  msg: 'Confirmer',
                  press: () {
                    Navigator.pushNamed(context, ServiceOfferScreen.routeName);
                  },
                  isValided: true,
                )
              ],
            )),
          )
        ],
      ),
    );
  }
}

/*

*/
bool isSubmitted(TextEditingController nameService,
    TextEditingController descriptionService) {
  bool isTextEntered =
      nameService.text.isNotEmpty && descriptionService.text.isNotEmpty;
  return isTextEntered;
}
