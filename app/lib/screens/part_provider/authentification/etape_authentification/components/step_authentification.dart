import 'package:app/configuration.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';

class StepAuthentification extends StatelessWidget {
  const StepAuthentification({
    super.key,
    required this.isChecked,
    required this.test,
  });

  final bool isChecked;
  final String test;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: getProportionateScreenWidth(20),
          left: getProportionateScreenWidth(30)),
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 5),
            height: getProportionateScreenHeight(14),
            width: getProportionateScreenWidth(14),
            decoration: BoxDecoration(
                // ignore: dead_code
                color: isChecked ? kyellowColor : Colors.white,
                border: Border.all(),
                borderRadius: BorderRadius.circular(14)),
          ),
          SizedBox(width: getProportionateScreenWidth(10)),
          textPresentation(
              msg: test,
              color: isChecked
                  ? const Color.fromRGBO(10, 17, 40, 1)
                  : const Color.fromRGBO(10, 17, 40, 0.5),
              fontWeight: FontWeight.w400,
              size: 13),
              
        ],
      ),
    );
  }
}
