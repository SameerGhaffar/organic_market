import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/ui/views/login/login_viewmodel.dart';
import 'package:stacked/stacked.dart';

import 'widgets/logintext_widget.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget builder(
      BuildContext context, LoginViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Builder(builder: (context) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(25),
              width: double.infinity,
              color: Colors.white70,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Login main text
                        Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.topCenter,
                            child: Text(
                              "LOGIN",
                              style: GoogleFonts.lato(
                                  textStyle: const TextStyle(fontSize: 25),
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2),
                            )),
                        //Email text input field
                        LoginViewTextWidget(
                          obscureText: false,
                          labeltext: 'Email',
                          prefixicon: Icons.email,
                          eyepass: false,
                          controller: viewModel.emailController,
                        ),

                        // password text input
                        LoginViewTextWidget(
                            obscureText: viewModel.obscureText,
                            labeltext: 'Password',
                            prefixicon: Icons.lock,
                            eyepass: true,
                            controller: viewModel.passController),
                        // Forgetpasswrod textbutton
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          width: double.infinity,
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () => viewModel.forgetPass(),
                            child: Text(
                              "Forgot your password?",
                              style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                    color: Colors.blue,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1),
                            ),
                          ),
                        ),
                        //sizebox of 15

                        // Login button
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                            ),
                            onPressed: () => viewModel.loginPressed(),
                            child: Text(
                              "LOGIN",
                              style: GoogleFonts.lato(
                                  fontSize: 17, letterSpacing: 1),
                            )),
                        //size box i will implement google auth

                        //google auth
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                color: Color(0xFF666666),
                                fontStyle: FontStyle.normal,
                              ),
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1),
                        ),
                        TextButton(
                          onPressed: () => viewModel.navigationTosignup(),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Color(0xFFf7418c),
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
