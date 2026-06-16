// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FilterOptionsImpl _$$FilterOptionsImplFromJson(Map<String, dynamic> json) =>
    _$FilterOptionsImpl(
      districts: (json['districts'] as List<dynamic>)
          .map((e) => FilterOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      zones: (json['zones'] as List<dynamic>)
          .map((e) => FilterOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      cameras: (json['cameras'] as List<dynamic>)
          .map((e) => FilterOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeRanges: (json['timeRanges'] as List<dynamic>)
          .map((e) => FilterOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FilterOptionsImplToJson(_$FilterOptionsImpl instance) =>
    <String, dynamic>{
      'districts': instance.districts,
      'zones': instance.zones,
      'cameras': instance.cameras,
      'timeRanges': instance.timeRanges,
    };

_$FilterOptionImpl _$$FilterOptionImplFromJson(Map<String, dynamic> json) =>
    _$FilterOptionImpl(
      id: json['id'] as String,
      label: json['label'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$FilterOptionImplToJson(_$FilterOptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'description': instance.description,
    };
