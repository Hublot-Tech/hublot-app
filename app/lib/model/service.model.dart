import 'user.model.dart';

class Service {
  final String name;
  final String description;
  final String? id;
  final String category;
  final String provider;
  final String mainImageRef;
  final DateTime updatedAt;
  final DateTime createdAt;
  final DateTime deleteAt;
  final String availability;

  Service({
    required this.name,
    this.id,
    required this.description,
    required this.category,
    required this.deleteAt,
    required this.provider,
    required this.mainImageRef,
    required this.updatedAt,
    required this.createdAt,
    required this.availability,
  });

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'category': category,
      'provider': provider,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'deleteAt': deleteAt.millisecondsSinceEpoch,
      'availability': availability,
      'mainImageRef': mainImageRef,
    };
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      id: map['id'] as String?,
      name: map['name'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      provider: map['provider'] as String,
      updatedAt: map['updatedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int)
          : DateTime.now(),
      createdAt: map["createdAt"] != null
          ? DateTime.fromMillisecondsSinceEpoch(map["createdAt"] as int)
          : DateTime.now(),
      deleteAt: map['deletedAt'] != null
          ? DateTime.fromMicrosecondsSinceEpoch(map['deletedAt'] as int)
          : DateTime.now(),
      availability: map['availability'] as String,
      mainImageRef: map['mainImageRef'],
    );
  }

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      name: json['name'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      provider: json['provider'] as String,
      id: json['id'] as String?,
      updatedAt: json['updatedAt'] != null
          ? DateTime.now()
          : DateTime.now(), //A GERER PLUS TARD
      createdAt: json["createdAt"] != null
          ? DateTime.now()
          : DateTime.now(), //A GERER PLUS TARD
      deleteAt: json['deleteAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['deletedAt'] as int)
          : DateTime.now(),
      availability: json['availability'] != null ? '' : 'availability',
      mainImageRef: json['mainImageRef'] ?? 'mainImageRef',
    );
  }

  factory Service.isEmpy() {
    return Service(
        name: '',
        description: '',
        category: '',
        deleteAt: DateTime.now(),
        provider: '',
        mainImageRef: '',
        updatedAt: DateTime.now(),
        createdAt: DateTime.now(),
        availability: '');
  }
}

class ServiceDetails {
  final String name;
  final String description, availability;
  final DateTime updatedAt, createdAt, deletedAt;
  final String category, place;
  final List<String> imageRefs;
  final String? mainImageRef, id;
  final List<String> offers;
  final User provider;

  ServiceDetails({
    required this.name,
    required this.place,
    required this.description,
    required this.updatedAt,
    required this.category,
    required this.imageRefs,
    this.mainImageRef,
    this.id,
    required this.deletedAt,
    required this.availability,
    required this.createdAt,
    required this.offers,
    required this.provider,
  });

  factory ServiceDetails.fromJson(Map<String, dynamic> json) {
    return ServiceDetails(
      name: json['name'] as String,
      place: json['place'] != null ? json['place'] as String : '',
      description: json['description'] as String,
      id: json['id'] != null ? json['id'] : "",
      createdAt: json["createdAt"] != null ? DateTime.now() : DateTime.now(),
      updatedAt: json['updatedAt'] != null ? DateTime.now() : DateTime.now(),
      deletedAt: json['deletedAt'] != null ? DateTime.now() : DateTime.now(),
      availability: json['availability'] != null ? json['availability'] : '',
      // updatedAt: DateTime.parse(json['updatedAt'] as String),
      category: json['category'] as String,
      imageRefs: List<String>.from(json['imageRefs'] as List<dynamic>),

      mainImageRef: json['mainImageRef'] as String?,
      offers: json['offers'] != null
          ? List<String>.from(json['offers'] as List<dynamic>)
          : [],
      // provider: User.empty(),
      provider: User.fromJson(json['provider'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'updatedAt': updatedAt.toIso8601String(),
      'category': category,
      'imageRefs': imageRefs,
      'mainImageRef': mainImageRef,
      'id': id,
      'deletedAt': deletedAt.toIso8601String(),
      'availability': availability,
      'createdAt': createdAt.toIso8601String(),
      'offers': offers,
      'provider': provider.toJson(),
    };
  }

  factory ServiceDetails.isEmpy() {
    return ServiceDetails(
      name: '',
      place: '',
      availability: '',
      description: '',
      category: '',
      provider: User.empty(),
      mainImageRef: '',
      updatedAt: DateTime.now(),
      deletedAt: DateTime.now(),
      createdAt: DateTime.now(),
      imageRefs: [],
      offers: [],
    );
  }
}
