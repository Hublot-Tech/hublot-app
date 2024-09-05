import 'package:app/blocs/message/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:app/configuration.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/body.dart';

class RecentChats extends StatelessWidget {
  const RecentChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorWhite,
      body: BlocProvider(
        create: (context) => ChatBloc()..add(ChatUpdateEvent()),
        child: const Body(),
      ),
    );
  }
}
