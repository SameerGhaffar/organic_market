import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:stacked/stacked.dart';

import '../cart/cart_view.dart';
import '../home/home_view.dart';

class DrawerViewModel extends BaseViewModel {
  final ZoomDrawerController _drawerControl = ZoomDrawerController();

  ZoomDrawerController get drawerControl => _drawerControl;

  void opendrawer() {
    _drawerControl.toggle?.call();
    rebuildUi();
  }

// using this as navbar controller
// 0 mean first page 3 mean last page
  int _selctedindex = 0;

  int get selctedindex => _selctedindex;

  void updateindex(int index) {
    _selctedindex = index;
    rebuildUi();
  }

  final List<Widget> bottomBarPages = [
    const HomeView(),
    const HomeView(),
    const CartView(),
    const HomeView(),
  ];
}
