import 'package:app/blocs/service/bloc/service_bloc.dart';
import 'package:app/configuration.dart';
import 'package:app/controller/interfaces/prestataire.dart';
import 'package:app/controller/interfaces/services.dart';
import 'package:app/model/service.model.dart';
import 'package:app/screens/components/shimer_loading.dart';
import 'package:app/screens/part_customer/description_service/description_service_screen.dart';
import 'package:app/screens/part_customer/home_screens/components/card_service_prestataire.dart';
import 'package:app/screens/part_customer/home_screens/components/hublo_text_widget.dart';
import 'package:app/screens/part_customer/home_screens/components/notification_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final ScrollController _scrollController = ScrollController();
  List<ServiceProvider> _items = []; // Liste pour stocker les éléments
  int page = 1;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> fetchMoreItems() async {
    if (!isLoading) {
      page += 1;
      BlocProvider.of<ServiceBloc>(context)
          .add(FetchProviderServicesEvent(page: page));
      //await _fetchItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchMoreItems();
      }
    });
    return SafeArea(
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
                    //Navigator.pushNamed(context, HomeScrenns.routeName);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new)),
              const NotificationBox(),
            ],
          ),
          const EspaceMenuWidget(),
          BlocBuilder<ServiceBloc, ServiceState>(
            builder: (context, state) {
              if (state is ServiceProviderState) {
                _items = state.provider;

                return ShimmerLoading(
                  isLoading: isLoading,
                  child: SizedBox(
                    height: (400),
                    child: ListView.builder(
                      itemCount: (_items.length),
                      itemBuilder: (context, index) {
                        if (_items.isNotEmpty &&
                            index < _items.length &&
                            _items[index].isSponsored == false) {
                          return GestureDetector(
                            onTap: () {
                              print(index);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) {
                                        return const DescriptionService();
                                      },
                                      settings: RouteSettings(
                                          arguments:
                                              _items[index].serviceName.id)));
                            },
                            child: CardServicePrestataire(
                                serviceData: Services(
                                    name: _items[index].fullname,
                                    profession: _items[index].serviceName.name,
                                    img: _items[index].profileRef,
                                    note: _items[index].avgRating.toString(),
                                    distance: _items[index].address,
                                    lieu: _items[index].address,
                                    like: true,
                                    favorite: false,
                                    prestataire: Prestataire(
                                      name: _items[index].fullname,
                                      firstname: '',
                                    ))),
                          );
                        }
                        return null;
                      },
                    ),
                  ),
                );
              }
              if (state is ServiceProviderLoading) {
                isLoading = false;
                return Center(child: CircularProgressIndicator());
              }
              if (state is ErrorServiceFetchingAllState) {
                isLoading = false;
                return Center(
                    child: textPresentation(
                        msg: "Une erreur a eu lieu",
                        fontWeight: FontWeight.w500));
              }

              return const Center(
                  child: Row(
                children: [
                  Text("Commande en cours de chargement"),
                  CircularProgressIndicator(),
                ],
              ));
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
