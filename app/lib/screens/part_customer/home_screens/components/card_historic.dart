import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardHistoric extends StatelessWidget {
  const CardHistoric({super.key, required this.press});
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          final iconSize = maxWidth * 0.15;
          final fontSize = maxWidth * 0.04;

          return Container(
            margin: EdgeInsets.only(right: maxWidth * 0.05),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: maxWidth * 0.2,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(30, 136, 229, 0.1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "img/icons8_time_machine 1.svg",
                        width: iconSize * 0.5,
                        height: iconSize * 0.5,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(maxWidth * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            overflow: TextOverflow.ellipsis,
                            "Vos recentes recherches",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontSize,
                                fontFamily: 'ProximaNova'),
                          ),
                          SizedBox(height: maxWidth * 0.02),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            "Consultez l'historique de votre \nnavigation...",
                            style: TextStyle(fontSize: fontSize * 0.8),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_outlined,
                        size: iconSize * 0.5),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
