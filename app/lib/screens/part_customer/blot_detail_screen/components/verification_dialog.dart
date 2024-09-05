import 'package:app/screens/default_screen.dart';
import 'package:flutter/material.dart';

class VerificationDialog extends StatelessWidget {
  final Widget widget;
  final String img;
  const VerificationDialog({super.key, required this.widget, required this.img});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Center(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SizedBox(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: CustomPaint(
                      size: Size(MediaQuery.of(context).size.width, 400),
                      painter: RPSCustomPainter(),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height *
                        0.15, // 15% de la hauteur de l'écran
                    right: MediaQuery.of(context).size.width *
                        0.38, // 20% de la largeur de l'écran
                    child: Container(
                      width: MediaQuery.of(context).size.width *
                          0.25, // 25% de la largeur de l'écran
                      height: MediaQuery.of(context).size.width *
                          0.25, // Garde un ratio carré
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        img,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                  widget,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Assurez-vous d'importer ou de définir RPSCustomPainter et textPresentation