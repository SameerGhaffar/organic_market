import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/services/auth_service.dart';
import 'package:organic_market/services/nav_drawer_service.dart';
import 'package:stacked/stacked.dart';

class DrawerViewModel extends ReactiveViewModel {
  final ZoomDrawerController _drawerControl = ZoomDrawerController();
  final _indexservice = locator<NavDrawerindexService>();
  final _authService = locator<AuthService>();

  @override
  ZoomDrawerController get drawerControl => _drawerControl;

  void logout() async {
    await _authService.signOut();
    _indexservice.setIndex = 0;
  }

  void opendrawer() {
    _drawerControl.toggle?.call();
    rebuildUi();
  }

  int getindex() {
    int _selctedindex = _indexservice.selctedindex;
    return _selctedindex;
  }

  int get selctedindex => getindex();

  void updateindex(int index) {
    _indexservice.setIndex = index;
    rebuildUi();
  }

  List<Color> colorList = [
    Colors.deepPurple,
    Colors.purple,
    Colors.green,
    Colors.blue
  ];
  List<String> title = [
    "ORGANIC MARKET",
    "PRODUCTS",
    "CART",
    "PROFILE",
  ];
  Future fetchData() async {
    _indexservice.addListener(() {
      rebuildUi();
    });
  }
}
