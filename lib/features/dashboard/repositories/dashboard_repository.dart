import 'package:dio/dio.dart';

import '../../../core/network/api_client.dart';
import '../models/dashboard_config.dart';
import '../models/chart_data.dart';
import '../models/filter_options.dart';
import '../models/metric_value.dart';

class DashboardRepository {
  DashboardRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  /// Fetch dashboard configuration from backend
  Future<DashboardConfig> fetchDashboardConfig() async {
    try {
      final response = await _apiClient.get<Map<String, dynamic>>(
        '/dashboard/config',
      );
      return DashboardConfig.fromJson(response.data ?? {});
    } on DioException catch (e) {
      throw Exception('Failed to fetch dashboard config: ${e.message}');
    }
  }

  /// Fetch all available filter options
  Future<FilterOptions> fetchFilterOptions() async {
    try {
      final response = await _apiClient.get<Map<String, dynamic>>(
        '/dashboard/filters',
      );
      return FilterOptions.fromJson(response.data ?? {});
    } on DioException catch (e) {
      throw Exception('Failed to fetch filter options: ${e.message}');
    }
  }

  /// Fetch district filter options
  Future<List<String>> fetchDistricts() async {
    try {
      final response = await _apiClient.get<Map<String, dynamic>>(
        '/dashboard/filters/districts',
      );
      final data = response.data ?? {};
      final options = FilterOptions.fromJson({
        'districts': data['districts'] ?? [],
        'zones': [],
        'cameras': [],
        'timeRanges': [],
      });
      return options.districts.map((d) => d.label).toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch districts: ${e.message}');
    }
  }

  /// Fetch zone filter options based on district
  Future<List<String>> fetchZones(String? districtId) async {
    try {
      final params = districtId != null ? {'districtId': districtId} : {};
      final response = await _apiClient.get<Map<String, dynamic>>(
        '/dashboard/filters/zones',
        queryParameters: params,
      );
      final data = response.data ?? {};
      final options = FilterOptions.fromJson({
        'zones': data['zones'] ?? [],
        'districts': [],
        'cameras': [],
        'timeRanges': [],
      });
      return options.zones.map((z) => z.label).toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch zones: ${e.message}');
    }
  }

  /// Fetch camera filter options based on zone
  Future<List<String>> fetchCameras(String? zoneId) async {
    try {
      final params = zoneId != null ? {'zoneId': zoneId} : {};
      final response = await _apiClient.get<Map<String, dynamic>>(
        '/dashboard/filters/cameras',
        queryParameters: params,
      );
      final data = response.data ?? {};
      final options = FilterOptions.fromJson({
        'cameras': data['cameras'] ?? [],
        'districts': [],
        'zones': [],
        'timeRanges': [],
      });
      return options.cameras.map((c) => c.label).toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch cameras: ${e.message}');
    }
  }

  /// Fetch metric value
  Future<MetricValue> fetchMetric(
    String metricId, {
    Map<String, dynamic>? filters,
  }) async {
    try {
      final response = await _apiClient.get<Map<String, dynamic>>(
        '/dashboard/metrics/$metricId',
        queryParameters: filters,
      );
      return MetricValue.fromJson(response.data ?? {});
    } on DioException catch (e) {
      throw Exception('Failed to fetch metric $metricId: ${e.message}');
    }
  }

  /// Fetch chart data
  Future<ChartResponse> fetchChart(
    String chartId, {
    Map<String, dynamic>? filters,
  }) async {
    try {
      final response = await _apiClient.get<Map<String, dynamic>>(
        '/dashboard/charts/$chartId',
        queryParameters: filters,
      );
      return ChartResponse.fromJson(response.data ?? {});
    } on DioException catch (e) {
      throw Exception('Failed to fetch chart $chartId: ${e.message}');
    }
  }

  /// Fetch all metrics
  Future<List<MetricValue>> fetchAllMetrics({
    Map<String, dynamic>? filters,
  }) async {
    try {
      final response = await _apiClient.get<List<dynamic>>(
        '/dashboard/metrics',
        queryParameters: filters,
      );
      final list = response.data ?? [];
      return list
          .map((item) => MetricValue.fromJson(item as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch metrics: ${e.message}');
    }
  }

  /// Fetch all charts
  Future<List<ChartResponse>> fetchAllCharts({
    Map<String, dynamic>? filters,
  }) async {
    try {
      final response = await _apiClient.get<List<dynamic>>(
        '/dashboard/charts',
        queryParameters: filters,
      );
      final list = response.data ?? [];
      return list
          .map((item) => ChartResponse.fromJson(item as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch charts: ${e.message}');
    }
  }
}
