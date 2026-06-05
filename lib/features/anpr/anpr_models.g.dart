// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anpr_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnprRecordImpl _$$AnprRecordImplFromJson(Map<String, dynamic> json) =>
    _$AnprRecordImpl(
      plate: json['plate'] as String,
      camera: json['camera'] as String,
      checkpost: json['checkpost'] as String,
      vehicleType: json['vehicleType'] as String,
      detectedAt: json['detectedAt'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      direction: json['direction'] as String,
      vehicleImage: json['vehicleImage'] as String,
      plateImage: json['plateImage'] as String,
    );

Map<String, dynamic> _$$AnprRecordImplToJson(_$AnprRecordImpl instance) =>
    <String, dynamic>{
      'plate': instance.plate,
      'camera': instance.camera,
      'checkpost': instance.checkpost,
      'vehicleType': instance.vehicleType,
      'detectedAt': instance.detectedAt,
      'confidence': instance.confidence,
      'direction': instance.direction,
      'vehicleImage': instance.vehicleImage,
      'plateImage': instance.plateImage,
    };
