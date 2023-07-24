// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i22;
import 'package:flutter/material.dart';
import 'package:organic_market/ui/admin/admin_view.dart' as _i8;
import 'package:organic_market/ui/admin/widgets/category/a_category_view.dart'
    as _i11;
import 'package:organic_market/ui/admin/widgets/item/a_item_view.dart' as _i12;
import 'package:organic_market/ui/admin/widgets/promotion/a_promotion_view.dart'
    as _i10;
import 'package:organic_market/ui/admin/widgets/slider/a_slider_view.dart'
    as _i9;
import 'package:organic_market/ui/views/account/account_view.dart' as _i13;
import 'package:organic_market/ui/views/chat_screen/chat_screen_view.dart'
    as _i19;
import 'package:organic_market/ui/views/checkout/checkout_view.dart' as _i20;
import 'package:organic_market/ui/views/home/home_view.dart' as _i15;
import 'package:organic_market/ui/views/item/item_view.dart' as _i7;
import 'package:organic_market/ui/views/layout/drawer_view.dart' as _i5;
import 'package:organic_market/ui/views/login/login_view.dart' as _i3;
import 'package:organic_market/ui/views/login/reset_view.dart' as _i6;
import 'package:organic_market/ui/views/map/map_view.dart' as _i17;
import 'package:organic_market/ui/views/order/order_view.dart' as _i14;
import 'package:organic_market/ui/views/ordercompleted/ordercompleted_view.dart'
    as _i21;
import 'package:organic_market/ui/views/product/product_view.dart' as _i18;
import 'package:organic_market/ui/views/searchproduct/search_product_view.dart'
    as _i16;
import 'package:organic_market/ui/views/signup/signup_view.dart' as _i4;
import 'package:organic_market/ui/views/startup/startup_view.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i23;

class Routes {
  static const startupView = '/startup-view';

  static const loginView = '/login-view';

  static const signupView = '/signup-view';

  static const drawerView = '/drawer-view';

  static const resetView = '/reset-view';

  static const itemView = '/item-view';

  static const adminView = '/admin-view';

  static const sliderAdmin = '/slider-admin';

  static const promotionAdmin = '/promotion-admin';

  static const categoryAdmin = '/category-admin';

  static const categoryItemAdmin = '/category-item-admin';

  static const accountView = '/account-view';

  static const orderView = '/order-view';

  static const homeView = '/home-view';

  static const searchProductView = '/search-product-view';

  static const mapView = '/map-view';

  static const productView = '/product-view';

  static const chatScreenView = '/chat-screen-view';

  static const checkoutView = '/checkout-view';

  static const ordercompletedView = '/ordercompleted-view';

  static const all = <String>{
    startupView,
    loginView,
    signupView,
    drawerView,
    resetView,
    itemView,
    adminView,
    sliderAdmin,
    promotionAdmin,
    categoryAdmin,
    categoryItemAdmin,
    accountView,
    orderView,
    homeView,
    searchProductView,
    mapView,
    productView,
    chatScreenView,
    checkoutView,
    ordercompletedView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i3.LoginView,
    ),
    _i1.RouteDef(
      Routes.signupView,
      page: _i4.SignupView,
    ),
    _i1.RouteDef(
      Routes.drawerView,
      page: _i5.DrawerView,
    ),
    _i1.RouteDef(
      Routes.resetView,
      page: _i6.ResetView,
    ),
    _i1.RouteDef(
      Routes.itemView,
      page: _i7.ItemView,
    ),
    _i1.RouteDef(
      Routes.adminView,
      page: _i8.AdminView,
    ),
    _i1.RouteDef(
      Routes.sliderAdmin,
      page: _i9.SliderAdmin,
    ),
    _i1.RouteDef(
      Routes.promotionAdmin,
      page: _i10.PromotionAdmin,
    ),
    _i1.RouteDef(
      Routes.categoryAdmin,
      page: _i11.CategoryAdmin,
    ),
    _i1.RouteDef(
      Routes.categoryItemAdmin,
      page: _i12.CategoryItemAdmin,
    ),
    _i1.RouteDef(
      Routes.accountView,
      page: _i13.AccountView,
    ),
    _i1.RouteDef(
      Routes.orderView,
      page: _i14.OrderView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i15.HomeView,
    ),
    _i1.RouteDef(
      Routes.searchProductView,
      page: _i16.SearchProductView,
    ),
    _i1.RouteDef(
      Routes.mapView,
      page: _i17.MapView,
    ),
    _i1.RouteDef(
      Routes.productView,
      page: _i18.ProductView,
    ),
    _i1.RouteDef(
      Routes.chatScreenView,
      page: _i19.ChatScreenView,
    ),
    _i1.RouteDef(
      Routes.checkoutView,
      page: _i20.CheckoutView,
    ),
    _i1.RouteDef(
      Routes.ordercompletedView,
      page: _i21.OrdercompletedView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i3.LoginView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.LoginView(),
        settings: data,
      );
    },
    _i4.SignupView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.SignupView(),
        settings: data,
      );
    },
    _i5.DrawerView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.DrawerView(),
        settings: data,
      );
    },
    _i6.ResetView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.ResetView(),
        settings: data,
      );
    },
    _i7.ItemView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.ItemView(),
        settings: data,
      );
    },
    _i8.AdminView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.AdminView(),
        settings: data,
      );
    },
    _i9.SliderAdmin: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.SliderAdmin(),
        settings: data,
      );
    },
    _i10.PromotionAdmin: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.PromotionAdmin(),
        settings: data,
      );
    },
    _i11.CategoryAdmin: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.CategoryAdmin(),
        settings: data,
      );
    },
    _i12.CategoryItemAdmin: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.CategoryItemAdmin(),
        settings: data,
      );
    },
    _i13.AccountView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.AccountView(),
        settings: data,
      );
    },
    _i14.OrderView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.OrderView(),
        settings: data,
      );
    },
    _i15.HomeView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.HomeView(),
        settings: data,
      );
    },
    _i16.SearchProductView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.SearchProductView(),
        settings: data,
      );
    },
    _i17.MapView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.MapView(),
        settings: data,
      );
    },
    _i18.ProductView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i18.ProductView(),
        settings: data,
      );
    },
    _i19.ChatScreenView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i19.ChatScreenView(),
        settings: data,
      );
    },
    _i20.CheckoutView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i20.CheckoutView(),
        settings: data,
      );
    },
    _i21.OrdercompletedView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i21.OrdercompletedView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i23.NavigationService {
  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDrawerView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.drawerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToResetView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.resetView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToItemView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.itemView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAdminView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.adminView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSliderAdmin([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sliderAdmin,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPromotionAdmin([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.promotionAdmin,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCategoryAdmin([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.categoryAdmin,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCategoryItemAdmin([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.categoryItemAdmin,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.accountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOrderView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.orderView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSearchProductView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.searchProductView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMapView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.mapView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProductView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.productView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChatScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.chatScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCheckoutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.checkoutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOrdercompletedView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.ordercompletedView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDrawerView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.drawerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithResetView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.resetView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithItemView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.itemView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAdminView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.adminView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSliderAdmin([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sliderAdmin,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPromotionAdmin([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.promotionAdmin,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCategoryAdmin([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.categoryAdmin,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCategoryItemAdmin([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.categoryItemAdmin,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.accountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOrderView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.orderView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSearchProductView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.searchProductView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMapView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.mapView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProductView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.productView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChatScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.chatScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCheckoutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.checkoutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOrdercompletedView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.ordercompletedView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
