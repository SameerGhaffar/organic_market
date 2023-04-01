import 'package:organic_market/services/auth_service.dart';
import 'package:organic_market/services/firestore_service.dart';
import 'package:organic_market/services/nav_drawer_service.dart';
import 'package:organic_market/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:organic_market/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:organic_market/ui/views/layout/drawer_view.dart';
import 'package:organic_market/ui/views/home/home_view.dart';
import 'package:organic_market/ui/views/login/login_view.dart';
import 'package:organic_market/ui/views/login/reset_view.dart';
import 'package:organic_market/ui/views/signup/signup_view.dart';
import 'package:organic_market/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: DrawerView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: ResetView)

    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: NavDrawerindexService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: FireStoreService)

    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
