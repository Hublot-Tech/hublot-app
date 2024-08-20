import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:app/blocs/message/bloc/chat_bloc.dart';
import 'package:app/configuration.dart';
import 'package:http/http.dart' as http;
import 'package:app/model/message_detail.dart';

class Chatservice {
  final storage = const FlutterSecureStorage();

  Future<Object> sendMessage(ChatSendMessageEvent event) async {
    final apiUrl = '$baseUrl2/chats/messages/new';

    final uri = Uri.parse(apiUrl);
    var request = http.MultipartRequest('POST', uri);
    // Ajoute le
    //add token to request
    final token = await storage.read(key: 'accessToken');
    request.headers['Authorization'] = 'Bearer $token';
    request.fields['contentType'] = event.message.contentType;
    
    // Ajoute le contenu du message en fonction du type
    if (event.message.contentType == 'text') {
      request.fields['content'] = event.message.content!;
     
    } else if (event.message.contentType == 'blot' ||
        event.message.contentType == 'order') {
      request.fields['content'] = event.message.content!;
      request.fields['resource'] = event.message.resource!;
      // File placeholderFile = File('D:/outputs.png');
      // var multipartFile = await http.MultipartFile.fromPath(
      //   'file', // Nom du champ attendu par l'API
      //   placeholderFile.path,
      // );
      // print('file');
      // request.files.add(multipartFile);
    }
    // Ajoute le destinataire
    request.fields['receiver'] = event.message.receiver!;
    print(event.message.receiver);
    // Ajoute le fichier si présent
    if (event.message.file != null) {
      var multipartFile = await http.MultipartFile.fromPath(
        'file', // Nom du champ attendu par l'API
        event.message.file!.path,
      );
      print('file');
      request.files.add(multipartFile);
    }
    try {
      var response = await request.send();

      if (response.statusCode == 201) {
        // Succès !
        
        var responseString = await response.stream.bytesToString();
        ;
        return MessageResponse.fromJson(jsonDecode(responseString));
      } else {
        // Gère les erreurs (codes d'état autres que 200)
        
        var responseString = await response.stream.bytesToString();
        
        return MessageError.fromJson(jsonDecode(responseString));
      }
    } catch (e) {
      // Gère les erreurs (ex: pas de connexion internet)
      
      return MessageError(message: e.toString(), status: 550);
    }
  }

  Future<Object> receiveMessage(
      {int? perPage, int? page, required ChatFetchMessageEvent event}) async {
    //add token to request
    final token = await storage.read(key: 'accessToken');
    final idUser = await storage.read(key: 'userId');
    final List<String> interculators = [idUser!, event.interculators];
    
    final queryParams = {
      'perpage': perPage.toString(),
      'page': page.toString(),
      'interlocutors': interculators // Encode le tableau en JSON
    };

     
    final apiUrl = '$baseUrl/chats/messages';
    final uri = Uri.parse(apiUrl).replace(queryParameters: queryParams);
    try {
      final response = await http.get(
        uri,
        headers: <String, String>{'Authorization': 'Bearer $token'},
      );
      print(response.reasonPhrase);
      print(response.body);
      if (response.statusCode == 200) {
        // Décode la réponse JSON et crée une liste de messages
        return MessageResponseFecth.fromJson(jsonDecode(response.body));
      } else {
        // Gère les erreurs
        return MessageError.fromJson(jsonDecode(response.body));
        // throw Exception('Erreur lors de la récupération des messages');
      }
    } catch (e) {
      print(e.toString());
      return MessageError.fromJson(jsonDecode(e.toString()));
    }
  }

  Future<Object> receiveAllChat() async {
    final token = await storage.read(key: 'accessToken');
    final apiUrl = '$baseUrl/chats';
    final uri = Uri.parse(apiUrl);
    try {
      final response = await http.get(
        uri,
        headers: <String, String>{'Authorization': 'Bearer $token'},
      );
     
      if (response.statusCode == 200) {
        
        return ChatResponseFecth.fromJson(jsonDecode(response.body));
      } else {
        return MessageError.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      return MessageError.fromJson(jsonDecode(e.toString()));
    }
  }
}
