import 'package:flutter/material.dart';
import 'package:flutterbase/screens/Part_Customer/answerScreen/answer_screen.dart';
import 'package:flutterbase/screens/Part_Customer/homeScreens/components/home_screen.dart';
import 'package:flutterbase/screens/Part_Customer/searchScreens/search_screen.dart';
import 'package:flutterbase/screens/homeScreens/components/home_screen.dart';
import 'package:flutterbase/screens/authentification/registrationScreen/register_screen.dart';
import 'package:flutterbase/screens/presentationScreens/components/presention_screen.dart';
import 'package:flutterbase/screens/authentification/customerScreens/customer_screen.dart';
import 'package:flutterbase/screens/authentification/providerScreen/prestataire_screen.dart';

final Map<String, WidgetBuilder> route = {
  Home.routeName: (context) => const Home(),
  PresentationScreen.routeName: (context) => const PresentationScreen(),
  CustomerScrenn.routeName: (context) => const CustomerScrenn(),
  ProviderScreen.routeName: (context) => const ProviderScreen(),
  RegistrationScreen.routeName: (context) => const RegistrationScreen(),
  HomeScrenns.routeName: (context) => const HomeScrenns(),
  SearchScreen.routeName: (context) => const SearchScreen(),
  AnswerScreen.routeName: (context) => const AnswerScreen(),
};
