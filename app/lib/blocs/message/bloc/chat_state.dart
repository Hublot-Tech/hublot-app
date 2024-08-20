part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatSendState extends ChatState {
  final MessageResponse message;
  const ChatSendState({required this.message});
}
class ChatLoaded extends ChatState {
  final List<ResponseMessageSend> chatList;
  const ChatLoaded({required this.chatList});
}

class ChatLisLoading extends ChatState {
  final List<ChatMessage> chatList;
  const ChatLisLoading({required this.chatList});
}

class ChatError extends ChatState{
  final MessageError error;
  const ChatError({required this.error});
}