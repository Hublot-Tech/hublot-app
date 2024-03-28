import 'package:flutter/material.dart';
import 'package:app/screens/part_customer/answer_screen/answer_screen.dart';
import 'package:app/screens/part_customer/home_screens/components/home_screen.dart';
import 'package:app/screens/part_customer/search_screens/search_screen.dart';
import 'package:app/screens/home_screens/components/home_screen.dart';
import 'package:app/screens/authentification/registration_screen/register_screen.dart';
import 'package:app/screens/presentation_screens/components/presention_screen.dart';
import 'package:app/screens/authentification/customer_screens/customer_screen.dart';
import 'package:app/screens/authentification/provider_screen/prestataire_screen.dart';

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
