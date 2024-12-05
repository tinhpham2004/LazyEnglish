import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lazy_english/app_notification/app_notification.dart';
import 'package:lazy_english/core/constants/app_name.dart';
import 'package:lazy_english/gen/assets.gen.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_english/local/preferences.dart';
import 'package:lazy_english/my_app.dart';
import 'package:lazy_english/router/app_path.dart';
import 'package:lazy_english/router/app_router.dart';

Future<void> main() async {
  await initializeApp();
  final router = await initializeRouter();
  runApp(MyApp(router: router));
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

Future<GoRouter> initializeRouter() async {
  GoRouter router = AppRouter().router;
  String initialRoute = AppPath.onboarding;
  dynamic extra;

  final auth = await Preferences.getAuth();
  if (auth == true) {
    initialRoute = AppPath.home;
  }

  router.go(initialRoute, extra: extra);

  return router;
}
