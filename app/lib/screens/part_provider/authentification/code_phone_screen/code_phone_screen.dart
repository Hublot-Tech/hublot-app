import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';

import 'component/body.dart';

class CodePhoneScreem extends StatelessWidget {
  const CodePhoneScreem({super.key});
  static String routeName = '/code_phone_screen';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Body(),
    );
  }
}
