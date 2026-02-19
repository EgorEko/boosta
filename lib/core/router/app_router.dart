import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/main/presentation/screens/main_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../blocs/app_settings_cubit/app_settings_cubit.dart';
import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash.path,
  redirect: (context, state) async {
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
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: AppRoutes.onboarding.path,
      builder: (context, state) => const OnboardingScreen(),
    ),
  ],
);
