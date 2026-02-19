import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/blocs/app_settings_cubit/app_settings_cubit.dart';
import '../../../../core/router/app_routes.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          onPressed: () async {
            await context.read<AppSettingsCubit>().completeOnboarding();
            if (context.mounted) {
              context.go(AppRoutes.main.path);
            }
          },
          child: Text('Apply for a Loan'),
        ),
      ),
    );
  }
}
