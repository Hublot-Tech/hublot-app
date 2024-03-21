import 'package:flutter/material.dart';
import 'package:app/screens/authentification/customer_screens/component/body.dart';

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
