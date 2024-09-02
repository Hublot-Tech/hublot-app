import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:app/blocs/kyc/bloc/kyc_bloc.dart';
import 'package:app/model/kyc_response.dart';
import 'package:app/configuration.dart';
class KycService {
  
  Future<Object> submitKyc(KycSubmitted event) async {
    //String apiUrl = '$baseUrl/kyc/submit';
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'accessToken'); //
    final uri = Uri.parse('$baseUrl/kyc/submit');
    var request = http.MultipartRequest('POST', uri);

    for (var file in event.files) {
      var multipartFile = await http.MultipartFile.fromPath(
        'kycFiles',
        file.path,
      );

      request.files.add(multipartFile);
    }
    request.headers['Authorization'] = 'Bearer $token';
    try {
      var response = await request.send();

      var responseString = await response.stream.bytesToString();
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(responseString);
        final data = KycResponse.fromJson(
            jsonDecode(responseString) as Map<String, dynamic>);
        return data;
      } else {
        final error = KycError.fromJson(
            jsonDecode(responseString) as Map<String, dynamic>);
        return error;
      }
    } catch (e) {
      // Gère les erreurs
      print(e);
      return KycError(
          message: 'Erreur lors de la soumission du KYC : $e', status: 505);
    }
  }
}
