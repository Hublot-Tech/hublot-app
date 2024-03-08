
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterbase/configuration.dart';

class ItemDeCategories extends StatelessWidget {
  const ItemDeCategories({
    super.key,
    required this.name,
    required this.icon,
  });
  final String name;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 140,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: const Color.fromRGBO(100, 100, 100, 0.15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Spacer(),
          SvgPicture.asset(icon),
          const SizedBox(width: 6),
          textPresentation(mesg: name, fontWeight: FontWeight.bold, size: 14),
          const Spacer(),
        ],
      ),
    );
  }
}
