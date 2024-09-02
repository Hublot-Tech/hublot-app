import 'package:app/configuration.dart';
import 'package:app/model/blot_entity.dart';
import 'package:app/screens/part_customer/blot_detail_screen/components/row_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardPresentation extends StatelessWidget {
  const CardPresentation({
    super.key,
    required this.widget,
  });
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 10.r, right: 12, top: 10, bottom: 15).r,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10).r,
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

Column buildColumn(BlotDetatails blotDetail) {
  int newPrice = (blotDetail.price * 0.1).toInt();
  return Column(
    children: [
      RowInfo(
          profession: 'Nom du prestataire',
          value: 'Photographe',
          name: blotDetail.provider.fullname),
      13.verticalSpace,
      RowInfo(name: blotDetail.consumer.fullname, profession: 'Nom du client'),
      13.verticalSpace,
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Options choisies',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Photographie',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Spacer(flex: 2),
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                // Action pour le bouton précédent
              },
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow[700],
              ),
              child: Text(
                '1',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 8),
            Column(
              children: [
                Text(
                  'Tenues',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  '1000 FCFA',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                // Action pour le bouton suivant
              },
            ),
          ],
        ),
      ),
      13.verticalSpace,
      RowInfo(
          name: 'Offre de base',
          value: '${blotDetail.offer}FCFA',
          profession: 'Photographe'),
      13.verticalSpace,
      RowInfo(
          name: 'Coût de la prestation : ',
          value: '${blotDetail.price}FCFA',
          profession: 'Prix des options prise en compte'),
      13.verticalSpace,
      RowInfo(
          name: 'Commission',
          value: '$newPrice FCFA',
          valu: 65,
          profession: '1% de votre coût de prestations'),
    ],
  );
}
