import 'dart:io';

import 'package:app/screens/authentification/etape_authentification/components/step_authentification.dart';
import 'package:app/screens/authentification/etape_authentification/etape_authenfication_screen.dart';
import 'package:app/screens/authentification/registration_screen/component/button_custom.dart';
import 'package:app/screens/components/background_add_service.dart';
import 'package:app/screens/part_customer/home_screens/components/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/blocs/kyc/bloc/kyc_bloc.dart';
import 'package:app/configuration.dart';

import 'package:app/services/toastServices.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'camera_file_box.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  File? selectedImage;
  File? selectedImage2;
  String? nameImg;
  String? nameImg2;

  File? _image;
  File? _image2;
  int selectIndex = 0;
  List<File> list = [];
  List<String> listName = [
    'Carte national d’identité',
    'Recepisser d’identité',
    'Passeport national'
  ];
  @override
  Widget build(BuildContext context) {
    return BackgroundAddService(
        widget: Padding(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(20),
          right: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, EtapeAuthentificationScreen.routeName);
                  },
                  icon: const Icon(Icons.arrow_back)),
            ],
          ),
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
          ListView.builder(
              itemBuilder: (context, index) => InkWell(
                    onTap: () => setState(() => selectIndex = index),
                    child: StepAuthentification(
                        isChecked: index == selectIndex ? true : false,
                        test: listName[index],
                        part: [
                          PartOfDocument(
                            image: _image,
                            nameImg: nameImg,
                            press: () {
                              showImagePickerOption(context);
                            },
                            message: 'Recto de votre document',
                          ),
                          PartOfDocument(
                            image: _image2,
                            nameImg: nameImg2,
                            press: () {
                              showImagePickerOption2(context);
                            },
                            message: 'Verso de votre document',
                          ),
                        ]),
                  ),
              itemCount: listName.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics()),
          const EspaceMenuWidget(),
          BlocConsumer<KycBloc, KycState>(
            listener: (context, state) {
              if (state is KycSendSuccess) {
                ToastService.successMessage(
                    'Vos fichiers ont été envoyé', kyellowColor,context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScrenns()));
              }
              if (state is KycFailure) {
                ToastService.errorMessage(state.error.message,context);
                ToastService.errorMessage(state.error.status.toString(),context);
              }
            },
            builder: (context, state) {
              return ButtomCustom(
                  press: () => {
                        list = [_image!, _image2!],
                        //appel ici la fonction pour envoyer les images au serveur
                        context
                            .read<KycBloc>()
                            .add(KycSubmitted(files: [_image!, _image2!])),
                      },
                  msg: 'Continuer',
                  isValided: _image != null && _image2 != null);
            },
          )
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
              pictureFromGallerieOrCamera(ImageSource.camera);
            },
            press2: () {
              pictureFromGallerieOrCamera(ImageSource.gallery);
            },
          );
        });
  }

  void showImagePickerOption2(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: kprimaryColor,
        context: context,
        builder: (builder) {
          return CameraOrFiileBox(
            press1: () {
              pictureFromGallerieOrCamera2(ImageSource.camera);
            },
            press2: () {
              pictureFromGallerieOrCamera2(ImageSource.gallery);
            },
          );
        });
  }

//picture to take picture for recto
  Future pictureFromGallerieOrCamera(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        nameImg = pickedFile.name;
      });

      Navigator.of(context).pop();
    } else {
      return;
    }
  }

//picture to take picture for verso
  Future pictureFromGallerieOrCamera2(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image2 = File(pickedFile.path);
        nameImg2 = pickedFile.name;
      });

      Navigator.of(context).pop();
    } else {
      return;
    }
  }
  // //function to take picture with camera
  // Future pictureFromCamera() async {
  //   final returnImage =
  //       await ImagePicker().pickImage(source: ImageSource.camera);
  //   if (returnImage == null) return;
  //   setState(() {
  //     selectedImage = File(returnImage.path);
  //     nameImg = returnImage.name;
  //   });
  //   Navigator.of(context).pop();
  // }
}

class PartOfDocument extends StatelessWidget {
  const PartOfDocument({
    super.key,
    required File? image,
    required this.nameImg,
    required this.press,
    required this.message,
  }) : _image = image;

  final File? _image;
  final String? nameImg;
  final GestureCancelCallback press;

  final String message;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
          child: SvgPicture.asset("img/background_rect.svg"),
        ),
        InkWell(
          onTap: press,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image != null
                  ? Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.file(_image!),
                    )
                  : SvgPicture.asset('img/icons8_identity_theft 1.svg'),
              SizedBox(width: getProportionateScreenWidth(10)),
              SizedBox(
                width: 100,
                child: textPresentation(
                    msg: nameImg != null ? nameImg! : message,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.visible,
                    size: 10),
              )
            ],
          ),
        )
      ],
    );
  }
}
