import 'package:flutter/material.dart';

import 'component/body.dart';

class BlotPreviewScrenn extends StatelessWidget {
  const BlotPreviewScrenn({super.key});
  static String routeName = '/blot_preview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Body(),
    );
  }
}
