import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:app/blocs/blot/bloc/blot_bloc.dart';
import 'package:app/configuration.dart';
import 'package:http/http.dart' as http;
import 'package:app/model/blot_response.dart';


class Blotservice {
  final storage = const FlutterSecureStorage();

  Future<Object> createBloc(BlotCreatedEvent blot) async {
    final token = await storage.read(key: 'accessToken');

    final response = await http.post(Uri.parse('$baseUrl2/blots/new'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(blot.blotEntity.toJson()));

    try {
      if (response.statusCode == 201) {
        return BlotResponse.fromJson(jsonDecode(response.body));
      } else {
        return BlotError.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      return BlotError(message: e.toString(), status: 505);
    }
  }

  Future<Object> getBlots(
      {int? perPage, int? page, required BlotFetchEvent event}) async {
    final token = await storage.read(key: 'accessToken');
    final userId = await storage.read(key: 'userId');
    Map<String, String> queryParams = {
      'perPage': event.perPage.toString(),
      'page': event.page.toString(),
      'provider': '6696b422a3938220854d4077', //event.provider.toString(),
      'consumer': userId.toString(),
      'status': event.status!,
    };

    Map<String, String> queryParams2 = {
      'perPage': event.perPage.toString(),
      'page': event.page.toString(),
      'consumer': userId.toString(),
      'status': event.status!,
    };
    if (perPage != null) queryParams['perpage'] = perPage.toString();
    if (page != null) queryParams['page'] = page.toString();

    try {
      final response = await http.get(
          Uri.parse('$baseUrl2/blots').replace(
              queryParameters:
                  event.provider == null ? queryParams : queryParams2),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          });

      if (response.statusCode == 200) {
        print(response.body);
        return BlotResponseFetch.fromJson(jsonDecode(response.body));
      } else {
        print(response.body);
        return BlotError.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
      return BlotError(message: e.toString(), status: 505);
    }
  }


Future<Object> updateStatusBlot(BlotUpdateEvent event) async {
  final token = await storage.read(key: 'accessToken');
  try {
    final response = await http.put(
      Uri.parse('$baseUrl2/blots/${event.idBlot}/status'),
      body: jsonEncode({"status": event.status}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );
    if(response.statusCode == 200){
      return BlotResponse.fromJson(jsonDecode(response.body));
    }else{
      return BlotError.fromJson(jsonDecode(response.body));
    }
  } catch (e) {
    return BlotError(message: e.toString(), status: 505);
  }
}
}