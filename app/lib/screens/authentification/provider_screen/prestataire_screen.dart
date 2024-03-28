import 'package:flutter/material.dart';
import 'package:app/screens/authentification/provider_screen/components/body.dart';

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
