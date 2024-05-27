import 'package:app/configuration.dart';
import 'package:app/screens/authentification/registration_screen/component/button_custom.dart';
import 'package:app/screens/part_provider/add_service/description_service/components/background_add_service.dart';
import 'package:app/screens/part_provider/authentification/code_phone_screen/code_phone_screen.dart';
import 'package:app/screens/part_provider/authentification/verify_identity/verify_identity_screen.dart';
import 'package:app/screens/part_provider/blot_screen/components/cancel_button.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';

import 'step_authentification.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = true;
    return BackgroundAddService(
      widget: Padding(
        padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(
                    top: 10, right: getProportionateScreenWidth(660)),
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, CodePhoneScreem.routeName);
                    },
                    icon: const Icon(Icons.arrow_back))),
            const EspaceMenuWidget(taille: 100),
            textPresentation(
                msg: 'Authenticité de votre compte',
                fontWeight: FontWeight.bold,
                size: 24.12),
            Padding(
              padding: EdgeInsets.only(
                  top: getProportionateScreenWidth(2),
                  left: getProportionateScreenWidth(21),
                  right: getProportionateScreenWidth(21)),
              child: textPresentation(
                msg:
                    'Afin de garantir une credibilité la verification de votre compte est necessaire tant pour vous que pour votre clientèle',
                fontWeight: FontWeight.w200,
                size: 10,
              ),
            ),
            const EspaceMenuWidget(),
            StepAuthentification(
                isChecked: isChecked, test: 'Création de votre compte'),
            StepAuthentification(
                isChecked: isChecked,
                test: 'Verification de votre numero whatsapp'),
            const StepAuthentification(
                isChecked: false, test: 'Verification de votre identité'),
            const StepAuthentification(
                isChecked: false, test: 'Effectuer votre premier Blot'),
            const EspaceMenuWidget(),
            ButtomCustom(
                press: () {
                  Navigator.pushNamed(context, VerifyIdentityScreen.routeName);
                },
                msg: 'Continuer',
                isValided: true),
            const EspaceMenuWidget(),
            CancelButtom(press: () {}),
          ],
        ),
      ),
    );
  }
}
