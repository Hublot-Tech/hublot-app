import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class ServiceOfferScreen extends StatelessWidget {
  const ServiceOfferScreen({super.key});
  static String routeName = "/service_offer";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Body(),
    );
  }
}
