import '../../core/network/api_client.dart';
import 'dashboard_models.dart';

class DashboardRepository {
  DashboardRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<KpiSummary> fetchKpis() async {
    // Mocking response to avoid calling the removed /dashboard API
    return const KpiSummary(
      totalVehiclesToday: 1205,
      totalVehiclesWeek: 8540,
      totalVehiclesMonth: 34120,
      blacklistedVehicles: 45,
      violationsDetected: 112,
      activeCameras: 32,
      offlineCameras: 2,
      totalCheckposts: 15,
    );
  }

  Future<List<AnalyticsSeries>> fetchHourlyTraffic() async {
    // Mocking response to avoid calling the removed /analytics API
    return const [
      AnalyticsSeries(label: '00:00', value: 120),
      AnalyticsSeries(label: '04:00', value: 80),
      AnalyticsSeries(label: '08:00', value: 350),
      AnalyticsSeries(label: '12:00', value: 500),
      AnalyticsSeries(label: '16:00', value: 450),
      AnalyticsSeries(label: '20:00', value: 300),
    ];
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
