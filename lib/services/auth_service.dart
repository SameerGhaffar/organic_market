import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/model/user.dart';
import 'package:organic_market/services/firestore_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _firestoreService = locator<FireStoreService>();

  FirebaseAuth get auth => _auth;

  String? error;

  _error(String? e) {
    error = e;
  }

  Future<bool> signup(
      {required String email,
      required String password,
      required String name}) async {
    try {
      UserCredential userCredential = await _signup(email, password);
      // Store additional user details in Firestore
      await _firestoreService.createUser(Userinfo(
          id: userCredential.user!.uid,
          name: name,
          email: email,
          isAdmin: false));

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
      debugPrint(e.toString());
    }
  }

  Future<bool> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (e) {
      _error(e.code);
      return false;
    }
  }

  Future<UserCredential> _signup(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  _signin(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }
}
