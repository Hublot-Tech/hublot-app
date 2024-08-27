import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/blocs/auth/auth_form_bloc.dart';
import 'package:app/blocs/auth/auth_form_event.dart';
import 'package:app/blocs/auth/auth_form_state.dart';
import 'package:app/configuration.dart';
import 'package:app/model/user.model.dart';
import 'package:app/screens/authentification/code_phone_screen/code_phone_screen.dart';
import 'package:app/screens/authentification/login_screen/login.dart';
import 'package:app/services/toastServices.dart';

import 'button_custom.dart';
import 'field_form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    TextEditingController mdpController = TextEditingController();

    return Stack(children: [
      Container(
        decoration: const BoxDecoration(color: ksecondaryColor),
      ),
      DraggableScrollableSheet(
        maxChildSize: .9,
        minChildSize: .2,
        initialChildSize: .9,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 20),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: SvgPicture.asset("img/croix.svg"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      children: [
                        const Spacer(),
                        textPresentation(
                          msg: "Inscrivez vous chez HUB",
                          fontWeight: FontWeight.w500,
                          size: 23,
                        ),
                        //HublotTextWigdet(),

                        textPresentation(
                            msg: "LOTS",
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 255, 177, 59),
                            size: 23),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 10),
                    textPresentation(
                      overflow: TextOverflow.visible,
                      msg:
                          "Veuillez vous assurer de la crédibilité de ces informations, car elles seront rigoureusement vérifiées",
                      fontWeight: FontWeight.w100,
                      size: 14,
                    ),
                    const SizedBox(height: 20),
                    FormInscription(
                      nameController: nameController,
                      emailController: emailController,
                      mdpController: mdpController,
                      numberControler: numberController,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textPresentation(
                            msg: 'Déjà un compte?',
                            fontWeight: FontWeight.w100,
                            size: 14),
                        InkWell(
                          onTap: () {
                            //navigate route for loginScreen
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: textPresentation(
                              msg: 'Cliquez ici',
                              fontWeight: FontWeight.bold,
                              size: 14,
                              color: kyellowColor),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ]);
  }
}

class FormInscription extends StatefulWidget {
  const FormInscription({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.numberControler,
    required this.mdpController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController numberControler;
  final TextEditingController mdpController;

  @override
  State<FormInscription> createState() => _FormInscriptionState();
}

class _FormInscriptionState extends State<FormInscription> {
  bool isHide = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            FieldForm(
              controller: widget.nameController,
              label: "Nom et prenom",
              hint: "Nom et prenom",
            ),
            const SizedBox(height: 17),
            FieldForm(
                controller: widget.emailController,
                label: "Email",
                hint: "Email"),
            const SizedBox(height: 17),
            TextFormField(
                controller: widget.numberControler,
                onChanged: (value) {
                  setState(() => value.length == 9 ? isHide = false : true);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un numero de telephone valide';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      top: 0,
                      left: 15,
                    ),
                    labelText: "+237|6xx xxx xxx",
                    hintText: "Numero de telephone",
                    suffixIcon: Image.asset("img/icons_whatsapp.png"),
                    border: const OutlineInputBorder())),
            const SizedBox(height: 17),
            TextFormField(
                obscureText: isHide == false ? false : true,
                controller: widget.mdpController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un mot de passe valide';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      top: 0,
                      left: 15,
                    ),
                    labelText: "Mot de passe",
                    hintText: "Mot de passe",
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isHide = !isHide;
                        });
                      },
                      child: Container(
                        padding:
                            const EdgeInsets.only(top: 15, left: 10, right: 10),
                        child: textPresentation(
                            msg: "Voir", fontWeight: FontWeight.bold, size: 17),
                      ),
                    ),
                    border: const OutlineInputBorder())),
            const SizedBox(height: 24),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthError) {
                  print(state.errorAuth.message);
                  ToastService.errorMessage(state.errorAuth.message,context);
                }
                if (state is AuthUserCreated) {
                  ToastService.successMessage(
                      "Inscription reussie avec succes", kyellowColor,context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) {
                            return const CodePhoneScreem();
                          },
                          settings: RouteSettings(
                              arguments: widget.numberControler.text)));
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(
                      child: CircularProgressIndicator(color: kyellowColor));
                }

                return ButtomCustom(
                  press: () {
                    // Navigator.pushNamed(context, HomeScreen.routeName);
                    if (_formKey.currentState!.validate()) {
                      User user = User(
                          fullname: widget.nameController.text,
                          phoneNumber: widget.numberControler.text,
                          locale: "fr",
                          address: widget.emailController.text,
                          password: widget.mdpController.text,
                          email: widget.emailController.text);
                      context.read<AuthBloc>().add(AuthCreateUserEvent(user));
                      // Navigator.pushNamed(context, HomeScreen.routeName);
                    }
                  },
                  msg: "S'inscrire",
                  isValided: true,
                );
              },
            ),
          ],
        ));
  }
}

///cette class est utilise pour le formulaire,