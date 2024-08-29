import 'package:app/blocs/service/bloc/service_bloc.dart';
import 'package:app/controller/interfaces/prestataire.dart';
import 'package:app/controller/interfaces/services.dart';
import 'package:app/screens/part_customer/description_service/description_service_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/part_customer/home_screens/components/card_service_prestataire.dart';
import 'package:app/screens/part_customer/home_screens/components/home_screen.dart';
import 'package:app/screens/part_customer/home_screens/components/hublo_text_widget.dart';
import 'package:app/screens/part_customer/home_screens/components/notification_box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configuration.dart';
import '../../../../controller/service.dart';
import '../../../../model/service.model.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.searchWord});
  final String searchWord;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  HublotProviderApiApi apiPrestataire = HublotProviderApiApi();
  List<Service> initialList = [];
  List<Service> filterList = [];
  List<String> categorieFilterList = [];
  TextEditingController _controler = TextEditingController();
  void updateList(String value) {
    // setState(() {
    //   filterList =
    //       initialList.where((element) => element.containsValue(value)).toList();
    // });
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
    // initialList = apiPrestataire.getAllServices();
    // filterList = List.from(initialList);
    _controler.text = widget.searchWord;
    updateList(widget.searchWord);
    // categorieFilterList = apiPrestataire.getAllFilterSearch();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20).r,
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
              height: 50.r,
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
            BlocBuilder<ServiceBloc, ServiceState>(
              builder: (context, state) {
                if (state is ServiceFetchingAllLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ServiceFectchedAllState) {
                  final list = state.services;
                  if (list.isEmpty) {
                    return Center(
                        child: textPresentation(
                            msg: 'Aucun resultat disponible',
                            fontWeight: FontWeight.w600,
                            size: 20));
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DescriptionService(),
                                    settings: RouteSettings(
                                        arguments: list[index].id)));
                          },
                          child: CardServicePrestataire(
                              serviceData: Services(
                                  img: list[index].mainImageRef,
                                  name: list[index].provider,
                                  profession: list[index].name,
                                  note: '4.3',
                                  lieu: list[index].provider,
                                  distance: list[index].name,
                                  like: true,
                                  favorite: false,
                                  prestataire: Prestataire(
                                      name: list[index].provider,
                                      firstname: list[index].name))),
                        );
                      },
                    ),
                  );
                }
                if (state is ErrorServiceFetchingAllState) {
                  return const Center(child: Text('failed to fetch posts'));
                }
                return const SizedBox.shrink();
              },
            ),
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
