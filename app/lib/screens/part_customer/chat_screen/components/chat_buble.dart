import 'package:app/blocs/service/bloc/service_bloc.dart';
import 'package:app/screens/part_customer/chat_screen/components/blot_buble.dart';
import 'package:app/screens/part_customer/chat_screen/components/order_buble.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/configuration.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble(
      {super.key,
      required this.resource,
      required this.message,
      required this.isMe,
      required this.contentTypee,
      required this.press});
  final String message, resource, contentTypee;
  final bool isMe;
  final GestureTapCancelCallback press;
  @override
  Widget build(BuildContext context) {
    //   final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: contentTypee == 'blot' ? press : null,
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          //width and height with 272 and 72 with size
          margin: isMe
              ? const EdgeInsets.only(left: 50, bottom: 5)
              : const EdgeInsets.only(right: 50, bottom: 5),
          padding: contentTypee == 'order'
              ? const EdgeInsets.all(0)
              : const EdgeInsets.only(
                  left: 16.0, top: 10, bottom: 10, right: 10),
          decoration: BoxDecoration(
              color: isMe ? kprimaryColor : kFiedBgColor2,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(18),
                topRight: const Radius.circular(18),
                bottomLeft: isMe ? const Radius.circular(18) : Radius.zero,
                bottomRight: isMe ? Radius.zero : const Radius.circular(18),
              )),
          child: contentTypee == 'blot'
              ? BlotBuble(message: message, isMe: isMe)
              : contentTypee == 'order'
                  ? BlocProvider(
                      create: (context) => ServiceBloc(),
                      child: OrderBuble(isMe: isMe, id: resource),
                    )
                  : textPresentation(
                      msg: message,
                      fontWeight: FontWeight.w400,
                      size: 19,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                      color: kColorWhite),
        ),
      ),
    );
  }
}
