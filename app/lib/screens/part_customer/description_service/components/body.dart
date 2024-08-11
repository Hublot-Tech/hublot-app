import 'package:app/screens/components/shimer_loading.dart';
import 'package:app/screens/components/shimmer.dart';
import 'package:app/screens/part_customer/description_service/components/custom_widget.dart';
import 'package:app/screens/part_customer/description_service/components/offre_base_box.dart';
import 'package:app/screens/part_customer/description_service/components/row_recommended_provider.dart';
import 'package:app/screens/part_customer/home_screens/components/home_screen.dart';
import 'package:app/screens/part_customer/home_screens/components/hublo_text_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/blocs/service/bloc/service_bloc.dart';
import 'package:app/configuration.dart';
import 'package:app/controller/service.dart';
import 'package:app/model/offer_model.dart';
import 'package:app/model/service.model.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';

import 'box_change.dart';
import 'box_presentation_information_provider.dart';
import 'rating_box.dart';
import 'row_verified_provider.dart';
import 'show_box_discussion.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String id = '';

  HublotProviderApiApi hublotProviderApiApi = HublotProviderApiApi();
  List<Map<String, String>> offerList = [];
  List<Map<String, String>> offerStandartList = [];
  ServiceDetails service = ServiceDetails.isEmpy();

  @override
  Widget build(BuildContext context) {
    id = ModalRoute.of(context)!.settings.arguments as String;
    //  BlocProvider.of<ServiceBloc>(context).add((FetchServiceByIdEvent(id)));
    BlocProvider.of<ServiceBloc>(context)
        .add((FetchServiceOffersByIdEvent(id)));
    bool isLoading = true;
    List<OfferDetails> offer = [];
    const shimmerGradient = LinearGradient(
      colors: [
        Color(0xFFEBEBF4),
        Color(0xFFF4F4F4),
        Color(0xFFEBEBF4),
      ],
      stops: [
        0.1,
        0.3,
        0.4,
      ],
      begin: Alignment(-1.0, -0.3),
      end: Alignment(1.0, 0.3),
      tileMode: TileMode.clamp,
    );
    return SafeArea(
      child: BlocBuilder<ServiceBloc, ServiceState>(
        builder: (context, state) {
          if (state is ServiceFetchingByIdLoading) {
            isLoading = !isLoading;
          }
          if (state is ServiceFetchedByIdState) {
            isLoading = !isLoading;
            print(id);
            service = state.service;
          }
          if (state is ServiceOffersByIdState) {
            debugPrint(state.service.length.toString());
            // isLoading = !isLoading;
            offer = state.service;
          }

          return Shimmer(
            linearGradient: shimmerGradient,
            child: SingleChildScrollView(
              physics: isLoading ? const NeverScrollableScrollPhysics() : null,
              child: Column(
                children: [
                  const HublotTextWigdet(),
                  const EspaceMenuWidget(),

                  ShimmerLoading(
                    isLoading: isLoading,
                    child: ClipPath(
                      clipper: TCustomWidget(),
                      child: Container(
                        padding: const EdgeInsets.all(0),
                        child: ImageBox(
                          imgUrl: service.mainImageRef!,
                        ),
                      ),
                    ),
                  ),
                  ShimmerLoading(
                    isLoading: isLoading,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: getProportionateScreenWidth(20),
                          right: getProportionateScreenWidth(20),
                          bottom: getProportionateScreenWidth(20)),
                      child: Row(
                        children: [
                          RowVerifieProvider(
                              imgPath: "img/icons8_instagram_check_mark 3.svg",
                              text: service.provider.verificationStatus! ==
                                      "verified"
                                  ? "Vérifié"
                                  : "Pas Vérifié"),
                          const RowRecommandedProvider(
                              imgPath: "img/icons8_thumbs_up_1 1 (1).svg",
                              text: "Non recommandé"),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: getProportionateScreenWidth(20)),
                    child: ShimmerLoading(
                      isLoading: isLoading,
                      child: BoxPresentationInformation(
                        name: service.provider.fullname,
                        profession: 'Photographe',
                        distance: '3km',
                        lieu: 'Douala ,Akwa',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: getProportionateScreenWidth(6), left: 20),
                    child: ShimmerLoading(
                        isLoading: isLoading,
                        child: const RatingVotingBox(rating: 0, vote: 0)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: getProportionateScreenHeight(20),
                        top: getProportionateScreenWidth(0)),
                    child: ShimmerLoading(
                      isLoading: isLoading,
                      child: Row(
                        children: [
                          const RatingBox(
                              imgPath: "img/icons8_thumbs_up_1 1.svg",
                              rate: 0,
                              color: kgreenColor),
                          const SizedBox(width: 30),
                          const RatingBox(
                              //negative
                              imgPath: "img/icons8_thumbs_down 1.svg",
                              rate: 0,
                              color: kredColor),
                          Padding(
                            padding: EdgeInsets.only(
                                left: getProportionateScreenWidth(75),
                                bottom: getProportionateScreenWidth(10)),
                            child: Row(
                              children: [
                                const ShadowBoxDiscussion(
                                  imgPath: 'img/icons8_discussion_forum 1.svg',
                                  nbre: 0,
                                ),
                                SizedBox(
                                    width: getProportionateScreenWidth(15)),
                                const ShadowBoxDiscussion(
                                  imgPath: 'img/icons8_handshake 1.svg',
                                  nbre: 0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const EspaceMenuWidget(),
                  ShimmerLoading(
                    isLoading: isLoading,
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: getProportionateScreenWidth(20)),
                        child: const TitleBox(
                            number: 1, titre: "Description des services")),
                  ),
                  ShimmerLoading(
                    isLoading: isLoading,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: getProportionateScreenWidth(20),
                          right: getProportionateScreenWidth(20),
                          top: getProportionateScreenWidth(05)),
                      child: textPresentation(
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.justify,
                          msg: service.description,
                          fontWeight: FontWeight.w400,
                          size: 18.25),
                    ),
                  ),
                  const EspaceMenuWidget(),
                  ShimmerLoading(
                    isLoading: isLoading,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: getProportionateScreenWidth(20)),
                      child: const TitleBox(
                          number: 2, titre: "Offres et services disponible :"),
                    ),
                  ),
                  const EspaceMenuWidget(taille: 10),
                  ShimmerLoading(
                    isLoading: isLoading,
                    child: BoxBasicPrimaryColor(
                      title: "Offre de base",
                      method: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) {
                                  return const HomeScrenns();
                                },
                                settings: RouteSettings(
                                  arguments: id,
                                )));
                      },
                    ),
                  ),
                  // ...List.generate(
                  //     offerList.length,
                  //     (index) => OffreBaseBox(
                  //         name: offerList[index]['name']!,
                  //         nbre: offerList[index]['nbre']!)),
                  ShimmerLoading(
                    isLoading: isLoading,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: (offer.length),
                        itemBuilder: (context, index) {
                          if (index < offer.length) {
                            return OffreBaseBox(
                                name: offer[index].name,
                                nbre: offer[index].price.toString());
                          }
                          return null;
                        }),
                  ),
                  const EspaceMenuWidget(),
                  ShimmerLoading(
                    isLoading: isLoading,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                textPresentation(
                                    msg: "Recommandé",
                                    fontWeight: FontWeight.bold,
                                    size: 19),
                                const Icon(Icons.keyboard_arrow_down_sharp),
                              ]),
                              textPresentation(
                                  msg: "1j de réalisation",
                                  fontWeight: FontWeight.normal,
                                  size: 11.64,
                                  color: kprimaryColor.withOpacity(0.9)),
                            ],
                          ),
                        ),
                        AddOfferButton(
                            heigt: 190,
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) {
                                        return const HomeScrenns();
                                      },
                                      settings: RouteSettings(
                                        arguments: id,
                                      )));
                            },
                            width: 34,
                            msg: "10 000 FCFA"),
                      ],
                    ),
                  ),
                  const EspaceMenuWidget(),

                  const EspaceMenuWidget(),
                  ShimmerLoading(
                    isLoading: isLoading,
                    child: BoxBasicPrimaryColor(
                      title: "Offre de Standard",
                      method: () {},
                    ),
                  ),
                  // ...List.generate(
                  //     offerStandartList.length,
                  //     (index) => OffreBaseBox(
                  //         name: offerStandartList[index]['name']!,
                  //         nbre: offerStandartList[index]['nbre']!)),
                  ShimmerLoading(
                    isLoading: isLoading,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: (offer.length),
                        itemBuilder: (context, index) {
                          if (index < offer.length) {
                            return OffreBaseBox(
                                name: offer[index].name,
                                nbre:
                                    offer[index].estimatedDuration.toString());
                          }
                          return null;
                        }),
                  ),
                  const EspaceMenuWidget(),
                  ShimmerLoading(
                    isLoading: isLoading,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: getProportionateScreenWidth(05),
                          right: getProportionateScreenWidth(20)),
                      child: AddOfferButton(
                          heigt: MediaQuery.of(context).size.height * 0.3,
                          press: () {},
                          width: 50,
                          msg: "Ajouter des options"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
    //page de service profil + status
  }
}

