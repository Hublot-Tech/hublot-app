import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../authentification/providerScreen/prestataire_screen.dart';

class BecomePrestataire extends StatelessWidget {
  const BecomePrestataire({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProviderScreen.routeName);
      },
      child: Row(children: [
        Container(
          //  margin: const EdgeInsets.only(left: 20),
          height: 40,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                blurRadius: 2,
                offset: const Offset(4.0, 4.0),
                spreadRadius: 1.0,
              ),
              const BoxShadow(
                color: Colors.white,
                blurRadius: 15,
                offset: Offset(-4.0, -4.0),
                spreadRadius: 1.0,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset("img/profil.svg"),
              const Text(
                "Devenir prestataire",
                style: TextStyle(fontSize: 15),
              ),
              const Icon(Icons.keyboard_arrow_down_sharp),
            ],
          ),
        ),
      ]),
    );
  }
}
