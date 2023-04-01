import 'package:flutter/material.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ResetViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _dialog = locator<DialogService>();
  final formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  var disabled = true;

  bool _loading = false;

  String email() {
    String emailname = emailController.toString();

    return emailname;
  }

  bool get loading => _loading;
  bool _send = false;
  bool get send => _send;

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

  resetPressed() async {
    _loading = true;
    rebuildUi();

    if (formkey.currentState!.validate()) {
      String email = emailController.text.toString();

      if (await _authService.resetPassword(email)) {
        _loading = false;
        _send = true;
        rebuildUi();
        // Reset passsword email is send
      } else {
        _send = false;
        _loading = false;
        rebuildUi();

        String? error = _authService.error;

        _dialog.showDialog(
          buttonTitle: "OK",
          title: "Opps",
          buttonTitleColor: Colors.black,
          description: error?.toUpperCase().replaceAll("-", " "),
        );
      }
    } else {
      _send = false;
      _loading = false;
      rebuildUi();
    }
  }

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
  }
}
