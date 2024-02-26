import 'package:flutter/material.dart';
import 'package:flutterbase/configuration.dart';

class Body extends StatefulWidget {
  const Body({super.key});
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentIndex = 0;
  List<Map<String, String>> spash_data = [
    {
      "img": "img/presentation1.png",
      "text": "Vous êtes passionné(e) et souhaitez vivre de cette passion ?",
      "mig":
          "Plomberie, Electricité, Vitrerie, Chaudronnerie, Seignerie; etc ... ils ont la solution à tous vous besoins "
    },
    {
      "img": "img/presentation2.png",
      "text":
          "Tous les micro-services dont vous avez besoin à portée de main !",
      "mig":
          "Plomberie, Electricité, Vitrerie, Chaudronnerie, Seignerie; etc ... tout les metiers sont permis."
    },
    {
      "img": "img/presentation3.png",
      "text": "Des échanges constructifs avec des Travailleurs compétents.",
      "mig":
          "Plomberie, Electricité, Vitrerie, Chaudronnerie, Seignerie; etc ... ils ont la solution à tous vous besoins "
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemCount: spash_data.length,
                itemBuilder: (context, index) => Image.asset(
                  spash_data[index]['img']!,
                  //fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  spash_data.length, (index) => buildot(index: index)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, left: 25),
              child: Column(
                children: [
                  textPresentation(
                      mesg: spash_data[currentIndex]['text']!,
                      size: 23,
                      fontWeight: FontWeight.bold),
                  const SizedBox(height: 30),
                  textPresentation(
                      mesg: spash_data[currentIndex]['mig']!,
                      size: 14,
                      fontWeight: FontWeight.w300),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: 390,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: currentIndex == 2 ? kprimaryColor : ksecondaryColor,
              ),
              child: const Center(
                child: Text(
                  "Découvrir",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Text textPresentation(
      {required String mesg,
      double size = 30,
      required FontWeight fontWeight}) {
    return Text(
      mesg,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: fontWeight,
        color: kprimaryColor,
        fontSize: size,
      ),
    );
  }

  AnimatedContainer buildot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 2),
      margin: const EdgeInsets.all(4),
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: currentIndex == index ? kprimaryColor : ksecondaryColor,
      ),
    );
  }
}
 

