// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_classification_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleCategoryImpl _$$VehicleCategoryImplFromJson(
  Map<String, dynamic> json,
) => _$VehicleCategoryImpl(
  category: json['category'] as String,
  count: (json['count'] as num).toInt(),
  trend: (json['trend'] as num).toDouble(),
);

Map<String, dynamic> _$$VehicleCategoryImplToJson(
  _$VehicleCategoryImpl instance,
) => <String, dynamic>{
  'category': instance.category,
  'count': instance.count,
  'trend': instance.trend,
};
