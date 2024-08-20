import 'dart:io';

import 'package:app/screens/part_customer/chat_screen/components/chat_buble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/blocs/auth/auth_form_bloc.dart';
import 'package:app/blocs/message/bloc/chat_bloc.dart';
import 'package:app/configuration.dart';
import 'package:app/model/message_detail.dart';
import 'package:app/model/send_menu_item.dart';
import 'package:app/services/toastServices.dart';

class Body extends StatefulWidget {
  final String interlocutor;
  const Body({super.key, required this.interlocutor});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String idUser = '';
  void read() async {
    idUser = await storage.read(key: 'userId') as String;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    read();
  }

  List<SendMenuItem> menuItems = [
    SendMenuItem(
        color: Colors.amber, icons: Icons.image, text: 'Photos & Videos'),
    SendMenuItem(
        color: Colors.blue, icons: Icons.insert_drive_file, text: 'Document'),
    SendMenuItem(color: Colors.orange, icons: Icons.music_note, text: 'Audio')
  ];
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              decoration: const BoxDecoration(
                  color: kColorWhite,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(20))),
              child: Column(
                children: [
                  Center(
                      child: Container(
                    height: 4,
                    width: 58,
                    color: Colors.grey.shade200,
                  )),
                  ListView.builder(
                      itemCount: menuItems.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: menuItems[index].color.shade100,
                              ),
                              height: 50,
                              width: 50,
                              child: Icon(
                                menuItems[index].icons,
                                size: 20,
                                color: menuItems[index].color.shade400,
                              ),
                            ),
                            title: textPresentation(
                                msg: menuItems[index].text,
                                fontWeight: FontWeight.normal,
                                size: 12),
                          ),
                        );
                      })
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    //size with Mediaquery
    SchedulerBinding.instance.addPostFrameCallback((_) => context
        .read<ChatBloc>()
        .startPeriodicFetching(
            ChatFetchMessageEvent(interculators: widget.interlocutor)));
    Size size = MediaQuery.of(context).size;
    TextEditingController controller = TextEditingController();
    List<ResponseMessageSend> listChat = [];

    File file = File('');

    return Stack(
      children: [
        BlocConsumer<ChatBloc, ChatState>(
          listener: (context, state) {
            if (state is ChatLoaded) {
            } else if (state is ChatError) {
              ToastService.errorMessage(state.error.message);
            }
          },
          builder: (context, state) {
            if (state is ChatLoaded) {
              listChat = state.chatList;
            }
            // if (state is ChatLoading) {
            //   return Center(child: CircularProgressIndicator());
            // }
            return Container(
                width: size.width,
                height: size.height * 0.85,
                color: const Color.fromARGB(0, 162, 22, 22),
                //     margin: EdgeInsets.only(bottom: 200),
                padding: const EdgeInsets.only(
                    left: 13, right: 13, top: 13, bottom: 70),
                child: ListView.builder(
                    itemCount: listChat.length,
                    itemBuilder: (context, index) => ChatBuble(
                          resource: listChat[index].resource,
                          contentTypee: listChat[index].contentType,
                          isMe: listChat[index].sender == idUser ? true : false,
                          message: listChat[index].content!,
                          press: () {},
                        )));
          },
        ),

        //   ChatBuble(isMe: true),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.transparent,
            child: BlocListener<ChatBloc, ChatState>(
              listener: (context, state) {
                if (state is ChatSendState) {
                  ToastService.successMessage(
                      "Message envoyé avec succès", kprimaryColor);
                } else if (state is ChatError) {
                  ToastService.errorMessage(state.error.message);
                }
              },
              child: Row(
                children: [
                  SizedBox(width: size.width * 0.05),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors
                            .grey[200], // Couleur de fond du TextFormField
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: TextFormField(
                        onFieldSubmitted: (value) {
                          if (value.isNotEmpty) {
                            String contentType = "";
                            CreateMessage createMessage;
                            if (controller.text.isNotEmpty) {
                              contentType = "text";
                              createMessage = CreateMessage(
                                contentType: contentType,
                                receiver: widget.interlocutor,
                                content: controller.text,
                              );
                            } else {
                              contentType = "file";
                              createMessage = CreateMessage(
                                contentType: contentType,
                                receiver: widget.interlocutor,
                                file: file,
                              );
                            }
                            context.read<ChatBloc>().add(
                                ChatSendMessageEvent(message: createMessage));
                            controller.clear();
                          }
                        },
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: "Ecrivez un message ...",
                          hintStyle: const TextStyle(
                              color: Colors.grey), // Couleur du hintText
                          prefixIcon: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: IconButton(
                                onPressed: () {
                                  showBottomSheet(context);
                                },
                                icon: SvgPicture.asset(
                                  'img/epingle.svg',
                                  color: Colors.grey, // Couleur de l'icône
                                ),
                              )),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          border: InputBorder
                              .none, // Supprimer la bordure par défaut
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: size.width * 0.02),
                  Container(
                    width: size.width * 0.12,
                    height: size.width *
                        0.12, // Assurer que le bouton est un cercle
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey, // Couleur du bouton d'envoi
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        'img/vectorPlig.svg',
                        color: Colors.white, // Couleur de l'icône d'envoi
                      ),
                      onPressed: () {
                        String contentType = "";
                        CreateMessage createMessage;
                        if (controller.text.isNotEmpty) {
                          contentType = "text";
                          createMessage = CreateMessage(
                            contentType: contentType,
                            receiver: widget.interlocutor,
                            content: controller.text,
                          );
                        } else {
                          contentType = "file";
                          createMessage = CreateMessage(
                            contentType: contentType,
                            receiver: widget.interlocutor,
                            file: file,
                          );
                        }
                        context
                            .read<ChatBloc>()
                            .add(ChatSendMessageEvent(message: createMessage));
                        controller.clear();
                      },
                    ),
                  ),
                  SizedBox(width: size.width * 0.05),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class FieldFom extends StatefulWidget {
  const FieldFom({
    super.key,
    this.isChange = false,
    required this.controller,
  });

  final TextEditingController controller;
  final bool isChange;
  @override
  State<FieldFom> createState() => _FieldFomState();
}

class _FieldFomState extends State<FieldFom> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: "Ecrivez un message ...",
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                // fit: BoxFit.cover,
                'img/epingle.svg',
              ),
            ),
            contentPadding: const EdgeInsets.only(left: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
          )),
    );
  }
}
