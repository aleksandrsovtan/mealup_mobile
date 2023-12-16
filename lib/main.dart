import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mealsup_mobile/main_bindings.dart';
import 'package:mealsup_mobile/routes.dart';

final logger = Logger(printer: PrettyPrinter(methodCount: 1));

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  MainBindings().dependencies();
  runApp(const MealsUp());
}

class MealsUp extends StatelessWidget {
  const MealsUp({super.key});

  @override
  Widget build(final BuildContext context) => GetMaterialApp(
        title: 'Meals Up',
        debugShowCheckedModeBanner: false,
        smartManagement: SmartManagement.keepFactory,
        getPages: GetPages.allGetPages(),
        initialRoute: Routes.splash,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      );
}
