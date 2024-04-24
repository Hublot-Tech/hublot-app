import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({super.key});
  static String routeName = "/descriptionScreen";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Body(),
    );
  }
}