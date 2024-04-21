import 'package:app/configuration.dart';
import 'package:app/screens/authentification/registration_screen/component/button_custom.dart';
import 'package:app/screens/part_provider/add_service/description_service/components/background_add_service.dart';
import 'package:app/screens/part_provider/add_service/service_offer/service_offer_screen.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int value = 0;
  void addValue() {
    setState(() {
      value++;
    });
  }

  void remodeValue() {
    if (value != 0) {
      setState(() {
        value--;
      });
    }
  }

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
                    Navigator.pushNamed(context, ServiceOfferScreen.routeName);
                  },
                  child: SizedBox(
                    width: getProportionateScreenWidth(20),
                    height: getProportionateScreenHeight(20),
                    child: SvgPicture.asset("img/croix.svg"),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(150)),
          textPresentation(
              msg: "Details de l'offre",
              fontWeight: FontWeight.bold,
              size: getProportionateScreenWidth(24.2)),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: textPresentation(
                msg:
                    "Chaque elements inserer sera percus sur la description du services où se trouve cette offre",
                fontWeight: FontWeight.normal,
                size: getProportionateScreenWidth(11)),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(60),
                      width: getProportionateScreenWidth(180),
                      child: const TextField(
                        decoration: InputDecoration(
                            hintText: "Nom de l’offre",
                            border: OutlineInputBorder()),
                      ),
                    ),
                    SizedBox(width: getProportionateScreenWidth(10)),
                    SizedBox(
                      height: getProportionateScreenHeight(60),
                      width: getProportionateScreenWidth(80),
                      child: const TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Prix", border: OutlineInputBorder()),
                      ),
                    ),
                  ],
                ),
                EspaceMenuWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(60),
                      width: getProportionateScreenWidth(180),
                      child: const TextField(
                        decoration: InputDecoration(
                            hintText: "Contenu 1",
                            border: OutlineInputBorder()),
                      ),
                    ),
                    SizedBox(width: getProportionateScreenWidth(5)),
                    SizedBox(
                        height: getProportionateScreenHeight(60),
                        width: getProportionateScreenWidth(80),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: getProportionateScreenWidth(20),
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        addValue();
                                      });
                                    },
                                    icon: Icon(Icons.add))),
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: SizedBox(
                                width: getProportionateScreenWidth(20),
                                child: textPresentation(
                                    msg: "$value",
                                    fontWeight: FontWeight.normal,
                                    size: getProportionateScreenWidth(16)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: SizedBox(
                                width: getProportionateScreenWidth(20),
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        remodeValue();
                                      });
                                    },
                                    icon: Icon(Icons.remove)),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
                EspaceMenuWidget(taille: 200),
                ButtomCustom(press: () {}, msg: "Confirmer", isValided: true)
              ],
            ),
          )
        ],
      ),
    );
  }
}
