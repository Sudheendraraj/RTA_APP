// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alerts_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlertItemImpl _$$AlertItemImplFromJson(Map<String, dynamic> json) =>
    _$AlertItemImpl(
      type: json['type'] as String,
      plate: json['plate'] as String,
      detectedAt: json['detectedAt'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$AlertItemImplToJson(_$AlertItemImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'plate': instance.plate,
      'detectedAt': instance.detectedAt,
      'status': instance.status,
    };
