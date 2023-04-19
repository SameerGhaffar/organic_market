import 'package:flutter/material.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/app/app.router.dart';
import 'package:organic_market/model/user.dart';
import 'package:organic_market/services/auth_service.dart';
import 'package:organic_market/services/firestore_service.dart';
import 'package:organic_market/services/nav_drawer_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AccountViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _firestoreService = locator<FireStoreService>();
  final _indexservice = locator<NavDrawerindexService>();
  final _navigationService = locator<NavigationService>();
  bool newpage = true;
  String? email() {
    return _authService.auth.currentUser!.email;
  }

  Userinfo? user;
  fetchData() async {
    String uid = await _authService.auth.currentUser!.uid;
    user = await _firestoreService.getUser(uid);
    rebuildUi();

    print(user!.email);
    print(user!.name);
  }

  void logout() async {
    await _authService.signOut();
    _indexservice.setIndex = 0;
  }

  List<String> profileMenu = [
    "My Orders",
    "Subscription",
    "Order History",
    "Address",
  ];
  List<Color> profileMenuColor = [
    Colors.amber.shade300,
    Colors.deepOrange.shade300,
    const Color.fromARGB(255, 1, 219, 183),
    Colors.blue.shade200,
  ];
  void onClick(int index) {
    switch (index) {
      case 0:
        _navigationService.navigateToOrderView();
        // rebuildUi();
        break;
      default:
    }
  }
}
