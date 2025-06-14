import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/ui/common/app_strings.dart';
import 'package:organic_market/ui/common/ui_helpers.dart';
import 'package:organic_market/ui/views/login/login_viewmodel.dart';
import 'package:stacked/stacked.dart';

import 'package:auth_buttons/auth_buttons.dart';
import 'widgets/text_widget.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget builder(
      BuildContext context, LoginViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ksAppTitle),
        centerTitle: true,
      ),
      body: Form(
        onChanged: viewModel.checkValidation,
        key: viewModel.formkey,
        child: Builder(builder: (context) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(25),
              width: double.infinity,
              color: Theme.of(context).scaffoldBackgroundColor,
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
                          validator: viewModel.emailValidator,
                          obscureText: false,
                          labeltext: ksEmail,
                          prefixicon: Icons.email,
                          eyepass: false,
                          controller: viewModel.emailController,
                        ),

                        // password text input
                        LoginViewTextWidget(
                            validator: viewModel.validatePassword,
                            obscureText: viewModel.obscureText,
                            labeltext: ksPassword,
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
                              ksforgetPassword,
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
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white70),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                            ),
                            onPressed: viewModel.disabled
                                ? null
                                : () => viewModel.loginPressed(),
                            child: viewModel.loading
                                ? const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 4,
                                    ))
                                : Text(
                                    ksLOGIN,
                                    style: GoogleFonts.lato(
                                        color: viewModel.disabled
                                            ? Colors.white54
                                            : Colors.white,
                                        fontSize: 17,
                                        letterSpacing: 1),
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
                          ksdonthaveaccount,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                color: Color(0xFF666666),
                                fontStyle: FontStyle.normal,
                              ),
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1),
                        ),
                        TextButton(
                          onPressed: () => viewModel.toSignUp(),
                          child: const Text(
                            ksSignup,
                            style: TextStyle(
                              color: Color(0xFFf7418c),
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpaceLarge,
                  GoogleAuthButton(
                    onPressed: () => viewModel.googleLoginPressed(),
                    isLoading: viewModel.googleLoading,
                    style: AuthButtonStyle(
                      elevation: 0.5,
                      progressIndicatorColor: Colors.black,
                      progressIndicatorValueColor: Colors.white,
                      shadowColor: Colors.white,
                      textStyle: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
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
