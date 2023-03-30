import 'package:firebase_auth/firebase_auth.dart';
import 'package:organic_market/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  Future<void> checkEmailVerified() async {
    User? user;
    user = _authService.auth.currentUser;
    await user!.reload();
    try {
      if (user.emailVerified) {
        user.reload();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    // _navigationService.replaceWithDrawerView();

    _authService.auth.userChanges().listen((User? user) {
      if (user == null) {
        _navigationService.replaceWithLoginView();
      } else {
        if (user.emailVerified) {
          _navigationService.replaceWithDrawerView();
        } else {
          checkEmailVerified();
        }
      }
    });
  }
}
