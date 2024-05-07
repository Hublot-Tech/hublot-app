import 'package:app/configuration.dart';
import 'package:app/screens/authentification/registration_screen/component/button_custom.dart';
import 'package:app/screens/part_provider/add_service/description_service/components/background_add_service.dart';
import 'package:app/screens/part_provider/add_service/service_offer/components/add_service_box.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../add_service/service_offer/components/cross_widget.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int duree = 0;
  void onAdd() {
    setState(() {
      duree++;
    });
  }

  void onRemove() {
    setState(() {
      if (duree != 0) {
        duree--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BackgroundAddService(
          widget: Padding(
        padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 05, top: 25),
              child: CrossWidgetClick(
                routeName: 'DescriptionService.routeName',
              ),
            ),
            const EspaceMenuWidget(taille: 70),
            textPresentation(
                msg: "Création du Blot #0001",
                fontWeight: FontWeight.normal,
                color: kprimaryColor,
                size: 24.12),
            Padding(
              padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(57),
                  right: getProportionateScreenWidth(57)),
              child: textPresentation(
                  color: kprimaryColor,
                  msg:
                      "Toutes informations inserer servira en cas de litige et aussi faciliter l’échange",
                  fontWeight: FontWeight.normal,
                  size: 11),
            ),
            const EspaceMenuWidget(taille: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    textPresentation(
                        color: kprimaryColor,
                        msg: "Offre de base",
                        fontWeight: FontWeight.bold,
                        size: 24.12),
                    Row(
                      children: [
                        textPresentation(
                            color: kprimaryColor,
                            msg: "Sélectionner un offre",
                            fontWeight: FontWeight.normal,
                            size: 13),
                        const Icon(Icons.keyboard_arrow_down_outlined),
                      ],
                    )
                  ],
                ),
                Container(
                  width: getProportionateScreenWidth(115),
                  height: getProportionateScreenHeight(32),
                  decoration: BoxDecoration(
                      color: kyellowColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: textPresentation(
                        msg: "10 000 FCFA",
                        fontWeight: FontWeight.bold,
                        color: kprimaryColor,
                        size: 15),
                  ),
                )
              ],
            ),
            const EspaceMenuWidget(taille: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textPresentation(
                    msg: "Description",
                    fontWeight: FontWeight.bold,
                    size: 24.12,
                    color: kprimaryColor),
                Row(
                  children: [
                    textPresentation(
                        msg: "Modifier",
                        fontWeight: FontWeight.normal,
                        size: 13),
                    SvgPicture.asset("img/icons8_edit_2 1.svg"),
                  ],
                ),
              ],
            ),
            const EspaceMenuWidget(),
            TextField(
              maxLines: 12,
              decoration: InputDecoration(
                hintStyle: const TextStyle(
                    fontSize: 13, fontWeight: FontWeight.normal),
                hintText:
                    "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonu Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonu Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonu...",
                contentPadding: const EdgeInsets.only(left: 30, top: 32),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const EspaceMenuWidget(),
            Row(
              children: [
                textPresentation(
                    msg: "Sélectionner des options",
                    fontWeight: FontWeight.bold,
                    size: 24.12,
                    color: kprimaryColor),
              ],
            ),
            const EspaceMenuWidget(),
            Container(
              height: getProportionateScreenHeight(50),
              width: getProportionateScreenWidth(290),
              decoration: const BoxDecoration(
                  border: Border(
                top: BorderSide(),
                bottom: BorderSide(),
              )),
              child: AddServiceBox(
                msg: "Ajouter des options ",
                press: () {},
              ),
            ),
            const EspaceMenuWidget(),
            Row(
              children: [
                textPresentation(
                    msg: "Date de début",
                    fontWeight: FontWeight.bold,
                    size: 24.12,
                    color: kprimaryColor),
              ],
            ),
            const EspaceMenuWidget(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BoxDateBlots(width: 50),
                BoxDateBlots(width: 50),
                BoxDateBlots(width: 64),
              ],
            ),
            const EspaceMenuWidget(),
            Row(
              children: [
                textPresentation(
                    msg: "Durée du blot",
                    fontWeight: FontWeight.bold,
                    size: 24.12,
                    color: kprimaryColor),
              ],
            ),
            const EspaceMenuWidget(),
            Row(children: [
              Container(
                height: getProportionateScreenHeight(50),
                width: getProportionateScreenWidth(58),
                margin: EdgeInsets.only(left: getProportionateScreenWidth(85)),
                decoration: const BoxDecoration(
                    border: Border(
                  top: BorderSide(),
                  bottom: BorderSide(),
                )),
                child: Row(
                  children: [
                    const Spacer(flex: 2),
                    textPresentation(
                        msg: "JJ", fontWeight: FontWeight.normal, size: 13),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_down_outlined)),
                  ],
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(30)),
              IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
              textPresentation(msg: '$duree', fontWeight: FontWeight.normal),
              IconButton(onPressed: onRemove, icon: const Icon(Icons.remove)),
            ]),
            const EspaceMenuWidget(taille: 30),
            const Divider(
              indent: 90,
              endIndent: 90,
              thickness: 4,
              color: Colors.black,
            ),
            const EspaceMenuWidget(),
            ButtomCustom(press: () {}, msg: "Aperçu", isValided: false),
            const EspaceMenuWidget(),
            Container(
              height: getProportionateScreenHeight(50),
              width: getProportionateScreenWidth(390),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(7),
                // color: ,
              ),
              child: Center(
                child: textPresentation(
                    msg: "Annuler",
                    fontWeight: FontWeight.normal,
                    size: 20,
                    color: Colors.black),
              ),
            ),
            EspaceMenuWidget(taille: 50),
          ],
        ),
      )),
    );
  }
}

class BoxDateBlots extends StatelessWidget {
  const BoxDateBlots({
    super.key,
    required this.width,
  });
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(50),
      width: getProportionateScreenWidth(width),
      decoration: const BoxDecoration(
          border: Border(
        top: BorderSide(),
        //bottom: BorderSide(),
      )),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            hintText: "JJ",
            contentPadding:
                EdgeInsets.only(left: getProportionateScreenWidth(14))),
      ),
    );
  }
}
