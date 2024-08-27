import 'package:app/blocs/auth/auth_form_bloc.dart';
import 'package:app/blocs/auth/auth_form_state.dart';
import 'package:app/blocs/service/bloc/service_bloc.dart';
import 'package:app/controller/interfaces/prestataire.dart';
import 'package:app/controller/interfaces/services.dart';
import 'package:app/controller/service.dart';
import 'package:app/model/service.model.dart';
import 'package:app/model/user.model.dart';
import 'package:app/model/user_storage.dart';
import 'package:app/screens/authentification/code_phone_screen/code_phone_screen.dart';
import 'package:app/screens/components/shimer_loading.dart';
import 'package:app/screens/part_customer/description_service/description_service_screen.dart';
import 'package:app/services/toastServices.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:app/configuration.dart';
import 'package:app/screens/part_customer/home_screens/components/become_prestataire.dart';
import 'package:app/screens/components/shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../authentification/provider_screen/prestataire_screen.dart';
import 'box_information.dart';
import 'card_service_prestataire.dart';
import 'box_category_service.dart';
import 'row_see_more.dart';
import 'card_historic.dart';
import 'hublo_text_widget.dart';
import 'item_categorie.dart';
import 'notification_box.dart';
import 'search_box.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool shimmer = false;
  HublotProviderApiApi apiPrestataire = HublotProviderApiApi();
  List<Map<Services, Services>> itemServices = [];
  List<Map<String, String>> itemCategoris = [];
  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 3)).then((value) {});
  }

  @override
  void initState() {
    super.initState();
    itemServices = apiPrestataire.getAllServices();
    itemCategoris = apiPrestataire.getAllCategories();
  }

  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<Service> list = [];
    // context.read<AuthBloc>().add(AuthGetCurrentUserEvent());
    User user = User.empty();
    UserStorage userStorage = UserStorage();
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUserProfile) {
          user = state.user;
          userStorage.storeUserData(
              user.id!, user.verificationStatus!, user.email!, user.fullname);
          if (!user.isOTPVerified!) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) {
                      return const CodePhoneScreem();
                    },
                    settings: RouteSettings(arguments: user.phoneNumber)));
          }
        } else if (state is AuthError) {
          ToastService.errorConnection('msg', Colors.red, context);
        }
      },
      child: Shimmer(
        linearGradient: shimmerGradient,
        child: SafeArea(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SingleChildScrollView(
                child: Column(children: [
                  const EspaceMenuWidget(),
                  const HublotTextWigdet(),
                  const EspaceMenuWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BecomeRowBox(
                        text: "Devenir prestataire",
                        press: () {
                          Navigator.pushNamed(
                              context, ProviderScreen.routeName);
                        },
                      ),
                      const NotificationBox(),
                    ],
                  ),
                  const EspaceMenuWidget(),
                  const SearchBox(),
                  const EspaceMenuWidget(),
                  Column(
                    children: [
                      BoxCategoryService(name: "Catégories", press: () {}),
                      10.verticalSpace,
                      ShimmerLoading(
                        isLoading: isLoading,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                                itemCategoris.length,
                                (index) => ItemCategories(
                                    name: itemCategoris[index]['text']!,
                                    icon: itemCategoris[index]['icon']!)),
                          ),
                        ),
                      ),

                      const EspaceMenuWidget(), //column deleted
                      const CardHistoric(),
                      const EspaceMenuWidget(),
                      RowSeeMore(
                          name: "Recommandés",
                          msg: "Liste basé sur votre position",
                          press: () {}),
                      const EspaceMenuWidget(),
                      BlocConsumer<ServiceBloc, ServiceState>(
                        listener: (context, state) {
                          if (state is ServiceFetchingAllLoading) {
                            setState(() {
                              isLoading = true;
                            });
                          }
                          if (state is ServiceFectchedAllState) {
                            setState(() {
                              isLoading = false;
                            });

                            //  list = state.services;

                            // print(list.length);
                          }
                          if (state is ErrorServiceFetchingAllState) {
                            setState(() {
                              isLoading = false;
                            });
                            ToastService.errorMessage(
                                state.error.message, context);
                          }
                        },
                        builder: (context, state) {
                          if (state is ServiceFectchedAllState) {
                            list = state.services;
                          }
                          return ShimmerLoading(
                            isLoading: isLoading,
                            child: SizedBox(
                              height: getProportionateScreenHeight(400),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: (list.length),
                                itemBuilder: (context, index) {
                                  if (list.isNotEmpty && index < list.length) {
                                    //  final MapEntry<Services, Services> entry =
                                    //     itemServices[0].entries.first;
                                    //  final Services serviceData = entry.value;
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
                                                        list[index].id)));
                                      },
                                      child: CardServicePrestataire(
                                          serviceData: Services(
                                              name: list[index].provider,
                                              profession: list[index].name,
                                              img: list[index].mainImageRef,
                                              note: "2.4",
                                              distance: user.address,
                                              lieu: user.address,
                                              like: true,
                                              favorite: false,
                                              prestataire: Prestataire(
                                                name: list[index].provider,
                                                firstname: '',
                                              ))),
                                    );
                                  }
                                  return null;
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      const EspaceMenuWidget(),
                      RowSeeMore(
                          name: "Annonceurs proches",
                          msg: "Liste basé sur votre position",
                          press: () {}),
                      const EspaceMenuWidget(),
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: ksecondaryColor,
                              borderRadius: BorderRadius.circular(23),
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(23),
                                  child: Image.asset(
                                    "img/portrait-stylish-professional-photographer.jpg",
                                    width: getProportionateScreenWidth(387),
                                    height: getProportionateScreenHeight(356),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Spacer(),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: size.width * 0.02, top: 10),
                                      // child: BoxStar(
                                      //   size: size,
                                      //   nbrOfStar: '4.6',
                                      // ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: size.height * 0.3),
                                  child: Center(
                                    child: BoxInformation(
                                      size: size,
                                      name: "Grec Koum,",
                                      profession: "Photographe",
                                      lieu: "Douala,akwa",
                                      distance: "3km",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MistakeWidget extends StatelessWidget {
  const MistakeWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: ksecondaryColor, borderRadius: BorderRadius.circular(23)),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(23),
          child: Image.asset(
            "img/portrait-stylish-professional-photographer.jpg",
            width: 387,
            height: 356,
            fit: BoxFit.cover,
          ),
        ),
        Row(
          children: [
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: size.width * 0.02, top: 10),
              // child: BoxStar(
              //   size: size,
              //  ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.3),
          child: Center(
            child: BoxInformation(
              size: size,
              name: "Grec Koum,",
              profession: "Photographe",
              lieu: "Douala,akwa",
              distance: "3km",
            ),
          ),
        ),
      ],
    );
  }
}
