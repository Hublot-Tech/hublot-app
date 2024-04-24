import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';

class NotificationBox extends StatelessWidget {
  const NotificationBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      height: getProportionateScreenHeight(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.white, width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 2,
            offset: const Offset(1.0, 1.0),
            spreadRadius: 1.0,
          ),
          const BoxShadow(
            color: Colors.white,
            blurRadius: 20,
            offset: Offset(-4.0, -4.0),
            spreadRadius: 10.0,
          )
        ],
      ),
      child: Icon(
        Icons.notifications_none_sharp,
        size: getProportionateScreenWidth(30),
      ),
    );
  }
}
