import 'dart:io';
import 'dart:typed_data';

import 'package:app/configuration.dart';
import 'package:app/screens/part_provider/add_service/service_offer/service_offer_screen.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../authentification/registration_screen/component/button_custom.dart';
import '../../../home_screen/home_screen.dart';
import 'background_add_service.dart';

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
    TextEditingController nameService = TextEditingController();
    TextEditingController descriptionService = TextEditingController();
    bool isValided;
    return BackgroundAddService(
      widget: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 21, top: 21),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, HomeScreen.routeName);
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
          //
          //
          SizedBox(height: getProportionateScreenHeight(150)),
          textPresentation(
              msg: "Description du services",
              fontWeight: FontWeight.bold,
              size: getProportionateScreenWidth(24.2)),
          textPresentation(
              msg: "Pour  faciliter l’échange avec vos potentiels ",
              fontWeight: FontWeight.normal,
              size: getProportionateScreenWidth(11)),
          const EspaceMenuWidget(),
          //
          //
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Form(
                child: Column(
              children: [
                TextField(
                  controller: nameService,
                  onSubmitted: (value) {
                    setState(() {
                      isValided = isSubmitted(nameService, descriptionService);
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Nom du service ",
                    contentPadding: const EdgeInsets.only(left: 30, top: 30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const EspaceMenuWidget(),
                TextField(
                  controller: descriptionService,
                  maxLines: 5,
                  onSubmitted: (value) {
                    setState(() {
                      isValided = isSubmitted(nameService, descriptionService);
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Description du service ",
                    contentPadding: const EdgeInsets.only(left: 30, top: 32),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const EspaceMenuWidget(),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding:
                        EdgeInsets.only(right: getProportionateScreenWidth(95)),
                    child: ExpansionTile(
                      title: textPresentation(
                          msg: "Choisir la categorie",
                          size: getProportionateScreenWidth(15),
                          fontWeight: FontWeight.normal),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: textPresentation(
                              msg: "Informatique",
                              size: getProportionateScreenWidth(18),
                              fontWeight: FontWeight.normal),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: textPresentation(
                              msg: "Informatique",
                              size: getProportionateScreenWidth(18),
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ),
                const EspaceMenuWidget(),
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
                ButtomCustom(
                  msg: 'Confirmer',
                  press: () {
                    Navigator.pushNamed(context, ServiceOfferScreen.routeName);
                  },
                  isValided: true,
                )
              ],
            )),
          )
        ],
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: kprimaryColor,
        context: context,
        builder: (builder) {
          return SizedBox(
            height: getProportionateScreenHeight(150),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                          size: 80,
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
                          size: 80,
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

  //function to take picture with camera
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

/*

*/
bool isSubmitted(TextEditingController nameService,
    TextEditingController descriptionService) {
  bool isTextEntered =
      nameService.text.isNotEmpty && descriptionService.text.isNotEmpty;
  return isTextEntered;
}
