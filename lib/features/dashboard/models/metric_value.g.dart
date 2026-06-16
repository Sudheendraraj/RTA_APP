// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metric_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MetricValueImpl _$$MetricValueImplFromJson(Map<String, dynamic> json) =>
    _$MetricValueImpl(
      id: json['id'] as String,
      value: json['value'] as num,
      previousValue: json['previousValue'] as num?,
      changePercentage: json['changePercentage'] as num?,
    );

Map<String, dynamic> _$$MetricValueImplToJson(_$MetricValueImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'previousValue': instance.previousValue,
      'changePercentage': instance.changePercentage,
    };
