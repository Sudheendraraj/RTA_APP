import '../../core/network/api_client.dart';
import 'cameras_models.dart';

class CamerasRepository {
  CamerasRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<CameraStatus>> fetchCameras() async {
    final response = await _apiClient.get<List<dynamic>>('/cameras');
    return response.data!
        .map((item) => CameraStatus.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
