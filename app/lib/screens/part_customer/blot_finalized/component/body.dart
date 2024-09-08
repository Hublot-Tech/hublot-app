import 'package:app/configuration.dart';
import 'package:app/screens/default_screen.dart';
import 'package:app/screens/part_customer/blot_verify/component/button_order2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              EspaceMenuWidget(taille: 40),
              Center(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kFiedBgColor2),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close)),
                ),
              ),
              EspaceMenuWidget(),

              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      0.25, // 25% de la largeur de l'écran
                  // Garde un ratio carré
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: SvgPicture.asset('img/icons8_in_progress 1.svg'),
                ),
              ),
              // EspaceMenuWidget(taille: 20),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13.5),
                      child: CustomPaint(
                        size: Size(400, 900),
                        painter: RPSCustomPainter(),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Column(
                      children: [
                        EspaceMenuWidget(taille: 30),
                        textPresentation(
                            msg:
                                "Félicitations !!!\n Vous avez validé votre blot",
                            fontWeight: FontWeight.w600,
                            maxLine: 2,
                            size: 21),
                        SizedBox(height: 1),
                        textPresentation(
                            msg: "06/10/2024 à 16h00",
                            fontWeight: FontWeight.w200,
                            size: 14),
                        SizedBox(height: 1),
                        Padding(
                          padding: const EdgeInsets.only(left: 80),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  //width and height to 57 with Mediaquery.of(context).size
                                  width: size.width * 0.2,
                                  height: size.height * 0.08,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: kyellowColor),
                                      image: const DecorationImage(
                                          image: AssetImage('img/backona.png'),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                flex: 7,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textPresentation(
                                        msg: 'Pessidjo Germann',
                                        fontWeight: FontWeight.bold,
                                        size: 19),
                                    Text(
                                      'Photographe',
                                      style: const TextStyle(
                                        color: kprimaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Josefin Sans',
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // EspaceMenuWidget(taille: 10),
                        RatingStars(onRatingChanged: (rating) {}),
                        EspaceMenuWidget(taille: 2),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            maxLines: 4,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Laisser un commentaire',
                              hintStyle: TextStyle(
                                color: kprimaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Josefin Sans',
                              ),
                            ),
                          ),
                        ),
                        EspaceMenuWidget(taille: 6),
                        ButtonOrder2(
                            text: 'Envoyer',
                            carre: 'img/Rectangle 12.png',
                            img: 'img/icons8_transaction_declined 1.png',
                            color1: kprimaryColor,
                            color2: kColorWhite,
                            color3: kColorWhite,
                            onTap: () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3719814, size.height * 0.03054120);
    path_0.cubicTo(
        size.width * 0.3574828,
        size.height * 0.01699668,
        size.width * 0.3502334,
        size.height * 0.01022445,
        size.width * 0.3458594,
        size.height * 0.007747076);
    path_0.cubicTo(
        size.width * 0.3381618,
        size.height * 0.003387691,
        size.width * 0.3354244,
        size.height * 0.002473023,
        size.width * 0.3253554,
        size.height * 0.0008961312);
    path_0.cubicTo(size.width * 0.3196340, 0, size.width * 0.3115332, 0,
        size.width * 0.2953263, 0);
    path_0.lineTo(size.width * 0.1183658, 0);
    path_0.cubicTo(size.width * 0.08489390, 0, size.width * 0.06815782, 0,
        size.width * 0.05495623, size.height * 0.003424485);
    path_0.cubicTo(
        size.width * 0.03735411,
        size.height * 0.007990465,
        size.width * 0.02336939,
        size.height * 0.01674834,
        size.width * 0.01607836,
        size.height * 0.02777159);
    path_0.cubicTo(
        size.width * 0.01061008,
        size.height * 0.03603904,
        size.width * 0.01061008,
        size.height * 0.04651993,
        size.width * 0.01061008,
        size.height * 0.06748140);
    path_0.lineTo(size.width * 0.01061008, size.height * 0.9192292);
    path_0.cubicTo(
        size.width * 0.01061008,
        size.height * 0.9401910,
        size.width * 0.01061008,
        size.height * 0.9506728,
        size.width * 0.01607836,
        size.height * 0.9589385);
    path_0.cubicTo(
        size.width * 0.02336939,
        size.height * 0.9699618,
        size.width * 0.03735411,
        size.height * 0.9787209,
        size.width * 0.05495623,
        size.height * 0.9832857);
    path_0.cubicTo(
        size.width * 0.06815782,
        size.height * 0.9867110,
        size.width * 0.08489390,
        size.height * 0.9867110,
        size.width * 0.1183658,
        size.height * 0.9867110);
    path_0.lineTo(size.width * 0.8816340, size.height * 0.9867110);
    path_0.cubicTo(
        size.width * 0.9151061,
        size.height * 0.9867110,
        size.width * 0.9318435,
        size.height * 0.9867110,
        size.width * 0.9450424,
        size.height * 0.9832857);
    path_0.cubicTo(
        size.width * 0.9626446,
        size.height * 0.9787209,
        size.width * 0.9766313,
        size.height * 0.9699618,
        size.width * 0.9839204,
        size.height * 0.9589385);
    path_0.cubicTo(
        size.width * 0.9893899,
        size.height * 0.9506728,
        size.width * 0.9893899,
        size.height * 0.9401910,
        size.width * 0.9893899,
        size.height * 0.9192292);
    path_0.lineTo(size.width * 0.9893899, size.height * 0.06748156);
    path_0.cubicTo(
        size.width * 0.9893899,
        size.height * 0.04651993,
        size.width * 0.9893899,
        size.height * 0.03603904,
        size.width * 0.9839204,
        size.height * 0.02777159);
    path_0.cubicTo(
        size.width * 0.9766313,
        size.height * 0.01674834,
        size.width * 0.9626446,
        size.height * 0.007990465,
        size.width * 0.9450424,
        size.height * 0.003424485);
    path_0.cubicTo(size.width * 0.9318435, 0, size.width * 0.9151061, 0,
        size.width * 0.8816340, 0);
    path_0.lineTo(size.width * 0.7046737, 0);
    path_0.cubicTo(size.width * 0.6884668, 0, size.width * 0.6803660, 0,
        size.width * 0.6746446, size.height * 0.0008961312);
    path_0.cubicTo(
        size.width * 0.6645756,
        size.height * 0.002473023,
        size.width * 0.6618382,
        size.height * 0.003387691,
        size.width * 0.6541406,
        size.height * 0.007747060);
    path_0.cubicTo(
        size.width * 0.6497666,
        size.height * 0.01022445,
        size.width * 0.6425172,
        size.height * 0.01699668,
        size.width * 0.6280186,
        size.height * 0.03054120);
    path_0.cubicTo(
        size.width * 0.5993528,
        size.height * 0.05732259,
        size.width * 0.5526923,
        size.height * 0.07475066,
        size.width * 0.5000000,
        size.height * 0.07475066);
    path_0.cubicTo(
        size.width * 0.4473077,
        size.height * 0.07475066,
        size.width * 0.4006472,
        size.height * 0.05732259,
        size.width * 0.3719814,
        size.height * 0.03054120);
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

class RatingStars extends StatefulWidget {
  final Function(int) onRatingChanged;

  const RatingStars({Key? key, required this.onRatingChanged})
      : super(key: key);

  @override
  _RatingStarsState createState() => _RatingStarsState();
}

class _RatingStarsState extends State<RatingStars> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            size: 48,
            index < _rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
          onPressed: () {
            setState(() {
              _rating = index + 1;
            });
            widget.onRatingChanged(_rating);
          },
        );
      }),
    );
  }
}
