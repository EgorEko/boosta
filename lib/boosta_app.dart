import 'package:flutter/material.dart';

import 'core/router/app_router.dart';

class BoostaApp extends StatelessWidget {
  const BoostaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Boosta test project',
    );
  }
}
