import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CrossWidgetClick extends StatelessWidget {
  const CrossWidgetClick({
    super.key, required this.routeName,
  });
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, routeName);
          },
          child: SizedBox(
            width: 20,
            height: 20,
            child: SvgPicture.asset("img/croix.svg"),
          ),
        ),
      ],
    );
  }
}
