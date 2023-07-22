import 'package:flutter/material.dart';
import 'package:organic_market/app/app.router.dart';
import 'package:organic_market/model/user.dart';
import 'package:organic_market/services/auth_service.dart';
import 'package:organic_market/services/firestore_service.dart';
import 'package:organic_market/services/nav_drawer_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';

class AdminViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _indexservice = locator<NavDrawerindexService>();
  final _navigation = locator<NavigationService>();
  final _firestoreService = locator<FireStoreService>();

  String? email() {
    return _authService.auth.currentUser!.email;
  }

  Userinfo? user;
  fetchData() async {
    String uid = _authService.auth.currentUser!.uid;
    user = await _firestoreService.getUser(uid);
    rebuildUi();

    print(user!.email);
    print(user!.name);
  }

  void logout() async {
    await _authService.signOut();
    _indexservice.setIndex = 0;
  }

  void toSliderView() {
    _navigation.navigateToSliderAdmin();
  }

  void toPromotionView() {
    _navigation.navigateToPromotionAdmin();
  }

  void toCategoryView() {
    _navigation.navigateToCategoryAdmin();
  }

  void onClick(int index) {
    switch (index) {
      case 0:
        toCategoryView();
        break;
      case 1:
        toSliderView();
        break;
      case 2:
        toPromotionView();
        break;
      default:
    }
  }

  List<String> profileMenu = [
    "Category Manager",
    "Slider Manger",
    "Promotion Manager",
  ];
  List<Color> profileMenuColor = [
    Colors.amber.shade300,
    Colors.blue.shade200,
    Colors.deepOrange.shade300,
  ];
}
