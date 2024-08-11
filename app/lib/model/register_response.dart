import 'package:app/model/user.model.dart';

final class RegisterResponse {
  final String message;
  final int status;
  final User data;
  RegisterResponse(
      {required this.message, required this.status, required this.data});

  // factory constructor to convert JSON to RegisterResponse object
  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
          message: json["message"],
          status: json["status"],
          data: User.fromJson(json["data"]));

  // factory constructor RegisterResponse isEmpty
  factory RegisterResponse.isEmpty() {
    return RegisterResponse(message: '', status: 404, data: User.empty());
  }
}

// final class ErrorResponse
final class ErrorRegister {
  final String message;
  final int status;
  ErrorRegister({required this.message, required this.status});
  //factory constructor to convert JSON to ErrorResponse object
  factory ErrorRegister.fromJson(Map<String, dynamic> json) {
    return ErrorRegister(message: json["message"], status: json["status"]);
  }

  //factory constructor ErrorResponse isEmpty
  factory ErrorRegister.isEmpty() => ErrorRegister(message: '', status: 404);
}
