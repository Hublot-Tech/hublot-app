import 'package:flutter/material.dart';
import 'package:app/screens/part_customer/home_screens/components/card_service_prestataire.dart';
import 'package:app/screens/part_customer/home_screens/components/home_screen.dart';
import 'package:app/screens/part_customer/home_screens/components/hublo_text_widget.dart';
import 'package:app/screens/part_customer/home_screens/components/notification_box.dart';

import '../../../../configuration.dart';
import '../../../../controller/service.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.searchWord});
  final String searchWord;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  HublotProviderApiApi apiPrestataire = HublotProviderApiApi();
  List<Map<String, String>> initialList = [];
  List<Map<String, String>> filterList = [];
  List<String> categorieFilterList = [];
  TextEditingController _controler = TextEditingController();
  void updateList(String value) {
    setState(() {
      filterList =
          initialList.where((element) => element.containsValue(value)).toList();
    });
  }

  void clearController() {
    setState(() {
      _controler.text = "";
      _controler = TextEditingController();
      updateList(_controler.text);
    });
  }

  @override
  void initState() {
    super.initState();
    initialList = apiPrestataire.getAllServices();
    filterList = List.from(initialList);
    _controler.text = widget.searchWord;
    updateList(widget.searchWord);
    categorieFilterList = apiPrestataire.getAllFilterSearch();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            const EspaceMenuWidget(),
            const HublotTextWigdet(),
            const EspaceMenuWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, HomeScrenns.routeName);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new)),
                const NotificationBox(),
              ],
            ),
            const EspaceMenuWidget(),
            SizedBox(
              height: 50,
              child: TextField(
                controller: _controler,
                onSubmitted: (value) => updateList(value),
                onChanged: (value) => updateList(value),
                decoration: InputDecoration(
                  hintText: _controler.text,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                      onPressed: clearController,
                      icon: const Icon(Icons.cancel_rounded)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
            const EspaceMenuWidget(),
            Row(
              children: [
                textPresentation(
                    msg: "Filtres", fontWeight: FontWeight.bold, size: 20),
              ],
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    categorieFilterList.length,
                    (index) => Container(
                          padding: const EdgeInsets.only(
                            top: 6,
                            right: 20,
                            left: 20,
                          ),
                          margin: const EdgeInsets.only(right: 10),
                          //  width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(100, 100, 100, 0.15),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: textPresentation(
                              msg: categorieFilterList[index],
                              fontWeight: FontWeight.bold,
                              size: 20),
                        )),
              ),
            ),
            const EspaceMenuWidget(),
            filterList.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: filterList.length,
                      itemBuilder: ((context, index) => CardServicePrestataire(
                            distance: filterList[index]['Distance']!,
                            img: filterList[index]['img']!,
                            localization: filterList[index]['lieu']!,
                            name: filterList[index]['name']!,
                            note: filterList[index]['note']!,
                            profession: filterList[index]['profession']!,
                          )),
                    ),
                  )
                : const Center(
                    child: Text("Aucun resultat disponible"),
                  )
          ],
        ),
      ),
    );
  }
}

class LocalizationWidget extends StatelessWidget {
  const LocalizationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textPresentation(
            msg: "Votre localisation",
            fontWeight: FontWeight.bold,
            size: 17,
            color: const Color.fromRGBO(117, 120, 132, 1),
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on_sharp,
                color: kyellowColor,
              ),
              textPresentation(
                  msg: "Douala-Bonamoussadi,Cameroun",
                  fontWeight: FontWeight.bold,
                  size: 13),
              const Icon(Icons.keyboard_arrow_down_rounded),
            ],
          ),
        ],
      ),
    );
  }
}
