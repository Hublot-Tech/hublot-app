import 'package:flutter/material.dart';
import 'package:flutterbase/route.dart';
import 'package:flutterbase/screens/presentationScreens/components/presention_screen.dart';

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
