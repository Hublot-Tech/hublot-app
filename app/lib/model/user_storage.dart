import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  Future<void> storeUserData(String userId, String verificationStatus,
      String email, String name) async {
    await storage.write(key: 'userId', value: userId);
    await storage.write(key: 'verificationStatus', value: verificationStatus);
    await storage.write(key: 'email', value: email);
    await storage.write(key: 'name', value: name);
  }

  //recuperer tous les informations de l'utilisateur
  Future<Map<String, String>> getUserData() async {
    Map<String, String> userData = <String, String>{};
    userData['userId'] = await storage.read(key: 'userId') ?? '';
    userData['verificationStatus'] =
        await storage.read(key: 'verificationStatus') ?? '';
    userData['email'] = await storage.read(key: 'email') ?? '';
    userData['name'] = await storage.read(key: 'name') ?? '';
    return userData;
  }

  //supprimer tous les informations de l'utilisateur
  Future<void> deleteUserData() async {
    await storage.deleteAll();
  }
}
