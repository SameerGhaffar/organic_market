import 'package:flutter/material.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final _navigationService = locator<NavigationService>();
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
}
