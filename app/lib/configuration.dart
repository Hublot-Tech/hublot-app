import 'package:app/size_configuration.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const kCategoriecolor = Color.fromRGBO(30, 136, 229, 1);
const kyellowColor = Color.fromRGBO(255, 192, 0, 1);
const kprimaryColor = Color.fromRGBO(10, 17, 40, 1);
const ksecondaryColor = Color.fromRGBO(100, 100, 100, 1);
const kbottonColor = Color.fromRGBO(100, 100, 100, 40);
const ktransparentColor = Color.fromRGBO(217, 217, 217, 1);
const kgreenColor = Color.fromRGBO(51, 196, 129, 1);
const kredColor = Color.fromRGBO(229, 57, 53, 1);
const kcolorBoxService = Color.fromRGBO(10, 17, 40, 0.1);
const kFiedBgColor = Color.fromRGBO(100, 100, 100, 0.15);
const kFiedBgColor2 = Color.fromRGBO(100, 100, 100, 0.2);
const kColorWhite = Colors.white;

const kColorBlack = Colors.black;
String baseUrl = 'https://api.hublots.co/api';
String baseUrl2 = 'https://api.hublots.co/api';

const shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);
Widget textPresentation({
  required String msg,
  double size = 30,
  Color color = kprimaryColor,
  TextAlign textAlign = TextAlign.center,
  TextOverflow overflow = TextOverflow.ellipsis,
  int? maxLine,
  double? minFontSize,
  required FontWeight fontWeight,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      //  double maxFontSize = (constraints.maxWidth / 10).floorToDouble();

      return AutoSizeText(
        msg,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLine ?? 1,
        minFontSize: minFontSize ?? 11,
        stepGranularity: 1,
        style: TextStyle(
          fontWeight: fontWeight,
          color: color,
          fontSize: size.sp,
          fontFamily: 'ProximaNova',
        ),
        // maxFontSize: maxFontSize,
      );
    },
  );
}

class EspaceMenuWidget extends StatelessWidget {
  const EspaceMenuWidget({
    super.key,
    this.taille = 20,
  });
  final double taille;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return taille.verticalSpace;
  }
}

const toastDuration = Duration(seconds: 6);
