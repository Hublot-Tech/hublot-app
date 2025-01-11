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

class ServiceProvider {
  final String fullname;
  String email;
  String phoneNumber;
  String locale;
  String address;

  String profile;
  String id;
  DateTime updatedAt;
  DateTime createdAt;

  List<String> roles;
  List<dynamic> kycImages;
  String verificationStatus;
  bool isOnline;
  bool isActive;
  bool isOTPVerified;
  String profileRef;
  int avgRating;
  ServiceItem serviceName;
  bool isSponsored;

  ServiceProvider({
    required this.fullname,
    required this.email,
    required this.phoneNumber,
    required this.locale,
    required this.kycImages,
    required this.address,
    required this.profile,
    required this.id,
    required this.updatedAt,
    required this.createdAt,
    required this.roles,
    required this.verificationStatus,
    required this.isOnline,
    required this.isActive,
    required this.isOTPVerified,
    required this.profileRef,
    required this.avgRating,
    required this.serviceName,
    required this.isSponsored,
  });

  factory ServiceProvider.fromJson(Map<String, dynamic> json) {
    return ServiceProvider(
      fullname: json['fullname'] ?? '', // Valeur par défaut si null
      email: json['email'] ?? '', // Valeur par défaut si null
      phoneNumber: json['phoneNumber'] ?? '', // Valeur par défaut si null
      locale: json['locale'] ?? 'fr', // Valeur par défaut si null
      address: json['address'] ?? '', // Valeur par défaut si null
      profile: json['profile'] ?? '', // Valeur par défaut si null
      id: json['id'] ?? '', // Valeur par défaut si null
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      roles: json['roles'] != null ? List<String>.from(json['roles']) : [],
      kycImages: json['kycImages'] != null ? json['kycImages'] : [],
      verificationStatus:
          json['verificationStatus'] ?? '', // Valeur par défaut si null
      isOnline: json['isOnline'] ?? false, // Valeur par défaut si null
      isActive: json['isActive'] ?? false, // Valeur par défaut si null
      isOTPVerified:
          json['isOTPVerified'] ?? false, // Valeur par défaut si null
      profileRef: json['profileRef'] ?? '', // Valeur par défaut si null
      avgRating: json['avgRating'] != null ? json['avgRating'] : 0,
      serviceName: json['service'] != null
          ? ServiceItem.fromJson(json['service'])
          : ServiceItem.empty(),
      isSponsored: json['isSponsored'] ?? false, // Valeur par défaut si null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'email': email,
      'phoneNumber': phoneNumber,
      'locale': locale,
      'address': address,
      'profile': profile,
      'id': id,
      'updatedAt': updatedAt.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'roles': roles,
      'verificationStatus': verificationStatus,
      'isOnline': isOnline,
      'isActive': isActive,
      'isOTPVerified': isOTPVerified,
      'profileRef': profileRef,
      'avgRating': avgRating,
      'service': serviceName,
      'isSponsored': isSponsored,
    };
  }
}

class ServiceItem {
  bool isSponsored;
  String name;
  String description;
  String category, profileRef, avgRating;

  List<String> imageRefs;
  String mainImageRef;
  DateTime updatedAt;
  DateTime createdAt;
  String id;

  ServiceItem({
    required this.isSponsored,
    required this.name,
    required this.description,
    required this.avgRating,
    required this.profileRef,
    required this.category,
    required this.imageRefs,
    required this.mainImageRef,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory ServiceItem.empty() => ServiceItem(
      isSponsored: true,
      name: '',
      description: '',
      category: '',
      profileRef: '',
      avgRating: '',
      imageRefs: [],
      mainImageRef: '',
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
      id: '');

  factory ServiceItem.fromJson(Map<String, dynamic> json) {
    return ServiceItem(
      isSponsored: json['isSponsored'],
      name: json['name'],
      description: json['description'],
      category: json['category'],
      profileRef: json['profileRef'] != null ? json['profileRef'] : '',
      avgRating: json['avgRating'] != null ? json['avgRating'] : '',
      imageRefs:
          json['imageRefs'] != null ? List<String>.from(json['imageRefs']) : [],
      mainImageRef: json['mainImageRef'],
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isSponsored': isSponsored,
      'name': name,
      'description': description,
      'category': category,
      'imageRefs': imageRefs,
      'mainImageRef': mainImageRef,
      'updatedAt': updatedAt.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'id': id,
    };
  }
}
