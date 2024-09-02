part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class ChatSendMessageEvent extends ChatEvent {
  final CreateMessage message;
  const ChatSendMessageEvent({required this.message});
}

class ChatFetchMessageEvent extends ChatEvent {
  final String interculators;
  const ChatFetchMessageEvent({required this.interculators});
}

class ChatUpdateEvent extends ChatEvent {}
class  ChatMarkAsReadEvent extends ChatEvent{
  final String id;
  const ChatMarkAsReadEvent({required this.id});
}

class ChatMarkAsDeliveredEvent extends ChatEvent {
  final String id;
  const ChatMarkAsDeliveredEvent({required this.id});
}