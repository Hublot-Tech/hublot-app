import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(
        child: Center(
          child:Image.asset('img/hublot.png')
        )
      )
    );
  }
}