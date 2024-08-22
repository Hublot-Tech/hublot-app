import 'package:app/screens/part_customer/chat_screen/components/box_buble.dart';
import 'package:app/screens/part_customer/chat_screen/components/box_user_chat.dart';
import 'package:app/screens/part_customer/chat_screen/components/pop_row_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/blocs/auth/auth_form_bloc.dart';
import 'package:app/blocs/message/bloc/chat_bloc.dart';
import 'package:app/configuration.dart';
import 'package:app/model/user.model.dart';

import 'components/body.dart';

enum BlotItem { appelAudio, appelVideo, litige, signalerProfil }

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

 // final List<String> _menuItems = ['Selon une offre', 'Selon un besoin'];
  BlotItem? selectedBlotItem;

  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);

    final size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        //6670c021826def765079b1fb
        BlocProvider(
          create: (context) => ChatBloc()
            ..add(ChatFetchMessageEvent(interculators: widget.interlocutor)),
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

                  BoxxUserChat(widget: widget, size: size),
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
                      } else if (value == BlotItem.appelAudio) {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         settings: RouteSettings(
                        //             arguments: [widget.interlocutor, id]),
                        //         builder: (context) => const CommandeScreen()));
                      }
                    },
                    icon: isClick
                        ? BoxBublePopup(size: size)
                        : const Icon(Icons.more_vert_sharp, color: kColorWhite),
                    iconColor: kColorWhite,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: kColorWhite, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    itemBuilder: (context) => [
                      PopupMenuItem<BlotItem>(
                          value: BlotItem.appelAudio,
                          child: PopRowItem(
                            icons: 'img/appel_audio.svg',
                            mesg: 'Appel audio',
                          )),
                  
                      PopupMenuItem(
                        value: BlotItem.appelVideo,
                        child: PopRowItem(
                            icons: 'img/appel_video.svg', mesg: 'Appel video'),
                      ),
                      PopupMenuItem(
                          value: BlotItem.litige,
                          child: PopRowItem(
                            icons: 'img/letige.svg',
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



