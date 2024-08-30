import 'package:app/configuration.dart';
import 'package:app/model/user_storage.dart';
import 'package:app/screens/part_customer/city_screen_choice/city_screen.dart';
import 'package:app/screens/part_customer/commande_screen/commande_screen.dart';
import 'package:app/screens/part_customer/language_screen/language_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'settings_row.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    UserStorage userStorage = UserStorage();

    Future<Map<String, String>> infoUser;
    Map<String, String>? userData = <String, String>{};
    infoUser = userStorage.getUserData();
    return SafeArea(
      child: SingleChildScrollView(
        child: FutureBuilder<Map<String, String>>(
            future: infoUser,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                userData = snapshot.data;
              }
              return Container(
                color: Colors.white,
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: RowUserProfile(userData: userData),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        // Navigator.pushNamedAndRemoveUntil(
                        //     context, CustomerScrenn.routeName, (route) => false);
                      },
                      child: Container(
                        width: size.width * 0.87,
                        height: size.height * 0.064,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('img/icons8_male_user 2.png'),
                            const SizedBox(width: 10),
                            Center(
                              child: textPresentation(
                                msg: "Mes comptes",
                                size: 18.36,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     IconButton(
                    //         onPressed: () {},
                    //         icon: SvgPicture.asset("img/plus_blue.svg")),
                    //     textPresentation(
                    //         msg: "Créer un compte",
                    //         fontWeight: FontWeight.normal,
                    //         size: 16,
                    //         color: const Color.fromRGBO(21, 101, 192, 1)),
                    //   ],
                    // ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        children: [
                          const Divider(
                            color: kprimaryColor,
                          ),
                          SettingsRow(
                            hasFlesh: false,
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CommandeScreen()));
                            },
                            icon: "img/icons8_edit_delivery_terms 1.svg",
                            ville: "Commandes",
                            info: "Toutes les villes",
                            hasInfo: false,
                          ),
                          const Divider(
                            color: kprimaryColor,
                          ),
                          const EspaceMenuWidget(taille: 10),
                          const InfoWidget(name: "Paramètres"),
                          const EspaceMenuWidget(taille: 15),
                          SettingsRow(
                            press: () {
                              Navigator.pushReplacementNamed(
                                  context, CityScreen.routeName);
                            },
                            icon: "img/icons8_city 1.svg",
                            ville: "Ville",
                            info: "Toutes les villes",
                            hasInfo: true,
                          ),
                          SettingsRow(
                            press: () {
                              Navigator.pushReplacementNamed(
                                  context, LanguageScreen.routeName);
                            },
                            icon: "img/icons8_Earth_Globe 1.svg",
                            ville: "Langue",
                            info: "Français",
                            hasInfo: true,
                          ),
                          const Divider(
                            color: kprimaryColor,
                          ),
                          const EspaceMenuWidget(taille: 10),
                          const InfoWidget(name: "Autres"),
                          const EspaceMenuWidget(taille: 15),
                          SettingsRow(
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LanguageScreen()));
                            },
                            icon: "img/icons8_Earth_Globe 1.svg",
                            ville: "Langue",
                            info: "Français",
                          ),
                          SettingsRow(
                              press: () {},
                              ville: "Support",
                              icon: "img/icons8_multiple_messages 1.svg",
                              info: ""),
                          SettingsRow(
                            press: () {},
                            ville: "Appelez-nous",
                            icon: "img/icons8_call 1.svg",
                            info: "",
                          ),
                          SettingsRow(
                            press: () {},
                            ville: "Termes & Conditions",
                            icon: "img/term.svg",
                            info: '',
                          ),
                          SettingsRow(
                            press: () {},
                            ville: "Publicités",
                            icon: "img/icons8_commercial 1.svg",
                            info: "",
                          )
                        ],
                      ),
                    ),
                    textPresentation(
                      msg: "Version 1.1",
                      fontWeight: FontWeight.w300,
                      size: 13,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class RowUserProfile extends StatelessWidget {
  const RowUserProfile({
    super.key,
    required this.userData,
  });

  final Map<String, String>? userData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 54,
          width: 54,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(100, 100, 100, 0.1),
            borderRadius: BorderRadius.circular(54),
          ),
          child: SvgPicture.asset(
            "img/hublo_h.svg",
            width: 20,
            fit: BoxFit.none,
            height: 20,
          ),
        ),
        10.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                textPresentation(
                  msg: "Salut, ${userData!['name']}",
                  fontWeight: FontWeight.bold,
                  size: 23,
                ),
                const SizedBox(width: 5),
                Image.asset(userData!['verificationStatus'] == 'validated'
                    ? 'img/icons8_instagram_check_mark 3.png'
                    : userData!['verificationStatus'] == 'submitted'
                        ? 'img/icon_waiting.png'
                        : 'img/icons8_cancel_480px 1.png'),
              ],
            ),
            const SizedBox(height: 2),
            FittedBox(
              child: textPresentation(
                msg: "Vous êtes connectez en tant client",
                fontWeight: FontWeight.w400,
                size: 13,
                color: const Color.fromRGBO(100, 100, 100, 0.5),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        children: [
          textPresentation(
            msg: name,
            fontWeight: FontWeight.w200,
            size: 18.36,
          ),
        ],
      ),
    );
  }
}
