import 'package:app/configuration.dart';
import 'package:app/controller/service.dart';
import 'package:app/screens/part_customer/home_screens/components/hublo_text_widget.dart';
import 'package:flutter/material.dart';

import 'subscription_pack.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  HublotProviderApiApi hublotProviderApiApi = HublotProviderApiApi();
  List<Map<String, String>> list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = hublotProviderApiApi.getFreeSubscription();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          const Center(
            child: HublotTextWigdet(),
          ),
          const EspaceMenuWidget(),
          textPresentation(
              msg: "Pack d’abonnements", fontWeight: FontWeight.bold, size: 30),
          textPresentation(
              msg: """Choisissez le pack qui vous correspond
afin de beneficier de ses privileges""",
              fontWeight: FontWeight.normal,
              size: 16),
          const EspaceMenuWidget(taille: 40),
          SubscriptionPack(
            name: 'Free',
            offerList: list,
          ),
        ],
      ),
    );
  }
}
