import 'package:app/blocs/blot/bloc/blot_bloc.dart';
import 'package:app/configuration.dart';
import 'package:app/controller/enumeration/blot.dart';
import 'package:app/model/blot_entity.dart';
import 'package:app/screens/components/shimer_loading.dart';
import 'package:app/screens/components/shimmer.dart';
import 'package:app/services/toastServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'button_order.dart';
import 'card_presentation.dart';
import 'order_boton.dart';
import 'step_colum.dart';
import 'verification_dialog.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  BlotStep currentStep = BlotStep.delaisRealisation;
  //controller form textfield
  TextEditingController numberController = TextEditingController();
  bool isLoading = true;
  BlotDetatails blotDetail = BlotDetatails.empty();
  bool isSubmit = false;
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

                    CardPresentation(
                      widget: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // StepperItem(isCompleted: true, isLast: true),
                              // StepperConnector(isCompleted: true),
                              StepperItem(
                                  isCompleted: currentStep ==
                                      BlotStep.validationCommande),
                              StepperConnector(
                                  isCompleted: currentStep ==
                                      BlotStep.validationCommande),
                              StepperItem(
                                  isCompleted: currentStep ==
                                      BlotStep.presencePrestataire),
                              StepperConnector(
                                  isCompleted: currentStep ==
                                      BlotStep.presencePrestataire),
                              StepperItem(
                                  isCompleted: currentStep ==
                                      BlotStep.presencePrestataire),
                              StepperConnector(
                                  isCompleted: currentStep ==
                                      BlotStep.presencePrestataire),
                              StepperItem(isCompleted: false),
                            ],
                          ),
                          5.verticalSpace,
                          // StepColumn(isClick: false, msg: 'Délais de réalisation'),
                          // 5.verticalSpace,
                          StepColumn(
                              isValid:
                                  currentStep == BlotStep.validationCommande,
                              isClick: false,
                              msg: 'Validation de la commande'),
                          5.verticalSpace,
                          StepColumn(
                              isValid:
                                  currentStep == BlotStep.presencePrestataire,
                              isClick: true,
                              msg: 'Réalisation de la commande'),
                          5.verticalSpace,
                          StepColumn(
                              isValid:
                                  currentStep == BlotStep.presencePrestataire,
                              isClick: false,
                              msg: 'Présence du prestataire signaler'),
                          5.verticalSpace,
                          StepColumn(
                              isValid:
                                  currentStep == BlotStep.presencePrestataire,
                              isClick: false,
                              msg: 'Présence du client signaler'),
                          10.verticalSpace,
                          BlocListener<BlotBloc, BlotState>(
                            listener: (context, state) {
                              if (state is BlotInitial) {
                                setState(() {
                                  isSubmit = true;
                                });
                              }
                              if (state is BlotAcceptOffer) {
                                setState(() {
                                  isSubmit = false;
                                });
                                currentStep = BlotStep.validationCommande;
                              } else if (state is BlotErrorState) {
                                setState(() {
                                  isSubmit = false;
                                });
                                currentStep = BlotStep.validationCommande;
                              }
                            },
                            child: buildActionButton(size, blotDetail,
                                context.read<BlotBloc>(), isSubmit),
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

  Widget buildActionButton(
      Size size, BlotDetatails blotDetail, BlotBloc blotBloc, bool isSubmit) {
    final formKey = GlobalKey<FormState>();
    TextEditingController numberController = TextEditingController();
    switch (currentStep) {
      case BlotStep.delaisRealisation:
        return OrderBoton(
            size: size,
            name: 'Valider la commande',
            asset: 'img/commande_val.png',
            press: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return VerificationDialog(
                      img: 'img/icons8_ledger 1.png',
                      widget: Positioned(
                        left: 20.r,
                        top: 220.r,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Material(
                            type: MaterialType.transparency,
                            child: Form(
                              key: formKey,
                              child: Column(
                                //mainAxisSize: MainAxisSize.min,
                                children: [
                                  textPresentation(
                                      msg: 'Confirmation de commande',
                                      fontWeight: FontWeight.bold,
                                      size: 18.sp),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      textPresentation(
                                          msg: blotDetail.consumer.fullname,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      textPresentation(
                                          msg: 'Vers',
                                          fontWeight: FontWeight.normal,
                                          size: 13.54),
                                      textPresentation(
                                          msg: 'Prrestataire',
                                          fontWeight: FontWeight.normal,
                                          size: 13.54),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      textPresentation(
                                          msg: blotDetail.provider.fullname,
                                          fontWeight: FontWeight.bold,
                                          size: 19.54),
                                      textPresentation(
                                          msg: blotDetail.description,
                                          fontWeight: FontWeight.bold,
                                          size: 18.54,
                                          color: kyellowColor),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      textPresentation(
                                          msg: 'Total',
                                          fontWeight: FontWeight.normal,
                                          size: 13.54),
                                      Row(
                                        children: [
                                          textPresentation(
                                              msg: "\$ ${blotDetail.price}",
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
                                          controller: numberController,
                                          onChanged: (value) {
                                            print(
                                                numberController.text.isEmpty);
                                          },
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Veuillez saisir votre numéro de téléphone';
                                            } else if (value.length > 9 ||
                                                value.length < 9) {
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
                                  GestureDetector(
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        blotBloc.add(
                                          BlotAcceptOffer(
                                            blotDetail.id,
                                            blotDetail.consumer.email!,
                                            'descriptions',
                                            numberController.text,
                                          ),
                                        );
                                      }
                                    },
                                    child: ValueListenableBuilder<
                                            TextEditingValue>(
                                        valueListenable: numberController,
                                        builder: (context, value, child) {
                                          return ButtonOrder(
                                            value: value,
                                            isSubmit: isSubmit,
                                          );
                                        }),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            });
      case BlotStep.validationCommande:
        return OrderBoton(
            size: size,
            name: "J'ai vue le prestataire",
            asset: 'img/icons8_look 1.png',
            press: () {
              blotBloc.add(BlotUpdateEvent('got_in_touch', blotDetail.id));
            });
      case BlotStep.presencePrestataire:
        // case BlotStep.debutTravaux:
        return OrderBoton(
            size: size,
            name: 'Début des travaux',
            asset: 'img/travaux_icon.png',
            press: () {
              blotBloc.add(BlotUpdateEvent('started_work', blotDetail.id));
            });
      case BlotStep.debutTravaux:
        return OrderBoton(
            size: size,
            name: 'Fin des travaux',
            asset: 'img/travaux_icon.png',
            press: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => BlotVerifyScreen(
              //           blotInfo: BlotInfo(
              //               idBlot: blotDetail.id,
              //               created: blotDetail.createdAt),
              //         ),
              //         ));
            });
      default:
        return OrderBoton(
            size: size,
            name: 'Terminé',
            asset: 'img/travaux_icon.png',
            press: () {});
    }
  }
}
