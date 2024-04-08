import 'package:flutter/material.dart';
import 'package:app/screens/part_customer/search_screens/components/body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static String routeName = '/searh';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
