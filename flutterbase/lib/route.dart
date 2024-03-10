import 'package:flutter/material.dart';
import 'package:flutterbase/screens/Part_Customer/homeScreens/components/home_screen.dart';
import 'package:flutterbase/screens/Part_Customer/searchScreens/search_screen.dart';
import 'package:flutterbase/screens/homeScreens/components/home_screen.dart';
import 'package:flutterbase/screens/Authentification/inscriptionScreen/inscription_screen.dart';
import 'package:flutterbase/screens/presentationScreens/components/presention_screen.dart';
import 'package:flutterbase/screens/Authentification/clientScreens/client_screen.dart';
import 'package:flutterbase/screens/Authentification/prestataireScreen/prestataire_screen.dart';

final Map<String, WidgetBuilder> route = {
  Home.routeName: (context) => const Home(),
  PresentationScreen.routeName: (context) => const PresentationScreen(),
  ClientScrenn.routeName: (context) => const ClientScrenn(),
  PrestataireScreen.routeName: (context) => const PrestataireScreen(),
  InscriptionScreen.routeName: (context) => const InscriptionScreen(),
  HomeScrenns.routeName: (context) => const HomeScrenns(),
  SearchScreen.routeName: (context) => const SearchScreen()
};
