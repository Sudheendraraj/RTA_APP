import '../../core/network/api_client.dart';
import 'reports_models.dart';

class ReportsRepository {
  ReportsRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<ReportItem>> fetchReports() async {
    final response = await _apiClient.get<List<dynamic>>('/reports');
    return response.data!
        .map((item) => ReportItem.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
