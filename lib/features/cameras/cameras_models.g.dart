// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cameras_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CameraStatusImpl _$$CameraStatusImplFromJson(Map<String, dynamic> json) =>
    _$CameraStatusImpl(
      name: json['name'] as String,
      checkpost: json['checkpost'] as String,
      status: json['status'] as String,
      health: (json['health'] as num).toInt(),
      lastActive: json['lastActive'] as String,
    );

Map<String, dynamic> _$$CameraStatusImplToJson(_$CameraStatusImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'checkpost': instance.checkpost,
      'status': instance.status,
      'health': instance.health,
      'lastActive': instance.lastActive,
    };
