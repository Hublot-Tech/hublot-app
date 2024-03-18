import 'package:flutter/material.dart';
import 'package:flutterbase/screens/authentification/registrationScreen/component/body.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});
  static String routeName = '/inscription';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
