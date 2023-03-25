// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'package:organic_market/ui/views/signup/signup_viewmodel.dart';
// import 'package:stacked/stacked.dart';

// class SignupView extends StackedView<SignupViewModel>{
//   const SignupView({super.key});

//   @override
//   Widget builder(BuildContext context, SignupViewModel viewModel, Widget? child) {
//      return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(25),
//           width: double.infinity,
//           color: Colors.white70,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Flexible(
//                 flex: 9,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     //Login main text
//                     Container(
//                         padding: const EdgeInsets.all(8.0),
//                         alignment: Alignment.center,
//                         child: Text(
//                           "SIGNUP",
//                           style: GoogleFonts.lato(
//                               textStyle: const TextStyle(fontSize: 25),
//                               fontWeight: FontWeight.bold,
//                               letterSpacing: 2),
//                         )),
//                     //Name text input field
//                     Mytextinputfield(
//                       labeltext: 'Name',
//                       prefixicon: Icons.person,
//                       eyepass: false,
//                       controller: nameController,
//                     ),

//                     //Email text input field
//                     Mytextinputfield(
//                       labeltext: 'Email',
//                       prefixicon: Icons.email,
//                       eyepass: false,
//                       controller: emailController,
//                     ),

//                     // password text input
//                     Mytextinputfield(
//                         labeltext: 'Password',
//                         prefixicon: Icons.lock,
//                         eyepass: true,
//                         controller: passController),

//                     // Forgetpasswrod textbutton
//                     Container(
//                       margin: const EdgeInsets.only(top: 5),
//                       width: double.infinity,
//                       child: Text(
//                         "By signing up, you agree to our Privacy And Terms",
//                         textAlign: TextAlign.center,
//                         style: GoogleFonts.lato(
//                           textStyle: const TextStyle(
//                             color: Colors.blue,
//                             fontStyle: FontStyle.normal,
//                           ),
//                         ),
//                       ),
//                     ),
//                     //sizebox of 15

//                     // Login button
//                     ElevatedButton(
//                         style: ButtonStyle(
//                           backgroundColor:
//                               MaterialStateProperty.all<Color>(Colors.black),
//                         ),
//                         onPressed: () {},
//                         child: Text(
//                           "Signup",
//                           style:
//                               GoogleFonts.lato(fontSize: 17, letterSpacing: 1),
//                         )),
//                     //size box i will implement google auth

//                     //google auth
//                   ],
//                 ),
//               ),
//               Flexible(
//                 flex: 1,
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Already have an account? ",
//                       style: GoogleFonts.lato(
//                           textStyle: const TextStyle(
//                             color: Color(0xFF666666),
//                             fontStyle: FontStyle.normal,
//                           ),
//                           fontWeight: FontWeight.w400,
//                           letterSpacing: 1),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const MyloginPage(),
//                             ));
//                       },
//                       child: const Text(
//                         "click here",
//                         style: TextStyle(
//                           color: Color(0xFFf7418c),
//                           fontStyle: FontStyle.normal,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   SignupViewModel viewModelBuilder(BuildContext context) => SignupViewModel();

//   }

