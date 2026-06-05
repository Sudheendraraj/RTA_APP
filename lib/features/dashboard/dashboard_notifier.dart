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
    this.isLoading = false,
    this.error,
  });

  final KpiSummary? kpis;
  final List<AnalyticsSeries> analyticsSeries;
  final bool isLoading;
  final String? error;
}

class DashboardNotifier extends StateNotifier<DashboardState> {
  DashboardNotifier({required this.repository}) : super(DashboardState()) {
    fetchDashboard();
  }

  final DashboardRepository repository;

  Future<void> fetchDashboard() async {
    state = DashboardState(isLoading: true);
    try {
      final kpis = await repository.fetchKpis();
      final analytics = await repository.fetchHourlyTraffic();
      state = DashboardState(
        kpis: kpis,
        analyticsSeries: analytics,
        isLoading: false,
      );
    } catch (error) {
      state = DashboardState(error: error.toString(), isLoading: false);
    }
  }
}
