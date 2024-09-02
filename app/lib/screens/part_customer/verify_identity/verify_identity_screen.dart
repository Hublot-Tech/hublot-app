import 'package:app/blocs/kyc/bloc/kyc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/configuration.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';

import 'component/body.dart';

class VerifyIdentityScreen extends StatelessWidget {
  const VerifyIdentityScreen({super.key});
  static String routeName = "/verifyIdentity";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Scaffold(
      backgroundColor: kprimaryColor,
      body: BlocProvider(
        create: (context) => KycBloc(),
        child:const Body(),
      ),
    );
  }
}
