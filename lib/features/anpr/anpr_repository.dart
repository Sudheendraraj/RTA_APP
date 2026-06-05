import '../../core/network/api_client.dart';
import 'anpr_models.dart';

class AnprRepository {
  AnprRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<AnprRecord>> fetchRecords() async {
    final response = await _apiClient.get<List<dynamic>>('/anpr-records');
    return response.data!
        .map((item) => AnprRecord.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
