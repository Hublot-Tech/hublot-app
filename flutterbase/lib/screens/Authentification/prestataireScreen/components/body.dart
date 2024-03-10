import 'package:flutter/material.dart';
import 'package:flutterbase/screens/Authentification/clientScreens/component/account_row.dart';

import '../../../../configuration.dart';
import '../../clientScreens/component/body.dart';
import '../../clientScreens/component/row_prestataire.dart';
import '../../clientScreens/component/row_reseau_connect.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          children: [
            const RowPrestataire(),
            Center(
              child: Image.asset("img/hublot.png"),
            ),
            const SizedBox(height: 20),
            Center(
              child: Image.asset("img/taf_icon.png"),
            ),
            Center(
              child: textPresentation(
                  mesg:
                      'Connectez vous pour joindre les prestataires plus proches ',
                  fontWeight: FontWeight.w600,
                  size: 23),
            ),
            const SizedBox(height: 20),
            RowReseauConnect(
              icon: "img/icons_facebook.png",
              img: "Continuer avec Facebook",
              press: () {},
            ),
            const SizedBox(height: 20),
            RowReseauConnect(
              icon: "img/icons_google.png",
              img: "Continuer avec Google",
              press: () {},
            ),
            const SizedBox(height: 20),
            RowReseauConnect(
              icon: "img/icons_apple.png",
              img: "Continuer avec Apple",
              press: () {},
            ),
            const SizedBox(height: 20),
            RowReseauConnect(
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
