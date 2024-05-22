import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';
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
    return Container(
      height: getProportionateScreenHeight(50),
      width: getProportionateScreenWidth(190),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white, width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 2,
            offset: const Offset(4.0, 4.0),
            spreadRadius: 1.0,
          ),
          const BoxShadow(
            color: Colors.white,
            blurRadius: 15,
            offset: Offset(-4.0, -4.0),
            spreadRadius: 1.0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10), // Marge à gauche
            child: SvgPicture.asset("img/profil.svg"),
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(14),
                fontFamily: 'ProximaNova'),
          ),
          const Icon(Icons.keyboard_arrow_down_sharp),
        ],
      ),
    );
  }
}
