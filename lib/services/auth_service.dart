import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseAuth get auth => _auth;

  _signup(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  _signin(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  String? error;
  _error(String? e) {
    error = e;
  }

  Future<bool> signup(String email, String password) async {
    try {
      await _signup(email, password);
      return true;
    } on FirebaseAuthException catch (e) {
      _error(e.code);
      return false;
    }
  }

  Future<bool> signin(String email, String password) async {
    try {
      await _signin(email, password);
      return true;
    } on FirebaseAuthException catch (e) {
      _error(e.code);
      return false;
    }
  }
}
