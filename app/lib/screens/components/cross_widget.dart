import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CrossWidgetClick extends StatelessWidget {
  const CrossWidgetClick({
    super.key,
    required this.routeName, this.id,
  });
  final Widget routeName;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return routeName;
            },settings: RouteSettings(arguments: id)));
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
