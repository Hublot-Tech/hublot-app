import 'dart:io';

import 'package:app/configuration.dart';
import 'package:app/screens/authentification/registration_screen/component/button_custom.dart';
import 'package:app/screens/part_provider/add_service/description_service/components/background_add_service.dart';
import 'package:app/screens/part_provider/authentification/etape_authentification/components/step_authentification.dart';
import 'package:app/screens/part_provider/authentification/etape_authentification/etape_authenfication_screen.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'camera_file_box.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Uint8List? _image;
  File? selectedImage;
  String? nameImg;

  @override
  Widget build(BuildContext context) {
    return BackgroundAddService(
        widget: Padding(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(20),
          right: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(
                  top: 10, right: getProportionateScreenWidth(660)),
              child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, EtapeAuthentificationScreen.routeName);
                  },
                  icon: const Icon(Icons.arrow_back))),
          const EspaceMenuWidget(taille: 100),
          textPresentation(
              msg: 'Vérification de votre identité',
              fontWeight: FontWeight.w600,
              size: 24.12),
          Padding(
            padding: EdgeInsets.only(
                top: getProportionateScreenWidth(2),
                left: getProportionateScreenWidth(21),
                right: getProportionateScreenWidth(21)),
            child: textPresentation(
              msg: 'Vous aurez besoin d’un document attestant votre identité',
              fontWeight: FontWeight.w300,
              size: 11,
            ),
          ),
          const EspaceMenuWidget(taille: 50),
          const StepAuthentification(
              isChecked: true, test: 'Carte national d’identité'),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(50)),
                child: SvgPicture.asset("img/background_rect.svg"),
              ),
              InkWell(
                onTap: () {
                  showImagePickerOption(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('img/icons8_identity_theft 1.svg'),
                    SizedBox(width: getProportionateScreenWidth(20)),
                    textPresentation(
                        msg: nameImg != null ? nameImg! : 'Inserez une image',
                        fontWeight: FontWeight.w400,
                        size: 10)
                  ],
                ),
              )
            ],
          ),
          const EspaceMenuWidget(),
          const StepAuthentification(
              isChecked: false, test: 'Recepisser d’identité'),
          const EspaceMenuWidget(),
          const StepAuthentification(
              isChecked: false, test: 'Passeport national'),
          const EspaceMenuWidget(),
          ButtomCustom(press: () => {}, msg: 'Continuer', isValided: false)
        ],
      ),
    ));
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: kprimaryColor,
        context: context,
        builder: (builder) {
          return CameraOrFiileBox(
            press1: () {
              pictureFromCamera();
            },
            press2: () {
              pictureFromGallerie();
            },
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
      _image = File(returnImage.path).readAsBytesSync();
      nameImg = returnImage.name;
    });

    Navigator.of(context).pop();
  }

  // //function to take picture with camera
  Future pictureFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
      nameImg = returnImage.name;
    });
    Navigator.of(context).pop();
  }
}
