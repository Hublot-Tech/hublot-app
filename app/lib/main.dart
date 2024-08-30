import 'package:app/screens/part_customer/home_screens/components/home_screen.dart';
import 'package:app/screens/part_customer/splash_screen/splash_screen.dart';
import 'package:app/screens/presentation_screens/components/presention_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/blocs/auth/auth_form_bloc.dart';
import 'package:app/blocs/auth/auth_form_event.dart';
import 'package:app/blocs/auth/auth_form_state.dart';
import 'package:app/screens/authentification/login_screen/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(BlocProvider(
    create: (context) => AuthBloc()..add(AuthCheckTokenEvent()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false, routes: route, home: child),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            // Logique de redirection gérée par l'état
            if (state is AuthAuthenticated) {
              return const HomeScrenns();
            } else if (state is AuthUnauthenticated) {
              return const LoginScreen();
            } else if (state is NoAuth) {
              return const PresentationScreen();
            } else {
              return const SplashScreen();
            }
          },
        ),
      );
}
