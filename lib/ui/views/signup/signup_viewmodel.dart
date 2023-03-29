import 'package:flutter/material.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/app/app.router.dart';
import 'package:organic_market/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends BaseViewModel {
  // navigation service
  final _navigationService = locator<NavigationService>();
  // auth service
  final _authService = locator<AuthService>();
  final _dialog = locator<DialogService>();

  // circular progress indicator
  bool _loading = false;
  bool get loading => _loading;

// controllers for email, passwrod , name
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();

// global form key
  final signupFormKey = GlobalKey<FormState>();
// for password field text eye button
  bool _obscureText = true;
  bool get obscureText => _obscureText;

  void showText() {
    _obscureText = !_obscureText;
    rebuildUi();
  }

// on changed function that is call when change in form occure
  void checkValidation() {
    signupFormKey.currentState!.validate();
    if (!(signupFormKey.currentState!.validate())) {
      _loading = false;
      rebuildUi();
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
      print("Email = $email");
      print("Pass = $password");
      print("name = $name");
      if (await _authService.signup(email, password)) {
        _loading = false;

        _navigationService.replaceWithDrawerView();
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
    }
    rebuildUi();
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

// navigator service use
  void tologinPage() {
    _navigationService.back();
  }

  @override
  void dispose() {
    super.dispose();
    passController.dispose();
    emailController.dispose();
    nameController.dispose();
  }
}
