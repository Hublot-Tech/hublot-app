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

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
 
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
                          fontWeight: FontWeight.w400,
                          size: 18.sp,
                        ),
                        //HublotTextWigdet(),

                        textPresentation(
                            msg: "LOTS",
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 255, 177, 59),
                            size: 18.r),
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
             InkWell(
                      onTap: () {
                        showImagePickerOption(context);
                      },
                      child: Container(
                        height: getProportionateScreenHeight(53),
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
                            SizedBox(width: getProportionateScreenWidth(5)),
                            textPresentation(
                                msg: "Ajouter les images",
                                fontWeight: FontWeight.normal,
                                size: getProportionateScreenWidth(15)),
                          ],
                        ),
                      ),
                    ),
                    textPresentation(
                        textAlign: TextAlign.start,
                        msg: nameImg != null ? nameImg.toString() : "",
                        fontWeight: FontWeight.bold,
                        color: kyellowColor,
                        size: getProportionateScreenWidth(12)),
                    const EspaceMenuWidget(),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthError) {
                  print(state.errorAuth.message);
                  ToastService.errorMessage(state.errorAuth.message, context);
                }
                if (state is AuthUserCreated) {
                  ToastService.successMessage(
                      "Inscription reussie avec succes", kyellowColor, context);
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
                      context.read<AuthBloc>().add(AuthCreateUserEvent(user,selectedImage));
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
            height: getProportionateScreenHeight(150),
            child: Padding(
              padding: EdgeInsets.only(top: getProportionateScreenWidth(30)),
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
                              size: getProportionateScreenWidth(20))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(40)),
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
                              size: getProportionateScreenWidth(20))
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