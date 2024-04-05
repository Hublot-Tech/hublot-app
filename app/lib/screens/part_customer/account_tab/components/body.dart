import 'package:app/configuration.dart';
import 'package:app/screens/authentification/customer_screens/customer_screen.dart';
import 'package:app/screens/part_customer/city_screen_choice/city_screen.dart';
import 'package:app/screens/part_customer/language_screen/language_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'settings_row.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 54,
                  width: 54,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(100, 100, 100, 0.1),
                    borderRadius: BorderRadius.circular(54),
                  ),
                  child: SvgPicture.asset(
                    "img/hublo_h.svg",
                    width: 20,
                    fit: BoxFit.none,
                    height: 20,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textPresentation(
                      msg: "Salut,",
                      fontWeight: FontWeight.bold,
                      size: 23,
                    ),
                    const SizedBox(height: 2),
                    textPresentation(
                      msg: "Connectez vous pour une experience personnaliser",
                      fontWeight: FontWeight.w400,
                      size: 13,
                      color: const Color.fromRGBO(100, 100, 100, 0.5),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, CustomerScrenn.routeName, (route) => false);
              },
              child: Container(
                width: size.width * 0.87,
                height: size.height * 0.064,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: Center(
                  child: textPresentation(
                    msg: "Connectez-vous",
                    size: 18.36,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("img/plus_blue.svg")),
                textPresentation(
                    msg: "Créer un compte",
                    fontWeight: FontWeight.normal,
                    size: 16,
                    color: const Color.fromRGBO(21, 101, 192, 1)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  const Divider(
                    color: kprimaryColor,
                  ),
                  const EspaceMenuWidget(taille: 10),
                  InfoWidget(name: "Paramètres"),
                  const EspaceMenuWidget(taille: 15),
                  SettingsRow(
                    press: () {
                      Navigator.pushReplacementNamed(
                          context, CityScreen.routeName);
                    },
                    icon: "img/icons8_city 1.svg",
                    ville: "Ville",
                    info: "Toutes les villes",
                    hasInfo: true,
                  ),
                  SettingsRow(
                    press: () {
                      Navigator.pushReplacementNamed(
                          context, LanguageScreen.routeName);
                    },
                    icon: "img/icons8_Earth_Globe 1.svg",
                    ville: "Langue",
                    info: "Français",
                    hasInfo: true,
                  ),
                  const Divider(
                    color: kprimaryColor,
                  ),
                  const EspaceMenuWidget(taille: 10),
                  InfoWidget(name: "Autres"),
                  const EspaceMenuWidget(taille: 15),
                  SettingsRow(
                    press: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, LanguageScreen.routeName, (route) => false);
                    },
                    icon: "img/icons8_Earth_Globe 1.svg",
                    ville: "Langue",
                    info: "Français",
                  ),
                  SettingsRow(
                      press: () {},
                      ville: "Support",
                      icon: "img/icons8_multiple_messages 1.svg",
                      info: ""),
                  SettingsRow(
                    press: () {},
                    ville: "Appelez-nous",
                    icon: "img/icons8_call 1.svg",
                    info: "",
                  ),
                  SettingsRow(
                    press: () {},
                    ville: "Termes & Conditions",
                    icon: "img/term.svg",
                    info: '',
                  ),
                  SettingsRow(
                    press: () {},
                    ville: "Publicités",
                    icon: "img/icons8_commercial 1.svg",
                    info: "",
                  )
                ],
              ),
            ),
            textPresentation(
              msg: "Version 1.1",
              fontWeight: FontWeight.w300,
              size: 13,
            ),
          ],
        ),
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        children: [
          textPresentation(
            msg: name,
            fontWeight: FontWeight.w200,
            size: 18.36,
          ),
        ],
      ),
    );
  }
}
