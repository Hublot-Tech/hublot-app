
import 'package:flutter/material.dart';

class NotificationBox extends StatelessWidget {
  const NotificationBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.only(right: 20),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
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
            blurRadius: 20,
            offset: Offset(-4.0, -4.0),
            spreadRadius: 10.0,
          )
        ],
      ),
      child: const Icon(
        Icons.notifications_none_sharp,
        size: 40,
      ),
    );
  }
}
