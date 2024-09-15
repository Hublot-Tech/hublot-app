import 'package:app/blocs/auth/auth_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/body.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});
  static String routeName = "/account_tab";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const Scaffold(
        body: Body(),
      ),
    );
  }
}
