import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  AuthService._();
  static final AuthService _instance = AuthService._();
  factory AuthService() => _instance;

  Future<bool> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  bool checkLogin() {
    return _auth.currentUser != null;
  }

  String? getUid() {
    return _auth.currentUser?.uid;
  }
}
