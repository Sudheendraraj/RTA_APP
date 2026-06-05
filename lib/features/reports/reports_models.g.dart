// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportItemImpl _$$ReportItemImplFromJson(Map<String, dynamic> json) =>
    _$ReportItemImpl(
      name: json['name'] as String,
      type: json['type'] as String,
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$$ReportItemImplToJson(_$ReportItemImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'count': instance.count,
    };
