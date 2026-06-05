// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KpiSummaryImpl _$$KpiSummaryImplFromJson(Map<String, dynamic> json) =>
    _$KpiSummaryImpl(
      totalVehiclesToday: (json['totalVehiclesToday'] as num).toInt(),
      totalVehiclesWeek: (json['totalVehiclesWeek'] as num).toInt(),
      totalVehiclesMonth: (json['totalVehiclesMonth'] as num).toInt(),
      blacklistedVehicles: (json['blacklistedVehicles'] as num).toInt(),
      violationsDetected: (json['violationsDetected'] as num).toInt(),
      activeCameras: (json['activeCameras'] as num).toInt(),
      offlineCameras: (json['offlineCameras'] as num).toInt(),
      totalCheckposts: (json['totalCheckposts'] as num).toInt(),
    );

Map<String, dynamic> _$$KpiSummaryImplToJson(_$KpiSummaryImpl instance) =>
    <String, dynamic>{
      'totalVehiclesToday': instance.totalVehiclesToday,
      'totalVehiclesWeek': instance.totalVehiclesWeek,
      'totalVehiclesMonth': instance.totalVehiclesMonth,
      'blacklistedVehicles': instance.blacklistedVehicles,
      'violationsDetected': instance.violationsDetected,
      'activeCameras': instance.activeCameras,
      'offlineCameras': instance.offlineCameras,
      'totalCheckposts': instance.totalCheckposts,
    };

_$AnalyticsSeriesImpl _$$AnalyticsSeriesImplFromJson(
  Map<String, dynamic> json,
) => _$AnalyticsSeriesImpl(
  label: json['label'] as String,
  value: (json['value'] as num).toInt(),
);

Map<String, dynamic> _$$AnalyticsSeriesImplToJson(
  _$AnalyticsSeriesImpl instance,
) => <String, dynamic>{'label': instance.label, 'value': instance.value};
