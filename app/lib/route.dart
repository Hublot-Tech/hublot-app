import 'package:app/modules/shipping_services/page/shipping_service_screen.dart';
import 'package:app/screens/part_customer/account_tab/account_tab.dart';
import 'package:app/screens/part_customer/city_screen_choice/city_screen.dart';
import 'package:app/screens/part_customer/language_screen/language_screen.dart';
import 'package:app/screens/part_provider/add_service/description_service/description_screen.dart';
import 'package:app/screens/part_provider/add_service/detail_offer/detail_offer_screen.dart';
import 'package:app/screens/part_provider/authentification/code_phone_screen/code_phone_screen.dart';
import 'package:app/screens/part_provider/authentification/etape_authentification/etape_authenfication_screen.dart';
import 'package:app/screens/part_provider/blot_preview_screen/blot_preview_screen.dart';
import 'package:app/screens/part_provider/blot_screen/blot_screen.dart';
import 'package:app/screens/part_provider/description_service/description_service_screen.dart';
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

import 'screens/part_provider/authentification/phone_number_screen/phone_number_screen.dart';
import 'screens/part_provider/authentification/verify_identity/verify_identity_screen.dart';

final Map<String, WidgetBuilder> route = {
  Home.routeName: (context) => const Home(),
  PresentationScreen.routeName: (context) => const PresentationScreen(),
  CustomerScrenn.routeName: (context) => const CustomerScrenn(),
  ProviderScreen.routeName: (context) => const ProviderScreen(),
  RegistrationScreen.routeName: (context) => const RegistrationScreen(),
  HomeScrenns.routeName: (context) => const HomeScrenns(),
  SearchScreen.routeName: (context) => const SearchScreen(),
  AnswerScreen.routeName: (context) => const AnswerScreen(),
  AccountTab.routeName: (context) => const AccountTab(),
  LanguageScreen.routeName: (context) => const LanguageScreen(),
  CityScreen.routeName: (context) => const CityScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  DescriptionScreen.routeName: (context) => const DescriptionScreen(),
  ServiceOfferScreen.routeName: (context) => const ServiceOfferScreen(),
  DetailOfferScreen.routeName: (context) => const DetailOfferScreen(),
  DescriptionService.routeName: (context) => const DescriptionService(),
  BlotScreen.routeName: (context) => const BlotScreen(),
  BlotPreviewScrenn.routeName: (context) => const BlotPreviewScrenn(),
  PhoneNumberScreen.routeName: (context) => const PhoneNumberScreen(),
  CodePhoneScreem.routeName: (context) => const CodePhoneScreem(),
  EtapeAuthentificationScreen.routeName: (context) =>
      const EtapeAuthentificationScreen(),
  VerifyIdentityScreen.routeName: (context) => const VerifyIdentityScreen(),
  ShippingServices.routeName: (context) => const ShippingServices(),
};
