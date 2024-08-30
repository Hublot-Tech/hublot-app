import 'package:app/configuration.dart';
import 'package:app/screens/part_customer/chat_screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BoxxUserChat extends StatelessWidget {
  const BoxxUserChat({
    super.key,
    required this.widget,
    required this.size,
  });

  final ChatScreen widget;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: textPresentation(
              msg: widget.name,
              fontWeight: FontWeight.bold,
              size: 20,
              color: Colors.white),
        ),
        Row(children: [
          Container(
            width: 4,
            height: 4,
            margin: EdgeInsets.only(right: size.width * 0.015),
            decoration: const BoxDecoration(
                color: Colors.green, shape: BoxShape.circle),
          ),
          textPresentation(
              msg: 'En ligne',
              fontWeight: FontWeight.w300,
              size: 13.4,
              color: Colors.white),
        ]),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: size.width * 0.015),
              child: SvgPicture.asset('img/icons8_star 2.svg',
                  width: 12, height: 12),
            ),
            textPresentation(
                msg: '4.6',
                fontWeight: FontWeight.w400,
                size: 10,
                color: Colors.white),
          ],
        ),
      ],
    );
  }
}
