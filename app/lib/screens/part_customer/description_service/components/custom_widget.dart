import 'package:flutter/material.dart';

class TCustomWidget extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firstCurve = Offset(0, size.height - 20);
    final lasrtCurve = Offset(30, size.height - 20);

    path.quadraticBezierTo(
        firstCurve.dx, firstCurve.dy, lasrtCurve.dx, lasrtCurve.dy);

    final secondFirstCuve = Offset(0, size.height - 20);
    final secondLastCuve = Offset(size.width - 30, size.height - 20);

    path.quadraticBezierTo(secondFirstCuve.dx, secondFirstCuve.dy,
        secondLastCuve.dx, secondLastCuve.dy);

    final thirdFirstCuve = Offset(size.width, size.height - 20);
    final thirdLastCuve = Offset(size.width, size.height);

    path.quadraticBezierTo(thirdFirstCuve.dx, thirdFirstCuve.dy,
        thirdLastCuve.dx, thirdLastCuve.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
