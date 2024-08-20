import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/blocs/blot/bloc/blot_bloc.dart';
import 'package:app/blocs/service/bloc/service_bloc.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class BlotScreen extends StatelessWidget {
  const BlotScreen({super.key, required this.hasOption});
  static String routeName = "/blot_screen";
  final bool hasOption;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BlotBloc(),
          ),
          BlocProvider(
            create: (context) => ServiceBloc(),
          ),
        ],
        child: Body(
          hasOption: hasOption,
        ),
      ),
    );
  }
}
