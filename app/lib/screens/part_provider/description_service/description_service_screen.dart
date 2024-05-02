import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class DescriptionService extends StatelessWidget {
  const DescriptionService({super.key});
  static String routeName = "/description_of_service";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      // backgroundColor: ktransparentColor,

      body: Body(),
    );
  }
}
