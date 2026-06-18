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

  Future<List<String>> fetchDistricts() async {
    final response = await _apiClient.get<List<dynamic>>('/districts');
    final districtList = response.data ?? [];
    final names = districtList
        .map((item) {
          if (item is Map) {
            return item['districtName']?.toString();
          }
          return null;
        })
        .whereType<String>()
        .toList();
    return ['Select All District', ...names];
  }

  Future<Map<String, dynamic>> fetchOffenceCountData({
    String? district,
    String? timeRange,
  }) async {
    final Map<String, dynamic> body = {};
    if (district != null && district != 'Select All District') {
      body['districtName'] = district;
    }
    // Note: If backend expects other fields in the body for timeRange, we can map it here.
    final response = await _apiClient.post<Map<String, dynamic>>(
      '/rta/getOffenceCountData',
      data: body,
    );
    return response.data?['data'] as Map<String, dynamic>? ?? {};
  }
}
