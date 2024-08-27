import 'package:flutter/gestures.dart';
import 'package:app/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtomCustom extends StatefulWidget {
  const ButtomCustom({
    super.key,
    this.loading = false,
    required this.press,
    required this.msg,
    this.color = kbottonColor,
    this.heigth = 50,
    required this.isValided,
  });
  final GestureCancelCallback press;
  final String msg;
  final Color color;
  final bool isValided;
  final double heigth;
  final bool loading;

  @override
  State<ButtomCustom> createState() => _ButtomCustomState();
}

class _ButtomCustomState extends State<ButtomCustom> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.isValided ? widget.press : null,
      child: Container(
        width: size.width * 0.8,
        height: widget.heigth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10).r,
          color: widget.isValided ? kprimaryColor : widget.color,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              const SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.msg,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 3, top: 10).r,
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 236, 213, 7),
                    ),
                  ),
                ],
              ),
              widget.loading
                  ? const CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.white)
                  : const SizedBox(),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
