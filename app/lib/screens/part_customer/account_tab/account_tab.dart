import 'package:flutter/material.dart';

import 'components/body.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});
  static String routeName = "/account_tab";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
