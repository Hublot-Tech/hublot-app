import 'package:flutter/material.dart';
import 'package:flutterbase/configuration.dart';
import 'package:flutterbase/screens/Part_Customer/answerScreen/answer_screen.dart';
import 'package:flutterbase/screens/Part_Customer/homeScreens/components/home_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _controler = TextEditingController();
  List<Map<String, String>> initialList = [
    {
      "img": "img/image 1.png",
      "name": "Gishlain Kamga ",
      "profession": "Photographe",
      "note": "4.6",
      "lieu": "Douala,akwa",
      "Distance": "3Km",
    },
    {
      "img": "img/portrait-stylish-professional-photographer.jpg",
      "name": "Grec Koum ",
      "profession": "Photographe",
      "note": "4.6",
      "lieu": "Douala,akwa",
      "Distance": "8Km",
    },
    {
      "img": "img/IMG_3531.JPG",
      "name": "Pessidjo Germann ",
      "profession": "Dev Fullstack",
      "note": "4.6",
      "lieu": "Douala,pk21",
      "Distance": "8Km",
    },
  ];
  List<Map<String, String>> filterList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filterList = List.from(initialList);
  }

  void updateList(String value) {
    setState(() {
      filterList =
          initialList.where((element) => element.containsValue(value)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, HomeScrenns.routeName);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new)),
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.only(right: 20),
                    child: TextField(
                      controller: _controler,
                      onSubmitted: (value) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) => AnswerScreen(
                                    searchWord: _controler.text,
                                  )),
                          ModalRoute.withName(AnswerScreen.routeName),
                        );
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 16),
                        suffixIcon: Container(
                          height: 20,
                          width: 50,
                          margin: const EdgeInsets.only(
                              bottom: 4, top: 4, right: 4),
                          decoration: BoxDecoration(
                            color: ksecondaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 18, left: 4),
                            child: IconButton(
                              icon: const Padding(
                                padding: EdgeInsets.only(bottom: 180),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        hintText: "Que recherchez vous?",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //
          ],
        ),
      ),
    );
  }
}
