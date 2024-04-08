import 'package:flutter/material.dart';

import 'components/body.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});
  static String routeName = '/langue';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
