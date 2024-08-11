import 'package:app/screens/authentification/registration_screen/component/button_custom.dart';
import 'package:app/screens/part_customer/home_screens/components/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/blocs/auth/auth_form_bloc.dart';
import 'package:app/blocs/auth/auth_form_event.dart';
import 'package:app/configuration.dart';
import 'package:app/screens/authentification/registration_screen/register_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/services/toastServices.dart';

import '../../../blocs/auth/auth_form_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginScreen> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  late bool _obscureText = false;
  late bool _loading = false;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Container(
                    height: 20,
                    width: 200,
                    decoration: const BoxDecoration(color: Color(0x00d9d9d9)),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      textPresentation(
                          msg: 'Connexion à Hublot',
                          size: 24,
                          fontWeight: FontWeight.w300),
                      const SizedBox(height: 8),
                      textPresentation(
                          msg:
                              'Ouvre ta session Hublot et crée de nouveau service!, fait toi de l\'argent',
                          size: 14,
                          fontWeight: FontWeight.w200,
                          maxLine: 2,
                          color: Colors.grey),
                      const SizedBox(height: 50),
                      Column(
                        children: [
                          SizedBox(
                            child: TextFormField(
                              controller: _emailController,
                              style: const TextStyle(
                                  // color: Color.fromARGB(99, 149, 149, 168),
                                  fontFamily: 'ProximaNova',
                                  fontSize: 18),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 3.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                    borderSide: const BorderSide(
                                        style: BorderStyle.solid,
                                        color:
                                            Color.fromARGB(99, 149, 149, 168),
                                        width: 1 / 3),
                                  ),
                                  hintText: 'Email',
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              149, 101, 101, 104),
                                          width: 1 / 3))),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                    .hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          SizedBox(
                            child: TextFormField(
                              style: const TextStyle(
                                  // color: Color(0x64646480),
                                  fontFamily: 'ProximaNova',
                                  fontSize: 18),
                              controller: _passwordController,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 3.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                    borderSide: const BorderSide(
                                        style: BorderStyle.solid,
                                        color:
                                            Color.fromARGB(149, 101, 101, 104),
                                        width: 1 / 3),
                                  ),
                                  hintText: 'Mot de passe',
                                  suffixStyle: const TextStyle(
                                      fontFamily: 'ProximaNova',
                                      fontSize: 16.0),
                                  suffix: GestureDetector(
                                    child: Text(
                                      _obscureText ? 'Voir' : 'Masquer',
                                    ),
                                    onTap: () => {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      })
                                    },
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0x64646480),
                                          width: 1 / 3))),
                              obscureText: _obscureText,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }

                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          BlocConsumer<AuthBloc, AuthState>(
                            listener: (context, state) {
                              if (state is UsersuccessAuth) {
                                ToastService.successMessage(
                                    'Connexion reussite', kyellowColor);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScrenns()));
                              }
                            },
                            builder: (context, state) {
                              if (state is AuthLoading) {
                                _loading = !_loading;
                                debugPrint('is loading');
                              }

                              if (state is UsersuccessAuth) {
                                _loading = !_loading;
                                debugPrint('is Succeful');
                              }

                              if (state is AuthError) {
                                _loading = !_loading;
                                debugPrint('is error');
                                ToastService.errorMessage(
                                    "Erreur d'authentification vérifier vos informations et réessayer");
                              }

                              return ButtomCustom(
                                  heigth: 48,
                                  press: () => {
                                        if (_formKey.currentState!.validate())
                                          {
                                            context.read<AuthBloc>().add(
                                                AuthSignEmailAndPasswordEvent(
                                                    _emailController.text,
                                                    _passwordController.text))
                                          }
                                      },
                                  msg: 'S\'authentifier',
                                  isValided: true,
                                  loading: _loading);
                            },
                          ),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              textPresentation(
                                  msg: 'Pas encore de compte?',
                                  fontWeight: FontWeight.w100,
                                  size: 14),
                              InkWell(
                                onTap: () {
                                  //navigate route for loginScreen
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegistrationScreen()));
                                },
                                child: textPresentation(
                                    msg: 'Créez en',
                                    fontWeight: FontWeight.bold,
                                    size: 14,
                                    color: kyellowColor),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
