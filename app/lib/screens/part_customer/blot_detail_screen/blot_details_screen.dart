import 'package:app/blocs/blot/bloc/blot_bloc.dart';
import 'package:app/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/body.dart';

class BlotDetailsScreen extends StatelessWidget {
  final String id;
  const BlotDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlotBloc()..add(BlotFetchIdEvent(id)),
      child: const Scaffold(
        backgroundColor: kColorWhite,
        body: Body(),
      ),
    );
  }
}
