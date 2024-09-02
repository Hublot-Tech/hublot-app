// ignore_for_file: prefer_typing_uninitialized_variables

final class SuccessAuth {
  final String? accessToken;
  final String? refreshToken;
  final String message;
  final int status;
  const SuccessAuth(
      {this.accessToken,
      this.refreshToken,
      required this.message,
      required this.status});

  factory SuccessAuth.empty() {
    return const SuccessAuth(
      accessToken: '',
      message: '',
      status: 200,
    );
  }

  factory SuccessAuth.fromJson(Map<String, dynamic> json) {
    return SuccessAuth(
        refreshToken: json['refreshToken'] as String?,
        accessToken: json['accessToken'] as String,
        message: json['message'] as String,
        status: json['status'] as int);
  }
}

final class ErrorAuth {
  final String message;
  final int status;
  const ErrorAuth({required this.message, required this.status});

  factory ErrorAuth.empty() {
    return const ErrorAuth(
      message: '',
      status: 500,
    );
  }

  factory ErrorAuth.fromJson(Map<String, dynamic> json) {
    return ErrorAuth(
        message: json['message'][0] as String,
        status: json['statusCode'] as int);
  }
}

final class ErrorOPTAuth {
  final String message;
  final int status;
  const ErrorOPTAuth({required this.message, required this.status});

  factory ErrorOPTAuth.empty() {
    return const ErrorOPTAuth(
      message: '',
      status: 500,
    );
  }

  factory ErrorOPTAuth.fromJson(Map<String, dynamic> json) {
    return ErrorOPTAuth(
        message: json['message'] as String, status: json['statusCode'] as int);
  }
}

class UserProfile {
  final user;
  const UserProfile({required this.user});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    // print(json['data']);

    return UserProfile(user: json['data']);
  }
}
