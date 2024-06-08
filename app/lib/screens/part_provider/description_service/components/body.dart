import 'package:app/configuration.dart';
import 'package:app/controller/service.dart';
import 'package:app/screens/part_customer/home_screens/components/hublo_text_widget.dart';
import 'package:app/screens/part_provider/add_service/service_offer/service_offer_screen.dart';
import 'package:app/screens/part_provider/description_service/components/custom_widget.dart';
import 'package:app/screens/part_provider/description_service/components/offre_base_box.dart';
import 'package:app/screens/part_provider/description_service/components/row_recommended_provider.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'box_change.dart';
import 'box_presentation_information_provider.dart';
import 'rating_box.dart';
import 'row_verified_provider.dart';
import 'show_box_discussion.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  HublotProviderApiApi hublotProviderApiApi = HublotProviderApiApi();
  List<Map<String, String>> offerList = [];
  List<Map<String, String>> offerStandartList = [];

  @override
  void initState() {
    super.initState();
    offerList = hublotProviderApiApi.getBasicOffer();
    debugPrint(offerList.length.toString());
    offerStandartList = hublotProviderApiApi.getStandarOffer();
    debugPrint(offerStandartList.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const HublotTextWigdet(),
            const EspaceMenuWidget(),
            ClipPath(
              clipper: TCustomWidget(),
              child: Container(
                padding: const EdgeInsets.all(0),
                child: const Testd(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(20),
                  right: getProportionateScreenWidth(20),
                  bottom: getProportionateScreenWidth(20)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RowVerifieProvider(
                      imgPath: "img/icons8_instagram_check_mark 3.svg",
                      text: "Non verifié"),
                  RowRecommandedProvider(
                      imgPath: "img/icons8_thumbs_up_1 1 (1).svg",
                      text: "Non recommandé"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
              child: const BoxPresentationInformation(
                name: 'Judith Kamga,',
                profession: 'Photographe',
                distance: '3km',
                lieu: 'Douala ,Akwa',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: getProportionateScreenWidth(6), left: 20),
              child: const RatingVotingBox(rating: 0, vote: 0),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: getProportionateScreenHeight(20),
                  top: getProportionateScreenWidth(0)),
              child: Row(
                children: [
                  const RatingBox(
                      imgPath: "img/icons8_thumbs_up_1 1.svg",
                      rate: 0,
                      color: kgreenColor),
                  const SizedBox(width: 30),
                  const RatingBox(
                      //negative
                      imgPath: "img/icons8_thumbs_down 1.svg",
                      rate: 0,
                      color: kredColor),
                  Padding(
                    padding: EdgeInsets.only(
                        left: getProportionateScreenWidth(75),
                        bottom: getProportionateScreenWidth(10)),
                    child: Row(
                      children: [
                        const ShadowBoxDiscussion(
                          imgPath: 'img/icons8_discussion_forum 1.svg',
                          nbre: 0,
                        ),
                        SizedBox(width: getProportionateScreenWidth(15)),
                        const ShadowBoxDiscussion(
                          imgPath: 'img/icons8_handshake 1.svg',
                          nbre: 0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const EspaceMenuWidget(),
            Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
                child: const TitleBox(
                    number: 1, titre: "Description des services")),
            Padding(
              padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(20),
                  right: getProportionateScreenWidth(20),
                  top: getProportionateScreenWidth(05)),
              child: textPresentation(
                  textAlign: TextAlign.justify,
                  msg:
                      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonu Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonu Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonu",
                  fontWeight: FontWeight.w400,
                  size: 18.25),
            ),
            const EspaceMenuWidget(),
            Padding(
              padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
              child: const TitleBox(
                  number: 2, titre: "Offres et services disponible :"),
            ),
            const EspaceMenuWidget(taille: 10),
            BoxBasicPrimaryColor(
              title: "Offre de base",
              method: () {},
            ),
            // ...List.generate(
            //     offerList.length,
            //     (index) => OffreBaseBox(
            //         name: offerList[index]['name']!,
            //         nbre: offerList[index]['nbre']!)),
            ListView.builder(
                shrinkWrap: true,
                itemCount: offerList.length,
                itemBuilder: (context, index) {
                  return OffreBaseBox(
                      name: offerList[index]['name'],
                      nbre: offerList[index]['nbre']);
                }),
            const EspaceMenuWidget(),
            Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        textPresentation(
                            msg: "Recommandé",
                            fontWeight: FontWeight.bold,
                            size: 19),
                        const Icon(Icons.keyboard_arrow_down_sharp),
                      ]),
                      textPresentation(
                          msg: "Offre de standard",
                          fontWeight: FontWeight.normal,
                          size: 11.64,
                          color: kprimaryColor.withOpacity(0.9)),
                    ],
                  ),
                ),
                AddOfferButton(
                    heigt: 190,
                    press: () {},
                    width: 34,
                    msg: "Ajouter une offre ou une option"),
              ],
            ),
            const EspaceMenuWidget(),
            Container(
              width: getProportionateScreenWidth(156),
              height: getProportionateScreenHeight(6),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(30)),
            ),
            const EspaceMenuWidget(),
            BoxBasicPrimaryColor(
              title: "Offre de Standard",
              method: () {},
            ),
            // ...List.generate(
            //     offerStandartList.length,
            //     (index) => OffreBaseBox(
            //         name: offerStandartList[index]['name']!,
            //         nbre: offerStandartList[index]['nbre']!)),
            ListView.builder(
                shrinkWrap: true,
                itemCount: offerStandartList.length,
                itemBuilder: (context, index) {
                  return OffreBaseBox(
                      name: offerStandartList[index]['name'],
                      nbre: offerStandartList[index]['nbre']);
                }),
            const EspaceMenuWidget(),
            Padding(
              padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(05),
                  right: getProportionateScreenWidth(20)),
              child: AddOfferButton(
                  heigt: 390,
                  press: () {},
                  width: 50,
                  msg: "Ajouter des options"),
            ),
          ],
        ),
      ),
    );
    //page de service profil + status
  }
}

