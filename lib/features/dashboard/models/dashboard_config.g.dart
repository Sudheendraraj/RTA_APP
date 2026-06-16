// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardConfigImpl _$$DashboardConfigImplFromJson(
  Map<String, dynamic> json,
) => _$DashboardConfigImpl(
  title: json['title'] as String,
  filters: (json['filters'] as List<dynamic>)
      .map((e) => FilterConfig.fromJson(e as Map<String, dynamic>))
      .toList(),
  metrics: (json['metrics'] as List<dynamic>)
      .map((e) => MetricConfig.fromJson(e as Map<String, dynamic>))
      .toList(),
  charts: (json['charts'] as List<dynamic>)
      .map((e) => ChartConfig.fromJson(e as Map<String, dynamic>))
      .toList(),
  layout: LayoutConfig.fromJson(json['layout'] as Map<String, dynamic>),
  refresh: RefreshConfig.fromJson(json['refresh'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$DashboardConfigImplToJson(
  _$DashboardConfigImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'filters': instance.filters,
  'metrics': instance.metrics,
  'charts': instance.charts,
  'layout': instance.layout,
  'refresh': instance.refresh,
};

_$FilterConfigImpl _$$FilterConfigImplFromJson(Map<String, dynamic> json) =>
    _$FilterConfigImpl(
      id: json['id'] as String,
      label: json['label'] as String,
      hint: json['hint'] as String,
      isMultiSelect: json['isMultiSelect'] as bool,
      isRequired: json['isRequired'] as bool,
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$$FilterConfigImplToJson(_$FilterConfigImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'hint': instance.hint,
      'isMultiSelect': instance.isMultiSelect,
      'isRequired': instance.isRequired,
      'order': instance.order,
    };

_$MetricConfigImpl _$$MetricConfigImplFromJson(Map<String, dynamic> json) =>
    _$MetricConfigImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      apiEndpoint: json['apiEndpoint'] as String,
      icon: json['icon'] as String,
      backgroundColor: json['backgroundColor'] as String,
      order: (json['order'] as num).toInt(),
      isVisible: json['isVisible'] as bool,
    );

Map<String, dynamic> _$$MetricConfigImplToJson(_$MetricConfigImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'apiEndpoint': instance.apiEndpoint,
      'icon': instance.icon,
      'backgroundColor': instance.backgroundColor,
      'order': instance.order,
      'isVisible': instance.isVisible,
    };

_$ChartConfigImpl _$$ChartConfigImplFromJson(Map<String, dynamic> json) =>
    _$ChartConfigImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      type: json['type'] as String,
      apiEndpoint: json['apiEndpoint'] as String,
      dataFields: (json['dataFields'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isVisible: json['isVisible'] as bool,
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$$ChartConfigImplToJson(_$ChartConfigImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'apiEndpoint': instance.apiEndpoint,
      'dataFields': instance.dataFields,
      'isVisible': instance.isVisible,
      'order': instance.order,
    };

_$LayoutConfigImpl _$$LayoutConfigImplFromJson(Map<String, dynamic> json) =>
    _$LayoutConfigImpl(
      filterColumnsDesktop: (json['filterColumnsDesktop'] as num).toInt(),
      filterColumnsMobile: (json['filterColumnsMobile'] as num).toInt(),
      metricColumnsDesktop: (json['metricColumnsDesktop'] as num).toInt(),
      metricColumnsMobile: (json['metricColumnsMobile'] as num).toInt(),
      chartColumnsDesktop: (json['chartColumnsDesktop'] as num).toInt(),
      chartColumnsMobile: (json['chartColumnsMobile'] as num).toInt(),
    );

Map<String, dynamic> _$$LayoutConfigImplToJson(_$LayoutConfigImpl instance) =>
    <String, dynamic>{
      'filterColumnsDesktop': instance.filterColumnsDesktop,
      'filterColumnsMobile': instance.filterColumnsMobile,
      'metricColumnsDesktop': instance.metricColumnsDesktop,
      'metricColumnsMobile': instance.metricColumnsMobile,
      'chartColumnsDesktop': instance.chartColumnsDesktop,
      'chartColumnsMobile': instance.chartColumnsMobile,
    };

_$RefreshConfigImpl _$$RefreshConfigImplFromJson(Map<String, dynamic> json) =>
    _$RefreshConfigImpl(
      intervalSeconds: (json['intervalSeconds'] as num).toInt(),
      enableAutoRefresh: json['enableAutoRefresh'] as bool,
      enableRealTimeUpdates: json['enableRealTimeUpdates'] as bool,
    );

Map<String, dynamic> _$$RefreshConfigImplToJson(_$RefreshConfigImpl instance) =>
    <String, dynamic>{
      'intervalSeconds': instance.intervalSeconds,
      'enableAutoRefresh': instance.enableAutoRefresh,
      'enableRealTimeUpdates': instance.enableRealTimeUpdates,
    };
