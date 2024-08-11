import 'package:app/model/offer_model.dart';

final class SuccessOfferCreation {
  final int status;
  final String message;
  final OfferDetails data;
  SuccessOfferCreation(
      {required this.status, required this.message, required this.data});

  factory SuccessOfferCreation.empty() {
    return SuccessOfferCreation(
      status: 200,
      message: ' ',
      data: OfferDetails.isEmpty(),
    );
  }

  factory SuccessOfferCreation.fromJson(Map<String, dynamic> json) {
    return SuccessOfferCreation(
      status: json['status'],
      message: json['message'],
      data: OfferDetails.fromJson(json['data']
          as Map<String, dynamic>), //(json['data'] as List<dynamic>?)
      //         ?.map(
      //             (item) => OfferDetails.fromJson(item as Map<String, dynamic>))
      //         .toList() ??
      //     [],
    );
  }
}

final class SuccessOfferFeching {
  final int status;
  final String message;
  final List<OfferDetails> data;
  SuccessOfferFeching(
      {required this.status, required this.message, required this.data});

  factory SuccessOfferFeching.empty() {
    return SuccessOfferFeching(
      status: 200,
      message: ' ',
      data: [],
    );
  }

  factory SuccessOfferFeching.fromJson(Map<String, dynamic> json) {
    return SuccessOfferFeching(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List<dynamic>?)
              ?.map(
                  (item) => OfferDetails.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

final class FailureOfferCreation {
  final int status;
  final String message;
  FailureOfferCreation({required this.status, required this.message});

  factory FailureOfferCreation.empty() {
    return FailureOfferCreation(
      status: 400,
      message: ' ',
    );
  }
  factory FailureOfferCreation.fromJson(Map<String, dynamic> json) {
    return FailureOfferCreation(
      status: json['status'],
      message: json['message'],
    );
  }
}