class AddOfferButton extends StatelessWidget {
  const AddOfferButton({
    super.key,
    required this.heigt,
    required this.width,
    required this.press,
    required this.msg,
  });
  final double heigt, width;
  final GestureCancelCallback press;
  final String msg;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: getProportionateScreenWidth(15)),
            decoration: const BoxDecoration(
              color: kyellowColor,
            ),
            child: Center(
              child: textPresentation(
                  msg: msg, fontWeight: FontWeight.bold, size: 14),
            ),
          ),
          Container(
              padding: EdgeInsets.all(10),
              color: kprimaryColor,
              child: textPresentation(
                msg: "Commander",
                fontWeight: FontWeight.bold,
                size: 14,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}

class BoxBasicPrimaryColor extends StatelessWidget {
  const BoxBasicPrimaryColor({
    super.key,
    required this.title,
    required this.method,
  });

  final String title;
  final GestureCancelCallback method;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: getProportionateScreenWidth(20),
          right: getProportionateScreenWidth(20)),
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(10),
          right: getProportionateScreenWidth(10)),
      width: getProportionateScreenWidth(390),
      height: getProportionateScreenHeight(50),
      decoration: const BoxDecoration(
        color: kprimaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textPresentation(
              msg: title,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              size: 18.64),
          BoxChange(press: method),
        ],
      ),
    );
  }
}

class TitleBox extends StatelessWidget {
  const TitleBox({
    super.key,
    required this.number,
    required this.titre,
  });
  final int number;
  final String titre;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        textPresentation(
            msg: "$number-",
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
            size: 18.64),
        textPresentation(
            msg: titre,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
            size: 18.64),
      ],
    );
  }
}
