import 'package:app/screens/part_customer/chat_screen/chat_screen.dart';
import 'package:app/screens/part_customer/chat_screen/components/recent_chat_Titile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/blocs/message/bloc/chat_bloc.dart';
import 'package:app/model/message_detail.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    //  final height = MediaQuery.of(context).size.width;
    List<ChatMessage> listChat = [];
    //String interlocutor = '';
    // listChat = state.chatList;

    return SingleChildScrollView(
        child: SafeArea(child: BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        if (state is ChatLisLoading) {
          listChat = state.chatList;
          if (listChat.isEmpty)
            return const Center(child: Text("Pas de message pour le moment"));
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
          return Center(child: Text(state.error.message));
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
    )));
  }
}
