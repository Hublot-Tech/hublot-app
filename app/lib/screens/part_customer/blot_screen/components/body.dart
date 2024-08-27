import 'package:app/configuration.dart';
import 'package:app/model/blot_entity.dart';
import 'package:app/model/info_client.dart';
import 'package:app/screens/authentification/registration_screen/component/button_custom.dart';
import 'package:app/screens/blot_preview_screen/blot_preview_screen.dart';
import 'package:app/screens/blot_preview_screen/component/decoration_box_widget.dart';
import 'package:app/screens/components/background_add_service.dart';


import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'box_date_blots.dart';
import 'cancel_button.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.hasOption});
  final bool hasOption;
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int duree = 0;
  void onAdd() {
    setState(() {
      duree++;
    });
  }

  void onRemove() {
    setState(() {
      if (duree != 0) {
        duree--;
      }
    });
  }

  String? valu = "Offre de base";
  List<String> menuItems = [
    'Offre de base',
    'Offre Standard',
    'Offre Personnalise'
  ];
  bool isLoading = false;
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final jourController = TextEditingController();
  final moisController = TextEditingController();
  final anneeController = TextEditingController();
  //controller for name and price
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  bool isComplete = false;
  @override
  Widget build(BuildContext context) {
    //size with MediaQuery
    Size size = MediaQuery.of(context).size;
    //receive args
    final args = ModalRoute.of(context)!.settings.arguments as InfoClient;
    return SafeArea(
      child: BackgroundAddService(
          widget: Padding(
        padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(20)),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 05, top: 25),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: SvgPicture.asset("img/croix.svg"),
                      ),
                    ),
                  ],
                ),
              ),
              const EspaceMenuWidget(taille: 70),
              textPresentation(
                  msg: "Création du Blot #0001",
                  fontWeight: FontWeight.w600,
                  color: kprimaryColor,
                  size: 24.12),
              Padding(
                padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(30),
                    right: getProportionateScreenWidth(30)),
                child: textPresentation(
                    overflow: TextOverflow.visible,
                    color: kprimaryColor,
                    msg:
                        "Toutes informations inserer servira en cas de litige et aussi faciliter l’échange",
                    fontWeight: FontWeight.w300,
                    size: 11),
              ),
              const EspaceMenuWidget(taille: 30),
              widget.hasOption
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            textPresentation(
                                color: kprimaryColor,
                                msg: "Offre de base",
                                fontWeight: FontWeight.bold,
                                size: 24.12),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: DropdownButton<String>(
                                  value: valu,
                                  dropdownColor: Colors.white,
                                  hint: textPresentation(
                                    msg: 'Offre de standard',
                                    fontWeight: FontWeight.normal,
                                    size: 15,
                                  ),
                                  items: menuItems.map((String item) {
                                    return DropdownMenuItem<String>(
                                        value: item,
                                        child: textPresentation(
                                            msg: item,
                                            fontWeight: FontWeight.normal,
                                            size: 16,
                                            color: kprimaryColor
                                                .withOpacity(0.9)));
                                  }).toList(),
                                  onChanged: (value) {
                                    //check if value is null

                                    setState(() {
                                      if (value != null) {
                                        valu = value;
                                      }
                                      isLoading = !isLoading;
                                    });
                                  }),
                            )
                          ],
                        ),
                        DecorationBoxWidget(
                            width: 115,
                            height: 32,
                            color: kyellowColor,
                            havePadding: false,
                            args: Center(
                              child: textPresentation(
                                  msg: "10 000 FCFA",
                                  fontWeight: FontWeight.bold,
                                  color: kprimaryColor,
                                  size: 15),
                            )),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textPresentation(
                            msg: "Nom du besoin",
                            fontWeight: FontWeight.w600,
                            size: 24.12,
                            color: kprimaryColor),
                        const Spacer(),
                        textPresentation(
                            msg: "Prix",
                            fontWeight: FontWeight.w600,
                            size: 24.12),
                        const Spacer(flex: 1),
                      ],
                    ),
              widget.hasOption
                  ? const SizedBox.shrink()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            //width woth Mediaquery of size
                            width: size.width * 0.44,
                            height: 40,
                            child: TextFormField(
                              controller: nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter someting';
                                } else {
                                  descriptionController.text = value;
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(top: 8, left: 10),
                                  border: OutlineInputBorder()),
                            )),
                        SizedBox(
                            height: 40,
                            //width woth Mediaquery of size
                            width: size.width * 0.26,
                            child: TextFormField(
                                controller: priceController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Entrer un prix';
                                  } else {
                                    descriptionController.text = value;
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(top: 8, left: 10),
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 9),
                                      child: textPresentation(
                                          msg: "FCFA",
                                          fontWeight: FontWeight.w400,
                                          size: 15),
                                    ),
                                    border: const OutlineInputBorder()))),
                      ],
                    ),
              const EspaceMenuWidget(taille: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textPresentation(
                      msg: "Description",
                      fontWeight: FontWeight.bold,
                      size: 24.12,
                      color: kprimaryColor),
                  Row(
                    children: [
                      textPresentation(
                          msg: "Modifier",
                          fontWeight: FontWeight.normal,
                          size: 13),
                      SvgPicture.asset("img/icons8_edit_2 1.svg"),
                    ],
                  ),
                ],
              ),
              const EspaceMenuWidget(),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter someting';
                  } else {
                    descriptionController.text = value;
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    isComplete = !isComplete;
                  });
                },
                maxLines: 12,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.normal),
                  hintText:
                      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonu Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonu Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonu...",
                  contentPadding: const EdgeInsets.only(left: 30, top: 32),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const EspaceMenuWidget(),
              Row(
                children: [
                  textPresentation(
                      msg: "Sélectionner des options",
                      fontWeight: FontWeight.bold,
                      size: 24.12,
                      color: kprimaryColor),
                ],
              ),
              const EspaceMenuWidget(),
              Container(
                height: getProportionateScreenHeight(50),
                width: getProportionateScreenWidth(290),
                decoration: const BoxDecoration(
                    border: Border(
                  top: BorderSide(),
                  bottom: BorderSide(),
                )),
                child:const Text(''),
                //  AddServiceBox(
                //   msg: "Ajouter des options ",
                //   press: () {},
                // ),
              ),
              const EspaceMenuWidget(),
              Row(
                children: [
                  textPresentation(
                      msg: "Date de début",
                      fontWeight: FontWeight.bold,
                      size: 24.12,
                      color: kprimaryColor),
                ],
              ),
              const EspaceMenuWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BoxDateBlots(
                      width: 50, controller: jourController, hint: "JJ"),
                  BoxDateBlots(
                    width: 50,
                    controller: moisController,
                    hint: "MM",
                  ),
                  BoxDateBlots(
                    width: 64,
                    controller: anneeController,
                    hint: "ANNEE",
                  ),
                ],
              ),
              const EspaceMenuWidget(),
              Row(
                children: [
                  textPresentation(
                      msg: "Durée du blot",
                      fontWeight: FontWeight.bold,
                      size: 24.12,
                      color: kprimaryColor),
                ],
              ),
              const EspaceMenuWidget(),
              Row(children: [
                Container(
                  height: getProportionateScreenHeight(50),
                  width: getProportionateScreenWidth(58),
                  margin:
                      EdgeInsets.only(left: getProportionateScreenWidth(85)),
                  decoration: const BoxDecoration(
                      border: Border(
                    top: BorderSide(),
                    bottom: BorderSide(),
                  )),
                  child: Row(
                    children: [
                      const Spacer(flex: 2),
                      textPresentation(
                          msg: "$duree",
                          fontWeight: FontWeight.normal,
                          size: 13),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.keyboard_arrow_down_outlined)),
                    ],
                  ),
                ),
                SizedBox(width: getProportionateScreenWidth(30)),
                IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
                textPresentation(msg: '$duree', fontWeight: FontWeight.normal),
                IconButton(onPressed: onRemove, icon: const Icon(Icons.remove)),
              ]),
              const EspaceMenuWidget(taille: 30),
              const Divider(
                indent: 90,
                endIndent: 90,
                thickness: 4,
                color: Colors.black,
              ),
              const EspaceMenuWidget(),
              ButtomCustom(
                  press: () {
                    print('hello les  ${anneeController.text}');
                    print(jourController.text);
                    print(moisController.text.toString());
                    int anneeInt = int.parse(anneeController.text);
                    int moisInt = int.parse(moisController.text);
                    int jourInt = int.parse(jourController.text);
                    if (formKey.currentState!.validate()) {
                      DateTime beginDate = DateTime(anneeInt, moisInt, jourInt);
                      //  int jourEnd = jourInt + duree;

                      //  DateTime endDate = DateTime(anneeInt, moisInt, jourEnd);
                      BlotEntity blot = BlotEntity(
                        duration: duree,
                        startDate: beginDate,
                        description: descriptionController.text,
                        price: int.parse(priceController.text),
                        status: "created",
                        consumer: args.id,
                        offer: '',
                        option: [],
                      );
                      InfoClient infoClient = InfoClient(
                          name: args.name, id: args.id, blotEntity: blot);
                      Navigator.pushNamed(context, BlotPreviewScrenn.routeName,
                          arguments: infoClient);
                    }
                  },
                  msg: "Aperçu",
                  isValided: true),
              const EspaceMenuWidget(),
              CancelButtom(
                press: () {},
              ),
              const EspaceMenuWidget(taille: 50),
            ],
          ),
        ),
      )),
    );
  }
}
