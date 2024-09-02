import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class EtapeAuthentificationScreen extends StatelessWidget {
  const EtapeAuthentificationScreen({super.key});
  static String routeName = '/etapeAuthentification';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Body(),
    );
  }
}
