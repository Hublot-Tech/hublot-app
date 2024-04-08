import 'package:app/configuration.dart';
import 'package:app/controller/service.dart';
import 'package:app/screens/authentification/registration_screen/component/button_custom.dart';
import 'package:app/screens/part_customer/language_screen/components/hublo_version.dart';
import 'package:flutter/material.dart';

import '../../home_screens/components/home_screen.dart';
import 'navigation_row.dart';
import 'row_city.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _controller = TextEditingController();
  HublotProviderApiApi hublotProviderApiApi = HublotProviderApiApi();
  List<String> initialList = [];
  List<String> finalList = [];

  void updateList(String search) {
    setState(() {
      finalList =
          initialList.where((element) => element.contains(search)).toList();
    });
  }

  void clearController() {
    setState(() {
      _controller.text = "";
      updateList(_controller.text);
    });
  }

  @override
  void initState() {
    super.initState();
    initialList = hublotProviderApiApi.getAllCity();
    finalList = List.from(initialList);
    updateList(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              const EspaceMenuWidget(taille: 40),
              NavigationRow(
                press: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, HomeScrenns.routeName, (route) => false);
                },
                name: 'Choix de votre ville',
              ),
              const EspaceMenuWidget(),
              Container(
                width: 397,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) => updateList(value),
                  onChanged: (value) => updateList(value),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.search)),
                    ),
                    suffixIcon: IconButton(
                        onPressed: clearController,
                        icon: const Icon(Icons.cancel_rounded)),
                    contentPadding: const EdgeInsets.only(left: 70, right: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(37)),
                  ),
                ),
              ),
              const EspaceMenuWidget(),
              Column(
                children: List.generate(
                    finalList.length,
                    (index) => RowCity(
                          cityName: finalList[index],
                          textEditingController: _controller,
                        )),
              ),
              const EspaceMenuWidget(),
              ButtomCustom(
                press: () {},
                msg: 'Confirmer',
                color: kprimaryColor,
              ),
              const EspaceMenuWidget(taille: 40),
              const VersionHublo(),
            ],
          ),
        ),
      ),
    );
  }
}
