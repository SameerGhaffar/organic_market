import 'package:stacked/stacked.dart';

class NavDrawerindexService with ListenableServiceMixin {
  int _selectedIndex = 0;

  int get selctedindex => _selectedIndex;

  set setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
