import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

/// la BecomeRowBox sert de box pour envoyer vers
class BecomeRowBox extends StatelessWidget {
  const BecomeRowBox({
    super.key,
    required this.text,
    required this.press,
  });

  final String text;
  final GestureCancelCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: BecomeRowBoxContainer(
        text: text,
      ),
    );
  }
}

class BecomeRowBoxContainer extends StatelessWidget {
  const BecomeRowBoxContainer({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 40,
      width: size.width * 0.52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white, width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withOpacity(0.05), // rgba(0, 0, 0, 0.05) en Flutter
            spreadRadius: 0, // Pas d'étalement
            blurRadius: 4, // Rayon de flou de 4 pixels
            offset: const Offset(0, 4), // Décalage de 4 pixels vers le bas
          ),
          // BoxShadow(
          //   color: Colors.grey.shade500,
          //   blurRadius: 4,
          //   offset: const Offset(4.0, 4.0),
          //   spreadRadius: 1.0,
          // ),
          // const BoxShadow(
          //   color: Colors.white,
          //   blurRadius: 15,
          //   offset: Offset(-4.0, -4.0),
          //   spreadRadius: 0,
          // )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset("img/profil.svg"),
          Text(
            text,
            style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'ProximaNova'),
          ),
          const Icon(Icons.keyboard_arrow_down_sharp),
        ],
      ),
    );
  }
}
