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
    //final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: getProportionateScreenWidth(50),
              decoration: BoxDecoration(
                color: kcolorBoxService,
                border: Border.all(),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: name != null
                      ? FittedBox(
                          fit: BoxFit.scaleDown,
                          child: textPresentation(
                            msg: name!,
                            fontWeight: FontWeight.normal,
                            size: 14,
                          ),
                        )
                      : const SizedBox(),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: getProportionateScreenWidth(50),
              decoration: BoxDecoration(
                color: kcolorBoxService,
                border: Border.all(),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: nbre != null
                      ? FittedBox(
                          fit: BoxFit.scaleDown,
                          child: textPresentation(
                            msg: nbre!,
                            fontWeight: FontWeight.normal,
                            size: 14,
                          ),
                        )
                      : const SizedBox(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
