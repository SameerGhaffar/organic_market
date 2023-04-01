import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/app/app.router.dart';
import 'package:organic_market/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends BaseViewModel {
  // controllers for email, passwrod , name
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  // service
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _dialog = locator<DialogService>();
// global form key
  final signupFormKey = GlobalKey<FormState>();
  // circular progress indicator
  bool _loading = false;
  bool get loading => _loading;
// button disabled
  var disabled = true;

// for password field text eye button
  bool _obscureText = true;
  bool get obscureText => _obscureText;

  void showText() {
    _obscureText = !_obscureText;
    rebuildUi();
  }

  bool verify = false;
  Timer? timer;
// on changed function that is call when change in form occure
  void onchangedValidation() {
    signupFormKey.currentState!.validate();
    if (signupFormKey.currentState!.validate()) {
      disabled = false;
      rebuildUi();
    }
    if (!(signupFormKey.currentState!.validate())) {
      _loading = false;
      disabled = true;
      rebuildUi();
    }
  }

  String name() {
    return _authService.auth.currentUser!.email.toString();
  }

  Future<void> checkEmailVerified() async {
    User? user;
    user = _authService.auth.currentUser;
    await user!.reload();
    try {
      if (user.emailVerified) {
        user.reload();
      }
    } catch (e) {
      print(e.toString());
      _dialog.showDialog(
          buttonTitle: "OK",
          title: "Opps",
          buttonTitleColor: Colors.black,
          description: "Please Verify email");
    }
  }

// when sign up button is pressed it is called
  Future<void> signupPressed() async {
    _loading = true;
    rebuildUi();

    if (signupFormKey.currentState!.validate()) {
      String email = emailController.text.toString();
      String password = passController.text.toString();
      String name = nameController.text.toString();

      if (await _authService.signup(
          email: email, password: password, name: name)) {
        _loading = false;
        _authService.sendEmailVerification();
        verify = true;

        timer = Timer.periodic(
            const Duration(seconds: 2), (timer) => checkEmailVerified());
      } else {
        _loading = false;
        String? error = _authService.error;
        // String e = error.substring(34);
        // print(error);
        _dialog.showDialog(
          buttonTitle: "OK",
          title: "Opps",
          buttonTitleColor: Colors.black,
          description: error,
        );
      }
    } else {
      _loading = false;
      rebuildUi();
    }
    rebuildUi();
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter correct name ";
    } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return "Invalid Name";
    }
    return null;
  }

  String? passValidator(String? value) {
    if (value!.isEmpty) {
      return "Password can't be empty";
    } else if (!value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
      return "Password must contain Special character";
    } else if (value.length < 7) {
      return "Password is short";
    }
    return null;
  }

  String? emailValidator(String? value) {
    // \w mean any letter and numbre but not special    expression =
    // -\.  mean contain underscore  hyphen and a dot
    // @ mean must contail it
    //{2,4} mean it can repeat
    final emailRegExp =
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$', caseSensitive: false);
    if (value == null || value.isEmpty) {
      return "Please enter Email";
    } else if (!emailRegExp.hasMatch(value)) {
      return "Please enter correct email address";
    }
    return null;
  }

// navigator service use
  void tologinPage() {
    _navigationService.replaceWithLoginView();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
    passController.dispose();
    emailController.dispose();
    nameController.dispose();
  }
}
