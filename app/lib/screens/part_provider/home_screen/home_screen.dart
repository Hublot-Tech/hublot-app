/// classe widget utilisée pour l"écran principal du prestataire
///
import 'package:app/configuration.dart';
import 'package:app/screens/part_customer/account_tab/account_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String routeName = "/homeScreenProvider";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const Body(),
        Container(),
        Container(),
        Container(),
        const AccountTab()
      ][_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.amber,
          selectedItemColor: Colors.black,
          onTap: (value) => setCurrentIndex(value),
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset("img/home-3--home-house-roof-shelter.svg"),
              label: "Acceuil",
              activeIcon: SvgPicture.asset("img/home-3 1.svg"),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "img/favori-icon.svg",
              ),
              label: "Favoris",
              activeIcon: SvgPicture.asset("img/favori-icon.svg"),
            ),
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  Container(
                    width: 52.13,
                    height: 52.01,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(51),
                        color: kyellowColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade500,
                            blurRadius: 2,
                            offset: const Offset(1.0, 4.0),
                            spreadRadius: 1.0,
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            blurRadius: 15,
                            offset: Offset(-4.0, -4.0),
                            spreadRadius: 1.0,
                          )
                        ]),
                  ),
                  Positioned(
                      top: 12,
                      left: 12,
                      child:
                          Center(child: SvgPicture.asset("img/msg-icon.svg"))),
                ],
              ),
              label: "",
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("img/chat.svg"),
                label: "Discussion",
                activeIcon:
                    SvgPicture.asset("img/chat-bubble-text-oval 1.svg")),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('img/hamburger-icon.svg'),
              label: "Menu",
            ),
          ]),
    );
  }
}
