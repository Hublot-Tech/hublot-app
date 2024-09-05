
import 'package:app/configuration.dart';
import 'package:flutter/material.dart';

class ButtonOrder2 extends StatelessWidget {
  const ButtonOrder2(
      {super.key,
      required this.carre,
      required this.img,
      required this.text,
      required this.color3,
      required this.color1,
      required this.color2,
      required this.onTap});
  final String img, text, carre;
  final Color color1, color2, color3;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 47,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color1,
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
              img,
              scale: 1.3,
              color: color3,
            ),
            const SizedBox(width: 10),
            textPresentation(
                msg: text,
                fontWeight: FontWeight.bold,
                color: color2,
                size: 15.62),
            const SizedBox(width: 2),
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Image.asset(carre),
            ),
            //circular in sizedBox
            // isSubmit ? CircularProgressIndicator() : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
