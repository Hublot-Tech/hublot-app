import 'package:app/blocs/service/bloc/service_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'component/body.dart';

class AnswerScreen extends StatelessWidget {
  const AnswerScreen({super.key, this.searchWord = "null"});
  final String searchWord;
  static String routeName = "/answer_screnn";

  @override
  Widget build(BuildContext context) {
    
    return  BlocProvider(
      create: (context) => ServiceBloc()..add(FetchServicesEvent(keywords:searchWord )),
      child: Scaffold(
          body: Body(searchWord: searchWord),
        ),
    );
  }
}
