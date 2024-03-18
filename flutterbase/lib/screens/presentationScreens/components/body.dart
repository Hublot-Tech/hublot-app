import 'package:flutter/material.dart';
import 'package:flutterbase/configuration.dart';
import 'package:flutterbase/controller/Service.dart';
import 'package:flutterbase/screens/Part_Customer/homeScreens/components/home_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentIndex = 0;
  ApiPrestataire apiPrestataire = ApiPrestataire();
  List<Map<String, String>> splahDatas = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splahDatas = apiPrestataire.getSplashData();
  }

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
                itemCount: splahDatas.length,
                itemBuilder: (context, index) => Container(
                  width: 400,
                  height: 581,
                  padding: const EdgeInsets.all(3),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      splahDatas[index]['img']!,
                      //fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  splahDatas.length, (index) => buildot(index: index)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, left: 25),
              child: Column(
                children: [
                  textPresentation(
                      msg: splahDatas[currentIndex]['text']!,
                      size: 26,
                      fontWeight: FontWeight.bold),
                  const SizedBox(height: 30),
                  textPresentation(
                      msg: splahDatas[currentIndex]['mig']!,
                      size: 14,
                      fontWeight: FontWeight.w300),
                ],
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: currentIndex == 2
                  ? () {
                      Navigator.pushNamed(context, HomeScrenns.routeName);
                    }
                  : () {},
              child: Container(
                width: 390,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: currentIndex == 2 ? kprimaryColor : ksecondaryColor,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Découvrir",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3, top: 9),
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(color: kyellowColor),
                      ),
                    ],
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
