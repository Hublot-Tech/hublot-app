import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInAPi {
  static final _googleSign = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => _googleSign.signIn();
  static Future<GoogleSignInAccount?> signOut() => _googleSign.signOut();
}
