import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/api_client.dart';
import '../auth/auth_notifier.dart';
import 'dashboard_models.dart';
import 'dashboard_repository.dart';

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
    this.kpis,
    this.analyticsSeries = const [],
    this.districts = const ['Select All District'],
    this.zones = const ['Select All Zone'],
    this.cameras = const ['Select All Camera'],
    this.cameraLocationToId = const {},
    this.offenceData,
    this.isLoading = false,
    this.error,
  });

  final KpiSummary? kpis;
  final List<AnalyticsSeries> analyticsSeries;
  final List<String> districts;
  final List<String> zones;
  final List<String> cameras;
  final Map<String, String> cameraLocationToId;
  final Map<String, dynamic>? offenceData;
  final bool isLoading;
  final String? error;
}

class DashboardNotifier extends StateNotifier<DashboardState> {
  DashboardNotifier({required this.repository}) : super(DashboardState()) {
    fetchDashboard();
  }

  final DashboardRepository repository;

  Future<void> fetchDashboard({String? district, String? zone, String? camera, String? timeRange}) async {
    state = DashboardState(
      isLoading: true,
      districts: state.districts,
      zones: state.zones,
      cameras: state.cameras,
      cameraLocationToId: state.cameraLocationToId,
      offenceData: state.offenceData,
      kpis: state.kpis,
      analyticsSeries: state.analyticsSeries,
    );
    KpiSummary? kpis;
    List<AnalyticsSeries> analytics = [];
    List<String> districts = state.districts;
    Map<String, dynamic>? offenceData;
    String? errorMsg;

    try {
      kpis = await repository.fetchKpis();
    } catch (e) {
      errorMsg = e.toString();
    }

    try {
      analytics = await repository.fetchHourlyTraffic();
    } catch (e) {
      errorMsg ??= e.toString();
    }

    try {
      districts = await repository.fetchDistricts();
    } catch (e) {
      errorMsg ??= e.toString();
    }

    try {
      offenceData = await repository.fetchOffenceCountData(
        district: district,
        zone: zone,
        camera: camera,
        timeRange: timeRange,
      );
    } catch (e) {
      errorMsg ??= e.toString();
    }

    state = DashboardState(
      kpis: kpis ?? state.kpis,
      analyticsSeries: analytics.isNotEmpty ? analytics : state.analyticsSeries,
      districts: districts,
      zones: state.zones,
      cameras: state.cameras,
      cameraLocationToId: state.cameraLocationToId,
      offenceData: offenceData ?? state.offenceData,
      isLoading: false,
      error: errorMsg,
    );
  }

  Future<void> fetchZonesForDistrict(String district) async {
    debugPrint('Notifier fetchZonesForDistrict called for: $district');
    state = DashboardState(
      isLoading: true,
      districts: state.districts,
      zones: state.zones,
      cameras: state.cameras,
      cameraLocationToId: state.cameraLocationToId,
      offenceData: state.offenceData,
      kpis: state.kpis,
      analyticsSeries: state.analyticsSeries,
    );
    try {
      final zonesList = await repository.fetchZones(district);
      debugPrint('Notifier fetchZonesForDistrict success: $zonesList');
      state = DashboardState(
        kpis: state.kpis,
        analyticsSeries: state.analyticsSeries,
        districts: state.districts,
        zones: zonesList,
        cameras: state.cameras,
        cameraLocationToId: state.cameraLocationToId,
        offenceData: state.offenceData,
        isLoading: false,
      );
    } catch (e, stack) {
      debugPrint('Notifier fetchZonesForDistrict error: $e');
      debugPrint(stack.toString());
      state = DashboardState(
        kpis: state.kpis,
        analyticsSeries: state.analyticsSeries,
        districts: state.districts,
        zones: const ['Select All Zone'],
        cameras: state.cameras,
        cameraLocationToId: state.cameraLocationToId,
        offenceData: state.offenceData,
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void resetZones() {
    state = DashboardState(
      kpis: state.kpis,
      analyticsSeries: state.analyticsSeries,
      districts: state.districts,
      zones: const ['Select All Zone'],
      cameras: state.cameras,
      cameraLocationToId: state.cameraLocationToId,
      offenceData: state.offenceData,
      isLoading: false,
    );
  }

  Future<void> fetchCamerasForZone(String zone) async {
    debugPrint('Notifier fetchCamerasForZone called for: $zone');
    state = DashboardState(
      isLoading: true,
      districts: state.districts,
      zones: state.zones,
      cameras: state.cameras,
      cameraLocationToId: state.cameraLocationToId,
      offenceData: state.offenceData,
      kpis: state.kpis,
      analyticsSeries: state.analyticsSeries,
    );
    try {
      final cameraData = await repository.fetchCameras(zone);
      final List<String> camerasList = ['Select All Camera'];
      final Map<String, String> lookup = {};
      for (final item in cameraData) {
        if (item is Map) {
          final id = item['cameraID']?.toString();
          final loc = item['cameraLocation']?.toString();
          if (id != null && loc != null) {
            camerasList.add(loc);
            lookup[loc] = id;
          }
        }
      }
      debugPrint('Notifier fetchCamerasForZone success: $camerasList');
      state = DashboardState(
        kpis: state.kpis,
        analyticsSeries: state.analyticsSeries,
        districts: state.districts,
        zones: state.zones,
        cameras: camerasList,
        cameraLocationToId: lookup,
        offenceData: state.offenceData,
        isLoading: false,
      );
    } catch (e, stack) {
      debugPrint('Notifier fetchCamerasForZone error: $e');
      debugPrint(stack.toString());
      state = DashboardState(
        kpis: state.kpis,
        analyticsSeries: state.analyticsSeries,
        districts: state.districts,
        zones: state.zones,
        cameras: const ['Select All Camera'],
        cameraLocationToId: const {},
        offenceData: state.offenceData,
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void resetCameras() {
    state = DashboardState(
      kpis: state.kpis,
      analyticsSeries: state.analyticsSeries,
      districts: state.districts,
      zones: state.zones,
      cameras: const ['Select All Camera'],
      cameraLocationToId: const {},
      offenceData: state.offenceData,
      isLoading: false,
    );
  }
}
