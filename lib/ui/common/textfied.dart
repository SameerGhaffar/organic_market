// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final FocusNode focusNode;
  final String labeltext;
  final String? Function(String? value) validator;
  final IconData prefixicon;
  final bool eyepass;
  final bool obscureText;
  final TextInputType keyboardtype;
  final TextEditingController controller;
  final Function? onpressed;
  final String hint;

  const TextWidget({
    Key? key,
    required this.focusNode,
    required this.labeltext,
    required this.validator,
    required this.prefixicon,
    required this.eyepass,
    required this.obscureText,
    required this.keyboardtype,
    required this.controller,
    this.onpressed,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      keyboardType: keyboardtype,
      validator: validator,
      obscureText: obscureText,
      showCursor: true,
      controller: controller,
      decoration: InputDecoration(
        labelText: labeltext,
        hintText: hint,
        filled: true,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        fillColor: Colors.white54,
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
                icon:
                    Icon(obscureText ? Icons.visibility_off : Icons.visibility),
                color: Colors.black,
                onPressed: () => onpressed)
            : null,
        hintStyle: const TextStyle(
          color: Color(0xFF666666),
          //hintText: "Phone Number",
        ),
      ),
    );
  }
}
