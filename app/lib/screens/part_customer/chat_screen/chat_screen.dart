import 'package:app/screens/part_customer/blot_screen/blot_screen.dart';
import 'package:app/screens/part_customer/chat_screen/components/pop_row_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/blocs/auth/auth_form_bloc.dart';
import 'package:app/blocs/message/bloc/chat_bloc.dart';
import 'package:app/configuration.dart';
import 'package:app/model/info_client.dart';
import 'package:app/model/user.model.dart';

import 'components/body.dart';

enum BlotItem { creerBlot, blotEncours, litige, signalerProfil }

class ChatScreen extends StatefulWidget {
  final String interlocutor;
  final String name;
  const ChatScreen({super.key, required this.interlocutor, required this.name});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isClick = false;
  User user = User.empty();
  String id = '';
  //method to read id from FlutterSecureStorage
  void read() async {
    id = await storage.read(key: 'userId') as String;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    read();
  }

  void onClick() {
    setState(() {
      isClick = !isClick;
    });
  }

  final List<String> _menuItems = ['Selon une offre', 'Selon un besoin'];
  BlotItem? selectedBlotItem;

  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);

    final size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        //6670c021826def765079b1fb
        BlocProvider(
          create: (context) => ChatBloc()..add(ChatFetchMessageEvent(interculators: widget.interlocutor)),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kprimaryColor,
          toolbarHeight: size.height * 0.1,
          flexibleSpace: SafeArea(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: kColorWhite)),
                  //container with color #FFC000 and
                  Container(
                    //width and height to 57 with Mediaquery.of(context).size
                    width: size.width * 0.14,
                    height: size.height * 0.14,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: kyellowColor),
                        image: const DecorationImage(
                            image: AssetImage('img/backona.png'),
                            fit: BoxFit.cover)),
                  ),
                  //

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textPresentation(
                          msg: widget.name,
                          fontWeight: FontWeight.bold,
                          size: 24,
                          color: Colors.white),
                      Row(children: [
                        Container(
                          width: 4,
                          height: 4,
                          margin: EdgeInsets.only(right: size.width * 0.015),
                          decoration: const BoxDecoration(
                              color: Colors.green, shape: BoxShape.circle),
                        ),
                        textPresentation(
                            msg: 'En ligne',
                            fontWeight: FontWeight.w300,
                            size: 13.4,
                            color: Colors.white),
                      ]),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: size.width * 0.015),
                            child: SvgPicture.asset('img/icons8_star 2.svg',
                                width: 12, height: 12),
                          ),
                          textPresentation(
                              msg: '4.6',
                              fontWeight: FontWeight.w400,
                              size: 10,
                              color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      color: kColorWhite,
                    ),
                  ),

                  PopupMenuButton<BlotItem>(
                    onOpened: onClick,
                    onCanceled: onClick,
                    initialValue: selectedBlotItem,
                    color: kColorWhite,
                    onSelected: (value) {
                      // onClick();
                      if (value == BlotItem.signalerProfil) {
                        //
                      } else if (value == BlotItem.blotEncours) {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         settings: RouteSettings(
                        //             arguments: [widget.interlocutor, id]),
                        //         builder: (context) => const CommandeScreen()));
                      }
                    },
                    icon: isClick
                        ? Container(
                            width: size.width * 0.075,
                            height: size.height * 0.075,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: kColorWhite,
                            ),
                            child: const Icon(Icons.more_vert_sharp,
                                color: kprimaryColor))
                        : const Icon(Icons.more_vert_sharp, color: kColorWhite),
                    iconColor: kColorWhite,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: kColorWhite, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    itemBuilder: (context) => [
                      PopupMenuItem<BlotItem>(
                          value: BlotItem.creerBlot,
                          child: DropdownButton(
                              dropdownColor: Colors.white,
                              hint:  PopRowItem(
                                icons: 'img/icons8_auto_deskew 1.svg',
                                mesg: 'Créer un blot',
                              ),
                              items: _menuItems.map((String item) {
                                return DropdownMenuItem<String>(
                                    value: item,
                                    child: PopRowItem(
                                      icons: 'img/icons8_auto_deskew 1.svg',
                                      mesg: item,
                                    ));
                              }).toList(),
                              onChanged: (value) {
                                if (value == 'Selon une offre') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          settings: RouteSettings(
                                            arguments: InfoClient(
                                                name: widget.name,
                                                id: widget.interlocutor),
                                          ),
                                          builder: (context) =>
                                              const BlotScreen(
                                                  hasOption: true)));
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          settings: RouteSettings(
                                            arguments: InfoClient(
                                                name: widget.name,
                                                id: widget.interlocutor),
                                          ),
                                          builder: (context) =>
                                              const BlotScreen(
                                                  hasOption: false)));
                                }
                              })),
                       PopupMenuItem(
                        value: BlotItem.blotEncours,
                        child: PopRowItem(
                            icons: 'img/icons8_copy_to_clipboard 1.svg',
                            mesg: 'Blot encours...'),
                      ),
                       PopupMenuItem(
                          value: BlotItem.litige,
                          child: PopRowItem(
                            icons: 'img/icons8_auto_deskew_1 1.svg',
                            mesg: 'Déclarer un litige',
                          )),
                      const PopupMenuItem(
                          value: BlotItem.signalerProfil,
                          child: PopRowItem(
                              icons: 'img/icons8_bad_decision 1.svg',
                              color: Colors.red,
                              mesg: 'Signaler ce profil'))
                    ],
                  ),
                ]),
          ),
        ),
        body: Body(interlocutor: widget.interlocutor),
      ),
    );
  }
}
