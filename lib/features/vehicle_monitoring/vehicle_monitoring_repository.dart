import '../../core/network/api_client.dart';
import 'vehicle_monitoring_models.dart';

class VehicleMonitoringRepository {
  VehicleMonitoringRepository({required ApiClient apiClient})
    : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<VehicleDetection>> fetchDetections() async {
    final response = await _apiClient.get<List<dynamic>>('/vehicles');
    return response.data!
        .map((item) => VehicleDetection.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
