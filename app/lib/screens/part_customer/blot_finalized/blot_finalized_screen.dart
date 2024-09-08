import 'package:flutter/material.dart';
import 'component/body.dart';

class BlotFinalizedScreen extends StatelessWidget {
  const BlotFinalizedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      body: Body(),
    );
  }
}