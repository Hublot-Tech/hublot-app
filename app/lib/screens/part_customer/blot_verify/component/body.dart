import 'package:app/blocs/blot/bloc/blot_bloc.dart';
import 'package:app/configuration.dart';
import 'package:app/model/blot_entity.dart';
import 'package:app/screens/default_screen.dart';
import 'package:app/screens/part_customer/blot_cancel/blot_cancel_screen.dart';
import 'package:app/services/toastServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'button_order2.dart';

class Body extends StatelessWidget {
  final BlotInfo blotInfo;
  const Body({super.key, required this.blotInfo});

  @override
  Widget build(BuildContext context) {
    // bool isSubmit = false;
    return SafeArea(
      child: Column(
        children: [
          EspaceMenuWidget(taille: 50),
          Center(
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kFiedBgColor2),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close)),
            ),
          ),
          EspaceMenuWidget(taille: 20),
          Container(
            //margin: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width *
                0.25, // 25% de la largeur de l'écran
            height: MediaQuery.of(context).size.width *
                0.25, // Garde un ratio carré
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Image.asset(
              'img/icons8_receipt 1.png',
              height: 20,
              width: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: SizedBox(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: Size(MediaQuery.of(context).size.width, 400),
                    painter: RPSCustomPainter(),
                  ),
                  Positioned(
                    top: 40,
                    left: 20,
                    child: Column(children: [
                      textPresentation(
                          msg: "Etat de vérification du\n blot #0001 ",
                          fontWeight: FontWeight.w600,
                          size: 20.sp,
                          maxLine: 2),
                      textPresentation(
                          msg:
                              "Blot délivrer le ${blotInfo.created.day}/${blotInfo.created.month}/${blotInfo.created.year} à ${blotInfo.created.hour}h${blotInfo.created.minute}",
                          fontWeight: FontWeight.normal,
                          size: 15),
                      // Spacer(),
                      EspaceMenuWidget(taille: 132),
                      BlocListener<BlotBloc, BlotState>(
                        listener: (context, state) {
                          if (state is BlotUpdated) {
                            ToastService.successMessage('Merci', kprimaryColor, context);
                            
                          }else if(state is BlotErrorState){
                            ToastService.errorMessage(state.message.message, context);
                          }
                        },
                        child: ButtonOrder2(
                          onTap: () {
                            context.read<BlotBloc>().add(
                                BlotUpdateEvent('finalized', blotInfo.idBlot));
                          },
                          carre: 'img/Rectangle 12.png',
                          text: 'Recevoir les travaux',
                          color1: kyellowColor,
                          color2: Colors.black,
                          color3: Colors.black,
                          img: 'img/icons8_working_at_the_imac 1.png',
                        ),
                      ),
                      EspaceMenuWidget(taille: 8),
                      ButtonOrder2(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlotCancelScreen()));
                        },
                        color3: kColorWhite,
                        carre: 'img/Rectangle 12a.png',
                        text: 'Rejeter les travaux',
                        color1: kprimaryColor,
                        color2: Colors.white,
                        img: 'img/icons8_transaction_declined 1.png',
                      ),
                    ]),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
