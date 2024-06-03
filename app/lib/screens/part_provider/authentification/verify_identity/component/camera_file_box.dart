import 'package:app/configuration.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CameraOrFiileBox extends StatelessWidget {
  const CameraOrFiileBox({
    super.key,
    required this.press1,
    required this.press2,
  });
  final GestureCancelCallback press1, press2;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(150),
      child: Padding(
        padding: EdgeInsets.only(top: getProportionateScreenWidth(30)),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: press1,
                child: Column(
                  children: [
                    const Icon(
                      Icons.camera,
                      color: Colors.white,
                      size: 50,
                    ),
                    const EspaceMenuWidget(taille: 10),
                    textPresentation(
                        msg: "Caméra",
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        size: getProportionateScreenWidth(20))
                  ],
                ),
              ),
            ),
            SizedBox(width: getProportionateScreenWidth(40)),
            Expanded(
              child: InkWell(
                onTap: press2,
                child: Column(
                  children: [
                    const Icon(
                      Icons.image,
                      color: Colors.white,
                      size: 50,
                    ),
                    const EspaceMenuWidget(taille: 10),
                    textPresentation(
                        msg: "Gallerie",
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        size: getProportionateScreenWidth(20))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
