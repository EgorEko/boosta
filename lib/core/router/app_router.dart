import 'package:connectivity_plus/connectivity_plus.dart';
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
import '../blocs/device_id_cubit/device_id_cubit.dart';
import '../common/utils/extensions.dart';
import 'app_routes.dart';

class CubitRefreshStream extends ChangeNotifier {
  CubitRefreshStream(Stream stream) {
    stream.listen((_) => notifyListeners());
  }
}

GoRouter createRouter({required DeviceIdCubit deviceIdCubit}) {
  return GoRouter(
    initialLocation: AppRoutes.splash.path,
    refreshListenable: CubitRefreshStream(deviceIdCubit.stream),
    redirect: (context, state) {
      final appSettings = context.read<AppSettingsCubit>();
      final deviceIdCubit = context.read<DeviceIdCubit>();

      final deviceId = deviceIdCubit.state.deviceId;
      final isLoading = deviceIdCubit.state.isLoading;
      final isFirstRun = appSettings.isFirstRun;

      if (isLoading) {
        return AppRoutes.splash.path;
      }

      if (!isFirstRun && state.matchedLocation == AppRoutes.onboarding.path) {
        return AppRoutes.main.path;
      }

      if (state.matchedLocation == AppRoutes.main.path) {
        final hasIdInUrl = state.uri.queryParameters.containsKey('device_id');

        if (!hasIdInUrl && deviceId != null) {
          return Uri(
            path: AppRoutes.main.path,
            queryParameters: {'device_id': deviceId},
          ).toString();
        }
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
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const MainScreen(),
            transitionsBuilder: (context, animation, secondary, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 50),
          );
        },
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
        builder: (context, state) => NoInternetScreen(
          onPressed: () async {
            final results = await Connectivity().checkConnectivity();
            final hasInternet = !results.contains(ConnectivityResult.none);

            if (hasInternet) {
              if (context.mounted && context.canPop()) {
                context.pop();
              }
            } else {
              if (context.mounted) {
                context.showSnack(context.locale!.connectionStillMissing);
              }
            }
          },
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
}
