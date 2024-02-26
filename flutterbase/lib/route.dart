import 'package:flutter/material.dart';
import 'package:flutterbase/screens/homeScreens/components/home_screen.dart';
import 'package:flutterbase/screens/presentationScreens/components/presention_screen.dart';

final Map<String, WidgetBuilder> route = {
  Home.routeName: (context) => const Home(),
  PresentationScreen.routeName: (context) => const PresentationScreen(),
};
