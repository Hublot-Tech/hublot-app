import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/blocs/blot/bloc/blot_bloc.dart';
import 'package:app/configuration.dart';
import 'components/body.dart';

class CommandeScreen extends StatelessWidget {
  const CommandeScreen({super.key});

  @override
  Widget build(BuildContext context) {
 
    return BlocProvider(
      create: (context) => BlotBloc()
        ..add(const BlotFetchEvent(
           status: 'created')),
      child: Scaffold(
     
        body:  const Body(),
        backgroundColor: kColorWhite,
      ),
    );
  }
}
