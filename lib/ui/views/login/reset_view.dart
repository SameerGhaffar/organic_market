import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/ui/common/app_strings.dart';
import 'package:organic_market/ui/common/ui_helpers.dart';
import 'package:organic_market/ui/views/login/reset_viewmodel.dart';
import 'package:organic_market/ui/views/login/widgets/reset_widget.dart';
import 'package:stacked/stacked.dart';

class ResetView extends StackedView<ResetViewModel> {
  const ResetView({super.key});

  @override
  Widget builder(
      BuildContext context, ResetViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ksAppTitle),
        centerTitle: true,
      ),
      body: Form(
        onChanged: viewModel.checkValidation,
        key: viewModel.formkey,
        child: Builder(builder: (context) {
          return Container(
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
                      Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Reset Password",
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(fontSize: 25),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2),
                          )),
                      verticalSpaceLarge,
                      //Email text input field
                      ResetViewTextWidget(
                        validator: viewModel.emailValidator,
                        obscureText: false,
                        labeltext: ksEmail,
                        prefixicon: Icons.email,
                        eyepass: false,
                        controller: viewModel.emailController,
                      ),

                      ElevatedButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white70),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                          ),
                          onPressed: viewModel.disabled
                              ? null
                              : () => viewModel.resetPressed(),
                          child: viewModel.loading
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 4,
                                  ))
                              : Text(
                                  "Reset",
                                  style: GoogleFonts.lato(
                                      color: viewModel.disabled
                                          ? Colors.white54
                                          : Colors.white,
                                      fontSize: 17,
                                      letterSpacing: 1),
                                )),
                      //size box i will implement google auth

                      verticalSpaceMassive,

                      viewModel.send
                          ? Text(
                              "A Password Rest Email hast been sent to ${viewModel.emailController.text}",
                              style: GoogleFonts.lato(
                                  textStyle: const TextStyle(fontSize: 16),
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2),
                            )
                          : Container(),

                      //google auth
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  @override
  ResetViewModel viewModelBuilder(BuildContext context) => ResetViewModel();
}
