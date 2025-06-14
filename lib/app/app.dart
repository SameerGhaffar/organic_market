import 'package:organic_market/services/auth_service.dart';
import 'package:organic_market/services/cart_service.dart';
import 'package:organic_market/services/firestore_service.dart';
import 'package:organic_market/services/nav_drawer_service.dart';
import 'package:organic_market/services/manager.dart';
import 'package:organic_market/services/tempdata_service.dart';
import 'package:organic_market/ui/admin/admin_view.dart';
import 'package:organic_market/ui/admin/widgets/category/a_category_view.dart';
import 'package:organic_market/ui/admin/widgets/item/a_item_view.dart';
import 'package:organic_market/ui/admin/widgets/promotion/a_promotion_view.dart';
import 'package:organic_market/ui/admin/widgets/slider/a_slider_view.dart';
import 'package:organic_market/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:organic_market/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:organic_market/ui/views/account/account_view.dart';
import 'package:organic_market/ui/views/item/item_view.dart';
import 'package:organic_market/ui/views/layout/drawer_view.dart';
import 'package:organic_market/ui/views/home/home_view.dart';
import 'package:organic_market/ui/views/login/login_view.dart';
import 'package:organic_market/ui/views/login/reset_view.dart';
import 'package:organic_market/ui/views/order/order_view.dart';
import 'package:organic_market/ui/views/searchproduct/search_product_view.dart';
import 'package:organic_market/ui/views/signup/signup_view.dart';
import 'package:organic_market/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:organic_market/ui/views/map/map_view.dart';
import 'package:organic_market/ui/views/product/product_view.dart';
import 'package:organic_market/ui/bottom_sheets/product/product_sheet.dart';
import 'package:organic_market/ui/views/chat_screen/chat_screen_view.dart';
import 'package:organic_market/ui/views/checkout/checkout_view.dart';
import 'package:organic_market/ui/views/ordercompleted/ordercompleted_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: DrawerView),
    MaterialRoute(page: ResetView),
    MaterialRoute(page: ItemView),
    MaterialRoute(page: AdminView),
    MaterialRoute(page: SliderAdmin),
    MaterialRoute(page: PromotionAdmin),
    MaterialRoute(page: CategoryAdmin),
    MaterialRoute(page: CategoryItemAdmin),
    MaterialRoute(page: AccountView),
    MaterialRoute(page: OrderView),
    MaterialRoute(page: HomeView),

    MaterialRoute(page: SearchProductView),

    MaterialRoute(page: MapView),
    MaterialRoute(page: ProductView),
    MaterialRoute(page: ChatScreenView),
    MaterialRoute(page: CheckoutView),
    MaterialRoute(page: OrdercompletedView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: NavDrawerindexService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: FireStoreService),
    LazySingleton(classType: StorageService),
    LazySingleton(classType: CartService),
    LazySingleton(classType: TempdataService),

// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: ProductSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
