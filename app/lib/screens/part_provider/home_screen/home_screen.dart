/// classe widget utilisée pour l"écran principal du prestataire
///
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
              icon: SvgPicture.asset("img/Vector (3).svg"),
              label: "Favoris",
              activeIcon: SvgPicture.asset("img/favorite-heart 1.svg"),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("img/add-circle 1.svg"),
              label: "Ajouter",
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("img/chat.svg"),
                label: "Discussion",
                activeIcon:
                    SvgPicture.asset("img/chat-bubble-text-oval 1.svg")),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_outlined,
                color: Colors.black,
              ),
              label: "Compte",
              activeIcon: Icon(
                Icons.person_2,
                color: Colors.black,
              ),
            ),
          ]),
    );
  }
}
