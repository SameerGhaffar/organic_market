import 'package:flutter/material.dart';
import 'package:organic_market/ui/views/signup/signup_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SignupViewVerify extends ViewModelWidget<SignupViewModel> {
  const SignupViewVerify({super.key});

  @override
  Widget build(BuildContext context, SignupViewModel viewModel) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'A verification Email hast been sent to ',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          Text(
            viewModel.name(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          const Text(
            'Please Verify',
            style: TextStyle(
              fontSize: 20,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
