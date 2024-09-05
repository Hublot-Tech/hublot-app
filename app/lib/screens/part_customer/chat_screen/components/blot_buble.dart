import 'package:app/configuration.dart';
import 'package:app/screens/part_customer/blot_detail_screen/blot_details_screen.dart';
import 'package:flutter/material.dart';

class BlotBuble extends StatelessWidget {
  const BlotBuble({
    super.key,
    required this.message,
    required this.isMe,
  });

  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BlotDetailsScreen(id: message)));
      },
      child: SizedBox(
        width: 152,
        height: 72,
        child: Row(
          children: [
            Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: kprimaryColor,
                  borderRadius: BorderRadius.circular(46),
                ),
                child: Image.asset('img/icons8_signing_a_document 1.png',
                    height: 20, width: 20)),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textPresentation(
                  msg: 'Blot  ',
                  fontWeight: FontWeight.w400,
                  size: 16,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.visible,
                  color: kColorWhite,
                ),
                textPresentation(
                    color: kColorWhite,
                    msg: isMe ? 'Envoyé' : 'Ouvrir',
                    fontWeight: FontWeight.w300,
                    size: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
