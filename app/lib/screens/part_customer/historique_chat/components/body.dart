import 'package:app/configuration.dart';
import 'package:app/screens/part_customer/chat_screen/chat_screen.dart';
import 'package:app/screens/part_customer/chat_screen/components/recent_chat_Titile.dart';
import 'package:app/screens/part_customer/home_screens/components/hublo_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/blocs/message/bloc/chat_bloc.dart';
import 'package:app/model/message_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    //  final height = MediaQuery.of(context).size.width;
    List<ChatMessage> listChat = [];
    //String interlocutor = '';
    // listChat = state.chatList;

    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SafeArea(
          child: Column(
        children: [
          40.verticalSpace,
          const HublotTextWigdet(),
          10.verticalSpace,
          Row(children: [
            textPresentation(
                textAlign: TextAlign.start,
                msg: "Discussions",
                fontWeight: FontWeight.bold,
                size: 32),
          ]),
          5.verticalSpace,
          TextField(
            decoration: InputDecoration(
              hintText: "Que recherchez-vous ?",
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
              prefixIcon: const Icon(Icons.search),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(37),
              ),
            ),
          ),
          7.verticalSpace,
          BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              if (state is ChatLisLoading) {
                listChat = state.chatList;
                if (listChat.isEmpty)
                  return Center(child: Text("Pas de message pour le moment"));
                return Column(
                    children: List.generate(listChat.length, (index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatScreen(
                                  interlocutor: listChat[index].interlocutor,
                                  name: listChat[index].name,
                                ))),
                    child: RecentChatTitle(
                      name: listChat[index].name,
                      title: listChat[index].lastMessage,
                    ),
                  );
                }));
              } else if (state is ChatError) {
                return Center(
                    child: Text(state.error.message
                            .contains("ClientException with SocketException")
                        ? "Pas de connexion internet"
                        : 'Pas de message pour le moment'));
              }
              return const Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Messages en cours de chargement"),
                  SizedBox(
                      width: 6,
                      height: 6,
                      child: CircularProgressIndicator(strokeAlign: 2)),
                ],
              ));
            },
          ),
        ],
      )),
    ));
  }
}