class AddOfferButton extends StatelessWidget {
  const AddOfferButton({
    super.key,
    required this.heigt,
    required this.width,
    required this.press,
    required this.msg,
  });
  final double heigt, width;
  final GestureCancelCallback press;
  final String msg;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(left: getProportionateScreenWidth(15)),
        width: getProportionateScreenWidth(heigt),
        height: getProportionateScreenHeight(width),
        decoration: const BoxDecoration(
          color: kyellowColor,
        ),
        child: Center(
          child:
              textPresentation(msg: msg, fontWeight: FontWeight.bold, size: 14),
        ),
      ),
    );
  }
}

class BoxBasicPrimaryColor extends StatelessWidget {
  const BoxBasicPrimaryColor({
    super.key,
    required this.title,
    required this.method,
  });

  final String title;
  final GestureCancelCallback method;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: getProportionateScreenWidth(20),
          right: getProportionateScreenWidth(20)),
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(10),
          right: getProportionateScreenWidth(10)),
      width: getProportionateScreenWidth(390),
      height: getProportionateScreenHeight(50),
      decoration: const BoxDecoration(
        color: kprimaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textPresentation(
              msg: title,
              color: Colors.white,
              fontWeight: FontWeight.normal,
              size: 18.64),
          BoxChange(press: () {
            Navigator.pushNamed(context, ServiceOfferScreen.routeName);
          }),
        ],
      ),
    );
  }
}

class TitleBox extends StatelessWidget {
  const TitleBox({
    super.key,
    required this.number,
    required this.titre,
  });
  final int number;
  final String titre;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        textPresentation(
            msg: "$number-",
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
            size: 18.64),
        textPresentation(
            msg: titre,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
            size: 18.64),
      ],
    );
  }
}
