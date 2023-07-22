import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:organic_market/app/app.bottomsheets.dart';
import 'package:organic_market/app/app.dialogs.dart';
import 'package:organic_market/app/app.locator.dart';

import 'package:organic_market/ui/common/app_colors.dart';
import 'package:organic_market/ui/common/app_strings.dart';
import 'package:organic_market/ui/common/app_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  // stacked locator and dialog // botttom sheet
  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

// firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
// google font license
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  // This is for setting orientation when remove devie preview un comment it

  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]).then((value) => runApp(const MyApp()));

  // runApp(const MyApp());
  // FlutterNativeSplash.remove();
  runApp(
    DevicePreview(
      enabled: true,
      backgroundColor: Colors.black,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        title: ksAppTitle,
        debugShowCheckedModeBanner: false,
        theme: Theme.of(context).copyWith(
          appBarTheme: MyAppbartheme.lightTheme(context),
          primaryColor: kcBackgroundColor,
          focusColor: kcPrimaryColor,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.black,
              ),
        ),
        darkTheme: Theme.of(context).copyWith(
          appBarTheme: MyAppbartheme.darkTheme(context),
          primaryColor: kcBackgroundColor,
          focusColor: kcPrimaryColor,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.black,
              ),
        ),
        initialRoute: Routes.startupView,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        navigatorObservers: [
          StackedService.routeObserver,
        ],
      );
    });
  }
}
