// import 'package:app/blocs/service/bloc/service_bloc.dart';
// import 'package:app/configuration.dart';
// import 'package:app/model/offer_model.dart';
// import 'package:app/model/service.model.dart';
// import 'package:app/model/user_storage.dart';
// import 'package:app/screens/part_customer/commande_screen/commande_screen.dart';
// import 'package:app/screens/part_customer/description_service/components/body.dart';
// import 'package:app/screens/part_customer/description_service/components/offer_botton.dart';
// import 'package:app/screens/part_customer/home_screens/components/home_screen.dart';
// import 'package:app/screens/part_customer/home_screens/components/hublo_text_widget.dart';
// import 'package:app/screens/presentation_screens/components/animated_contenair.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Body extends StatelessWidget {
//   const Body({super.key});

//   @override
//   Widget build(BuildContext context) {
//     int number = 0;
//     int number2 = 0;
//     UserStorage userStorage = UserStorage();
//     ServiceDetails service = ServiceDetails.isEmpy();
//     List<OfferDetails> offer = [];
//     String nameProvider = '';
//     Map<String, String>? userData = <String, String>{};
//     CarouselSliderController buttonController = CarouselSliderController();
//     final args = ModalRoute.of(context)!.settings.arguments as String;
//     BlocProvider.of<ServiceBloc>(context)
//         .add((FetchServiceOffersByIdEvent(args)));
//     return SafeArea(
//       child: SingleChildScrollView(
//         child: FutureBuilder<Map<String, String>>(
//             future: userStorage.getUserData(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Text('Error: ${snapshot.error}');
//               } else if (snapshot.hasData) {
//                 userData = snapshot.data;
//               }
//               return BlocBuilder<ServiceBloc, ServiceState>(
//                 builder: (context, state) {
//                   if (state is ServiceFetchedByIdState) {
//                     service = state.service;
//                     nameProvider = state.service.provider.fullname;
//                   }
//                   if (state is ErrorServiceFetchingByIdState) {
//                     return const Center(
//                         child: Text("Une erreur s'est produite"));
//                   }
//                   if (state is ServiceOffersByIdState) {
//                     offer = state.service;
//                   }
//                   return Column(
//                     children: [
//                       const HublotTextWigdet(),
//                       Stack(
//                         children: [
//                           Container(
//                             width: double.infinity,
//                             height: 730,
//                             decoration: BoxDecoration(
//                               color: kFiedBgColor,
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                           ),
//                           Container(
//                             width: double.infinity,
//                             margin: const EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 20),
//                             padding: EdgeInsets.only(bottom: 20),
//                             decoration: BoxDecoration(
//                                 color: kColorWhite,
//                                 borderRadius: BorderRadius.circular(30)),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                         onPressed: () {
//                                           Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       const HomeScrenns()));
//                                         },
//                                         icon: const Icon(Icons.clear)),
//                                   ],
//                                 ),
//                                 const EspaceMenuWidget(),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 25),
//                                   child: Row(
//                                     children: [
//                                       Container(
//                                           width: 62,
//                                           height: 62,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(62),
//                                             image: const DecorationImage(
//                                                 image: AssetImage(
//                                                     'img/backona.png')),
//                                           )),
//                                       const SizedBox(width: 10),
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           textPresentation(
//                                               msg: "Votre commande à",
//                                               fontWeight: FontWeight.bold,
//                                               size: 24),
//                                           textPresentation(
//                                               msg: nameProvider,
//                                               fontWeight: FontWeight.bold,
//                                               size: 24,
//                                               color: kyellowColor),
//                                         ],
//                                       )

//                                       //container with dimension 62  and image in background
//                                     ],
//                                   ),
//                                 ),
//                                 const EspaceMenuWidget(),
//                                 CarouselCard(
//                                     buttonController: buttonController),
//                                 const EspaceMenuWidget(),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 20, right: 20),
//                                   child: Column(
//                                     children: [
//                                       Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             textPresentation(
//                                                 msg:
//                                                     "Offre de standard\n shooting photo",
//                                                 fontWeight: FontWeight.w600,
//                                                 textAlign: TextAlign.start,
//                                                 size: 15),
//                                             Column(
//                                               children: [
//                                                 textPresentation(
//                                                     msg: '25000 FCFA',
//                                                     fontWeight: FontWeight.bold,
//                                                     size: 14),
//                                                 textPresentation(
//                                                     msg: "10 photos",
//                                                     color: kyellowColor,
//                                                     fontWeight:
//                                                         FontWeight.normal,
//                                                     size: 12),
//                                               ],
//                                             )
//                                           ]),
//                                       const EspaceMenuWidget(taille: 10),
//                                       textPresentation(
//                                           msg:
//                                               'Les options selectionnés engendrons des charges supplementaires',
//                                           fontWeight: FontWeight.w200,
//                                           size: 12),
//                                     ],
//                                   ),
//                                 ),
//                                 const EspaceMenuWidget(taille: 10),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 30),
//                                   child: Column(
//                                     children: [
//                                       SelectItemOrder(
//                                         number: number,
//                                         name: 'Personne',
//                                       ),
//                                       SelectItemOrder(
//                                         number: number2,
//                                         name: 'Tenues',
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 const EspaceMenuWidget(taille: 10),
//                                 Container(
//                                   height: 50,
//                                   width: MediaQuery.of(context).size.width,
//                                   color: kColorWhite,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     children: [
//                                       Padding(
//                                         padding: EdgeInsets.only(left: (20)),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Row(children: [
//                                               textPresentation(
//                                                   msg: "Total",
//                                                   fontWeight: FontWeight.bold,
//                                                   size: 19),
//                                               const Icon(Icons
//                                                   .keyboard_arrow_down_sharp),
//                                             ]),
//                                             textPresentation(
//                                                 msg: "1j de réalisation",
//                                                 fontWeight: FontWeight.normal,
//                                                 size: 11.64,
//                                                 color: kprimaryColor
//                                                     .withOpacity(0.9)),
//                                           ],
//                                         ),
//                                       ),
//                                       AddOfferButton(
//                                           heigt: 190,
//                                           toCommande: true,
//                                           press: () {
//                                             Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) {
//                                                       return const CommandeScreen();
//                                                     },
//                                                     settings: RouteSettings(
//                                                       arguments: 'id',
//                                                     )));
//                                           },
//                                           width: 34,
//                                           msg: "20 000 FCFA"),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       const EspaceMenuWidget(taille: 30),
//                       const Padding(
//                         padding: EdgeInsets.only(left: (20)),
//                         child: TitleBox(
//                             number: 3,
//                             titre: "Options d'offres supplementaires :"),
//                       ),
//                       const EspaceMenuWidget(taille: 15),
//                       //"Choisissez jusqu'à 10 options",
//                       Container(
//                         padding: EdgeInsets.all(10),
//                         margin: EdgeInsets.only(left: (15), right: 15),
//                         decoration: const BoxDecoration(
//                           color: kyellowColor,
//                         ),
//                         child: Center(
//                           child: textPresentation(
//                               msg: "Choisissez jusqu'à 10 options",
//                               fontWeight: FontWeight.bold,
//                               size: 14),
//                         ),
//                       ),
//                       const EspaceMenuWidget(taille: 30),
//                     ],
//                   );
//                 },
//               );
//             }),
//       ),
//     );
//   }
// }

// class CarouselCard extends StatefulWidget {
//   const CarouselCard({
//     super.key,
//     required this.buttonController,
//   });

//   final CarouselSliderController buttonController;

//   @override
//   State<CarouselCard> createState() => _CarouselCardState();
// }

// class _CarouselCardState extends State<CarouselCard> {
//   @override
//   Widget build(BuildContext context) {
//     int currentIndex = 0;
//     int index = 0;
//     List<Widget> list = [
//       Container(
//         width: 326.3,
//         height: 309,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           image: const DecorationImage(image: AssetImage('img/backona.png')),
//         ),
//       ),
//       Container(
//         width: 326.3,
//         height: 309,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           image: const DecorationImage(image: AssetImage('img/backona.png')),
//         ),
//       ),
//       Container(
//         width: 326.3,
//         height: 309,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           image: const DecorationImage(image: AssetImage('img/backona.png')),
//         ),
//       )
//     ];
//     return Column(
//       children: [
//         CarouselSlider.builder(
//           itemBuilder: (context, index, realIndex) => list[index],
//           itemCount: list.length,
//           carouselController: widget.buttonController,
//           options: CarouselOptions(
//             autoPlay: false,
//             viewportFraction: 0.9,
//             aspectRatio: 1.5,
//             enlargeCenterPage: true,
//             initialPage: currentIndex,
//             onPageChanged: (indexe, reason) => setState(() {
//               currentIndex = indexe;
//             }),
//           ),
//         ),
//         AnimatedContenu(currentIndex: currentIndex, index: index, nbre: 3),
//       ],
//     );
//   }
// }

// class SelectItemOrder extends StatefulWidget {
//   SelectItemOrder({
//     super.key,
//     required this.number,
//     required this.name,
//   });
//   int number;
//   final String name;
//   @override
//   State<SelectItemOrder> createState() => _SelectItemOrderState();
// }

// class _SelectItemOrderState extends State<SelectItemOrder> {
//   void add() {
//     setState(() {
//       widget.number++;
//     });
//   }

//   void remove() {
//     if (widget.number == 0) {
//       setState(() {
//         widget.number = 0;
//       });
//     } else {
//       setState(() {
//         widget.number--;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           width: 12,
//           height: 12,
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.black),
//             color: widget.number == 0 ? kColorWhite : kyellowColor,
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//         const SizedBox(width: 10),
//         textPresentation(
//             msg: widget.name, fontWeight: FontWeight.normal, size: 15),
//         const Spacer(flex: 2),
//         IconButton(onPressed: add, icon: const Icon(Icons.add)),
//         const SizedBox(width: 10),
//         textPresentation(
//             msg: '${widget.number}', fontWeight: FontWeight.normal, size: 15),
//         const SizedBox(width: 10),
//         IconButton(onPressed: remove, icon: const Icon(Icons.remove)),
//       ],
//     );
//   }
// }
