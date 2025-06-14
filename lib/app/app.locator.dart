// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/auth_service.dart';
import '../services/cart_service.dart';
import '../services/firestore_service.dart';
import '../services/manager.dart';
import '../services/nav_drawer_service.dart';
import '../services/tempdata_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => NavDrawerindexService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => FireStoreService());
  locator.registerLazySingleton(() => StorageService());
  locator.registerLazySingleton(() => CartService());
  locator.registerLazySingleton(() => TempdataService());
}
