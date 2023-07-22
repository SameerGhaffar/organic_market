import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/model/user.dart';
import 'package:organic_market/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

class AuthService with ListenableServiceMixin {
  final _firestoreService = locator<FireStoreService>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuth get auth => _auth;

  String? error;

  ///A Function to that set error msg on 'error' in auth
  _error(String? e) {
    error = e;
  }

  String userId() {
    return _auth.currentUser!.uid;
  }

  /// A Function to SignIN User from google
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
        Userinfo user = Userinfo(
            id: userCredential.user?.uid,
            name: userCredential.user?.displayName as String,
            email: userCredential.user?.email as String,
            isAdmin: false);
        await _firestoreService.createUser(user);
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
    } on PlatformException catch (e) {
      _error(e.message);
      print(e);
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  ///SignUp with email and password
  Future<bool> signup(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final userWithGivenEmail =
          await _firestoreService.getUserWithEmail(email);
      UserCredential userCredential = await _signup(email, password);

      if (userWithGivenEmail == null) {
        Userinfo user = Userinfo(
            id: userCredential.user?.uid,
            name: name,
            email: userCredential.user?.email as String,
            isAdmin: false);
        await _firestoreService.createUser(user);
      }
      return true;
    } on FirebaseAuthException catch (e) {
      _error(e.code);
      return false;
    }
  }

  ///SignIn with email password
  Future<bool> signin(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      _error(e.code);
      return false;
    }
  }

  // Future<bool> isUserLoggedIn() async {
  //   var user = _auth.currentUser;
  //   return user != null;
  // }

  // Stream<bool> get emailVerifiedChanges =>
  //     _auth.authStateChanges().map((user) => user?.emailVerified ?? false);

  ///send email verification
  Future<void> sendEmailVerification() async {
    User? user = _auth.currentUser;
    await user?.sendEmailVerification();
  }

  ///SignOut User
  Future<bool> signOut() async {
    try {
      // await GoogleSignIn().signOut();
      await _auth.signOut();
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  ///Reset password for User
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
}
