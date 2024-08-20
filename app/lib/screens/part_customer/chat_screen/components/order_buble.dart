import 'package:app/configuration.dart';
import 'package:flutter/material.dart';

class OrderBuble extends StatelessWidget {
  const OrderBuble({
    super.key, required this.isMe,
  });
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 308,
      height: 354,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 308,
            height: 178,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18), topRight: Radius.circular(18)),
              image: DecorationImage(
                  image: AssetImage('img/backona.png'), fit: BoxFit.cover),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, top: 13, bottom: 15, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 1),
                Row(
                  children: [
                    textPresentation(
                        msg: 'Bonjour',
                        color: isMe? kColorWhite : kColorBlack,
                        fontWeight: FontWeight.w400,
                        size: 16),
                    textPresentation(
                        msg: 'Juditht',
                        fontWeight: FontWeight.bold,
                        size: 16,
                        color: isMe? kColorWhite : kColorBlack,),
                  ],
                ),
                textPresentation(
                    msg: 'Je suis intéressé(e) par votre service',
                    fontWeight: FontWeight.w400,
                    size: 16,
                    color: isMe? kColorWhite : kColorBlack),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: kyellowColor),
                  child: Row(
                    children: [
                      textPresentation(
                          msg: 'Photographe',
                          fontWeight: FontWeight.bold,
                          size: 18.5,
                          color: isMe? kColorWhite : kColorBlack),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: kyellowColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textPresentation(
                          msg: 'Photographe',
                          fontWeight: FontWeight.w400,
                          size: 14,
                          color: isMe? kColorWhite : kColorBlack,),
                      textPresentation(
                          msg: '1000 FCFA',
                          fontWeight: FontWeight.bold,
                          size: 16,
                          color: isMe? kColorWhite : kColorBlack,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
