import 'package:app/blocs/blot/bloc/blot_bloc.dart';
import 'package:app/configuration.dart';
import 'package:app/controller/enumeration/blot.dart';
import 'package:app/screens/part_customer/blot_detail_screen/components/card_presentation.dart';
import 'package:app/screens/part_customer/blot_detail_screen/components/step_colum.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  BlotStep currentStep = BlotStep.validationCommande;
  //controller form textfield
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // int index = 0;
    // int ode = 0;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.close)),
                  //icons8_business_documentation 1.png
                  Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: kprimaryColor,
                        borderRadius: BorderRadius.circular(46),
                      ),
                      child: Image.asset(
                          'img/icons8_business_documentation 1.png',
                          height: 20,
                          width: 20)),
                  Container(
                      // width: 81,
                      height: 28,
                      padding: EdgeInsets.only(right: 10, left: 10),
                      decoration: BoxDecoration(
                          color: kprimaryColor,
                          borderRadius: BorderRadius.circular(6)),
                      child: Row(
                        children: [
                          textPresentation(
                              msg: 'Modifier',
                              fontWeight: FontWeight.normal,
                              color: kColorWhite,
                              size: 15),
                          Icon(Icons.edit, color: kyellowColor, size: 14),
                        ],
                      )),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textPresentation(
                      msg: "Suivis du Blot",
                      fontWeight: FontWeight.bold,
                      size: 24.12),
                  textPresentation(
                      msg: ' #0001', fontWeight: FontWeight.normal, size: 24.12)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textPresentation(
                      msg: 'Détails', fontWeight: FontWeight.w300, size: 15),
                  textPresentation(
                      msg: ' 01/06/2024 ',
                      fontWeight: FontWeight.w600,
                      size: 15),
                  textPresentation(
                      msg: 'à', fontWeight: FontWeight.w300, size: 15),
                  textPresentation(
                      msg: ' 10h58', fontWeight: FontWeight.w600, size: 15),
                ],
              ),
              SizedBox(height: 30),
              CardPresentation(widget: buildColumn()),
              SizedBox(height: 30),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kColorWhite,
                    boxShadow: [
                      // BoxShadow(
                      //   color: Colors.black.withOpacity(
                      //       0.05), // rgba(0, 0, 0, 0.05) en Flutter
                      //   spreadRadius: 0, // Pas d'étalement
                      //   blurRadius: 6, // Rayon de flou de 4 pixels
                      //   offset: const Offset(
                      //       0, 4), // Décalage de 4 pixels vers le bas
                      // ),
                      BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: 4,
                        offset: const Offset(4, 0),
                        spreadRadius: 1.0,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        blurRadius: 2,
                        offset: Offset(-4.0, -4.0),
                        spreadRadius: 0,
                      )
                    ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // StepperItem(isCompleted: true, isLast: true),
                        // StepperConnector(isCompleted: true),
                        StepperItem(isCompleted: true),
                        StepperConnector(isCompleted: false),
                        StepperItem(isCompleted: false),
                        StepperConnector(isCompleted: false),
                        StepperItem(isCompleted: false),
                        StepperConnector(isCompleted: false),
                        StepperItem(isCompleted: false),
                        StepperConnector(isCompleted: false),
                        StepperItem(isCompleted: false),
                      ],
                    ),
                    SizedBox(height: 5),
                    // StepColumn(isClick: false, msg: 'Délais de réalisation'),
                    // SizedBox(height: 5),
                    StepColumn(
                        isClick: false, msg: 'Validation de la commande'),
                    SizedBox(height: 5),
                    StepColumn(
                        isClick: false, msg: 'Réalisation de la commande'),
                    SizedBox(height: 5),
                    StepColumn(
                        isClick: false,
                        msg: 'Présence du prestataire signaler'),
                    SizedBox(height: 5),
                    StepColumn(
                        isClick: false, msg: 'Présence du client signaler'),
                    SizedBox(height: 10),
                    BlocListener<BlotBloc, BlotState>(
                      listener: (context, state) {},
                      child: buildActionButton(size),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              EspaceMenuWidget(taille: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildActionButton(Size size) {
    switch (currentStep) {
      case BlotStep.delaisRealisation:
        return OrderBoton(
            size: size,
            name: 'Valider le delai',
            asset: 'img/clock.png',
            press: () {
              context.read<BlotBloc>().add(BlotUpdateEvent('', ''));
            });
      case BlotStep.validationCommande:
        return OrderBoton(
            size: size,
            name: 'Valider la commande',
            asset: 'img/commande_val.png',
            press: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      child: ConfirmationScreen(
                          numberController: numberController),
                    );
                  });
            });
      case BlotStep.realisationCommande:
        return OrderBoton(
            size: size,
            name: 'J\’ai vue le prestataire',
            asset: 'img/icons8_look 1.png',
            press: () {});
      case BlotStep.presencePrestataire:
        return OrderBoton(
            size: size,
            name: 'J\’ai vue le client',
            asset: 'img/icons8_look 1.png',
            press: () {});
      case BlotStep.debutTravaux:
        return OrderBoton(
            size: size,
            name: 'Début des travaux',
            asset: 'img/travaux_icon.png',
            press: () {});
      case BlotStep.termine:
        return OrderBoton(
            size: size,
            name: 'Telecharger',
            asset: 'img/download.png',
            press: () {});
      default:
        return OrderBoton(
            size: size,
            name: 'Terminé',
            asset: 'img/travaux_icon.png',
            press: () {});
    }
  }
}

