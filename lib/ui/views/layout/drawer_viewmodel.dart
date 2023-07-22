import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/services/auth_service.dart';
import 'package:organic_market/services/nav_drawer_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../chat_screen/chat_screen_view.dart';

class DrawerViewModel extends ReactiveViewModel {
  final ZoomDrawerController _drawerControl = ZoomDrawerController();
  final _indexservice = locator<NavDrawerindexService>();
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  late AnimationController controller;

  // @override
  List<ListenableServiceMixin> get listenableService => [_indexservice];

  ZoomDrawerController get drawerControl => _drawerControl;
  onCreateContrller(controller) {}
  void logout() async {
    await _authService.signOut();
  }

  void drawerToggle() {
    _drawerControl.toggle?.call();
  }

  int getindex() {
    int _selctedindex = _indexservice.selctedindex;
    return _selctedindex;
  }

  int get selctedindex => getindex();

  void updateindex(int index) {
    _indexservice.setIndex = index;
  }

  void inDrawerUpdateIndex(int index) {
    _indexservice.setIndex = index;
    drawerToggle();
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

    // _indexservice.addListener(() {
    //   rebuildUi();
    // });
  }

  onBotClick() {
    //_navigationService.replaceWithChatScreenView();
    _navigationService.navigateToView(const ChatScreenView());
  }
}
