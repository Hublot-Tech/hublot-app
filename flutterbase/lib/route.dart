import 'package:flutter/material.dart';
import 'package:flutterbase/screens/Partie%20client/homeScreens/components/home_screen.dart';
import 'package:flutterbase/screens/homeScreens/components/home_screen.dart';
import 'package:flutterbase/screens/inscriptionScreen/inscription_screen.dart';
import 'package:flutterbase/screens/presentationScreens/components/presention_screen.dart';
import 'package:flutterbase/screens/clientScreens/client_screen.dart';
import 'package:flutterbase/screens/prestataireScreen/prestataire_screen.dart';

final Map<String, WidgetBuilder> route = {
  Home.routeName: (context) => const Home(),
  PresentationScreen.routeName: (context) => const PresentationScreen(),
  ClientScrenn.routeName: (context) => const ClientScrenn(),
  PrestataireScreen.routeName: (context) => const PrestataireScreen(),
  InscriptionScreen.routeName: (context) => const InscriptionScreen(),
  HomeScrenns.routeName: (context) => const HomeScrenns()
};
