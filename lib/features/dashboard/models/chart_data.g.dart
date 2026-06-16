// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DynamicChartDataImpl _$$DynamicChartDataImplFromJson(
  Map<String, dynamic> json,
) => _$DynamicChartDataImpl(
  label: json['label'] as String,
  value: json['value'] as num,
  color: json['color'] as String,
);

Map<String, dynamic> _$$DynamicChartDataImplToJson(
  _$DynamicChartDataImpl instance,
) => <String, dynamic>{
  'label': instance.label,
  'value': instance.value,
  'color': instance.color,
};

_$ChartResponseImpl _$$ChartResponseImplFromJson(Map<String, dynamic> json) =>
    _$ChartResponseImpl(
      title: json['title'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => DynamicChartData.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$ChartResponseImplToJson(_$ChartResponseImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'data': instance.data,
      'description': instance.description,
    };
