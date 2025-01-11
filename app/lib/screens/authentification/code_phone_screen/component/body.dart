import 'dart:async';

import 'package:app/screens/authentification/registration_screen/component/button_custom.dart';
import 'package:app/screens/part_customer/home_screens/components/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/blocs/auth/auth_form_bloc.dart';
import 'package:app/blocs/auth/auth_form_event.dart';
import 'package:app/blocs/auth/auth_form_state.dart';
import 'package:app/configuration.dart';
import 'package:app/screens/components/background_add_service.dart';
import 'package:app/services/toastServices.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:otp_input_editor/otp_input_editor.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _otpData = TextEditingController();
  static const maxSeconds = 30;
  int remainingSeconds = maxSeconds;
  bool isLoading = false;
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    super.dispose();
    _otpData.dispose();
    _timer?.cancel();
  }

  void _startCountdown() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingSeconds > 0) {
          remainingSeconds--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  void _stopCountdown() {
    _timer?.cancel();
  }

  void _resetCountdown() {
    _timer?.cancel();
    setState(() {
      remainingSeconds = maxSeconds;
    });
  }

  @override
  Widget build(BuildContext context) {
    String userPhone = ModalRoute.of(context)!.settings.arguments as String;
    return BackgroundAddService(
      widget: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScrenns()));
                  },
                  icon: const Icon(Icons.arrow_back)),
            ],
          ),
          const EspaceMenuWidget(taille: 50),
          textPresentation(
              msg: 'Consulter votre messagerie',
              fontWeight: FontWeight.bold,
              size: 24.12),
          Padding(
            padding: EdgeInsets.only(
                top: getProportionateScreenWidth(2),
                left: getProportionateScreenWidth(21),
                right: getProportionateScreenWidth(21)),
            child: textPresentation(
              msg: 'Code envoyé au $userPhone',
              fontWeight: FontWeight.normal,
              size: 11,
            ),
          ),
          const EspaceMenuWidget(),
          Container(
            child: OtpInputEditor(
              otpLength: 6,
              obscureText: false,
              onOtpChanged: (value) {
                print(value.length);
                setState(() {
                  _otpData.text = value;
                });
              },
              onInitialization: (OtpInputController otpInputController) {
                setState(() {});
              },
              invalid: true,
              otpTextFieldBackgroundColor: Colors.white,
              cursorHeight: 25,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                ),
              ],
              fieldHeight: 58.0,
              cursorWidth: 0.5,
              textInputStyle: const TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              boxDecoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          const EspaceMenuWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textPresentation(
                  msg: '${remainingSeconds}s',
                  fontWeight: FontWeight.normal,
                  size: 13),
              SizedBox(width: getProportionateScreenWidth(10)),
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoading) {
                    isLoading = true;
                  }
                  if (state is AuthOtpSend) {
                    isLoading = false;
                  }
                  if (state is AuthError) {
                    isLoading = false;
                    ToastService.errorMessage(state.errorAuth.message, context);
                  }
                },
                child: TextButton(
                    onPressed: () => {
                          if (remainingSeconds > 0)
                            {
                              null,
                            }
                          else
                            {
                              context
                                  .read<AuthBloc>()
                                  .add(AuthSendOTPEvent(userPhone)),
                              _resetCountdown(),
                              _startCountdown(),
                              _otpData = TextEditingController(),
                            }
                        },
                    child: textPresentation(
                      msg: 'Renvoyer le code?',
                      color: remainingSeconds > 0
                          ? Colors.grey
                          : const Color(0xFF1E88E5),
                      fontWeight: FontWeight.normal,
                      size: 13,
                    )),
              ),
            ],
          ),
          const EspaceMenuWidget(),
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthLoading) {
                isLoading = true;
              }
              if (state is AuthError) {
                ToastService.errorMessage(state.errorAuth.message, context);
                isLoading = false;
              }
              if (state is AuthOtpVerified) {
                ToastService.successMessage(
                    'Code verifié avec succès', kyellowColor, context);

                isLoading = false;
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScrenns()));
              }
            },
            child: ButtomCustom(
                press: () {
                  context
                      .read<AuthBloc>()
                      .add(AuthVerifyOTPEvent(userPhone, _otpData.text));
                },
                msg: 'Confirmer',
                loading: isLoading,
                isValided:
                    _otpData.text.isNotEmpty && _otpData.text.length == 6),
          ),
          const EspaceMenuWidget(),
          //  CancelButtom(press: () {}),
        ],
      ),
    );

    //   Padding(
    // padding: EdgeInsets.only(
    //     left: getProportionateScreenHeight(20),
    //     right: getProportionateScreenWidth(20)),
    // ));
  }
}
