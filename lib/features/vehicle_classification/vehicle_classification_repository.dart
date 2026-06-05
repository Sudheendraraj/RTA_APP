import '../../core/network/api_client.dart';
import 'vehicle_classification_models.dart';

class VehicleClassificationRepository {
  VehicleClassificationRepository({required ApiClient apiClient})
    : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<VehicleCategory>> fetchVehicleCategories() async {
    final response = await _apiClient.get<List<dynamic>>(
      '/vehicle-classification',
    );
    return response.data!
        .map((item) => VehicleCategory.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
