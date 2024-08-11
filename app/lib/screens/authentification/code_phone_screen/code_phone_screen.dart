import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/blocs/auth/auth_form_bloc.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';

import 'component/body.dart';

class CodePhoneScreem extends StatelessWidget {
  const CodePhoneScreem({super.key});
  static String routeName = '/code_phone_screen';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: Body(),
      ),
    );
  }
}
