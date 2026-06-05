import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_monitoring_models.freezed.dart';
part 'vehicle_monitoring_models.g.dart';

@freezed
class VehicleDetection with _$VehicleDetection {
  const factory VehicleDetection({
    required String plate,
    required String vehicleType,
    required String camera,
    required String checkpost,
    required String detectedAt,
    required double confidence,
    required String direction,
    required String vehicleImage,
    required String plateImage,
  }) = _VehicleDetection;

  factory VehicleDetection.fromJson(Map<String, dynamic> json) =>
      _$VehicleDetectionFromJson(json);
}
