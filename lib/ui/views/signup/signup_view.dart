import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/ui/common/app_strings.dart';
import 'package:organic_market/ui/views/signup/widgets/verify.dart';

import 'package:stacked/stacked.dart';

import 'signup_viewmodel.dart';
import 'widgets/signtext_widget.dart';

class SignupView extends StackedView<SignupViewModel> {
  const SignupView({super.key});

  @override
  Widget builder(
      BuildContext context, SignupViewModel viewModel, Widget? child) {
    return viewModel.verify
        ? const SignupViewVerify()
        : Scaffold(
            appBar: AppBar(),
            body: Form(
              onChanged: viewModel.onchangedValidation,
              key: viewModel.signupFormKey,
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
                                  alignment: Alignment.center,
                                  child: Text(
                                    ksSIGNUP,
                                    style: GoogleFonts.lato(
                                        textStyle:
                                            const TextStyle(fontSize: 25),
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2),
                                  )),
                              //Name text input field
                              SignupViewTextWidget(
                                keyboardtype: TextInputType.name,
                                validator: viewModel.nameValidator,
                                obscureText: false,
                                labeltext: ksFirstname,
                                prefixicon: Icons.person,
                                eyepass: false,
                                controller: viewModel.nameController,
                              ),
                              //Email text input field
                              SignupViewTextWidget(
                                keyboardtype: TextInputType.emailAddress,
                                validator: viewModel.emailValidator,
                                obscureText: false,
                                labeltext: ksEmail,
                                prefixicon: Icons.email,
                                eyepass: false,
                                controller: viewModel.emailController,
                              ),

                              // password text input
                              SignupViewTextWidget(
                                  keyboardtype: TextInputType.visiblePassword,
                                  validator: viewModel.passValidator,
                                  obscureText: viewModel.obscureText,
                                  labeltext: ksPassword,
                                  prefixicon: Icons.lock,
                                  eyepass: true,
                                  controller: viewModel.passController),

                              // Forgetpasswrod textbutton
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                width: double.infinity,
                                child: Text(
                                  ksPrivacyterm,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                      color: Colors.blue,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                              ),
                              //sizebox of 15

                              // Login button
                              ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black),
                                  ),
                                  onPressed: viewModel.disabled
                                      ? null
                                      : () => viewModel.signupPressed(),
                                  child: viewModel.loading
                                      ? const SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 4,
                                          ))
                                      : Text(
                                          ksSignup,
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
                                ksAlreadyhaveaccount,
                                style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                      color: Color(0xFF666666),
                                      fontStyle: FontStyle.normal,
                                    ),
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1),
                              ),
                              TextButton(
                                onPressed: () => viewModel.tologinPage(),
                                child: const Text(
                                  ksclickHere,
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
  SignupViewModel viewModelBuilder(BuildContext context) => SignupViewModel();
}
