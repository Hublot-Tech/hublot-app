import 'package:flutter/material.dart';
import 'package:flutterbase/screens/Part_Customer/searchScreens/components/body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static String routeName = '/searh';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
