import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class DetailOfferScreen extends StatelessWidget {
  const DetailOfferScreen({super.key});
  static String routeName = "/detail_offer";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Body();
  }
}
