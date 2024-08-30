import 'package:app/model/service.model.dart';

final class SuccessServiceCreation {
  final String message;
  final int? status;
  final Service data;
  const SuccessServiceCreation(
      {required this.message, required this.data, required this.status});

  factory SuccessServiceCreation.empty() {
    return SuccessServiceCreation(
      data: Service.isEmpy(),
      message: '',
      status: 201,
    );
  }

  factory SuccessServiceCreation.fromJson(Map<String, dynamic> json) {
    return SuccessServiceCreation(
      message: json['message'] ?? 'succes',
      status: json['status'] ?? 201,
      data: Service.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

final class ErrorServiceCreation {
  final String message;
  final int status;
  const ErrorServiceCreation({required this.message, required this.status});

  factory ErrorServiceCreation.empty() {
    return const ErrorServiceCreation(
      message: 'erreur les',
      status: 500,
    );
  }

  factory ErrorServiceCreation.fromJson(Map<String, dynamic> json) {
    String message;
    if (json['message'] is List) {
      message = (json['message'] as List).join(', ');
    } else {
      message = json['message'] as String? ?? 'unexpected error';
    }

    return ErrorServiceCreation(
      message: message,
      status: json['status'] as int? ?? 500,
    );
  }
}

final class ErrorServiceFetching extends ErrorServiceCreation {
  ErrorServiceFetching({required super.message, required super.status});
  factory ErrorServiceFetching.fromJson(Map<String, dynamic> json) {
    String message;
    if (json['message'] is List) {
      message = (json['message'] as List).join(', ');
    } else {
      message = json['message'] as String? ?? 'unexpected error';
    }

    return ErrorServiceFetching(
      message: message,
      status: json['status'] as int? ?? 500,
    );
  }
}

final class SuccessServiceFetchingById {
  final String message;
  final int? status;
  final ServiceDetails data;
  SuccessServiceFetchingById(
      {required this.message, required this.data, required this.status});
  factory SuccessServiceFetchingById.empty() {
    return SuccessServiceFetchingById(
      data: ServiceDetails.isEmpy(),
      message: '',
      status: 201,
    );
  }

  factory SuccessServiceFetchingById.fromJson(Map<String, dynamic> json) {
    return SuccessServiceFetchingById(
      message: json['message'] as String,
      status: json['status'],
      data: ServiceDetails.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

final class SuccessServiceFetching {
  final String message;
  final int? status, perpage, page;
  final List<Service> data;
  SuccessServiceFetching(
      {required this.message,
      required this.page,
      required this.perpage,
      required this.data,
      required this.status});
  factory SuccessServiceFetching.empty() {
    return SuccessServiceFetching(
      data: [],
      perpage: 0,
      page: 0,
      message: '',
      status: 201,
    );
  }

  factory SuccessServiceFetching.fromJson(Map<String, dynamic> json) {
    return SuccessServiceFetching(
      message: json['message'],
      status: json['status'],
      perpage: json['perpage'],
      page: json['page'],
      data: (json['data'] as List<dynamic>?)
              ?.map((item) => Service.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}


final class SuccessProviderFetching {
  final String message;
  final int? status, perpage, page;
  final List<ServiceProvider> data;
  SuccessProviderFetching(
      {required this.message,
      required this.page,
      required this.perpage,
      required this.data,
      required this.status});
  factory SuccessProviderFetching.empty() {
    return SuccessProviderFetching(
      data: [],
      perpage: 0,
      page: 0,
      message: '',
      status: 201,
    );
  }

  factory SuccessProviderFetching.fromJson(Map<String, dynamic> json) {
    return SuccessProviderFetching(
      message: json['message'],
      status: json['status'],
      perpage: json['perpage'],
      page: json['page'],
      data: (json['data'] as List<dynamic>?)
              ?.map((item) => ServiceProvider.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
