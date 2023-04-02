import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:organic_market/app/app.router.dart';
import 'package:organic_market/services/auth_service.dart';
import 'package:organic_market/services/firestore_service.dart';
import 'package:organic_market/services/nav_drawer_service.dart';
import 'package:organic_market/services/storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';

class AdminViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _indexservice = locator<NavDrawerindexService>();
  final _firestore = locator<FireStoreService>();
  final _navigation = locator<NavigationService>();
  final _dialogservice = locator<DialogService>();
  final _storagesevice = locator<StorageService>();

  void logout() async {
    await _authService.signOut();
    _indexservice.setIndex = 0;
  }

  void toSliderupload() {
    _navigation.navigateToSliderAdmin();
  }
}
