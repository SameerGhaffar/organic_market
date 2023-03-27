import 'package:flutter_zoom_drawer/config.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/services/nav_drawer_service.dart';
import 'package:stacked/stacked.dart';

class DrawerViewModel extends BaseViewModel {
  final ZoomDrawerController _drawerControl = ZoomDrawerController();
  final _indexservice = locator<NavDrawerindexService>();

  ZoomDrawerController get drawerControl => _drawerControl;

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
}
