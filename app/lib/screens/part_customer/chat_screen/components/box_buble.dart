import 'package:app/configuration.dart';
import 'package:flutter/material.dart';

class BoxBublePopup extends StatelessWidget {
  const BoxBublePopup({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width * 0.075,
        height: size.height * 0.075,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: kColorWhite,
        ),
        child: const Icon(Icons.more_vert_sharp,
            color: kprimaryColor));
  }
}
