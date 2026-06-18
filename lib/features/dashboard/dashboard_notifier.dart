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
    this.offenceData,
    this.isLoading = false,
    this.error,
  });

  final KpiSummary? kpis;
  final List<AnalyticsSeries> analyticsSeries;
  final List<String> districts;
  final Map<String, dynamic>? offenceData;
  final bool isLoading;
  final String? error;
}

class DashboardNotifier extends StateNotifier<DashboardState> {
  DashboardNotifier({required this.repository}) : super(DashboardState()) {
    fetchDashboard();
  }

  final DashboardRepository repository;

  Future<void> fetchDashboard({String? district, String? timeRange}) async {
    state = DashboardState(
      isLoading: true,
      districts: state.districts,
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
        timeRange: timeRange,
      );
    } catch (e) {
      errorMsg ??= e.toString();
    }

    state = DashboardState(
      kpis: kpis ?? state.kpis,
      analyticsSeries: analytics.isNotEmpty ? analytics : state.analyticsSeries,
      districts: districts,
      offenceData: offenceData ?? state.offenceData,
      isLoading: false,
      error: errorMsg,
    );
  }
}
