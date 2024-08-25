
import 'package:app/configuration.dart';
import 'package:app/screens/part_customer/blot_detail_screen/blot_details_screen.dart';
import 'package:flutter/material.dart';

class BlotStatus extends StatelessWidget {
  const  BlotStatus({
    super.key,
    required this.size,
    required this.nomClient,
    required this.blotNumber,
    required this.statusBlot,
  });

  final Size size;
  final String nomClient, blotNumber, statusBlot;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=>BlotDetailsScreen(id: blotNumber))),
      child: Row(
        children: [
          Container(
            //width and height to 57 with Mediaquery.of(context).size
            width: size.width * 0.14,
            height: size.height * 0.14,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kyellowColor),
                image: const DecorationImage(
                    image: AssetImage('img/backona.png'), fit: BoxFit.cover)),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textPresentation(
                  msg: nomClient, fontWeight: FontWeight.w600, size: 24),
              Row(
                children: [
                  textPresentation(
                      msg: blotNumber, fontWeight: FontWeight.w300, size: 13),
                  const SizedBox(width: 10),
                  textPresentation(
                      msg: statusBlot,
                      fontWeight: FontWeight.w300,
                      size: 13,
                      color: const Color.fromRGBO(10, 17, 40, 0.5))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
