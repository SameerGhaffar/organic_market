import 'package:flutter/material.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  bool _obscureText = true;

  bool get obscureText => _obscureText;
  void showText() {
    _obscureText = !_obscureText;
    rebuildUi();
  }

  void loginPressed() {
    if (formkey.currentState!.validate()) {
      String email = emailController.text.toString();
      String pass = passController.text.toString();

      print("Email = $email");

      print("Pass = $pass");
    }
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
    _navigationService.navigateToSignupView();
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
