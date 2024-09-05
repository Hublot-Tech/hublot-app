import 'package:app/blocs/blot/bloc/blot_bloc.dart';
import 'package:app/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'component/body.dart';

class BlotCancelScreen extends StatelessWidget {
  const BlotCancelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlotBloc(),
      child: Scaffold(
        backgroundColor: kColorWhite,
        body: Body(),
      ),
    );
  }
}
