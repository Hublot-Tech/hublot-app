import 'enumeration/locale.dart';

class User {
  late String ids;
  String? fullname, email, address, password, phoneNumber;
  bool? isVerified, isOnline;
  Locale? locale;
  DateTime? createdAt;

  User(String id,String fullnamed) {
    ids = id;
    fullname = fullnamed;
  }
}
