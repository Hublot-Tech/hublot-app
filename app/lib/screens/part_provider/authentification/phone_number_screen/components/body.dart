import 'package:app/configuration.dart';
import 'package:app/screens/authentification/registration_screen/component/button_custom.dart';
import 'package:app/screens/part_provider/add_service/description_service/components/background_add_service.dart';
import 'package:app/screens/part_provider/add_service/service_offer/components/cross_widget.dart';
import 'package:app/screens/part_provider/authentification/code_phone_screen/code_phone_screen.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return BackgroundAddService(
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
            EspaceMenuWidget(taille: 100),
            textPresentation(
                msg: 'Votre numero de telephone',
                fontWeight: FontWeight.bold,
                size: 24.12),
            Padding(
              padding: EdgeInsets.only(
                  top: getProportionateScreenWidth(2),
                  left: getProportionateScreenWidth(21),
                  right: getProportionateScreenWidth(21)),
              child: textPresentation(
                msg:
                    'Rassurez vous que votre contact est un compte whatsapp et qu’il soit du cameroun',
                fontWeight: FontWeight.normal,
                size: 11,
              ),
            ),
            EspaceMenuWidget(taille: 200),
            Row(
              children: [
                Checkbox(
                    value: isChecked,
                    onChanged: (ischeck) {
                      setState(() {
                        isChecked = ischeck!;
                      });
                    }),
                textPresentation(
                    msg: 'Vous accepetez les ',
                    fontWeight: FontWeight.normal,
                    size: 10),
                textPresentation(
                    msg: ' termes et conditions',
                    fontWeight: FontWeight.normal,
                    color: kCategoriecolor,
                    size: 10),
              ],
            ),
            ButtomCustom(
                press: () {
                  Navigator.pushNamed(context, CodePhoneScreem.routeName);
                },
                msg: 'Confirmer',
                isValided: isChecked),
          ],
        ),
      ),
    );
  }
}
