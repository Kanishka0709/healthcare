import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  );

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
} 