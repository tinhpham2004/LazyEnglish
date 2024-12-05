import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_english/modules/account/account_screen.dart';
import 'package:lazy_english/modules/card_set/card_set_screen.dart';
import 'package:lazy_english/modules/card_set_detail/card_set_detail_scren.dart';
import 'package:lazy_english/modules/first_test/screens/first_test_result_scren.dart';
import 'package:lazy_english/modules/first_test/screens/first_test_screen.dart';
import 'package:lazy_english/modules/flashcard/flashcard_screen.dart';
import 'package:lazy_english/modules/flashcard_test/flashcard_test_screen.dart';
import 'package:lazy_english/modules/home/home_screen.dart';
import 'package:lazy_english/modules/my_card/my_card_screen.dart';
import 'package:lazy_english/modules/notification/notification_screen.dart';
import 'package:lazy_english/modules/onboarding/onboarding_screen.dart';
import 'package:lazy_english/modules/set_up_notification/set_up_notification_screen.dart';
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
              builder: (context, state) {
                final int point = state.extra as int;
                return FirstTestResultScren(point: point);
              },
            ),
            GoRoute(
              path: AppPath.home,
              builder: (context, state) => HomeScreen(),
            ),
            GoRoute(
              path: AppPath.cardSet,
              builder: (context, state) => CardSetScreen(),
            ),
            GoRoute(
              path: AppPath.cardSetDetail,
              builder: (context, state) => CardSetDetailScren(),
            ),
            GoRoute(
              path: AppPath.flashcard,
              builder: (context, state) => FlashcardScreen(),
            ),
            GoRoute(
              path: AppPath.flashcardTest,
              builder: (context, state) => FlashcardTestScreen(),
            ),
            GoRoute(
              path: AppPath.notification,
              builder: (context, state) => NotificationScreen(),
            ),
            GoRoute(
              path: AppPath.myCard,
              builder: (context, state) => MyCardScreen(),
            ),
            GoRoute(
              path: AppPath.account,
              builder: (context, state) => AccountScreen(),
            ),
            GoRoute(
              path: AppPath.setUpNotification,
              builder: (context, state) => SetUpNotificationScreen(),
            ),
          ],
        );
}
