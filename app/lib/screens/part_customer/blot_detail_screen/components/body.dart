import 'package:app/blocs/blot/bloc/blot_bloc.dart';
import 'package:app/configuration.dart';
import 'package:app/controller/enumeration/blot.dart';
import 'package:app/model/blot_entity.dart';
import 'package:app/screens/components/shimer_loading.dart';
import 'package:app/screens/components/shimmer.dart';
import 'package:app/screens/part_customer/blot_detail_screen/components/card_presentation.dart';
import 'package:app/screens/part_customer/blot_detail_screen/components/step_colum.dart';
import 'package:app/services/toastServices.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  BlotStep currentStep = BlotStep.validationCommande;
  //controller form textfield
  TextEditingController numberController = TextEditingController();
  bool isLoading = true;
  BlotDetatails blotDetail = BlotDetatails.empty();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // int index = 0;
    // int ode = 0;
    return SafeArea(
      child: BlocListener<BlotBloc, BlotState>(
        listener: (context, state) {
          if (state is BlotFetchedDetail) {
            setState(() {
              isLoading = false;
            });
            blotDetail = state.data;
          }
          if (state is BlotErrorState) {
            setState(() {
              isLoading = false;
            });
            ToastService.errorMessage(state.message.message, context);
          }
        },
        child: SingleChildScrollView(
          child: Shimmer(
            linearGradient: shimmerGradient,
            child: ShimmerLoading(
              isLoading: isLoading,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    20.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.close)),
                        //icons8_business_documentation 1.png
                        Container(
                            width: 46,
                            height: 46,
                            decoration: BoxDecoration(
                              color: kprimaryColor,
                              borderRadius: BorderRadius.circular(46).r,
                            ),
                            child: Image.asset(
                                'img/icons8_business_documentation 1.png',
                                height: 20,
                                width: 20)),
                        Container(
                            // width: 81,
                            height: 28,
                            padding: const EdgeInsets.only(right: 10, left: 10),
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
                                const Icon(Icons.edit,
                                    color: kyellowColor, size: 14),
                              ],
                            )),
                      ],
                    ),
                    20.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textPresentation(
                            msg: "Suivis du Blot",
                            fontWeight: FontWeight.bold,
                            size: 24.12),
                        textPresentation(
                            msg: ' #0001',
                            fontWeight: FontWeight.normal,
                            size: 24.12)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textPresentation(
                            msg: 'Détails ',
                            fontWeight: FontWeight.w300,
                            size: 15),
                        textPresentation(
                            msg:
                                "${blotDetail.createdAt.month.toString()}/${blotDetail.createdAt.day.toString()}/${blotDetail.createdAt.year.toString()}",
                            fontWeight: FontWeight.w600,
                            size: 15),
                        textPresentation(
                            msg: ' à', fontWeight: FontWeight.w300, size: 15),
                        textPresentation(
                            msg:
                                " ${blotDetail.createdAt.hour.toString()}h${blotDetail.createdAt.minute.toString()}",
                            fontWeight: FontWeight.w600,
                            size: 15),
                      ],
                    ),
                    30.verticalSpace,
                    CardPresentation(widget: buildColumn(blotDetail)),
                    30.verticalSpace,
                    // Container(
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       color: kColorWhite,
                    //       boxShadow: [
                    //         // BoxShadow(
                    //         //   color: Colors.black.withOpacity(
                    //         //       0.05), // rgba(0, 0, 0, 0.05) en Flutter
                    //         //   spreadRadius: 0, // Pas d'étalement
                    //         //   blurRadius: 6, // Rayon de flou de 4 pixels
                    //         //   offset: const Offset(
                    //         //       0, 4), // Décalage de 4 pixels vers le bas
                    //         // ),
                    //         BoxShadow(
                    //           color: Colors.grey.shade500,
                    //           blurRadius: 4,
                    //           offset: const Offset(4, 0),
                    //           spreadRadius: 1.0,
                    //         ),
                    //         const BoxShadow(
                    //           color: Colors.white,
                    //           blurRadius: 2,
                    //           offset: Offset(-4.0, -4.0),
                    //           spreadRadius: 0,
                    //         )
                    //       ]),
                    //   child:
                    CardPresentation(
                      widget: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                          5.verticalSpace,
                          // StepColumn(isClick: false, msg: 'Délais de réalisation'),
                          // 5.verticalSpace,
                          const StepColumn(
                              isClick: false, msg: 'Validation de la commande'),
                          5.verticalSpace,
                          const StepColumn(
                              isClick: true, msg: 'Réalisation de la commande'),
                          5.verticalSpace,
                          const StepColumn(
                              isClick: false,
                              msg: 'Présence du prestataire signaler'),
                          5.verticalSpace,
                          const StepColumn(
                              isClick: false,
                              msg: 'Présence du client signaler'),
                          10.verticalSpace,
                          BlocListener<BlotBloc, BlotState>(
                            listener: (context, state) {},
                            child: buildActionButton(size),
                          ),
                          10.verticalSpace,
                        ],
                      ),
                    ),
                    //  ),
                    const EspaceMenuWidget(taille: 100),
                  ],
                ),
              ),
            ),
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
              context.read<BlotBloc>().add(const BlotUpdateEvent('', ''));
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
            name: 'J’ai vue le prestataire',
            asset: 'img/icons8_look 1.png',
            press: () {});
      case BlotStep.presencePrestataire:
        return OrderBoton(
            size: size,
            name: 'J’ai vue le client',
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
          onPressed: press,
          style: TextButton.styleFrom(
              backgroundColor: kyellowColor,
              padding: EdgeInsets.symmetric(
                  vertical: 15, horizontal: size.width * 0.1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(asset),
              const SizedBox(width: 10),
              textPresentation(
                  msg: name, fontWeight: FontWeight.bold, size: fontSize!),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset('img/Rectangle 12.png'),
              )
            ],
          )),
    );
  }
}

class StepperItem extends StatelessWidget {
  final bool isCompleted;
  final bool isLast;

  const StepperItem(
      {super.key, required this.isCompleted, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return isCompleted
        ? const SteppItemValided()
        : Container(
            width: 21,
            height: 21,
            decoration: const BoxDecoration(
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
        padding: const EdgeInsets.all(20),
        //margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
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
                  const Icon(Icons.receipt_long, size: 50, color: Colors.green),
                  const SizedBox(height: 16),
                  textPresentation(
                      msg: 'Confirmation de commande',
                      fontWeight: FontWeight.bold,
                      size: 20),
                  const SizedBox(height: 8),
                ]),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textPresentation(
                        msg: 'Description',
                        fontWeight: FontWeight.normal,
                        size: 13.54),
                    const Icon(Icons.arrow_drop_down,
                        size: 16, color: Colors.grey),
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
              const SizedBox(height: 8),
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
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              Row(
                children: [
                  Image.asset('img/Group 138.png'),
                  const SizedBox(width: 10),
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
                      decoration: const InputDecoration(
                        labelText: "6xx xx xx xx",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
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
                              const SizedBox(width: 10),
                              textPresentation(
                                  msg: 'Valider la commande',
                                  fontWeight: FontWeight.bold,
                                  color: value.text.isEmpty
                                      ? Colors.black.withOpacity(0.4)
                                      : Colors.black,
                                  size: 15.62),
                              const SizedBox(width: 6),
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
