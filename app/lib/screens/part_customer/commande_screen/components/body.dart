import 'package:app/screens/part_customer/account_tab/components/body.dart';
import 'package:app/screens/part_customer/commande_screen/components/blot_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/blocs/blot/bloc/blot_bloc.dart';
import 'package:app/configuration.dart';
import 'package:app/model/blot_entity.dart';

import 'package:app/model/user_storage.dart';
import 'package:dotted_line/dotted_line.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom) {
      final blotBloc = context.read<BlotBloc>();
      final state = blotBloc.state;
      if (state is BlotFetched && !state.hasReachedMax) {
        blotBloc.add(BlotFetchEvent(
          status: "created", // Remplace par les valeurs réelles
          page: (state.blots.length ~/ 10) + 1,
        ));
      }
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserStorage userStorage = UserStorage();
    final Size size = MediaQuery.of(context).size;
    Future<Map<String, String>> infoUser;
    Map<String, String>? userData = <String, String>{};
    infoUser = userStorage.getUserData();
    return SafeArea(
      child: FutureBuilder<Map<String, String>>(
          future: infoUser,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              userData = snapshot.data;
            }
            return Column(
              children: [
                40.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(left: 20.0).r,
                  child: RowUserProfile(userData: userData),
                ),
                15.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const DottedLine(
                      direction: Axis.horizontal,
                      lineLength: 90.0,
                      lineThickness: 2.0,
                      dashLength: 4.0,
                      dashColor: Colors.grey,
                      dashGapLength: 4.0,
                    ),
                    9.verticalSpace,
                    SvgPicture.asset("img/icons8_edit_delivery_terms 1.svg"),
                    5.verticalSpace,
                    textPresentation(
                        msg: "Commandes",
                        fontWeight: FontWeight.w600,
                        size: 24),
                    10.verticalSpace,
                    const DottedLine(
                      direction: Axis.horizontal,
                      lineLength: 90.0,
                      lineThickness: 2.0,
                      dashLength: 4.0,
                      dashColor: Colors.grey,
                      dashGapLength: 4.0,
                    ),
                  ],
                ),
                10.verticalSpace,
                BlocBuilder<BlotBloc, BlotState>(
                  builder: (context, state) {
                    if (state is BlotFetched) {
                      List<Blot> blots = state.blots;

                      return Expanded(
                        child: blots.isEmpty
                            ? Center(
                                child: textPresentation(
                                    msg: "Pas de commande pour le moment",
                                    fontWeight: FontWeight.bold,
                                    size: 20),
                              )
                            : ListView.builder(
                                controller: _scrollController,
                                padding: const EdgeInsets.only(left: 10),
                                itemBuilder: (context, index) {
                                  return BlotStatus(
                                      size: size,
                                      nomClient: 'Judit',
                                      statusBlot: blots[index].status,
                                      blotNumber: blots[index].id);
                                },
                                itemCount: blots.length,
                                shrinkWrap: true,
                                physics: const AlwaysScrollableScrollPhysics(),
                              ),
                      );
                    } else if (state is BlotFetched) {
                      return const Center(
                          child: CircularProgressIndicator(
                        backgroundColor: kyellowColor,
                      ));
                    } else if (state is BlotErrorState) {
                      return Center(child: Text(state.message.message));
                    }
                    return const Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Commande en cours de chargement"),
                        SizedBox(
                            width: 6,
                            height: 6,
                            child: CircularProgressIndicator(strokeAlign: 2)),
                      ],
                    ));
                  },
                ),
              ],
            );
          }),
    );
  }
}
