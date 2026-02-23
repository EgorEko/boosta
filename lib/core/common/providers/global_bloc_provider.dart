import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../blocs/app_settings_cubit/app_settings_cubit.dart';
import '../../blocs/device_id_cubit/device_id_cubit.dart';

class GlobalBlocProvider extends StatelessWidget {
  const GlobalBlocProvider({
    super.key,
    required this.child,
    required SharedPreferences prefs,
    required DeviceIdCubit deviceIdCubit,
  }) : _prefs = prefs,
       _deviceIdCubit = deviceIdCubit;

  final Widget child;
  final SharedPreferences _prefs;
  final DeviceIdCubit _deviceIdCubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppSettingsCubit(_prefs)),
        BlocProvider.value(value: _deviceIdCubit),
      ],
      child: child,
    );
  }
}
