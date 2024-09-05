import 'package:app/blocs/blot/bloc/blot_bloc.dart';
import 'package:app/model/blot_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'component/body.dart';

class BlotVerifyScreen extends StatelessWidget {
  final BlotInfo blotInfo;
  const BlotVerifyScreen({super.key, required this.blotInfo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlotBloc(),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
        body: Body(blotInfo: blotInfo),
      ),
    );
  }
}
