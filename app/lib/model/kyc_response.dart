class KycResponse {
  final int status;
  final String message;
  final KycData? data;
  const KycResponse({required this.status, required this.message, this.data});

  //method from json
  factory KycResponse.fromJson(Map<String, dynamic> json) => KycResponse(
        status: json["status"],
        message: json["message"],
        data: KycData.fromJson(json["data"]),
      );
}

//class kycFaillure
class KycError {
  final int status;
  final String message;
  const KycError({required this.status, required this.message});

  //method from json
  factory KycError.fromJson(Map<String, dynamic> json) => KycError(
        status: json["status"],
        message: json["message"],
      );
}

class KycData {
  final String? id;
  final String status;

  final String user;
  final List<String> imageRefs;
  final String? validatedBy;

  final DateTime createdAt;
  final DateTime updatedAt;
  const KycData(
      {this.id,
      required this.status,
      required this.updatedAt,
      required this.user,
      required this.imageRefs,
      this.validatedBy,
      required this.createdAt});

  //method from json
  factory KycData.fromJson(Map<String, dynamic> json) => KycData(
        id: json["id"] as String,
        status: json["status"] as String,
        user: json["user"] as String,
        updatedAt: DateTime.parse(json["updatedAt"] as String),
        imageRefs: List<String>.from(json["imageRefs"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"] as String),
      );

  //method KycData to json
  Map<String, dynamic> toJson() => <String, dynamic>{
        "id": id,
        "status": status,
        "user": user,
        "imageRefs": imageRefs,
        "validatedBy": validatedBy,
        "createdAt": createdAt.toIso8601String(),
      };
}
