import 'package:flutter/material.dart';
import 'package:flutterbase/screens/authentification/providerScreen/components/body.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({super.key});
  static String routeName = '/prestataire';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
