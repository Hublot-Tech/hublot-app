import 'package:app/model/blot_entity.dart';

class BlotResponse {
  final String message;
  final int status;
  final Blot data;
  const BlotResponse(
      {required this.message, required this.status, required this.data});

  //factory BlotResponse fromJson
  factory BlotResponse.fromJson(Map<String, dynamic> json) => BlotResponse(
        message: json['message'],
        status: json['status'],
        data: Blot.fromJson(json['data']),
      );

  //toJson
  Map<String, dynamic> toJson() => {
        'message': message,
        'status': status,
        'data': data.toJson(),
      };
}

class BlotResponseFetch {
  final String message;
  final int status, perpage, page;
  final List<Blot> data;
  const BlotResponseFetch(
      {required this.message,
      required this.status,
      required this.perpage,
      required this.page,
      required this.data});

  //factory BlotResponseFetch fromJson
  factory BlotResponseFetch.fromJson(Map<String, dynamic> json) =>
      BlotResponseFetch(
          message: json['message'],
          status: json['status'],
          perpage: json['perpage'],
          page: json['page'],
          data: List<Blot>.from(json['data'].map((x) => Blot.fromJson(x))));

  Map<String, dynamic> toJson() => {
        'message': message,
        'status': status,
        'perpage': perpage,
        'page': page,
        'data': List<dynamic>.from(data.map((x) => x.toJson()))
      };
}

class BlotError {
  final String message;
  final int status;
  const BlotError({required this.message, required this.status});
  //factory BlotError fromJson
  factory BlotError.fromJson(Map<String, dynamic> json) =>
      BlotError(message: json['message'], status: json['statusCode']);
}
