import 'package:app/configuration.dart';
import 'package:flutter/material.dart';
import 'component/body.dart';
class BlotCancelScreen extends StatelessWidget {
  const BlotCancelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorWhite,
      body: Body(),
    );
  }
}