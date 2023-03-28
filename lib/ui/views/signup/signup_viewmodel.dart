import 'package:flutter/material.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final _navigationService = locator<NavigationService>();

  final signupFormKey = GlobalKey<FormState>();

  bool _obscureText = true;
  bool get obscureText => _obscureText;

  void showText() {
    _obscureText = !_obscureText;
    rebuildUi();
  }

  void checkValidation() {
    signupFormKey.currentState!.validate();
  }

  void signupPressed() {
    if (signupFormKey.currentState!.validate()) {
      String email = emailController.text.toString();
      String pass = passController.text.toString();
      String name = nameController.text.toString();

      print("Email = $email");

      print("Pass = $pass");
      print("name = $name");
    }
  }

  void tologinPage() {
    _navigationService.back(result: 3);
  }

  String? nameValidator(String? value) {
    if (value!.length < 5) {
      return "Name is too short ";
    }
    return null;
  }

  String? passValidator(String? value) {
    if (value!.isEmpty) {
      return "Enter pass";
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return "Enter pass";
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    passController.dispose();
    emailController.dispose();
    nameController.dispose();
  }
}
