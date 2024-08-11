import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as _httpClient;
import 'package:app/blocs/auth/auth_form_event.dart';
import 'package:app/model/auth_response.dart';
import 'package:app/model/register_response.dart';

class AuthService {
  // final String token =
  //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Imdlcm1jdkBnbWFpbC5jb20iLCJzdWIiOiI2NjliOWYyZmNjY2U0NGMyOWM1M2U1YjQiLCJ0eXBlIjoiYWNjZXNzX3Rva2VuIiwiaWF0IjoxNzIxNDc0ODYzLCJleHAiOjE3MjE1NjEyNjN9.R6lc-yEK_xQMT_n-mMH4eaOmBKN-kZq7obDkyqLtohM";

  static final host =
      Uri.parse('https://hublots-api-8c97109dc203.herokuapp.com/api');

  Future<Object> register(AuthCreateUserEvent data) async {
    final response = await _httpClient.post(Uri.parse('$host/auth/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data.user.toJson()));
    try {
      print(jsonEncode(data.user.toJson()));
      if (response.statusCode == 201) {
        print(response.body);
        late final data = RegisterResponse.fromJson(jsonDecode(response.body));
        return data;
      } else {
        print(response.body);
        return ErrorAuth.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e.toString());
      return ErrorAuth(message: e.toString(), status: 505);
    }
  }

  Future<Object> login(AuthSignEmailAndPasswordEvent data) async {
    final response = await _httpClient.post(
      Uri.parse('$host/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'password': data.password, 'email': data.email}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      late final data = SuccessAuth.fromJson(jsonDecode(response.body));
      late final user = getCurrentUsers();
      print(user);
      return data;
    } else {
      return ErrorAuth.fromJson(jsonDecode(response.body));
    }
  }

  Future<bool> tryRefreshToken() async {
    final storage = FlutterSecureStorage();
    final refreshToken = await storage.read(key: 'refreshToken');

    if (refreshToken == null) {
      // Aucun refresh token disponible : échec du rafraîchissement
      return false;
    }

    try {
      final response = await _httpClient.post(
        Uri.parse('$host/auth/refresh-token'), // Remplace par ton endpoint
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'refreshToken': refreshToken}),
      );
      print(response.body);
      print(refreshToken);
      if (response.statusCode == 201) {
        // Rafraîchissement réussi : mets à jour l'access token
        final responseData = jsonDecode(response.body);
        final newAccessToken = responseData['accessToken'];
        final newRefreshToken = responseData['refreshToken'];
        await storage.write(key: 'accessToken', value: newAccessToken);
        await storage.write(key: 'refreshToken', value: newRefreshToken);
        await saveTokenAndExpiry(newAccessToken, newRefreshToken, 24);
        return true;
      } else {
        // Échec du rafraîchissement
        // Gère les erreurs du backend si nécessaire (ex: déconnexion si le refresh token est invalide)
        print(
            'Erreur lors du rafraîchissement du token : ${response.statusCode}');
        return false;
      }
    } catch (e) {
      // Erreur réseau ou autre
      print('Erreur lors du rafraîchissement du token : $e');
      return false;
    }
  }

  Future<void> saveTokenAndExpiry(
      String accessToken, String refreshToken, int expiresIn) async {
    final storage = FlutterSecureStorage();
    final expiryDate = DateTime.now().add(Duration(hours: expiresIn));

    await storage.write(key: 'accessToken', value: accessToken);
    await storage.write(key: 'refreshToken', value: refreshToken);
    await storage.write(
        key: 'tokenExpiry', value: expiryDate.toIso8601String());
  }

  Future<Object> getCurrentUsers() async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'accessToken');
    try {
      final request = await _httpClient.get(
        Uri.parse('$host/users/profile'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
      );

      if (request.statusCode == 200 || request.statusCode == 201) {
        final data = RegisterResponse.fromJson(jsonDecode(request.body));

        return data;
      } else {
        return ErrorAuth.fromJson(jsonDecode(request.body));
      }
    } catch (e) {
      print(e);
      return ErrorAuth(message: e.toString(), status: 500);
    }
  }

  //endpoint otp/send pour demander le code otp
  Future<Object> reSendOtp(AuthSendOTPEvent event) async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'accessToken');
    try {
      final request = await _httpClient.post(Uri.parse('$host/otp/send'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode({'phoneNumber': event.phoneNumber}));
      if (request.statusCode == 204) {
        return SuccessAuth(message: request.reasonPhrase!, status: 204);
      } else {
        print(request.body);
        return ErrorAuth.fromJson(jsonDecode(request.body));
      }
    } catch (e) {
      print(e.toString);
      return ErrorAuth(message: e.toString(), status: 500);
    }
  }

  //endpoint opt/verify pour verifier le code otp
  Future<Object> verifyOtp(AuthVerifyOTPEvent event) async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'accessToken');
    try {
      final request = await _httpClient.post(Uri.parse('$host/otp/verify'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          },
          body:
              jsonEncode({'phoneNumber': event.phoneNumber, 'otp': event.otp}));
      if (request.statusCode == 204) {
        return SuccessAuth(message: request.reasonPhrase!, status: 204);
      } else {
        print(jsonDecode(request.body));
        return ErrorOPTAuth.fromJson(jsonDecode(request.body));
      }
    } catch (e) {
      return ErrorAuth(message: e.toString(), status: 500);
    }
  }
}
