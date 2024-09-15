import 'package:app/blocs/service/bloc/service_bloc.dart';
import 'package:app/configuration.dart';
import 'package:app/controller/interfaces/prestataire.dart';
import 'package:app/controller/interfaces/services.dart';
import 'package:app/model/service.model.dart';
import 'package:app/screens/part_customer/description_service/description_service_screen.dart';
import 'package:app/screens/part_customer/home_screens/components/card_service_prestataire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final ScrollController _scrollController = ScrollController();
  List<ServiceProvider> _items = []; // Liste pour stocker les éléments
  int page = 1;
  int limit = 3;
  bool isLoading = false;
  bool hasMore = true;
  //receive args

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        fetchMoreItems();
      }
    });
  }

  Future<void> fetchMoreItems() async {
    if (isLoading) return;
    isLoading = true;
    page += 1;
    BlocProvider.of<ServiceBloc>(context)
        .add(FetchProviderServicesEvent(page: page, perPage: limit));
    //await _fetchItems();
  }

  TextEditingController _controler = TextEditingController();
  void clearController() {
    setState(() {
      _controler.text = "";
      _controler = TextEditingController();
      //  updateList(_controler.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    //mediaquery of size
    final size = MediaQuery.of(context).size;
    final isSponsorised = ModalRoute.of(context)!.settings.arguments as bool;

    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const EspaceMenuWidget(),
              const EspaceMenuWidget(),
              SizedBox(
                width: size.width,
                child: textPresentation(
                    size: 20,
                    msg: 'Liste des prestataires recommandes',
                    fontWeight: FontWeight.w500),
              ),
              const EspaceMenuWidget(),
              SizedBox(
                height: 50.r,
                child: TextField(
                  controller: _controler,
                  //  onSubmitted: (value) => updateList(value),
                  //onChanged: (value) => updateList(value),
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
              const EspaceMenuWidget(taille: 50),
              BlocBuilder<ServiceBloc, ServiceState>(
                builder: (context, state) {
                  if (state is ServiceProviderState) {
                    int item_lenght = 0;
                    for (var i = 0; i < state.provider.length; i++) {
                      if (state.provider[i].isSponsored == isSponsorised) {
                        _items.add(state.provider[i]);
                        item_lenght++;
                      }
                    }
                    // _items.addAll(state.provider);
              
                    if (item_lenght < limit) {
                      hasMore = false;
                    }
                    isLoading = false;
                    // return ShimmerLoading(
                    //   isLoading: isLoading,
                    //   child: SizedBox(
                    //     height: (400),
                    //     child: ListView.builder(
                    //       itemCount: (_items.length),
                    //       itemBuilder: (context, index) {
                    //         if (_items.isNotEmpty &&
                    //             index < _items.length &&
                    //             _items[index].isSponsored == false) {
                    //           return GestureDetector(
                    //             onTap: () {
                    //               print(index);
                    //               Navigator.push(
                    //                   context,
                    //                   MaterialPageRoute(
                    //                       builder: (context) {
                    //                         return const DescriptionService();
                    //                       },
                    //                       settings: RouteSettings(
                    //                           arguments:
                    //                               _items[index].serviceName.id)));
                    //             },
                    //             child: CardServicePrestataire(
                    //                 serviceData: Services(
                    //                     name: _items[index].fullname,
                    //                     profession: _items[index].serviceName.name,
                    //                     img: _items[index].profileRef,
                    //                     note: _items[index].avgRating.toString(),
                    //                     distance: _items[index].address,
                    //                     lieu: _items[index].address,
                    //                     like: true,
                    //                     favorite: false,
                    //                     prestataire: Prestataire(
                    //                       name: _items[index].fullname,
                    //                       firstname: '',
                    //                     ))),
                    //           );
                    //         }
                    //         return null;
                    //       },
                    //     ),
                    //   ),
                    // );
                  }
                  if (state is ServiceProviderLoading) {
                    isLoading = true;
                  }
                  if (state is ErrorServiceFetchingAllState) {
                    isLoading = false;
                    return Center(
                        child: textPresentation(
                            msg: "Une erreur a eu lieu",
                            fontWeight: FontWeight.w500));
                  }
                  return
                      // isLoading
                      //     ? Skelton(
                      //         width: 353,
                      //         height: 300,
                      //       )

                      // Expanded(
                      //     child: ListView.separated(
                      //         itemBuilder: (context, index) => Skelton(
                      //               width: 353,
                      //               height: 300,
                      //             ),
                      //         separatorBuilder: (context, index) =>
                      //             SizedBox(height: 12),
                      //         itemCount: 4),
                      //   )
                      // :
                      SizedBox(
                    height: (400),
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: (_items.length + 1),
                      itemBuilder: (context, index) {
                        if (index < _items.length) {
                          if (_items.isNotEmpty &&
                              _items[index].isSponsored == isSponsorised) {
                            return GestureDetector(
                              onTap: () {
                                
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
                                      isSponsorite: _items[index].isSponsored,
                                      profession:
                                          _items[index].serviceName.name,
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
                          } else {
                            return const Center(
                                child: Text("Pas de prestataire"));
                          }
                        } else {
                          return Padding(
                              padding: EdgeInsets.symmetric(vertical: 32),
                              child: Center(
                                child: hasMore
                                    ? CircularProgressIndicator()
                                    : SizedBox.shrink(),
                              ));
                        }
                      },
                    ),
                  );
                  // return const Center(
                  //     child: Row(
                  //   children: [
                  //     Text("Commande en cours de chargement"),
                  //     CircularProgressIndicator(),
                  //   ],
                  // ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
