import 'package:app/configuration.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';

import 'component/body.dart';

class VerifyIdentityScreen extends StatelessWidget {
  const VerifyIdentityScreen({super.key});
  static String routeName = "/verify_identity";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      backgroundColor: kprimaryColor,
      body: Body(),
    );
  }
}
