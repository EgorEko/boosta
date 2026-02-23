import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

part 'device_id_state.dart';

class DeviceIdCubit extends Cubit<DeviceIdState> {
  DeviceIdCubit() : super(const DeviceIdState(isLoading: true));

  Future<void> loadOrGenerateId() async {
    emit(state.copyWith(isLoading: true));

    final prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('device_id');

    if (id == null) {
      id = const Uuid().v4();
      await prefs.setString('device_id', id);
    }

    emit(state.copyWith(deviceId: id, isLoading: false));
  }
}
