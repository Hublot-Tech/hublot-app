import 'package:app/configuration.dart';
import 'package:app/screens/authentification/registration_screen/component/button_custom.dart';
import 'package:app/screens/part_customer/home_screens/components/home_screen.dart';
import 'package:flutter/material.dart';

import '../../city_screen_choice/components/navigation_row.dart';
import 'hublo_version.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isFrenchd = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const EspaceMenuWidget(taille: 40),
          NavigationRow(
            press: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, HomeScrenns.routeName, (route) => false);
            },
            name: 'Choix de votre langue',
          ),
          const EspaceMenuWidget(taille: 40),
          Row(
            //Français
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildLanguageSelector(true), // Français
              buildLanguageSelector(false), // Autre langue
            ],
          ),
          const SizedBox(height: 100),
          ButtomCustom(press: () {}, msg: "Confirmer",color: kprimaryColor, isValided: true),
          const SizedBox(height: 100),
          const VersionHublo(),
        ],
      ),
    );
  }

  GestureDetector buildLanguageSelector(bool isFrench) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFrenchd = isFrench;
        });
      },
      child: Container(
        width: 127,
        height: 44,
        decoration: BoxDecoration(
          color: isFrenchd == isFrench
              ? const Color.fromRGBO(255, 192, 0, 1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(isFrench ? "img/french.png" : "img/english.png"),
            const SizedBox(width: 6),
            textPresentation(
              msg: isFrench ? "Français" : "Anglais",
              fontWeight: FontWeight.normal,
              size: 18.36,
            ),
          ],
        ),
      ),
    );
  }
}

