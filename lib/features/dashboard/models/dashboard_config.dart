import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_config.freezed.dart';
part 'dashboard_config.g.dart';

@freezed
class DashboardConfig with _$DashboardConfig {
  const factory DashboardConfig({
    required String title,
    required List<FilterConfig> filters,
    required List<MetricConfig> metrics,
    required List<ChartConfig> charts,
    required LayoutConfig layout,
    required RefreshConfig refresh,
  }) = _DashboardConfig;

  factory DashboardConfig.fromJson(Map<String, dynamic> json) =>
      _$DashboardConfigFromJson(json);
}

@freezed
class FilterConfig with _$FilterConfig {
  const factory FilterConfig({
    required String id,
    required String label,
    required String hint,
    required bool isMultiSelect,
    required bool isRequired,
    required int order,
  }) = _FilterConfig;

  factory FilterConfig.fromJson(Map<String, dynamic> json) =>
      _$FilterConfigFromJson(json);
}

@freezed
class MetricConfig with _$MetricConfig {
  const factory MetricConfig({
    required String id,
    required String title,
    required String apiEndpoint,
    required String icon,
    required String backgroundColor,
    required int order,
    required bool isVisible,
  }) = _MetricConfig;

  factory MetricConfig.fromJson(Map<String, dynamic> json) =>
      _$MetricConfigFromJson(json);
}

@freezed
class ChartConfig with _$ChartConfig {
  const factory ChartConfig({
    required String id,
    required String title,
    required String type, // 'doughnut', 'column', 'line', 'pie'
    required String apiEndpoint,
    required List<String> dataFields,
    required bool isVisible,
    required int order,
  }) = _ChartConfig;

  factory ChartConfig.fromJson(Map<String, dynamic> json) =>
      _$ChartConfigFromJson(json);
}

@freezed
class LayoutConfig with _$LayoutConfig {
  const factory LayoutConfig({
    required int filterColumnsDesktop,
    required int filterColumnsMobile,
    required int metricColumnsDesktop,
    required int metricColumnsMobile,
    required int chartColumnsDesktop,
    required int chartColumnsMobile,
  }) = _LayoutConfig;

  factory LayoutConfig.fromJson(Map<String, dynamic> json) =>
      _$LayoutConfigFromJson(json);
}

@freezed
class RefreshConfig with _$RefreshConfig {
  const factory RefreshConfig({
    required int intervalSeconds,
    required bool enableAutoRefresh,
    required bool enableRealTimeUpdates,
  }) = _RefreshConfig;

  factory RefreshConfig.fromJson(Map<String, dynamic> json) =>
      _$RefreshConfigFromJson(json);
}
