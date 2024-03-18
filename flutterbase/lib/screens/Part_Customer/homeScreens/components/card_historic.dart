import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../configuration.dart';

class CardHistoric extends StatelessWidget {
  const CardHistoric({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(children: [
        Container(
          //margin: const EdgeInsets.only(right: 20),
          width: 390,
          height: 72,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.white, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                blurRadius: 2,
                offset: const Offset(2.0, 2.0),
                spreadRadius: 1.0,
              ),
              const BoxShadow(
                color: Colors.white,
                blurRadius: 10,
                offset: Offset(-1.0, -1.0),
                spreadRadius: 1.0,
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
                width: 83,
                height: 72,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(30, 136, 229, 0.1),
                ),
                child: Center(
                  child: SvgPicture.asset("img/icons8_time_machine 1.svg"),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textPresentation(
                      msg: "Vos recentes recherches",
                      fontWeight: FontWeight.bold,
                      size: 16),
                  const SizedBox(height: 2),
                  const Text("Consultez l'historique de votre \nnavigation..."),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_outlined))
          ],
        ),
      ]),
    );
  }
}
