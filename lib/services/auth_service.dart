import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static Future<void> register({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}