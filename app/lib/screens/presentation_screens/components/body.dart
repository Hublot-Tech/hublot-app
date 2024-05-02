import 'package:app/controller/service.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:app/configuration.dart';

import 'package:app/screens/part_customer/home_screens/components/home_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentIndex = 0;
  HublotProviderApiApi hublotProviderApi = HublotProviderApiApi();
  List<Map<String, String>> splahDatas = [];

  @override
  void initState() {
    super.initState();
    splahDatas = hublotProviderApi.getSplashData();
    debugPrint(splahDatas.length.toString());
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
                  padding: const EdgeInsets.all(3),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      splahDatas[index]['img']!,
                      fit: BoxFit.cover,
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
                      size: getProportionateScreenWidth(20),
                      fontWeight: FontWeight.bold),
                  const SizedBox(height: 10),
                  textPresentation(
                      msg: splahDatas[currentIndex]['mig']!,
                      size: getProportionateScreenWidth(14),
                      fontWeight: FontWeight.w300),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(20)),
            //boutton de Decouvrir
            GestureDetector(
              onTap: currentIndex == 2
                  ? () {
                      Navigator.pushNamed(context, HomeScrenns.routeName);
                    }
                  : () {},
              child: Container(
                width: getProportionateScreenWidth(340),
                height: getProportionateScreenHeight(60),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: currentIndex == 2 ? kprimaryColor : ksecondaryColor,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Découvrir",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(20),
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 3, top: 9),
                        width: getProportionateScreenWidth(5),
                        height: getProportionateScreenHeight(5),
                        decoration: const BoxDecoration(color: kyellowColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(20)),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 2),
      margin: const EdgeInsets.all(4),
      height: getProportionateScreenHeight(15),
      width: getProportionateScreenWidth(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: currentIndex == index ? kprimaryColor : ksecondaryColor,
      ),
    );
  }
}
