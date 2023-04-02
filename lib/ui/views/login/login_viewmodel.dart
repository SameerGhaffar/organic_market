import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/app/app.router.dart';
import 'package:organic_market/services/auth_service.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialog = locator<DialogService>();
  // auth service
  final _authService = locator<AuthService>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  var disabled = true;

  bool _obscureText = true;

  bool get obscureText => _obscureText;
  void showText() {
    _obscureText = !_obscureText;
    rebuildUi();
  }

  User? user;
  // circular progress indicator k liye
  bool _loading = false;
  bool get loading => _loading;
  // Future<void> checkEmailVerified() async {
  //   user = _authService.auth.currentUser;
  //   await user!.reload();
  //   if (user!.emailVerified) {
  //     _navigationService.replaceWithDrawerView();
  //   } else {
  //     _dialog.showDialog(
  //         buttonTitle: "OK",
  //         title: "Opps",
  //         buttonTitleColor: Colors.black,
  //         description: "Please Verify email");
  //   }
  // }

  void loginPressed() async {
    _loading = true;
    rebuildUi();
    if (formkey.currentState!.validate()) {
      String email = emailController.text.toString();
      String password = passController.text.toString();

      if (await _authService.signin(email, password)) {
        _loading = false;
      } else {
        _loading = false;

        String? error = _authService.error;

        _dialog.showDialog(
          buttonTitle: "OK",
          title: "Opps",
          buttonTitleColor: Colors.black,
          description: error?.toUpperCase().replaceAll("-", " "),
        );
      }
    } else {
      _loading = false;
      rebuildUi();
    }
    rebuildUi();
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

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Enter pass";
    }
    return null;
  }

  void forgetPass() {
    _navigationService.navigateToResetView();
  }

  // navigation to SignUp Page
  void toSignUp() {
    _navigationService.replaceWithSignupView();
  }

  void checkValidation() {
    formkey.currentState!.validate();

    if (formkey.currentState!.validate()) {
      disabled = false;
    }

    if (!(formkey.currentState!.validate())) {
      _loading = false;
      disabled = true;
    }
    rebuildUi();
  }

  @override
  void dispose() {
    super.dispose();
    passController.dispose();
    emailController.dispose();
  }
}
