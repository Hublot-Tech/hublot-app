import 'package:app/screens/presentation_screens/components/presention_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: route,
      debugShowCheckedModeBanner: false,
      initialRoute: PresentationScreen.routeName,
    );
  }
}
