import 'package:app/configuration.dart';
import 'package:app/controller/enumeration/locale.dart';
import 'package:app/screens/authentification/registration_screen/component/button_custom.dart';
import 'package:app/screens/part_customer/home_screens/components/home_screen.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  Body({super.key, this.isFrench = true});
  late bool isFrench;
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    LocalLanguage language = LocalLanguage.fr;

    return SafeArea(
      child: Column(
        children: [
          EspaceMenuWidget(taille: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 20),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomeScrenns.routeName, (route) => false);
                  },
                  icon: Icon(Icons.arrow_back_ios_sharp)),
              SizedBox(width: 40),
              textPresentation(
                msg: "Choix de votre langue",
                fontWeight: FontWeight.bold,
                size: 24,
              ),
              Spacer(),
            ],
          ),
          EspaceMenuWidget(taille: 40),
          Row(
            //Français
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.isFrench = true;
                    debugPrint(widget.isFrench.toString());
                  });
                },
                child: Container(
                  width: 127,
                  height: 44,
                  decoration: BoxDecoration(
                    color: widget.isFrench
                        ? Color.fromRGBO(255, 192, 0, 1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("img/french.png"),
                      SizedBox(width: 6),
                      textPresentation(
                          msg: "Français",
                          fontWeight: FontWeight.normal,
                          size: 18.36),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.isFrench = false;
                    debugPrint(widget.isFrench.toString());
                  });
                },
                child: Container(
                  width: 127,
                  height: 44,
                  decoration: BoxDecoration(
                    color: widget.isFrench
                        ? Colors.transparent
                        : Color.fromRGBO(255, 192, 0, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("img/english.png"),
                      SizedBox(width: 6),
                      textPresentation(
                          msg: "Anglais",
                          fontWeight: FontWeight.normal,
                          size: 18.36),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 100),
          ButtomCustom(press: () {}, msg: "Confirmer"),
          const SizedBox(height: 100),
          textPresentation(
            msg: "Version 1.1",
            fontWeight: FontWeight.w300,
            size: 13,
          ),
        ],
      ),
    );
  }
}
