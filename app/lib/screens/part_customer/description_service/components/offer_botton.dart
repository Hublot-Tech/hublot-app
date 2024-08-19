import 'package:app/configuration.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AddOfferButton extends StatelessWidget {
  const AddOfferButton({
    super.key,
    required this.heigt,
    required this.width,
    required this.press,
    required this.msg,
    this.toCommande = false,
  });
  final double heigt, width;
  final GestureCancelCallback press;
  final String msg;
  final bool toCommande;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: getProportionateScreenWidth(15)),
            decoration: const BoxDecoration(
              color: kyellowColor,
            ),
            child: Center(
              child: textPresentation(
                  msg: msg, fontWeight: FontWeight.bold, size: 14),
            ),
          ),
          toCommande == true
              ? Container(
                  padding: EdgeInsets.all(10),
                  color: kprimaryColor,
                  child: textPresentation(
                    msg: "Commander",
                    fontWeight: FontWeight.bold,
                    size: 14,
                    color: Colors.white,
                  ))
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
