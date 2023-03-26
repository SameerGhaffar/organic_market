import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool _obscureText = true;
  bool get obscureText => _obscureText;

  void showText() {
    _obscureText = !_obscureText;
    rebuildUi();
  }

  void loginPressed() {
    String email = emailController.text.toString();
    String pass = passController.text.toString();

    print("Email = $email");

    print("Pass = $pass");
  }

  void forgetPass() {
    print("Forget Pass Button");
  }

  void navigationTosignup() {
    print("Signup clicked");
  }

  @override
  void dispose() {
    super.dispose();
    passController.dispose();
    emailController.dispose();
  }
}
