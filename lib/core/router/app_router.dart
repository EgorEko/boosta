import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../features/main/presentation/screens/hidden_web_view_screen.dart';
import '../../features/main/presentation/screens/main_screen.dart';
import '../../features/no_internet/presentation/screens/no_internet_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/services/presentation/screens/privacy_policy.dart';
import '../../features/services/presentation/screens/terms_of_service.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../blocs/app_settings_cubit/app_settings_cubit.dart';
import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash.path,
  redirect: (context, state) {
    final isFirstRun = context.read<AppSettingsCubit>().isFirstRun;

    if (!isFirstRun && state.matchedLocation == AppRoutes.onboarding.path) {
      return AppRoutes.main.path;
    }
    return null;
  },

  routes: [
    GoRoute(
      path: AppRoutes.splash.path,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.main.path,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const MainScreen(),
        transitionsBuilder: (context, animation, secondary, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    ),
    GoRoute(
      path: AppRoutes.onboarding.path,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const OnboardingScreen(),
        transitionsBuilder: (context, animation, secondary, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    ),
    GoRoute(
      path: AppRoutes.noInternet.path,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const NoInternetScreen(),
        transitionsBuilder: (context, animation, secondary, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    ),
    GoRoute(
      path: AppRoutes.hiddenForm.path,
      pageBuilder: (context, state) {
        final controller = state.extra as WebViewController;

        return CustomTransitionPage(
          opaque: false,
          barrierColor: Colors.transparent,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
          child: HiddenWebViewScreen(controller: controller),
          transitionsBuilder: (_, _, _, child) => child,
        );
      },
    ),
    GoRoute(
      path: AppRoutes.privacyPolicy.path,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const PrivacyPolicy(),
        transitionsBuilder: (context, animation, secondary, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    ),
    GoRoute(
      path: AppRoutes.termsOfService.path,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const TermsOfService(),
        transitionsBuilder: (context, animation, secondary, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    ),
  ],
);
