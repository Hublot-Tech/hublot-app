import 'package:flutter/material.dart';
import 'package:flutterbase/configuration.dart';

class RowReseauConnect extends StatelessWidget {
  const RowReseauConnect({
    super.key,
    required this.img,
    required this.icon,
    required this.press,
  });
  final String img;
  final String icon;
  final GestureCancelCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Center(
        child: Container(
          height: 40,
          // width: 360,
          decoration: BoxDecoration(
            border: Border.all(color: kprimaryColor),
          ),
          child: Row(
            children: [
              const SizedBox(width: 15),
              SizedBox(
                width: 26,
                height: 26,
                child: Image.asset(icon),
              ),
              const SizedBox(width: 15),
              textPresentation(mesg: img, fontWeight: FontWeight.w400, size: 15)
            ],
          ),
        ),
      ),
    );
  }
}
