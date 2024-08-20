import 'package:app/blocs/service/bloc/service_bloc.dart';
import 'package:app/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/body.dart';

class CommandeScreen extends StatelessWidget {
  const CommandeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //receive id arguments from previous screen
    final args = ModalRoute.of(context)!.settings.arguments as List<String>;

    return Scaffold(
      backgroundColor: kColorWhite,
      body: BlocProvider(
        create: (context) => ServiceBloc()..add(FetchServiceByIdEvent(args[0])),
        child: const Body(),
      ),
    );
  }
}
