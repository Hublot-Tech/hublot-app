import 'dart:io';

import 'package:app/model/user.model.dart';

class MessageDetails {
  final String contentType;
  final String? content;
  final String id;
  final DateTime sendAt;
  final DateTime deliveredAt;
  final DateTime readAt;
  final String fileRef;
  final User sender;
  final User receiver;

  const MessageDetails(
      {required this.contentType,
      required this.id,
      this.content,
      required this.sendAt,
      required this.deliveredAt,
      required this.readAt,
      required this.fileRef,
      required this.sender,
      required this.receiver});

  //factory MessageDetails isEmpty

  factory MessageDetails.isEmpty() {
    return MessageDetails(
        contentType: '',
        id: '',
        sendAt: DateTime.now(),
        deliveredAt: DateTime.now(),
        readAt: DateTime.now(),
        fileRef: '',
        sender: User.empty(),
        receiver: User.empty());
  }
  factory MessageDetails.fromJson(Map<String, dynamic> json) {
    return MessageDetails(
        contentType: json['contentType'],
        id: json['id'],
        sendAt: DateTime.parse(json['sendAt']),
        deliveredAt: DateTime.parse(json['deliveredAt']),
        readAt: DateTime.parse(json['readAt']),
        fileRef: json['fileRef'],
        sender: User.fromJson(json['sender']),
        receiver: User.fromJson(json['receiver']));
  }

  //factory messageDetails to json
  Map<String, dynamic> toJson() {
    return {
      "content": content,
      "contentType": contentType,
      "id": id,
      "sendAt": sendAt.toIso8601String(),
      "deliveredAt": deliveredAt.toIso8601String(),
      "readAt": readAt.toIso8601String(),
      "fileRef": fileRef,
      "sender": sender.toJson(),
      "receiver": receiver.toJson(),
    };
  }
}

class CreateMessage {
  final String contentType;
  final String? content;
  final String? blotId;
  final String? resource;
  final File? file;
  final String? receiver;
  CreateMessage(
      {this.content,
      this.blotId,
      this.receiver,
      this.resource,
      this.file,
      required this.contentType});

  factory CreateMessage.fromJson(Map<String, dynamic> json) {
    return CreateMessage(
        contentType: json['contentType'],
        content: json['content'],
        receiver: json['receiver'],
        resource: json['resource']);
  }

  Map<String, dynamic> toJson() {
    return {
      "content": content,
      'receiver': receiver,
      "contentType": contentType,
      "resource": resource
    };
  }

  factory CreateMessage.isEmpty() {
    return CreateMessage(
        contentType: '', receiver: '', content: '', resource: null);
  }
}

class MessageEntity {
  final String id;
  final String contentType;
  final String? content;
  final String? file;
  final String fileRef;
  final DateTime sendAt;
  final DateTime deliveredAt;
  final DateTime readAt;
  final String receiver;
  final String sender;

  const MessageEntity(
      {this.content,
      required this.id,
      required this.contentType,
      required this.deliveredAt,
      this.file,
      required this.readAt,
      required this.fileRef,
      required this.receiver,
      required this.sendAt,
      required this.sender});

  factory MessageEntity.fromJson(Map<String, dynamic> json) {
    return MessageEntity(
      id: json['id'],
      contentType: json['contentType'],
      deliveredAt: DateTime.parse(json['deliveredAt']),
      fileRef: json['fileRef'],
      receiver: json['receiver'],
      sendAt: DateTime.parse(json['sendAt']),
      sender: json['sender'],
      readAt: DateTime.parse(json['readAt']),
    );
  }
}

class ResponseMessageSend {
  final String id;
  final String contentType;
  final String? content;
  final String? file;
  final String resource;
  final DateTime sendAt;
  final DateTime deliveredAt, createdAt, updatedAt;
  final DateTime readAt;
  final String receiver;
  final String sender;

  const ResponseMessageSend(
      {required this.sender,
      required this.receiver,
      required this.readAt,
      this.content,
      required this.contentType,
      required this.createdAt,
      required this.deliveredAt,
      required this.resource,
      required this.id,
      required this.sendAt,
      required this.updatedAt,
      this.file});
  //factory from json
  factory ResponseMessageSend.fromJson(Map<String, dynamic> json) {
    return ResponseMessageSend(
      id: json['id'] as String,
      contentType: json['contentType'] as String,
      content: json['content'] as String,
      deliveredAt: json['deliveredAt'] == null
          ? DateTime.now()
          : DateTime.parse(json['deliveredAt']),
      resource: json['resource'] == null ? '' : json['resource'] as String,
      receiver: json['receiver'],
      sendAt: json['sendAt'] == null
          ? DateTime.now()
          : DateTime.parse(json['sendAt']),
      createdAt: json['createdAt'] == null
          ? DateTime.now()
          : DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] == null
          ? DateTime.now()
          : DateTime.parse(json['updatedAt']),
      sender: json['sender'],
      readAt: json['readAt'] == null
          ? DateTime.now()
          : DateTime.parse(json['readAt']),
    );
  }
}

class MessageError {
  final String message;
  final int status;
  const MessageError({required this.message, required this.status});
  factory MessageError.fromJson(Map<String, dynamic> json) {
    return MessageError(message: json['message'], status: json['status']);
  }
  factory MessageError.empty() {
    return const MessageError(message: '', status: 503);
  }
}

class MessageResponse {
  final String message;
  final int status;
  final ResponseMessageSend data;
  const MessageResponse(
      {required this.message, required this.data, required this.status});
  factory MessageResponse.fromJson(Map<String, dynamic> json) {
    return MessageResponse(
        message: json['message'],
        status: json['status'],
        data: ResponseMessageSend.fromJson(json['data']));
  }
}

class MessageResponseFecth {
  final String message;
  final int status;
  final List<ResponseMessageSend> data;
  const MessageResponseFecth(
      {required this.data, required this.status, required this.message});

  factory MessageResponseFecth.fromJson(Map<String, dynamic> json) {
    return MessageResponseFecth(
      message: json['message'],
      status: json['status'],
      data: List<ResponseMessageSend>.from(
          json['data'].map((x) => ResponseMessageSend.fromJson(x))),
    );
  }
}

class ChatMessage {
  final String interlocutor;
  final String name;
  final String lastMessage;
  final DateTime updatedAt;

  const ChatMessage(
      {required this.interlocutor,
      required this.lastMessage,
      required this.name,
      required this.updatedAt});

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
        interlocutor: json['interlocutor'],
        lastMessage: json['lastMessage'],
        name: json['name'],
        updatedAt: DateTime.parse(json['updatedAt']));
  }
}

class ChatResponseFecth {
  final String message;
  final int status;
  final int page;
  final int perpage;
  final List<ChatMessage> data;
  const ChatResponseFecth(
      {required this.data,
      required this.message,
      required this.page,
      required this.perpage,
      required this.status});

  factory ChatResponseFecth.fromJson(Map<String, dynamic> json) {
    return ChatResponseFecth(
        message: json['message'],
        status: json['status'],
        page: json['page'],
        perpage: json['perpage'],
        data: List<ChatMessage>.from(
            json['data'].map((x) => ChatMessage.fromJson(x))));
  }
}
