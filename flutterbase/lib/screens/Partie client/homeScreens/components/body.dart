import 'package:flutter/material.dart';
import 'package:flutterbase/configuration.dart';
import 'package:flutterbase/screens/Partie%20client/homeScreens/components/becomePrestataire.dart';

import 'box_information.dart';
import 'box_star.dart';
import 'cardRecommandes.dart';
import 'categoriesBox.dart';
import 'columnVoirPlus.dart';
import 'historiqueCard.dart';
import 'hubloWidget.dart';
import 'itemCategorie.dart';
import 'notificationBox.dart';
import 'searchBox.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const EspaceMenuWidget(),
              const HublotWigdet(),
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
              CategoriesBox(name: "Catégories", press: () {}),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      dataItem.length,
                      (index) => ItemDeCategories(
                          name: dataItem[index]['text']!,
                          icon: dataItem[index]['icon']!)),
                ),
              ),
              const EspaceMenuWidget(),
              const HistoriqueCard(),
              const EspaceMenuWidget(),
              ColumnVoirPlus(
                  name: "Recommandés",
                  msg: "Liste basé sur votre position",
                  press: () {}),
              const EspaceMenuWidget(),

              Container(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: itemCardRecommande.length,
                  itemBuilder: (context, index) {
                    return CardRecommandes(
                      img: itemCardRecommande[index]['img']!,
                      distance: itemCardRecommande[index]['Distance']!,
                      profession: itemCardRecommande[index]['profession']!,
                      lieu: itemCardRecommande[index]['lieu']!,
                      name: itemCardRecommande[index]['name']!,
                      note: itemCardRecommande[index]['note']!,
                    );
                  },
                ),
              ),

              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: List.generate(
              //       itemCardRecommande.length,
              //       (index) => CardRecommandes(
              //         img: itemCardRecommande[index]['img']!,
              //         distance: itemCardRecommande[index]['Distance']!,
              //         profession: itemCardRecommande[index]['profession']!,
              //         lieu: itemCardRecommande[index]['lieu']!,
              //         name: itemCardRecommande[index]['name']!,
              //         note: itemCardRecommande[index]['note']!,
              //       ),
              //     ),
              //   ),
              // ),
              // const CardRecommandes(
              //   img: "img/image 1.png",
              //   distance: '3km',
              //   profession: "Photographe",
              //   lieu: "Douala,akwa",
              //   name: 'Gihslain Kamga',
              //   note: '4.6',
              // ),
              const EspaceMenuWidget(),
              ColumnVoirPlus(
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
                      Spacer(),
                      Padding(
                        padding:
                            EdgeInsets.only(right: size.width * 0.02, top: 10),
                        child: BoxStar(
                          size: size,
                          icon: 'img/icons8_star 2.svg',
                          nbreEtoile: '4.6',
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.3),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
