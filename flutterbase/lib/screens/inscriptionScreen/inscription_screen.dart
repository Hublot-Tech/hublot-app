import 'package:flutter/material.dart';
import 'package:flutterbase/screens/inscriptionScreen/component/body.dart';

class InscriptionScreen extends StatelessWidget {
  const InscriptionScreen({super.key});
  static String routeName = '/inscription';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
