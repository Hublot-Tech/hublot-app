import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:app/blocs/service/bloc/service_bloc.dart';
import 'package:app/model/offer_response.dart';
import 'package:app/model/service_response.dart';
import 'package:app/configuration.dart';

class ApiService {
  // final String token =
  //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Imdlcm1jdkBnbWFpbC5jb20iLCJzdWIiOiI2NmFiNjAxZjcwMzcxMjJiMjgyNWYwMTkiLCJ0eXBlIjoiYWNjZXNzX3Rva2VuIiwiaWF0IjoxNzIyNTA3Mjk1LCJleHAiOjE3MjI1OTM2OTV9.fIeSkQ25jFM9RoPnxDg1nGz9c3uWlAKngqL2ZvaP8qA";

  // Future<Object> createService(CreateServiceEvent serviceCreated) async {
  //   const storage = FlutterSecureStorage();
  //   final token = await storage.read(key: 'accessToken'); //
  //   try {
  //     final uri = Uri.parse('$baseUrl2/services/new');
  //     final request = http.MultipartRequest('POST', uri);
  //     request.headers['Authorization'] = 'Bearer $token';
  //     request.fields['name'] = serviceCreated.service.name;
  //     request.fields['description'] = serviceCreated.service.description;
  //     request.fields['category'] = serviceCreated.service.category;
  //     request.fields['provider'] = serviceCreated.service.provider;
  //     request.files.add(
  //         await http.MultipartFile.fromPath('file', serviceCreated.file.path));
  //     final response = await request.send();

  //     final responseData = await response.stream.bytesToString();
  //     final jsonResponse = jsonDecode(responseData);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       late final data = //SuccessServiceCreation.empty();
  //           SuccessServiceCreation.fromJson((jsonResponse));
  //       return data;
  //     } else {
  //       return ErrorServiceCreation(
  //           message: jsonResponse.toString(),
  //           status:
  //               500); //ErrorServiceCreation.fromJson(jsonDecode(jsonResponse));
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //     return ErrorServiceCreation(message: e.toString(), status: 500);
  //   }
  // }

  Future<Object> getServiceById(String serviceId) async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'accessToken');
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/services/$serviceId'), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data =
            SuccessServiceFetchingById.fromJson(jsonDecode(response.body));

        return data;
      } else {
        return ErrorServiceFetching.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      return ErrorServiceFetching(message: e.toString(), status: 500);
    }
  }

  Future<Object> getOffersById(String serviceId) async {
    try {
      const storage = FlutterSecureStorage();
      final token = await storage.read(key: 'accessToken');
      final response = await http
          .get(Uri.parse('$baseUrl/services/$serviceId/offers'), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = SuccessOfferFeching.fromJson(jsonDecode(response.body));

        return data;
      } else {
        return ErrorServiceFetching.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      return ErrorServiceFetching(message: e.toString(), status: 506);
    }
  }

  Future<Object> getAllServices({FetchServicesEvent? event}) async {
    try {
      const storage = FlutterSecureStorage();
      final token = await storage.read(key: 'accessToken');
      final response = await http.get(
          Uri.parse('$baseUrl/services').replace(
            queryParameters: {
              'perpage': event!.perPage.toString(),
              'page': event.page.toString(),
              if (event.longitude != null)
                'longitude': event.longitude.toString(),
              if (event.latitude != null) 'latitude': event.latitude.toString(),
              if (event.placeName != null) 'placeName': event.placeName,
              if (event.maxDistance != null) 'maxDistance': event.maxDistance,
              if (event.createdBy != null) 'createdBy': event.createdBy,
              if (event.provider != null) 'provider': event.provider,
              if (event.category != null) 'category': event.category,
              if (event.keywords != null) 'keywords': event.keywords,
            },
          ),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          });

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = SuccessServiceFetching.fromJson(jsonDecode(response.body));
        return data;
      } else {
        return ErrorServiceFetching.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      return ErrorServiceFetching(message: e.toString(), status: 0);
    }
  }

  Future<Object> getAllProvider({FetchProviderServicesEvent? event}) async {
    try {
      const storage = FlutterSecureStorage();
      final token = await storage.read(key: 'accessToken');
      final response = await http.get(
          Uri.parse('$baseUrl/services/providers').replace(
            queryParameters: {
              'perpage': event!.perPage.toString(),
              'page': event.page.toString(),
              if (event.longitude != null)
                'longitude': event.longitude.toString(),
              if (event.latitude != null) 'latitude': event.latitude.toString(),
              if (event.placeName != null) 'placeName': event.placeName,
              if (event.maxDistance != null) 'maxDistance': event.maxDistance,
              if (event.createdBy != null) 'createdBy': event.createdBy,
              if (event.provider != null) 'provider': event.provider,
              if (event.category != null) 'category': event.category,
              if (event.keywords != null) 'keywords': event.keywords,
            },
          ),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          });

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(jsonDecode(response.body));
        final data =
            SuccessProviderFetching.fromJson(jsonDecode(response.body));
        return data;
      } else {
        return ErrorServiceFetching.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      
      return ErrorServiceFetching(message: e.toString(), status: 0);
    }
  }
}
