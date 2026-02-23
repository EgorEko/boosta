import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'boosta_app.dart';
import 'core/blocs/device_id_cubit/device_id_cubit.dart';
import 'core/common/providers/global_bloc_provider.dart';
import 'core/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final deviceIdCubit = DeviceIdCubit();
  await deviceIdCubit.loadOrGenerateId();

  WakelockPlus.enable();

  final prefs = await SharedPreferences.getInstance();

  final router = createRouter(deviceIdCubit: deviceIdCubit);

  runApp(
    GlobalBlocProvider(
      prefs: prefs,
      deviceIdCubit: deviceIdCubit,
      child: BoostaApp(appRouter: router),
    ),
  );
}
