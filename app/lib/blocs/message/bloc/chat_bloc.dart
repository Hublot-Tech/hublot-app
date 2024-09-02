import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:app/model/message_detail.dart';
import 'package:app/services/chatService.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<ChatSendMessageEvent>(sendMessage);
    on<ChatFetchMessageEvent>(fetchMessage);
    on<ChatUpdateEvent>(fetchChat);
    on<ChatMarkAsReadEvent>(markAsReadHandler);
  }

  Chatservice api = Chatservice();
  Timer? _timer;

  FutureOr<void> sendMessage(
      ChatSendMessageEvent event, Emitter<ChatState> emit) async {
    emit(ChatLoading());
    try {
      final response = await api.sendMessage(event);
      // Après l'envoi, recharge les messages
      if (response is MessageResponse) {
        emit(ChatSendState(message: response));
        //add(ChatFetchMessageEvent());
        // add( ChatFetchMessageEvent(interculators: event.message));
      } else if (response is MessageError) {
        emit(ChatError(error: response));
      }
    } catch (error) {
      emit(ChatError(
          error: MessageError(message: error.toString(), status: 505)));
    }
  }

  FutureOr<void> fetchMessage(
      ChatFetchMessageEvent event, Emitter<ChatState> emit) async {
    emit(ChatLoading());

    try {
      final response =
          await api.receiveMessage(perPage: 50, page: 1, event: event);
      if (response is MessageResponseFecth) {
        emit(ChatLoaded(chatList: response.data));
      } else if (response is MessageError) {
        emit(ChatError(error: response));
      }
    } catch (e) {
      emit(ChatError(error: MessageError(message: e.toString(), status: 505)));
    }
  }

  FutureOr<void> fetchChat(
      ChatUpdateEvent event, Emitter<ChatState> emit) async {
    emit(ChatLoading());

    try {
      final response = await api.receiveAllChat();
      if (response is ChatResponseFecth) {
        emit(ChatLisLoading(chatList: response.data));
      } else if (response is MessageError) {
        emit(ChatError(error: response));
      }
    } catch (e) {
      emit(ChatError(error: MessageError(message: e.toString(), status: 505)));
    }
  }

  FutureOr<void> markAsReadHandler(
      ChatMarkAsReadEvent event, Emitter<ChatState> emit) async {
    try {
      final response = await api.markMessageAsRead(event.id);
      if (response is Map<String, bool> && response['success'] == true) {
        emit(ChatMessageRead(messageId: event.id));
      } else if (response is MessageError) {
        emit(ChatError(error: response));
      }
    } catch (e) {
      emit(ChatError(error: MessageError(message: e.toString(), status: 500)));
    }
  }
  FutureOr<void> markAsReadDelivered(
      ChatMarkAsReadEvent event, Emitter<ChatState> emit) async {
    try {
      final response = await api.markMessageAsDelivered(event.id);
      if (response is Map<String, bool> && response['success'] == true) {
        emit(ChatMessageRead(messageId: event.id));
      } else if (response is MessageError) {
        emit(ChatError(error: response));
      }
    } catch (e) {
      emit(ChatError(error: MessageError(message: e.toString(), status: 500)));
    }
  }

  void startPeriodicFetching(ChatFetchMessageEvent event) {
    _timer = Timer.periodic(const Duration(seconds: 60), (timer) {
      add(event); // Déclenche l'événement de récupération des messages
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel(); // Arrête le timer lorsque le bloc est fermé
    return super.close();
  }
}
