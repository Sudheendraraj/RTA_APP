import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/api_client.dart';
import '../auth/auth_notifier.dart';
import 'dashboard_models.dart';
import 'dashboard_repository.dart';

final dashboardNotifierProvider =
    StateNotifierProvider.autoDispose<DashboardNotifier, DashboardState>((ref) {
      final authState = ref.watch(authNotifierProvider);
      final storage = ref.watch(authNotifierProvider.notifier).storage;
      final apiClient = ApiClient(storage);
      return DashboardNotifier(
        repository: DashboardRepository(apiClient: apiClient),
        isAuthenticated: authState.isAuthenticated,
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
    this.offenceTypes = const [],
    this.isLoading = false,
    this.error,
    this.eChallan = '2',
    this.manualChallan = '2',
    this.seizedVehicles = '0',
    this.monthlyRevenue = const {},
  });

  final KpiSummary? kpis;
  final List<AnalyticsSeries> analyticsSeries;
  final List<String> districts;
  final List<String> zones;
  final List<String> cameras;
  final Map<String, String> cameraLocationToId;
  final Map<String, dynamic>? offenceData;
  final List<String> offenceTypes;
  final bool isLoading;
  final String? error;
  final String eChallan;
  final String manualChallan;
  final String seizedVehicles;
  final Map<String, double> monthlyRevenue;

  DashboardState copyWith({
    KpiSummary? kpis,
    List<AnalyticsSeries>? analyticsSeries,
    List<String>? districts,
    List<String>? zones,
    List<String>? cameras,
    Map<String, String>? cameraLocationToId,
    Map<String, dynamic>? offenceData,
    List<String>? offenceTypes,
    bool? isLoading,
    String? error,
    String? eChallan,
    String? manualChallan,
    String? seizedVehicles,
    Map<String, double>? monthlyRevenue,
  }) {
    return DashboardState(
      kpis: kpis ?? this.kpis,
      analyticsSeries: analyticsSeries ?? this.analyticsSeries,
      districts: districts ?? this.districts,
      zones: zones ?? this.zones,
      cameras: cameras ?? this.cameras,
      cameraLocationToId: cameraLocationToId ?? this.cameraLocationToId,
      offenceData: offenceData ?? this.offenceData,
      offenceTypes: offenceTypes ?? this.offenceTypes,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      eChallan: eChallan ?? this.eChallan,
      manualChallan: manualChallan ?? this.manualChallan,
      seizedVehicles: seizedVehicles ?? this.seizedVehicles,
      monthlyRevenue: monthlyRevenue ?? this.monthlyRevenue,
    );
  }
}

class DashboardNotifier extends StateNotifier<DashboardState> {
  DashboardNotifier({
    required this.repository,
    required bool isAuthenticated,
  }) : super(DashboardState()) {
    if (isAuthenticated) {
      fetchDashboard(timeRange: 'Today', isInitial: true);
    }
  }

  final DashboardRepository repository;

