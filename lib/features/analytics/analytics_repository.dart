import '../../core/network/api_client.dart';
import 'analytics_models.dart';

class AnalyticsRepository {
  AnalyticsRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<TrafficSeries>> fetchHourlyTraffic() async {
    final response = await _apiClient.get<List<dynamic>>('/analytics');
    return response.data!
        .map((item) => TrafficSeries.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
