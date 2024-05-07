import 'package:app/configuration.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';

class ButtomCustom extends StatefulWidget {
  const ButtomCustom({
    super.key,
    required this.press,
    required this.msg,
    this.color = kbottonColor, required this.isValided,
  });
  final GestureCancelCallback press;
  final String msg;
  final Color color;
  final bool isValided;

  @override
  State<ButtomCustom> createState() => _ButtomCustomState();
}

class _ButtomCustomState extends State<ButtomCustom> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: Container(
        width: getProportionateScreenWidth(390),
        height: getProportionateScreenHeight(50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.isValided ? kprimaryColor : widget.color,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.msg,
                textAlign: TextAlign.center,
                style: const TextStyle(
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
