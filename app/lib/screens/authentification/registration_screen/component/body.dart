import 'dart:io';

import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/blocs/auth/auth_form_bloc.dart';
import 'package:app/blocs/auth/auth_form_event.dart';
import 'package:app/blocs/auth/auth_form_state.dart';
import 'package:app/configuration.dart';
import 'package:app/model/user.model.dart';
import 'package:app/screens/authentification/code_phone_screen/code_phone_screen.dart';
import 'package:app/screens/authentification/login_screen/login.dart';
import 'package:app/services/toastServices.dart';
import 'package:image_picker/image_picker.dart';

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
    TextEditingController addressController = TextEditingController();

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
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.close))
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
                      maxLine: 2,
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
                      addresController: addressController,
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
                            Navigator.pushReplacement(
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
    required this.addresController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController numberControler;
  final TextEditingController mdpController;
  final TextEditingController addresController;

  @override
  State<FormInscription> createState() => _FormInscriptionState();
}

class _FormInscriptionState extends State<FormInscription> {
  bool isHide = true;
  final _formKey = GlobalKey<FormState>();
  File selectedImage = File('');
  String? nameImg;
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
            FieldForm(
                controller: widget.addresController,
                label: "Votre Adresse",
                hint: "Votre Adresse"),
            const SizedBox(height: 17),
            TextFormField(
                controller: widget.numberControler,
                keyboardType: TextInputType.phone,
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
            InkWell(
              onTap: () {
                showImagePickerOption(context);
              },
              child: Container(
                height: (53),
                padding: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: nameImg == null
                            ? const Color(0xFF000000)
                            : kyellowColor),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("img/icons8_upload_file_144px_1 2.png"),
                    const SizedBox(width: (5)),
                    textPresentation(
                        msg: "Ajouter une photo de profil",
                        fontWeight: FontWeight.normal,
                        size: (15)),
                  ],
                ),
              ),
            ),
            textPresentation(
                textAlign: TextAlign.start,
                msg: nameImg != null ? nameImg.toString() : "",
                fontWeight: FontWeight.bold,
                color: kyellowColor,
                size: (12)),
            const EspaceMenuWidget(),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthError) {
                  if (state.errorAuth.message.contains('already taken')) {
                    ToastService.errorMessage(
                        "L'email ou le numero de telephone sont deja utilisé!",
                        context);
                  } else if (state.errorAuth.message.contains('valid phone')) {
                    ToastService.errorMessage(
                        "Numero de telephone Whatsapp pas valide!", context);
                  } else if (state.errorAuth.message.contains('an email')) {
                    ToastService.errorMessage("Email incorrect", context);
                  }
                }
                if (state is AuthUserCreated) {
                  ToastService.successMessage(
                      "Inscription reussie avec succes", kyellowColor, context);
                  Navigator.pushReplacement(
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
                      String phone = "+237${widget.numberControler.text}";

                      User user = User(
                          fullname: widget.nameController.text,
                          phoneNumber: phone,
                          locale: "fr",
                          address: widget.addresController.text,
                          password: widget.mdpController.text,
                          email: widget.emailController.text);
                      context
                          .read<AuthBloc>()
                          .add(AuthCreateUserEvent(user, selectedImage));
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

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: kprimaryColor,
        context: context,
        builder: (builder) {
          return SizedBox(
            height: (150),
            child: Padding(
              padding: const EdgeInsets.only(top: (30)),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        pictureFromCamera();
                      },
                      child: Column(
                        children: [
                          const Icon(
                            Icons.camera,
                            color: Colors.white,
                            size: 50,
                          ),
                          const EspaceMenuWidget(taille: 10),
                          textPresentation(
                              msg: "Caméra",
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              size: (20))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: (40)),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        pictureFromGallerie();
                      },
                      child: Column(
                        children: [
                          const Icon(
                            Icons.image,
                            color: Colors.white,
                            size: 50,
                          ),
                          const EspaceMenuWidget(taille: 10),
                          textPresentation(
                              msg: "Gallerie",
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              size: (20))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

//picture to take picture from gallery
  Future pictureFromGallerie() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      nameImg = returnImage.name;
    });

    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  //function to take picture with camera
  Future pictureFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      nameImg = returnImage.name;
    });
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }
}

///cette class est utilise pour le formulaire,