import 'package:flutter/material.dart';
import 'package:flutterbase/screens/authentification/customerScreens/component/body.dart';

class CustomerScrenn extends StatelessWidget {
  const CustomerScrenn({super.key});
  static String routeName = "/client";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
