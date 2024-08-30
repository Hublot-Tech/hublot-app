import 'package:app/blocs/service/bloc/service_bloc.dart';
import 'package:app/configuration.dart';
import 'package:app/screens/part_customer/home_screens/components/hublo_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'component/body.dart';

class AllItemScreen extends StatelessWidget {
  const AllItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceBloc()..add(FetchProviderServicesEvent()),
      child: Scaffold(
        backgroundColor: kColorWhite,
        appBar: AppBar(
          title: Center(child: HublotTextWigdet()),
        ),
        body: Body(),
      ),
    );
  }
}
