class User {
  User({
    required this.fullname,
    this.id,
    this.isOnline,
    required this.phoneNumber,
    required this.locale,
    this.roles,
    required this.address,
    this.verificationStatus,
    this.isOTPVerified,
    this.isActive,
    required this.email,
    this.accessToken,
    this.refreshToken,
    this.createdAt,
    required this.password,
    this.profilRef,
  });

  final String fullname;
  final String? id;
  final String locale;
  final List<String>? roles;
  final String address;
  final String? verificationStatus;
  final bool? isOTPVerified;
  final bool? isActive;
  final bool? isOnline;

  final String phoneNumber;
  final String? email;
  final String? accessToken;
  final String? refreshToken, profilRef;
  final DateTime? createdAt;
  final String password;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullname': fullname,
      'locale': locale,
      'address': address,
      'phoneNumber': phoneNumber,
      "email": email,
      "password": password,
    };
  }

  factory(Map<String, dynamic> map) {
    return User(
      fullname: map['fullname'] as String,
      id: map['id'],
      profilRef: map['profilRef'],
      locale: map['locale'] as String,
      roles: map['roles'] as List<String>,
      address: map['address'] as String,
      verificationStatus: map['veificationStatus'] as String,
      isOTPVerified: map['isOTPVerified'] as bool,
      isActive: map['isActive'] as bool,
      isOnline: map['isOnline'] as bool,
      phoneNumber: map['phoneNumber'] as String,
      email: map["email"],
      accessToken: map["accessToken"],
      createdAt: map["createdAt"] != null
          ? DateTime.fromMillisecondsSinceEpoch(map["createdAt"] as int)
          : DateTime.now(),
      password: map["password"] as String,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        fullname: json['fullname'] as String,
        email: json['email'] as String,
        phoneNumber: json['phoneNumber'] as String,
        locale: json['locale'] as String,
        roles: List<String>.from(json['roles'] as List<dynamic>),
        address: json['address'] as String,
        verificationStatus: json['verificationStatus'] != null
            ? json['verificationStatus']
            : '',
        isOnline: json['isOnline'] as bool,
        isActive: json['isActive'] as bool,
        isOTPVerified: json['isOTPVerified'] as bool,
        accessToken: json['accessToken'] as String?,
        refreshToken: json['refreshToken'] as String?,
        id: json['id'],
        createdAt: DateTime.now(),
        password: '',
        profilRef: json['profilRef'] != null ? json['profilRef'] : '');
  }
  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      "email": email,
      'phoneNumber': phoneNumber,
      'locale': locale,
      'address': address,
      "password": password,
    };
  }

  factory User.empty() {
    return User(
      fullname: '',
      email: '',
      profilRef: '',
      isOnline: false,
      phoneNumber: '',
      createdAt: DateTime.now(),
      password: '',
      locale: '',
      roles: [],
      address: '',
      verificationStatus: '',
      isOTPVerified: false,
      isActive: false,
    );
  }

  factory User.copyWith(User user) {
    return User(
      fullname: user.fullname,
      email: user.email,
      id: user.id,
      locale: user.locale,
      roles: user.roles,
      address: user.address,
      verificationStatus: user.verificationStatus,
      isOTPVerified: user.isOTPVerified,
      isActive: user.isActive,
      isOnline: user.isOnline,
      phoneNumber: user.phoneNumber,
      createdAt: user.createdAt,
      password: user.password,
      profilRef: user.profilRef,
    );
  }

  Map<String, dynamic> authCredentiel(User user) {
    return {
      'email': user.email,
      'password': user.password,
    };
  }

  bool isSamePhoneNumber(String otherPhoneNumber) {
    return phoneNumber == otherPhoneNumber;
  }

  String get phoneNumberWithoutPlus => phoneNumber.substring(1);
}
