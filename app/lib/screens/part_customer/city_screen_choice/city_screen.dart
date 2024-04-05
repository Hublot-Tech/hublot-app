import 'package:flutter/material.dart';

import 'components/body.dart';

class CityScreen extends StatelessWidget {
  const CityScreen({super.key});
  static String routeName="/city";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}