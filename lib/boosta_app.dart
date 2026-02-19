import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/common/utils/platform_utils.dart';
import 'l10n/app_localizations.dart';

import 'core/router/app_router.dart';

class BoostaApp extends StatelessWidget {
  const BoostaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: PlatformUtils.getScreenSize(),
      minTextAdapt: true,
      child: MaterialApp.router(
        routerConfig: appRouter,
        title: 'Boosta test project',
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale('en')],
      ),
    );
  }
}
