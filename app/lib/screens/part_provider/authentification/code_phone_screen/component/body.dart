import 'package:app/configuration.dart';
import 'package:app/screens/authentification/registration_screen/component/button_custom.dart';
import 'package:app/screens/part_provider/add_service/description_service/components/background_add_service.dart';
import 'package:app/screens/part_provider/authentification/etape_authentification/etape_authenfication_screen.dart';
import 'package:app/screens/part_provider/authentification/phone_number_screen/phone_number_screen.dart';
import 'package:app/screens/part_provider/blot_screen/components/cancel_button.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';


class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return BackgroundAddService(
        widget: Padding(
      padding: EdgeInsets.only(
          left: getProportionateScreenHeight(20),
          right: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(
                  top: 10, right: getProportionateScreenWidth(660)),
              child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, PhoneNumberScreen.routeName);
                  },
                  icon: const Icon(Icons.arrow_back))),
          const EspaceMenuWidget(taille: 100),
          textPresentation(
              msg: 'Consulter votre messagerie',
              fontWeight: FontWeight.bold,
              size: 24.12),
          Padding(
            padding: EdgeInsets.only(
                top: getProportionateScreenWidth(2),
                left: getProportionateScreenWidth(21),
                right: getProportionateScreenWidth(21)),
            child: textPresentation(
              msg: 'Code envoyé au +237 6xx xxx xxx',
              fontWeight: FontWeight.normal,
              size: 11,
            ),
          ),
          const EspaceMenuWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: getProportionateScreenWidth(50),
                height: getProportionateScreenWidth(50),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: TextFormField(),
              ),
              Container(
                width: getProportionateScreenWidth(50),
                height: getProportionateScreenWidth(50),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: TextFormField(),
              ),
              Container(
                width: getProportionateScreenWidth(50),
                height: getProportionateScreenWidth(50),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: TextFormField(),
              ),
              Container(
                width: getProportionateScreenWidth(50),
                height: getProportionateScreenWidth(50),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: TextFormField(),
              ),
            ],
          ),
          const EspaceMenuWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textPresentation(
                  msg: '30s', fontWeight: FontWeight.normal, size: 13),
              SizedBox(width: getProportionateScreenWidth(10)),
              textPresentation(
                  msg: 'Renvoyer le code?',
                  fontWeight: FontWeight.normal,
                  size: 13,
                  color: kCategoriecolor),
            ],
          ),
          const EspaceMenuWidget(),
          ButtomCustom(
              press: () {
                Navigator.pushNamed(
                    context, EtapeAuthentificationScreen.routeName);
              },
              msg: 'Confirmer',
              isValided: false),
          const EspaceMenuWidget(),
          CancelButtom(press: () {}),
        ],
      ),
    ));
  }
}
