// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_monitoring_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleDetectionImpl _$$VehicleDetectionImplFromJson(
  Map<String, dynamic> json,
) => _$VehicleDetectionImpl(
  plate: json['plate'] as String,
  vehicleType: json['vehicleType'] as String,
  camera: json['camera'] as String,
  checkpost: json['checkpost'] as String,
  detectedAt: json['detectedAt'] as String,
  confidence: (json['confidence'] as num).toDouble(),
  direction: json['direction'] as String,
  vehicleImage: json['vehicleImage'] as String,
  plateImage: json['plateImage'] as String,
);

Map<String, dynamic> _$$VehicleDetectionImplToJson(
  _$VehicleDetectionImpl instance,
) => <String, dynamic>{
  'plate': instance.plate,
  'vehicleType': instance.vehicleType,
  'camera': instance.camera,
  'checkpost': instance.checkpost,
  'detectedAt': instance.detectedAt,
  'confidence': instance.confidence,
  'direction': instance.direction,
  'vehicleImage': instance.vehicleImage,
  'plateImage': instance.plateImage,
};
