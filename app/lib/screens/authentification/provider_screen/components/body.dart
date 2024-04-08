import 'package:app/controller/function_api.dart';
import 'package:app/controller/google_sign_it.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/authentification/customer_Screens/component/account_row.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../configuration.dart';
import '../../customer_screens/component/body.dart';
import '../../customer_screens/component/cross_widget.dart';
import '../../customer_screens/component/network_widget.dart';

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
                  msg: 'Connectez vous pour joindre les services plus proches ',
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
            const NetworkWigdet(
              icon: "img/icons_google.png",
              img: "Continuer avec Google",
              press: asignIn,
            ),
            const SizedBox(height: 20),
            NetworkWigdet(
              icon: "img/icons_apple.png",
              img: "Continuer avec Apple",
              press: () async {
                await GoogleSignInAPi.signOut();
              },
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

Future<void> asignIn() async {
  GoogleSignInAccount? user = await GoogleSignInAPi.login();
  debugPrint(user!.displayName.toString());
  final auth = await user.authentication;
  String? idToken = auth.idToken;

  debugPrint(auth.idToken);
  if (idToken != null) {
    // call the server with ID token
    postIdToken(idToken);
  }
}
