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

  Future<bool> isUserLoggedIn() async {
    var user = _auth.currentUser;
    return user != null;
  }

  // Stream<bool> get emailVerifiedChanges =>
  //     _auth.authStateChanges().map((user) => user?.emailVerified ?? false);

  Future<void> sendEmailVerification() async {
    User? user = _auth.currentUser;
    await user?.sendEmailVerification();
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
