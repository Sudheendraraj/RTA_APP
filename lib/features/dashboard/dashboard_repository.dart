import '../../core/network/api_client.dart';
import 'dashboard_models.dart';

class DashboardRepository {
  DashboardRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<KpiSummary> fetchKpis() async {
    final response = await _apiClient.get<Map<String, dynamic>>('/dashboard');
    final kpis = response.data!['kpis'] as Map<String, dynamic>;
    return KpiSummary.fromJson({
      'totalVehiclesToday': kpis['today'],
      'totalVehiclesWeek': kpis['week'],
      'totalVehiclesMonth': kpis['month'],
      'blacklistedVehicles': kpis['blacklisted'],
      'violationsDetected': kpis['violations'],
      'activeCameras': kpis['activeCameras'],
      'offlineCameras': kpis['offlineCameras'],
      'totalCheckposts': kpis['checkposts'],
    });
  }

  Future<List<AnalyticsSeries>> fetchHourlyTraffic() async {
    final response = await _apiClient.get<List<dynamic>>('/analytics');
    return response.data!
        .map((item) => AnalyticsSeries.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
