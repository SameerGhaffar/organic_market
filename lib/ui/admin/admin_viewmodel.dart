import 'dart:io';

import 'package:organic_market/app/app.router.dart';
import 'package:organic_market/services/auth_service.dart';
import 'package:organic_market/services/nav_drawer_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';

class AdminViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _indexservice = locator<NavDrawerindexService>();
  final _navigation = locator<NavigationService>();

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
}
