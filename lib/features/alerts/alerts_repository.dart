import '../../core/network/api_client.dart';
import 'alerts_models.dart';

class AlertsRepository {
  AlertsRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<AlertItem>> fetchAlerts() async {
    final response = await _apiClient.get<List<dynamic>>('/alerts');
    return response.data!
        .map((item) => AlertItem.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
