import 'package:flutter/material.dart';
import 'package:flutterbase/screens/Authentification/clientScreens/component/body.dart';

class ClientScrenn extends StatelessWidget {
  const ClientScrenn({super.key});
  static String routeName = "/client";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
