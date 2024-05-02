import 'package:app/configuration.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';

class OffreBaseBox extends StatelessWidget {
  const OffreBaseBox({
    Key? key,
    required this.name,
    required this.nbre,
  }) : super(key: key);
  final String? name, nbre;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(395),
      height: getProportionateScreenWidth(50),
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(20),
          right: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: getProportionateScreenHeight(197),
            height: getProportionateScreenWidth(50),
            decoration: BoxDecoration(
              color: kcolorBoxService,
              border: Border.all(),
            ),
            child: Center(
              child: name != null
                  ? textPresentation(
                      msg: name!, fontWeight: FontWeight.normal, size: 14)
                  : SizedBox(), // Remplacer par un widget vide si name est null
            ),
          ),
          Container(
            width: getProportionateScreenHeight(145),
            height: getProportionateScreenWidth(50),
            decoration: BoxDecoration(
              color: kcolorBoxService,
              border: Border.all(),
            ),
            child: Center(
              child: nbre != null
                  ? textPresentation(
                      msg: nbre!, fontWeight: FontWeight.normal, size: 14)
                  : SizedBox(), // Remplacer par un widget vide si nbre est null
            ),
          ),
        ],
      ),
    );
  }
}
