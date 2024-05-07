import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class BlotScreen extends StatelessWidget {
  const BlotScreen({super.key});
  static String routeName = "/blot_screen";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Body(),
    );
  }
}
