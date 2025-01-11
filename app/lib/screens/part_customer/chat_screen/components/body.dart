import 'dart:io';

import 'package:app/screens/part_customer/chat_screen/components/chat_buble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/blocs/auth/auth_form_bloc.dart';
import 'package:app/blocs/message/bloc/chat_bloc.dart';
import 'package:app/configuration.dart';
import 'package:app/model/message_detail.dart';
import 'package:app/model/send_menu_item.dart';
import 'package:app/services/toastServices.dart';
import 'chat_input_field.dart';
import 'bottom_sheet.dart';

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
      builder: (context) => ChatBottomSheet(menuItems: menuItems),
    );
  }

  @override
  Widget build(BuildContext context) {
    //size with Mediaquery
    print(widget.interlocutor);
    print(idUser);

    SchedulerBinding.instance.addPostFrameCallback((_) => context
        .read<ChatBloc>()
        .startPeriodicFetching(
            ChatFetchMessageEvent(interculators: widget.interlocutor)));
    Size size = MediaQuery.of(context).size;
    TextEditingController controller = TextEditingController();
    List<ResponseMessageSend> listChat = [];
    void markMessagesAsRead(List<ResponseMessageSend> messages) {
      final chatBloc = BlocProvider.of<ChatBloc>(context);
      for (var message in messages) {
        if (message.sender != idUser &&
            message.readAt.isBefore(message.sendAt)) {
          chatBloc.add(ChatMarkAsReadEvent(id: message.id));
        }
      }
    }

    void markMessagesAsDelivered(List<ResponseMessageSend> messages) {
      final chatBloc = BlocProvider.of<ChatBloc>(context);
      for (var message in messages) {
        if (message.sender != idUser &&
            message.deliveredAt.isBefore(message.sendAt)) {
          chatBloc.add(ChatMarkAsDeliveredEvent(id: message.id));
        }
      }
    }

    File file = File('');

    return Stack(
      children: [
        BlocConsumer<ChatBloc, ChatState>(
          listener: (context, state) {
            if (state is ChatLoaded) {
              markMessagesAsRead(state.chatList);
              markMessagesAsDelivered(state.chatList);
            } else if (state is ChatError) {
              ToastService.errorMessage(state.error.message, context);
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
                      "Message envoyé avec succès", kprimaryColor, context);
                } else if (state is ChatError) {
                  ToastService.errorMessage(state.error.message, context);
                }
              },
              child: ChatInputField(
                controller: controller,
                onAttachmentPressed: () => showBottomSheet(context),
                onSendPressed: () {
                  String contentType = "";
                  print("hello");
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
          ),
        )
      ],
    );
  }
}
