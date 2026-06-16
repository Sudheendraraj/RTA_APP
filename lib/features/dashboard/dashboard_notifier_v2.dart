import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/api_client.dart';
import '../auth/auth_notifier.dart';
import 'models/dashboard_config.dart';
import 'models/filter_options.dart';
import 'models/chart_data.dart';
import 'models/metric_value.dart';
import 'repositories/dashboard_repository.dart';

final dashboardConfigProvider = FutureProvider<DashboardConfig>((ref) async {
  final storage = ref.watch(authNotifierProvider.notifier).storage;
  final apiClient = ApiClient(storage);
  final repository = DashboardRepository(apiClient: apiClient);
  return repository.fetchDashboardConfig();
});

final dashboardFilterOptionsProvider = FutureProvider<FilterOptions>((
  ref,
) async {
  final storage = ref.watch(authNotifierProvider.notifier).storage;
  final apiClient = ApiClient(storage);
  final repository = DashboardRepository(apiClient: apiClient);
  return repository.fetchFilterOptions();
});

final dashboardMetricsProvider = FutureProvider<List<MetricValue>>((ref) async {
  final storage = ref.watch(authNotifierProvider.notifier).storage;
  final apiClient = ApiClient(storage);
  final repository = DashboardRepository(apiClient: apiClient);
  return repository.fetchAllMetrics();
});

final dashboardChartsProvider = FutureProvider<List<ChartResponse>>((
  ref,
) async {
  final storage = ref.watch(authNotifierProvider.notifier).storage;
  final apiClient = ApiClient(storage);
  final repository = DashboardRepository(apiClient: apiClient);
  return repository.fetchAllCharts();
});

final selectedDistrictProvider = StateProvider<String?>((ref) => null);
final selectedZoneProvider = StateProvider<String?>((ref) => null);
final selectedCameraProvider = StateProvider<List<String>>((ref) => []);
final selectedTimeRangeProvider = StateProvider<String?>((ref) => null);

final districtOptionsProvider = FutureProvider<List<String>>((ref) async {
  final storage = ref.watch(authNotifierProvider.notifier).storage;
  final apiClient = ApiClient(storage);
  final repository = DashboardRepository(apiClient: apiClient);
  return repository.fetchDistricts();
});

final zoneOptionsProvider = FutureProvider<List<String>>((ref) async {
  final selectedDistrict = ref.watch(selectedDistrictProvider);
  final storage = ref.watch(authNotifierProvider.notifier).storage;
  final apiClient = ApiClient(storage);
  final repository = DashboardRepository(apiClient: apiClient);
  return repository.fetchZones(selectedDistrict);
});

final cameraOptionsProvider = FutureProvider<List<String>>((ref) async {
  final selectedZone = ref.watch(selectedZoneProvider);
  final storage = ref.watch(authNotifierProvider.notifier).storage;
  final apiClient = ApiClient(storage);
  final repository = DashboardRepository(apiClient: apiClient);
  return repository.fetchCameras(selectedZone);
});

final dashboardNotifierProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>((ref) {
      final storage = ref.watch(authNotifierProvider.notifier).storage;
      final apiClient = ApiClient(storage);
      return DashboardNotifier(
        repository: DashboardRepository(apiClient: apiClient),
      );
    });

class DashboardState {
  DashboardState({
    this.config,
    this.filterOptions,
    this.metrics = const [],
    this.charts = const [],
    this.isLoading = false,
    this.error,
    this.lastUpdated,
  });

  final DashboardConfig? config;
  final FilterOptions? filterOptions;
  final List<MetricValue> metrics;
  final List<ChartResponse> charts;
  final bool isLoading;
  final String? error;
  final DateTime? lastUpdated;

  DashboardState copyWith({
    DashboardConfig? config,
    FilterOptions? filterOptions,
    List<MetricValue>? metrics,
    List<ChartResponse>? charts,
    bool? isLoading,
    String? error,
    DateTime? lastUpdated,
  }) {
    return DashboardState(
      config: config ?? this.config,
      filterOptions: filterOptions ?? this.filterOptions,
      metrics: metrics ?? this.metrics,
      charts: charts ?? this.charts,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}

class DashboardNotifier extends StateNotifier<DashboardState> {
  DashboardNotifier({required this.repository}) : super(DashboardState()) {
    _initializeDashboard();
  }

  final DashboardRepository repository;
  Timer? _autoRefreshTimer;

  Future<void> _initializeDashboard() async {
    state = state.copyWith(isLoading: true);
    try {
      final config = await repository.fetchDashboardConfig();
      final filterOptions = await repository.fetchFilterOptions();
      final metrics = await repository.fetchAllMetrics();
      final charts = await repository.fetchAllCharts();

      state = state.copyWith(
        config: config,
        filterOptions: filterOptions,
        metrics: metrics,
        charts: charts,
        isLoading: false,
        lastUpdated: DateTime.now(),
      );

      // Start auto-refresh if enabled
      if (config.refresh.enableAutoRefresh) {
        _startAutoRefresh(config.refresh.intervalSeconds);
      }
    } catch (error) {
      state = state.copyWith(error: error.toString(), isLoading: false);
    }
  }

  void _startAutoRefresh(int intervalSeconds) {
    _autoRefreshTimer?.cancel();
    _autoRefreshTimer = Timer.periodic(
      Duration(seconds: intervalSeconds),
      (_) => fetchDashboardData(),
    );
  }

  Future<void> fetchDashboardData() async {
    try {
      final metrics = await repository.fetchAllMetrics();
      final charts = await repository.fetchAllCharts();

      state = state.copyWith(
        metrics: metrics,
        charts: charts,
        lastUpdated: DateTime.now(),
        error: null,
      );
    } catch (error) {
      state = state.copyWith(error: error.toString());
    }
  }

  Future<void> applyFilters({
    String? district,
    String? zone,
    List<String>? cameras,
    String? timeRange,
  }) async {
    try {
      state = state.copyWith(isLoading: true);

      final filters = <String, dynamic>{};
      if (district != null && district != 'Select All District') {
        filters['district'] = district;
      }
      if (zone != null && zone != 'Select All Zone') {
        filters['zone'] = zone;
      }
      if (cameras != null && cameras.isNotEmpty) {
        filters['cameras'] = cameras.join(',');
      }
      if (timeRange != null && timeRange != 'Select All Time Range') {
        filters['timeRange'] = timeRange;
      }

      final metrics = await repository.fetchAllMetrics(filters: filters);
      final charts = await repository.fetchAllCharts(filters: filters);

      state = state.copyWith(
        metrics: metrics,
        charts: charts,
        isLoading: false,
        lastUpdated: DateTime.now(),
      );
    } catch (error) {
      state = state.copyWith(error: error.toString(), isLoading: false);
    }
  }

  @override
  void dispose() {
    _autoRefreshTimer?.cancel();
    super.dispose();
  }
}
