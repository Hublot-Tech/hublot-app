import 'package:app/configuration.dart';
import 'package:flutter/material.dart';

class ButtomCustom extends StatelessWidget {
  const ButtomCustom({
    super.key,
    required this.press,
    required this.msg,
  });
  final GestureCancelCallback press;
  final String msg;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 390,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ksecondaryColor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                msg,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 3, top: 10),
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 236, 213, 7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
