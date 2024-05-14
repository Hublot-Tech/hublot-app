import 'package:app/configuration.dart';
import 'package:app/controller/blot.dart';
import 'package:app/screens/part_provider/add_service/description_service/components/background_add_service.dart';
import 'package:app/screens/part_provider/blot_screen/components/cancel_button.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../authentification/registration_screen/component/button_custom.dart';
import 'decoration_box_widget.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final Blot args = ModalRoute.of(context)!.settings.arguments as Blot;
    return BackgroundAddService(
      widget: Padding(
        padding: EdgeInsets.only(
            left: getProportionateScreenWidth(15),
            right: getProportionateScreenWidth(15)),
        child: Column(
          children: [
            const EspaceMenuWidget(),
            Container(
              height: getProportionateScreenHeight(46),
              width: getProportionateScreenWidth(46),
              padding: EdgeInsets.only(left: getProportionateScreenWidth(5)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(46),
                color: kprimaryColor,
              ),
              child: SvgPicture.asset(
                "img/bot_icon.svg",
                fit: BoxFit.scaleDown,
              ),
            ),
            const EspaceMenuWidget(taille: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textPresentation(
                    msg: "BLOT  #", fontWeight: FontWeight.bold, size: 24.12),
                textPresentation(
                    msg: args.idBlot.toString(),
                    fontWeight: FontWeight.normal,
                    size: 24.12),
              ],
            ),
            Center(
                child: textPresentation(
                    msg: "Détails", fontWeight: FontWeight.normal, size: 15)),
            const EspaceMenuWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textPresentation(
                    msg: 'Offre de base',
                    fontWeight: FontWeight.bold,
                    size: 24.12),
                const Spacer(),
                DecorationBoxWidget(
                    width: 115,
                    height: 50,
                    color: kyellowColor,
                    havePadding: true,
                    args: Center(
                      child: textPresentation(
                          msg: "10 000 FCFA",
                          fontWeight: FontWeight.bold,
                          color: kprimaryColor,
                          size: 15),
                    )),
              ],
            ),
            const EspaceMenuWidget(),
            Padding(
              padding: EdgeInsets.only(right: getProportionateScreenWidth(90)),
              child: textPresentation(
                  msg: "Résumer de l’échange",
                  fontWeight: FontWeight.bold,
                  size: 24.12),
            ),
            const EspaceMenuWidget(taille: 4),
            Padding(
              padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
              child: Row(
                children: [
                  textPresentation(
                      msg: args.description!,
                      fontWeight: FontWeight.normal,
                      size: 15,
                      textAlign: TextAlign.justify),
                ],
              ),
            ),
            const EspaceMenuWidget(),
            Padding(
              padding: EdgeInsets.only(right: getProportionateScreenWidth(98)),
              child: textPresentation(
                  msg: "Options selectionnés",
                  fontWeight: FontWeight.bold,
                  size: 24.12),
            ),
            const EspaceMenuWidget(),
            DecorationBoxWidget(
              width: 390,
              height: 50,
              color: kyellowColor,
              havePadding: true,
              args: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textPresentation(
                      msg: "Tenues", fontWeight: FontWeight.normal, size: 16),
                  textPresentation(
                      msg: "10 000 FCFA",
                      fontWeight: FontWeight.bold,
                      color: kprimaryColor,
                      size: 15),
                ],
              ),
            ),
            const EspaceMenuWidget(),
            Padding(
              padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
              child: textPresentation(
                  msg: "Délais de la tâche à effectuer",
                  fontWeight: FontWeight.bold,
                  size: 24.12),
            ),
            Row(
              children: [
                textPresentation(
                    msg: 'L’échéance de livraisons est prevu du ',
                    fontWeight: FontWeight.normal,
                    size: 16),
                DecorationBoxWidget(
                  args: Center(
                    child: textPresentation(
                        msg:
                            '${args.beginDate!.day.toString()}/${args.beginDate!.month.toString()}/${args.beginDate!.year.toString()}',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        size: 14),
                  ),
                  height: 26,
                  width: 61,
                  color: ksecondaryColor,
                  havePadding: false,
                ),
              ],
            ),
            Row(
              children: [
                textPresentation(
                    msg: 'au   ', fontWeight: FontWeight.normal, size: 14),
                DecorationBoxWidget(
                  args: Center(
                    child: textPresentation(
                        msg:
                            '${args.endDate!.day.toString()}/${args.endDate!.month.toString()}/${args.beginDate!.year.toString()}',
                        fontWeight: FontWeight.bold,
                        size: 18),
                  ),
                  height: 26,
                  width: 91,
                  color: kyellowColor,
                  havePadding: false,
                ),
              ],
            ),
            const EspaceMenuWidget(),
            ButtomCustom(
              isValided: true,
              msg: 'Envoyer',
              press: () {},
            ),
            const EspaceMenuWidget(),
            CancelButtom(press: () {}),
          ],
        ),
      ),
    );
  }
}
