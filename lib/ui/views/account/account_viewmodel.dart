import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/services/auth_service.dart';
import 'package:organic_market/services/nav_drawer_service.dart';
import 'package:stacked/stacked.dart';

class AccountViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _indexservice = locator<NavDrawerindexService>();

  String? name() {
    return _authService.auth.currentUser?.email;
  }

  void logout() async {
    await _authService.signOut();
    _indexservice.setIndex = 0;
  }
}
