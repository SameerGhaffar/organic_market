import 'package:flutter/material.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final _navigationService = locator<NavigationService>();

  bool _obscureText = true;
  bool get obscureText => _obscureText;

  void showText() {
    _obscureText = !_obscureText;
    rebuildUi();
  }

  void tologinPage() {}

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passController.dispose();
    emailController.dispose();
    nameController.dispose();
  }
}
