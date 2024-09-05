import 'package:app/configuration.dart';
import 'package:app/screens/part_customer/home_screens/components/hublo_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HublotTextWigdet(),
              30.verticalSpace,
              Image.asset('img/icons8_Sand_Timer 1.png'),
              10.verticalSpace,
              textPresentation(
                  maxLine: 2,
                  msg: 'Pas encore prêt mais\n pour bientôt',
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                  size: 32.sp),
              20.verticalSpace,
             
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
          ),
          painter: RPSCustomPainter(),
        ),
      ],
    );
  }
}

// CustomPainter class to for the header curved-container
class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color.fromARGB(255, 92, 60, 44);
    Path path = Path()
      ..relativeLineTo(100, 150)
      ..quadraticBezierTo(size.width / 2, 250.0, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CurveImage extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 30);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


class CustomVerificationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      child: CustomPaint(
        painter: CardShapePainter(),
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.receipt,
                size: 30,
                color: Colors.red[300],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "État de vérification du blot #0001",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Blot délivré le 06/10/2024 à 16h00",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFFF0F0F0)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..lineTo(0, size.height - 40)
      ..quadraticBezierTo(
        size.width * 0.25,
        0,
        size.width * 0.5,
        size.height * 0.05,
      )
      ..quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.1,
        size.width,
        size.height * 0.2,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(140.889, 20.4599);
    path_0.cubicTo(132.849, 10.3144, 128.83, 5.24165, 127.237, 3.96518);
    path_0.cubicTo(123.925, 1.31202, 124.114, 1.40314, 119.978, 0.455788);
    path_0.cubicTo(117.988, 0, 114.946, 0, 108.862, 0);
    path_0.lineTo(40.6239, 0);
    path_0.cubicTo(28.005, 0, 21.6955, 0, 16.7185, 2.06154);
    path_0.cubicTo(10.0825, 4.81026, 4.81026, 10.0825, 2.06154, 16.7185);
    path_0.cubicTo(0, 21.6955, 0, 28.005, 0, 40.6238);
    path_0.lineTo(0, 407.376);
    path_0.cubicTo(0, 419.995, 0, 426.304, 2.06154, 431.281);
    path_0.cubicTo(4.81026, 437.917, 10.0825, 443.19, 16.7185, 445.938);
    path_0.cubicTo(21.6955, 448, 28.005, 448, 40.6239, 448);
    path_0.lineTo(328.376, 448);
    path_0.cubicTo(340.995, 448, 347.305, 448, 352.281, 445.938);
    path_0.cubicTo(358.917, 443.19, 364.19, 437.917, 366.938, 431.281);
    path_0.cubicTo(369, 426.304, 369, 419.995, 369, 407.376);
    path_0.lineTo(369, 40.6239);
    path_0.cubicTo(369, 28.005, 369, 21.6955, 366.938, 16.7185);
    path_0.cubicTo(364.19, 10.0825, 358.917, 4.81026, 352.281, 2.06154);
    path_0.cubicTo(347.305, 0, 340.995, 0, 328.376, 0);
    path_0.lineTo(260.138, 0);
    path_0.cubicTo(254.054, 0, 251.012, 0, 249.022, 0.455788);
    path_0.cubicTo(244.886, 1.40314, 245.074, 1.31202, 241.763, 3.96518);
    path_0.cubicTo(240.17, 5.24165, 236.15, 10.3144, 228.111, 20.4599);
    path_0.cubicTo(218.387, 32.731, 202.477, 40.7274, 184.5, 40.7274);
    path_0.cubicTo(166.523, 40.7274, 150.613, 32.731, 140.889, 20.4599);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
