import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsCubit extends Cubit<bool> {
  AppSettingsCubit(this._prefs) : super(_prefs.getBool(_isFirstRunKey) ?? true);

  final SharedPreferences _prefs;
  static const _isFirstRunKey = 'is_first_run';

  bool get isFirstRun => state;

  Future<void> completeOnboarding() async {
    await _prefs.setBool(_isFirstRunKey, false);
    emit(false);
  }
}
