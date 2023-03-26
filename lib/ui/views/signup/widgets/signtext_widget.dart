// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../signup_viewmodel.dart';

class SignupViewTextWidget extends ViewModelWidget<SignupViewModel> {
  final String labeltext;
  final IconData prefixicon;
  final bool eyepass;
  final bool obscureText;
  final TextEditingController controller;

  const SignupViewTextWidget({
    super.key,
    required this.labeltext,
    required this.prefixicon,
    required this.eyepass,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context, SignupViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        //validator: validator,
        obscureText: obscureText,
        showCursor: true,
        controller: controller,
        decoration: InputDecoration(
          labelText: labeltext,
          filled: true,
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          fillColor: const Color(0xFFF2F3F5),
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          prefixIcon: Icon(
            prefixicon,
            color: const Color(0xFF666666),
          ),
          suffixIcon: eyepass
              ? IconButton(
                  icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility),
                  color: Colors.black,
                  onPressed: () => viewModel.showText())
              : null,
          hintStyle: const TextStyle(
            color: Color(0xFF666666),
            //hintText: "Phone Number",
          ),
        ),
      ),
    );
  }
}
