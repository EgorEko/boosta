import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/blocs/app_settings_cubit/app_settings_cubit.dart';
import '../../../../core/common/widgets/bg_widgets/bg_widget.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  void _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    final isFirstRun = context.read<AppSettingsCubit>().isFirstRun;
    context.go(isFirstRun ? AppRoutes.onboarding.path : AppRoutes.main.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BGWidget(
        child: Stack(
          children: [
            Assets.elements.net.svg(
              alignment: Alignment.center,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Center(
              child: Image.asset(
                Assets.icons.appStoreIcon.path,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
