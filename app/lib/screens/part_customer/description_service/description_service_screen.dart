import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/blocs/service/bloc/service_bloc.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class DescriptionService extends StatelessWidget {
  const DescriptionService({super.key});
  static String routeName = "/description_of_service";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final id = ModalRoute.of(context)!.settings.arguments as String;
    // BlocProvider.of<ServiceBloc>(context).add((FetchServiceByIdEvent(id)));
   
    return Scaffold(
      // backgroundColor: ktransparentColor,

      body: BlocProvider(
        create: (context) => ServiceBloc()..add(FetchServiceByIdEvent(id)),
        child: const Body(),
      ),
    );
  }
}
