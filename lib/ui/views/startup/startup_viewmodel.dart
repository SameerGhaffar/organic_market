import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:organic_market/services/auth_service.dart';
import 'package:organic_market/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _dialog = locator<DialogService>();
  final _firestore = locator<FireStoreService>();

  Future<void> checkEmailVerified() async {
    User? user;
    user = _authService.auth.currentUser;
    await user!.reload();
    try {
      if (user.emailVerified) {
        user.reload();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    // This is where i can make decisions on where your app should navigate when

    // Check if user is an admin
    bool isAdmin;

    _authService.auth.userChanges().listen((User? user) async {
      if (user == null) {
        _navigationService.replaceWithLoginView();
      } else {
        if (user.emailVerified) {
          await _firestore.loadSliderImage();
          await _firestore.loadPromotionImage();
          await _firestore.loadCategoryData();

          DocumentSnapshot userSnapshot =
              await _firestore.users.doc(user.uid).get();
          isAdmin = userSnapshot.get('isAdmin');

          if (isAdmin) {
            _navigationService.replaceWithAdminView();
          } else {
            _navigationService.replaceWithDrawerView();
          }
        } else {
          try {
            checkEmailVerified();
          } catch (e) {
            _dialog.showDialog(
              buttonTitle: "OK",
              title: "Opps",
              buttonTitleColor: Colors.black,
              description: e.toString(),
            );
          }
        }
      }
    });
  }
}
