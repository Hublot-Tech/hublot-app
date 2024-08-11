final class SuccessFile {
  final String message;
  final int status;

  const SuccessFile({required this.message, required this.status});

  factory SuccessFile.empty() => const SuccessFile(message: '', status: 200);

  factory SuccessFile.fromJson(Map<String, dynamic> json) =>
      SuccessFile(message: json['message'], status: json['status']);
}

final class ErrorFile {
  final String message;
  final int status;
  const ErrorFile({required this.message, required this.status});

  factory ErrorFile.empty() => const ErrorFile(message: '', status: 400);
  
  factory ErrorFile.fromJson(Map<String, dynamic> json) =>
      ErrorFile(message: json['message'], status: json['status']);
}
