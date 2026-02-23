part of 'device_id_cubit.dart';

class DeviceIdState extends Equatable {
  const DeviceIdState({this.deviceId, this.isLoading = false});

  final String? deviceId;
  final bool isLoading;

  @override
  List<Object?> get props => [deviceId, isLoading];

  DeviceIdState copyWith({String? deviceId, bool? isLoading}) {
    return DeviceIdState(
      deviceId: deviceId ?? this.deviceId,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
