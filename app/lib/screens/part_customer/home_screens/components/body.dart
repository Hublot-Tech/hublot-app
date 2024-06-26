import 'package:app/controller/service.dart';
import 'package:flutter/material.dart';
import 'package:app/configuration.dart';
import 'package:app/screens/part_customer/home_screens/components/become_prestataire.dart';
import 'package:shimmer/shimmer.dart';

import 'box_information.dart';
import 'box_star.dart';
import 'card_service_prestataire.dart';
import 'box_category_service.dart';
import 'row_see_more.dart';
import 'card_historic.dart';
import 'hublo_text_widget.dart';
import 'item_categorie.dart';
import 'notification_box.dart';
import 'search_box.dart';

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

    return RefreshIndicator(
      onRefresh: _refresh,
      color: Colors.white,
      backgroundColor: kyellowColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const EspaceMenuWidget(),
                const HublotTextWigdet(),
                const EspaceMenuWidget(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BecomePrestataire(),
                    NotificationBox(),
                  ],
                ),
                const EspaceMenuWidget(),
                const SearchBox(),
                const EspaceMenuWidget(),
                shimmer
                    ? Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: Colors.transparent,
                        child: Column(
                          children: [
                            BoxCategoryService(
                                name: "Catégories", press: () {}),
                            const SizedBox(height: 10),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                    itemCategoris.length,
                                    (index) => ItemCategories(
                                        name: itemCategoris[index]['text']!,
                                        icon: itemCategoris[index]['icon']!)),
                              ),
                            ),

                            const EspaceMenuWidget(), //column deleted
                            const CardHistoric(),
                            const EspaceMenuWidget(),
                            RowSeeMore(
                                name: "Recommandés",
                                msg: "Liste basé sur votre position",
                                press: () {}),
                            const EspaceMenuWidget(),
                            SizedBox(
                              height: 400,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: itemServices.length,
                                itemBuilder: (context, index) {
                                  return CardServicePrestataire(
                                    img: itemServices[index]['img']!,
                                    distance: itemServices[index]['Distance']!,
                                    profession: itemServices[index]
                                        ['profession']!,
                                    localization: itemServices[index]['lieu']!,
                                    name: itemServices[index]['name']!,
                                    note: itemServices[index]['note']!,
                                  );
                                },
                              ),
                            ),
                            const EspaceMenuWidget(),
                            RowSeeMore(
                                name: "Annonceurs proches",
                                msg: "Liste basé sur votre position",
                                press: () {}),
                            const EspaceMenuWidget(),
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: ksecondaryColor,
                                      borderRadius: BorderRadius.circular(23)),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(23),
                                  child: Image.asset(
                                    "img/portrait-stylish-professional-photographer.jpg",
                                    width: 387,
                                    height: 356,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Spacer(),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: size.width * 0.02, top: 10),
                                      child: BoxStar(
                                        size: size,
                                        icon: 'img/icons8_star 2.svg',
                                        nbrOfStar: '4.6',
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: size.height * 0.3),
                                  child: Center(
                                    child: BoxInformation(
                                      size: size,
                                      name: "Grec Koum,",
                                      profession: "Photographe",
                                      lieu: "Douala,akwa",
                                      distance: "3km",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          BoxCategoryService(name: "Catégories", press: () {}),
                          const SizedBox(height: 10),
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

                          const EspaceMenuWidget(), //column deleted
                          const CardHistoric(),
                          const EspaceMenuWidget(),
                          RowSeeMore(
                              name: "Recommandés",
                              msg: "Liste basé sur votre position",
                              press: () {}),
                          const EspaceMenuWidget(),
                          SizedBox(
                            height: 400,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: itemServices.length,
                              itemBuilder: (context, index) {
                                return CardServicePrestataire(
                                  img: itemServices[index]['img']!,
                                  distance: itemServices[index]['Distance']!,
                                  profession: itemServices[index]
                                      ['profession']!,
                                  localization: itemServices[index]['lieu']!,
                                  name: itemServices[index]['name']!,
                                  note: itemServices[index]['note']!,
                                );
                              },
                            ),
                          ),
                          const EspaceMenuWidget(),
                          RowSeeMore(
                              name: "Annonceurs proches",
                              msg: "Liste basé sur votre position",
                              press: () {}),
                          const EspaceMenuWidget(),
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: ksecondaryColor,
                                    borderRadius: BorderRadius.circular(23)),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(23),
                                child: Image.asset(
                                  "img/portrait-stylish-professional-photographer.jpg",
                                  width: 387,
                                  height: 356,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Row(
                                children: [
                                  const Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: size.width * 0.02, top: 10),
                                    child: BoxStar(
                                      size: size,
                                      icon: 'img/icons8_star 2.svg',
                                      nbrOfStar: '4.6',
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * 0.3),
                                child: Center(
                                  child: BoxInformation(
                                    size: size,
                                    name: "Grec Koum,",
                                    profession: "Photographe",
                                    lieu: "Douala,akwa",
                                    distance: "3km",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
