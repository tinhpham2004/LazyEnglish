import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_english/modules/first_test/screens/first_test_result_scren.dart';
import 'package:lazy_english/modules/first_test/screens/first_test_screen.dart';
import 'package:lazy_english/modules/onboarding/onboarding_screen.dart';
import 'package:lazy_english/router/app_path.dart';

class AppRouter {
  final GoRouter _router;

  GoRouter get router => _router;

  AppRouter()
      : _router = GoRouter(
          initialLocation: AppPath.onboarding,
          routes: <GoRoute>[
            GoRoute(
              path: AppPath.onboarding,
              builder: (context, state) => OnboardingScreen(),
            ),
            GoRoute(
              path: AppPath.firstTest,
              builder: (context, state) => FirstTestScreen(),
            ),
            GoRoute(
              path: AppPath.firstTestResult,
              builder: (context, state) => FirstTestResultScren(),
            ),
          ],
        );
}
