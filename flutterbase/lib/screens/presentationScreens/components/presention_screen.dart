import 'package:flutter/material.dart';
import 'package:flutterbase/screens/presentationScreens/components/body.dart';

class PresentationScreen extends StatelessWidget {
  static String routeName = "/presentation";
  const PresentationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
