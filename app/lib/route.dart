import 'package:app/screens/part_customer/account_tab/account_tab.dart';
import 'package:app/screens/part_customer/city_screen_choice/city_screen.dart';
import 'package:app/screens/part_customer/language_screen/language_screen.dart';
import 'package:app/screens/part_provider/add_service/description_service/description_screen.dart';
import 'package:app/screens/part_provider/add_service/detail_offer/detail_offer_screen.dart';
import 'package:app/screens/part_provider/home_screen/home_screen.dart';
import 'package:app/screens/part_provider/add_service/service_offer/service_offer_screen.dart';
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
  RegistrationScreen.routeName: (context) =>  RegistrationScreen(),
  HomeScrenns.routeName: (context) => const HomeScrenns(),
  SearchScreen.routeName: (context) => const SearchScreen(),
  AnswerScreen.routeName: (context) => const AnswerScreen(),
  AccountTab.routeName: (context) => const AccountTab(),
  LanguageScreen.routeName: (context) => const LanguageScreen(),
  CityScreen.routeName: (context) => const CityScreen(),
  HomeScreen.routeName:(context) => const HomeScreen(),
  DescriptionScreen.routeName:(context) => const DescriptionScreen(),
  ServiceOfferScreen.routeName:(context) => const ServiceOfferScreen(),
  DetailOfferScreen.routeName:(context) => const DetailOfferScreen()
 };
