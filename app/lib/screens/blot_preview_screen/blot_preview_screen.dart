import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/blocs/auth/auth_form_bloc.dart';
import 'package:app/blocs/auth/auth_form_event.dart';
import 'package:app/blocs/blot/bloc/blot_bloc.dart';
import 'package:app/blocs/message/bloc/chat_bloc.dart';

import 'component/body.dart';

class BlotPreviewScrenn extends StatelessWidget {
  const BlotPreviewScrenn({super.key});
  static String routeName = '/blot_preview';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BlotBloc(),
        ),
        BlocProvider(
          create: (context) => ChatBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthGetCurrentUserEvent()),
        ),
      ],
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Body(),
      ),
    );
  }
}
