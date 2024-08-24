import 'package:app/configuration.dart';
import 'package:app/screens/part_customer/blot_detail_screen/components/row_info.dart';
import 'package:flutter/material.dart';

class CardPresentation extends StatelessWidget {
  const CardPresentation({
    super.key, required this.widget,
  });
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kColorWhite,
          boxShadow: [
            // BoxShadow(
            //   color: Colors.black.withOpacity(
            //       0.05), // rgba(0, 0, 0, 0.05) en Flutter
            //   spreadRadius: 0, // Pas d'étalement
            //   blurRadius: 6, // Rayon de flou de 4 pixels
            //   offset: const Offset(
            //       0, 4), // Décalage de 4 pixels vers le bas
            // ),
            BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: 4,
              offset: const Offset(4, 0),
              spreadRadius: 1.0,
            ),
            const BoxShadow(
              color: Colors.white,
              blurRadius: 2,
              offset: Offset(-4.0, -4.0),
              spreadRadius: 0,
            )
          ]),
      child: widget,
    );
  }
}

Column buildColumn() {
  return Column(
    children: [
      RowInfo(
          profession: 'Nom du prestataire',
          value: 'Photographe',
          name: 'Gislain Lamga'),
      SizedBox(height: 15),
      RowInfo(name: 'Diboum alex', profession: 'Nom du client'),
      SizedBox(height: 15),
      RowInfo(
          name: 'Options choisies',
          value: 'Tenues',
          valu: 50,
          profession: 'Photographe'),
      SizedBox(height: 15),
      RowInfo(
          name: 'Offre de base',
          value: '10 000 FCFA',
          profession: 'Photographe'),
      SizedBox(height: 15),
      RowInfo(
          name: 'Coût de la prestation : ',
          value: '11 000 FCFA',
          profession: 'Prix des options prise en compte'),
      SizedBox(height: 15),
      RowInfo(
          name: 'Commission',
          value: '110 FCFA',
          valu: 65,
          profession: 'Prix des options prise en compte'),
    ],
  );
}
