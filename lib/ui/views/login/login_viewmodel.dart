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

  bool _obscureText = true;

  bool get obscureText => _obscureText;
  void showText() {
    _obscureText = !_obscureText;
    rebuildUi();
  }

  // circular progress indicator k liye
  bool _loading = false;
  bool get loading => _loading;

  void loginPressed() async {
    _loading = true;
    rebuildUi();
    if (formkey.currentState!.validate()) {
      String email = emailController.text.toString();
      String password = passController.text.toString();

      print("Email = $email");

      print("Pass = $password");
      if (await _authService.signin(email, password)) {
        _loading = false;

        _navigationService.replaceWithDrawerView();
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
    }
    rebuildUi();
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Enter Email";
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
    print("Forget Pass Button");
  }

  // navigation to SignUp Page
  void toSignUp() {
    _navigationService.replaceWithSignupView();
    print("clicked on signup");
  }

  @override
  void dispose() {
    super.dispose();
    passController.dispose();
    emailController.dispose();
  }

  void checkValidation() {
    formkey.currentState!.validate();
  }
}
