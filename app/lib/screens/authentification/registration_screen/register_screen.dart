import 'package:app/blocs/auth/auth_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/authentification/registration_screen/component/body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});
  static String routeName = '/inscription';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child:const Body(),
      ),
    );
  }
}
/// cette class est le formulaire d'inscription a hublo
/// constituer de plusieurs textfield
/// prends en argument une fonction void press qui regiride le user apres s'etre inscris