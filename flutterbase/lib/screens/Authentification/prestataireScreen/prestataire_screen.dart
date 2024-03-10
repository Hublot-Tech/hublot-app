import 'package:flutter/material.dart';
import 'package:flutterbase/screens/Authentification/prestataireScreen/components/body.dart';

class PrestataireScreen extends StatelessWidget {
  const PrestataireScreen({super.key});
  static String routeName = '/prestataire';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