class OrderBoton extends StatelessWidget {
  const OrderBoton({
    super.key,
    required this.size,
    required this.name,
    required this.asset,
    required this.press,
    this.fontSize = 20,
  });

  final Size size;
  final String name;
  final String asset;
  final double? fontSize;
  final GestureCancelCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(right: 10),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(12), boxShadow: [
        BoxShadow(
          color: Colors.grey.shade500,
          blurRadius: 4,
          offset: const Offset(0, 3),
          spreadRadius: 1.0,
        ),
        const BoxShadow(
          color: Colors.white,
          blurRadius: 1,
          offset: Offset(-4.0, -4.0),
          spreadRadius: 0,
        )
      ]),
      child: TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(asset),
              SizedBox(width: 10),
              textPresentation(
                  msg: name, fontWeight: FontWeight.bold, size: fontSize!),
              SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset('img/Rectangle 12.png'),
              )
            ],
          ),
          onPressed: press,
          style: TextButton.styleFrom(
              backgroundColor: kyellowColor,
              padding: EdgeInsets.symmetric(
                  vertical: 15, horizontal: size.width * 0.16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)))),
    );
  }
}

class StepperItem extends StatelessWidget {
  final bool isCompleted;
  final bool isLast;

  StepperItem({required this.isCompleted, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return isCompleted
        ? SteppItemValided()
        : Container(
            width: 21,
            height: 21,
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Image.asset('img/Vector 3726.png'));
  }
}

class ConfirmationScreen extends StatefulWidget {
  final TextEditingController numberController;

  const ConfirmationScreen({super.key, required this.numberController});
  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    //form key form validation
    final formKey = GlobalKey<FormState>();
    return ClipPath(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        //margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 20,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Column(children: [
                  Icon(Icons.receipt_long, size: 50, color: Colors.green),
                  SizedBox(height: 16),
                  textPresentation(
                      msg: 'Confirmation de commande',
                      fontWeight: FontWeight.bold,
                      size: 20),
                  SizedBox(height: 8),
                ]),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textPresentation(
                        msg: 'Description',
                        fontWeight: FontWeight.normal,
                        size: 13.54),
                    Icon(Icons.arrow_drop_down, size: 16, color: Colors.grey),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textPresentation(
                      msg: 'De vous',
                      fontWeight: FontWeight.normal,
                      size: 13.54),
                  textPresentation(
                      msg: 'Client',
                      fontWeight: FontWeight.normal,
                      size: 13.54),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textPresentation(
                      msg: 'Jean Charles',
                      fontWeight: FontWeight.bold,
                      size: 19.54),
                  textPresentation(
                      msg: 'Client',
                      fontWeight: FontWeight.bold,
                      size: 18.54,
                      color: kyellowColor),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textPresentation(
                      msg: 'Vers', fontWeight: FontWeight.normal, size: 13.54),
                  textPresentation(
                      msg: 'Prrestataire',
                      fontWeight: FontWeight.normal,
                      size: 13.54),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textPresentation(
                      msg: 'Jean Charles',
                      fontWeight: FontWeight.bold,
                      size: 19.54),
                  textPresentation(
                      msg: 'Photographe',
                      fontWeight: FontWeight.bold,
                      size: 18.54,
                      color: kyellowColor),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textPresentation(
                      msg: 'Total', fontWeight: FontWeight.normal, size: 13.54),
                  Row(
                    children: [
                      textPresentation(
                          msg: "\$865",
                          fontWeight: FontWeight.bold,
                          size: 18.54),
                      textPresentation(
                          msg: ' Fcfa',
                          fontWeight: FontWeight.normal,
                          size: 13.54)
                    ],
                  )
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Image.asset('img/Group 138.png'),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: widget.numberController,
                      onChanged: (value) {
                        print(widget.numberController.text.isEmpty);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Veuillez saisir votre numéro de téléphone';
                        } else if (value.length > 9 || value.length < 9) {
                          return 'Veuillez saisir un numéro de téléphone valide';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "6xx xx xx xx",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ValueListenableBuilder<TextEditingValue>(
                  valueListenable: widget.numberController,
                  builder: (context, value, child) {
                    return GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        child: Container(
                          height: 47,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: value.text.isEmpty
                                  ? kFiedBgColor2
                                  : kyellowColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade500,
                                  blurRadius: 2,
                                  offset: const Offset(0, 2),
                                  spreadRadius: 1.0,
                                ),
                                const BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 1,
                                  offset: Offset(-1.0, 0),
                                  spreadRadius: 0,
                                )
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'img/commande_val.png',
                                scale: 1.3,
                                color: value.text.isEmpty
                                    ? Colors.black.withOpacity(0.4)
                                    : Colors.black,
                              ),
                              SizedBox(width: 10),
                              textPresentation(
                                  msg: 'Valider la commande',
                                  fontWeight: FontWeight.bold,
                                  color: value.text.isEmpty
                                      ? Colors.black.withOpacity(0.4)
                                      : Colors.black,
                                  size: 15.62),
                              SizedBox(width: 6),
                              Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Image.asset('img/Rectangle 12.png'),
                              )
                            ],
                          ),
                        ));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