  Future<void> fetchDashboard({
    String? district,
    String? zone,
    String? camera,
    String? timeRange,
    bool isInitial = false,
  }) async {
    if (!isInitial) {
      state = state.copyWith(isLoading: true);
    }
    
    KpiSummary? kpis;
    List<AnalyticsSeries> analytics = [];
    List<String> districts = state.districts;
    List<String> offenceTypes = state.offenceTypes;
    Map<String, dynamic>? offenceData;
    Map<String, String> challans = {
      'eChallan': state.eChallan,
      'manualChallan': state.manualChallan,
      'seizedVehicles': state.seizedVehicles,
    };
    Map<String, double> monthlyRevenue = state.monthlyRevenue;
    String? errorMsg;

    try {
      final kpiFuture = repository.fetchKpis().catchError((e) {
        errorMsg ??= e.toString();
        return const KpiSummary(
          totalVehiclesToday: 0,
          totalVehiclesWeek: 0,
          totalVehiclesMonth: 0,
          blacklistedVehicles: 0,
          violationsDetected: 0,
          activeCameras: 0,
          offlineCameras: 0,
          totalCheckposts: 0,
        );
      });

      final trafficFuture = repository.fetchHourlyTraffic().catchError((e) {
        errorMsg ??= e.toString();
        return const <AnalyticsSeries>[];
      });

      final districtsFuture = repository.fetchDistricts().catchError((e) {
        errorMsg ??= e.toString();
        return state.districts;
      });

      final offenceDataFuture = repository.fetchOffenceCountData(
        district: district,
        zone: zone,
        camera: camera,
        timeRange: timeRange,
      ).catchError((e) {
        errorMsg ??= e.toString();
        return const <String, dynamic>{};
      });

      final offenceTypesFuture = repository.fetchOffenceTypes().catchError((e) {
        errorMsg ??= e.toString();
        return state.offenceTypes;
      });

      final challansFuture = repository.fetchChallanCounts(
        district: district,
        zone: zone,
        camera: camera,
        timeRange: timeRange,
      ).catchError((e) {
        errorMsg ??= e.toString();
        return const <String, String>{};
      });

      final revenueFuture = repository.fetchMonthlyRevenue(DateTime.now().year).catchError((e) {
        errorMsg ??= e.toString();
        return const <String, double>{};
      });

      // Await all futures in parallel
      final results = await Future.wait([
        kpiFuture,
        trafficFuture,
        districtsFuture,
        offenceDataFuture,
        offenceTypesFuture,
        challansFuture,
        revenueFuture,
      ]);

      // Assign results safely using type-safety checks
      final dynamic kpisResult = results[0];
      final dynamic analyticsResult = results[1];
      final dynamic districtsResult = results[2];
      final dynamic offenceDataResult = results[3];
      final dynamic offenceTypesResult = results[4];
      final dynamic challansResult = results[5];
      final dynamic revenueResult = results[6];

      kpis = kpisResult is KpiSummary ? kpisResult : state.kpis;
      analytics = analyticsResult is List<AnalyticsSeries> ? analyticsResult : state.analyticsSeries;
      districts = districtsResult is List<String> ? districtsResult : state.districts;
      offenceData = offenceDataResult is Map<String, dynamic> ? offenceDataResult : state.offenceData;
      offenceTypes = offenceTypesResult is List<String> ? offenceTypesResult : state.offenceTypes;
      challans = challansResult is Map<String, String> ? challansResult : challans;
      monthlyRevenue = revenueResult is Map<String, double>
          ? revenueResult
          : Map<String, double>.from(revenueResult as Map);

      state = state.copyWith(
        kpis: kpis,
        analyticsSeries: analytics,
        districts: districts,
        offenceData: offenceData,
        offenceTypes: offenceTypes,
        eChallan: challans['eChallan'],
        manualChallan: challans['manualChallan'],
        seizedVehicles: challans['seizedVehicles'],
        monthlyRevenue: monthlyRevenue,
        isLoading: false,
        error: errorMsg,
      );
    } catch (e) {
      debugPrint('Unhandled error in fetchDashboard: $e');
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> fetchZonesForDistrict(String district) async {
    debugPrint('Notifier fetchZonesForDistrict called for: $district');
    state = state.copyWith(isLoading: true);
    try {
      final zonesList = await repository.fetchZones(district);
      debugPrint('Notifier fetchZonesForDistrict success: $zonesList');
      state = state.copyWith(
        zones: zonesList,
        isLoading: false,
      );
    } catch (e, stack) {
      debugPrint('Notifier fetchZonesForDistrict error: $e');
      debugPrint(stack.toString());
      state = state.copyWith(
        zones: const ['Select All Zone'],
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void resetZones() {
    state = state.copyWith(
      zones: const ['Select All Zone'],
    );
  }

  Future<void> fetchCamerasForZone(String zone) async {
    debugPrint('Notifier fetchCamerasForZone called for: $zone');
    state = state.copyWith(isLoading: true);
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
      state = state.copyWith(
        cameras: camerasList,
        cameraLocationToId: lookup,
        isLoading: false,
      );
    } catch (e, stack) {
      debugPrint('Notifier fetchCamerasForZone error: $e');
      debugPrint(stack.toString());
      state = state.copyWith(
        cameras: const ['Select All Camera'],
        cameraLocationToId: const {},
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void resetCameras() {
    state = state.copyWith(
      cameras: const ['Select All Camera'],
      cameraLocationToId: const {},
    );
  }
}
