import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'core/blocs/device_id_cubit/device_id_cubit.dart';
import 'core/common/utils/platform_utils.dart';
import 'l10n/app_localizations.dart';

class BoostaApp extends StatelessWidget {
  const BoostaApp({super.key, required this.appRouter});

  final GoRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: PlatformUtils.getScreenSize(),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocBuilder<DeviceIdCubit, DeviceIdState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: appRouter,
            title: 'Boosta test project',
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('en')],
            builder: (context, child) {
              if (state.isLoading) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }
              return child!;
            },
          );
        },
      ),
    );
  }
}
