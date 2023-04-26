import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  String userId() {
    return _auth.currentUser!.uid;
  }

  Future<bool> signUpWithGoogle() async {
    try {
      await GoogleSignIn().signOut();
      final GoogleSignInAccount? gUSer =
          await GoogleSignIn().signIn().catchError((error) => null);
      if (gUSer == null) {
        return false;
      }
      final GoogleSignInAuthentication gAuth = await gUSer.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken, idToken: gAuth.idToken);

      final userWithGivenEmail =
          await _firestoreService.getUserWithEmail(gUSer.email);
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userWithGivenEmail == null) {
        await _firestoreService.createUser(Userinfo(
            id: userCredential.user?.uid,
            name: userCredential.user?.displayName as String,
            email: userCredential.user?.email as String,
            isAdmin: false));
        print('empty');
      }

      return true;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'ERROR_USER_DISABLED':
          print('Google Sign-In error: User disabled');
          break;
        case 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL':
          print(
              'Google Sign-In error: Account already exists with a different credential.');
          break;
        case 'ERROR_INVALID_CREDENTIAL':
          print('Google Sign-In error: Invalid credential.');
          break;
        case 'ERROR_OPERATION_NOT_ALLOWED':
          print('Google Sign-In error: Operation not allowed.');
          break;
        default:
          print('Google Sign-In error');
          break;
      }
      return false;
    } catch (e) {
      print('Google Sign-In error');
      print(e);
      return false;
    }
  }

  Future<bool> signup(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();
      final List<DocumentSnapshot> documents = result.docs;

      if (documents.isEmpty) {
        UserCredential userCredential = await _signup(email, password);
        // Store additional user details in Firestore
        await _firestoreService.createUser(Userinfo(
            id: userCredential.user!.uid,
            name: name,
            email: email,
            isAdmin: false));
        print('EMail empty');
      } else {
        print('Email Not Empty');
        UserCredential userCredential = await _signup(email, password);
      }
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
