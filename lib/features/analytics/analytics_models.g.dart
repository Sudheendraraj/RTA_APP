// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrafficSeriesImpl _$$TrafficSeriesImplFromJson(Map<String, dynamic> json) =>
    _$TrafficSeriesImpl(
      label: json['label'] as String,
      vehicles: (json['vehicles'] as num).toInt(),
    );

Map<String, dynamic> _$$TrafficSeriesImplToJson(_$TrafficSeriesImpl instance) =>
    <String, dynamic>{'label': instance.label, 'vehicles': instance.vehicles};
