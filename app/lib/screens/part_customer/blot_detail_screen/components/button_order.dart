
import 'package:app/configuration.dart';
import 'package:flutter/material.dart';

class ButtonOrder extends StatelessWidget {
  const ButtonOrder({
    super.key,
    this.value,
    required this.isSubmit,
  });
  final TextEditingValue? value;
  final bool isSubmit;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: value!.text.isEmpty ? kFiedBgColor2 : kyellowColor,
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
            color: value!.text.isEmpty
                ? Colors.black.withOpacity(0.4)
                : Colors.black,
          ),
          const SizedBox(width: 10),
          textPresentation(
              msg: 'Valider la commande',
              fontWeight: FontWeight.bold,
              color: value!.text.isEmpty
                  ? Colors.black.withOpacity(0.4)
                  : Colors.black,
              size: 15.62),
          const SizedBox(width: 6),
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Image.asset('img/Rectangle 12.png'),
          ),
          //circular in sizedBox
          isSubmit ? CircularProgressIndicator() : SizedBox.shrink(),
        ],
      ),
    );
  }
}