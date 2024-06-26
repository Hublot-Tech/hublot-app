import 'package:flutter/material.dart';
import 'package:app/screens/authentification/customer_screens/component/cross_widget.dart';

import '../../../../configuration.dart';
import 'account_row.dart';
import 'network_widget.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          children: [
            const CrossWidget(),
            Center(
              child: Image.asset("img/hublot.png"),
            ),
            const SizedBox(height: 20),
            Center(
              child: Image.asset("img/taf_icon.png"),
            ),
            Center(
              child: textPresentation(
                  msg:
                      'Connectez vous pour decouvrir des services adapter a vos besoins',
                  fontWeight: FontWeight.w600,
                  size: 23),
            ),
            const SizedBox(height: 20),
            NetworkWigdet(
              icon: "img/icons_facebook.png",
              img: "Continuer avec Facebook",
              press: () {},
            ),
            const SizedBox(height: 20),
            NetworkWigdet(
              icon: "img/icons_google.png",
              img: "Continuer avec Google",
              press: () {},
            ),
            const SizedBox(height: 20),
            NetworkWigdet(
              icon: "img/icons_apple.png",
              img: "Continuer avec Apple",
              press: () {},
            ),
            const SizedBox(height: 20),
            NetworkWigdet(
              icon: "img/icons_gmail.png",
              img: "Continuer avec Gmail",
              press: () {},
            ),
            const AccountRow(),
            const Row(
              children: [
                TextWithStyle(text: "Vous acceptez les", colors: Colors.black),
                TextWithStyle(
                    text: " termes et conditions à suivre ",
                    colors: Colors.blue),
                TextWithStyle(
                  colors: Colors.black,
                  text: 'à votre connexion',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TextWithStyle extends StatelessWidget {
  const TextWithStyle({
    super.key,
    required this.text,
    required this.colors,
  });
  final String text;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: colors, fontSize: 12),
    );
  }
}
