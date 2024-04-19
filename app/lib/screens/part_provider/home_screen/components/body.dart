import 'package:app/configuration.dart';
import 'package:app/controller/service.dart';
import 'package:app/screens/part_customer/home_screens/components/become_prestataire.dart';
import 'package:app/screens/part_customer/home_screens/components/box_category_service.dart';
import 'package:app/screens/part_customer/home_screens/components/card_historic.dart';
import 'package:app/screens/part_customer/home_screens/components/hublo_text_widget.dart';
import 'package:app/screens/part_customer/home_screens/components/notification_box.dart';
import 'package:app/screens/part_customer/home_screens/components/row_see_more.dart';
import 'package:app/screens/part_customer/home_screens/components/search_box.dart';
import 'package:app/screens/part_provider/add_service/description_service/description_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../part_customer/home_screens/components/card_service_prestataire.dart';
import '../../../part_customer/home_screens/components/item_categorie.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool shimmer = false;
  HublotProviderApiApi apiPrestataire = HublotProviderApiApi();
  List<Map<String, String>> itemServices = [];
  List<Map<String, String>> itemCategoris = [];
  Future<void> _refresh() {
    setState(() {
      shimmer = true;
    });
    return Future.delayed(const Duration(seconds: 3)).then((value) {
      setState(() {
        shimmer = false;
        itemServices = apiPrestataire.getAllServices();
        itemCategoris = apiPrestataire.getAllCategories();
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemServices = apiPrestataire.getAllServices();
    itemCategoris = apiPrestataire.getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            children: [
              const EspaceMenuWidget(),
              const HublotTextWigdet(),
              const EspaceMenuWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BecomeRowBox(
                    text: 'Devenir partenaire',
                    press: () {},
                  ),
                  const NotificationBox(),
                ],
              ),
              const EspaceMenuWidget(),
              const SearchBox(),
              const EspaceMenuWidget(),
              BoxCategoryService(name: "Catégories", press: () {}),
              const EspaceMenuWidget(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      itemCategoris.length,
                      (index) => ItemCategories(
                          name: itemCategoris[index]['text']!,
                          icon: itemCategoris[index]['icon']!)),
                ),
              ),
              const EspaceMenuWidget(),
              Container(
                margin: const EdgeInsets.only(right: 20),
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      blurRadius: 2,
                      offset: const Offset(1.0, 1.0),
                      spreadRadius: 1.0,
                    ),
                    const BoxShadow(
                      color: Colors.white,
                      blurRadius: 10,
                      offset: Offset(-1.0, -1.0),
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 81,
                      height: 110,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 192, 0, 0.2)),
                      child: Center(
                        child: Image.asset("img/icon_v.png"),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            textPresentation(
                                msg: "Avoir un profil vérifier",
                                size: 16,
                                fontWeight: FontWeight.bold),
                            const Spacer(),
                            textPresentation(
                                msg: "Construisez une confiance",
                                size: 11,
                                fontWeight: FontWeight.normal),
                            textPresentation(
                                msg: "Soyez plus visible",
                                size: 11,
                                fontWeight: FontWeight.normal),
                            textPresentation(
                                msg: "Débloquez des options exclusive",
                                size: 11,
                                fontWeight: FontWeight.normal),
                            const EspaceMenuWidget(taille: 10),
                            textPresentation(
                                msg: "Commencer.",
                                fontWeight: FontWeight.normal,
                                size: 11,
                                color: kCategoriecolor),
                            const Spacer(flex: 2),
                          ],
                        ),
                        const SizedBox(width: 65),
                        const Icon(Icons.arrow_forward_sharp),
                      ],
                    )
                  ],
                ),
              ),
              const EspaceMenuWidget(),
              const CardHistoric(),
              const EspaceMenuWidget(),
              RowSeeMore(
                  name: "Vos services",
                  msg: "Liste basé sur le niveau de demandes",
                  press: () {}),
              const EspaceMenuWidget(),
              Padding(
                padding: const EdgeInsets.only(right: 22),
                child: Stack(children: [
                  Image.asset("img/services.png"),
                  Positioned(
                      left: size.width * 0.3,
                      top: size.height * 0.17,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, DescriptionScreen.routeName);
                          },
                          child:
                              SvgPicture.asset("img/icons8_Plus_Key 1.svg"))),
                ]),
              ),
              EspaceMenuWidget(),
              RowSeeMore(
                  name: "Recommandés",
                  msg: "Liste basé sur votre position",
                  press: () {}),
              EspaceMenuWidget(),
              SizedBox(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: itemServices.length,
                  itemBuilder: (context, index) {
                    return CardServicePrestataire(
                      img: itemServices[index]['img']!,
                      distance: itemServices[index]['Distance']!,
                      profession: itemServices[index]['profession']!,
                      localization: itemServices[index]['lieu']!,
                      name: itemServices[index]['name']!,
                      note: itemServices[index]['note']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/// body de la class HOmeScreen du prestataire,   