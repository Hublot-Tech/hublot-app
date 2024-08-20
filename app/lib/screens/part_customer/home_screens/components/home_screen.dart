import 'package:app/blocs/auth/auth_form_bloc.dart';
import 'package:app/blocs/auth/auth_form_event.dart';
import 'package:app/blocs/service/bloc/service_bloc.dart';
import 'package:app/configuration.dart';
import 'package:app/screens/part_customer/account_tab/account_tab.dart';
import 'package:app/screens/part_customer/historique_chat/recent_chat.dart';
import 'package:app/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'body.dart';

class HomeScrenns extends StatefulWidget {
  const HomeScrenns({super.key});
  static String routeName = "/homeScreenClient";

  @override
  State<HomeScrenns> createState() => _HomeScrennsState();
}

class _HomeScrennsState extends State<HomeScrenns> {
  int _currentIndex = 0;
  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: [
          MultiBlocProvider(
            providers: [
              //          context.read<ServiceBloc>().add(FetchServicesEvent());
              // context.read<AuthBloc>().add(const AuthGetCurrentUserEvent());
              BlocProvider(
                create: (context) => ServiceBloc()..add(FetchServicesEvent()),
              ),
              BlocProvider(
                create: (context) => AuthBloc()..add(AuthGetCurrentUserEvent()),
              ),
            ],
            child: const Body(),
          ),
          Container(),
          Container(),
          RecentChats(),
          const AccountTab()
        ][_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: kyellowColor,
            selectedItemColor: Colors.black,
            onTap: (value) => setCurrentIndex(value),
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                icon:
                    SvgPicture.asset("img/home-3--home-house-roof-shelter.svg"),
                label: "Acceuil",
                activeIcon: SvgPicture.asset("img/home-3 1.svg"),
              ),
              BottomNavigationBarItem(
                icon: Image.asset('img/Group 56.png'),
                label: "Favoris",
                activeIcon: Image.asset('img/Group 56.png'),
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  children: [
                    Container(
                      width: 52.13,
                      height: 52.01,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(51),
                          color: kyellowColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              blurRadius: 2,
                              offset: const Offset(1.0, 4.0),
                              spreadRadius: 1.0,
                            ),
                            const BoxShadow(
                              color: Colors.white,
                              blurRadius: 15,
                              offset: Offset(-4.0, -4.0),
                              spreadRadius: 1.0,
                            )
                          ]),
                    ),
                    Positioned(
                        top: 12,
                        left: 12,
                        child: Center(
                            child: SvgPicture.asset("img/msg-icon.svg"))),
                  ],
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("img/chat.svg"),
                  label: "Discussion",
                  activeIcon:
                      SvgPicture.asset("img/chat-bubble-text-oval 1.svg")),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('img/hamburger-icon.svg'),
                label: "Menu",
              ),
            ]));
  }
}
