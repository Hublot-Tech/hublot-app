import 'package:flutter/material.dart';
import 'package:app/screens/authentification/registration_screen/component/body.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});
  static String routeName = '/inscription';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
