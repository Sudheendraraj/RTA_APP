import 'package:flutter/foundation.dart';
import '../../core/network/api_client.dart';
import 'dashboard_models.dart';
import 'models/missing_certificate_model.dart';

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

  Future<List<String>> fetchOffenceTypes() async {
    final response = await _apiClient.get<Map<String, dynamic>>(
      '/rta/getOffencesList',
    );

    final data = response.data?['data'];
    if (data is List) {
      return data.whereType<String>().toList();
    }
    return [];
  }

  Future<Map<String, dynamic>> fetchOffenceCountData({
    String? district,
    String? zone,
    String? camera,
    String? timeRange,
  }) async {
    final Map<String, dynamic> body = {};
    if (district != null && district != 'Select All District') {
      body['districtName'] = district;
    }
    if (zone != null && zone != 'Select All Zone') {
      body['officeName'] = zone;
      body['zone'] = zone;
    }
    if (camera != null && camera != 'Select All Camera') {
      body['cameraId'] = camera;
    }
    // Note: If backend expects other fields in the body for timeRange, we can map it here.
    final response = await _apiClient.post<Map<String, dynamic>>(
      '/rta/getOffenceCountData',
      data: body,
    );
    return response.data?['data'] as Map<String, dynamic>? ?? {};
  }

  Future<List<String>> fetchZones(String district) async {
    try {
      final encodedDistrict = Uri.encodeComponent(district);
      debugPrint('Repository fetchZones calling: /rtaOffices/$encodedDistrict');
      final response = await _apiClient.get<List<dynamic>>(
        '/rtaOffices/$encodedDistrict',
      );
      debugPrint('Repository fetchZones response data: ${response.data}');
      final offices = response.data ?? [];
      final names = offices
          .map((item) {
            if (item is Map) {
              return item['officeName']?.toString();
            }
            return null;
          })
          .whereType<String>()
          .toList();
      final result = ['Select All Zone', ...names];
      debugPrint('Repository fetchZones parsed: $result');
      return result;
    } catch (e) {
      debugPrint('Repository fetchZones error: $e');
      rethrow;
    }
  }

  Future<List<dynamic>> fetchCameras(String zone) async {
    try {
      final encodedZone = Uri.encodeComponent(zone);
      debugPrint('Repository fetchCameras calling: /camera/$encodedZone');
      final response = await _apiClient.get<List<dynamic>>(
        '/camera/$encodedZone',
      );
      debugPrint('Repository fetchCameras response data: ${response.data}');
      return response.data ?? [];
    } catch (e) {
      debugPrint('Repository fetchCameras error: $e');
      rethrow;
    }
  }

  Future<MissingCertificateModel> fetchMissingCertificates({
    String? district,
    String? zone,
    String? camera,
  }) async {
    // Use GET endpoint with date range to fetch live data. Default to
    // start of today -> now if no explicit dates are provided by caller.
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final queryParameters = <String, dynamic>{
      'startDate': startOfDay.toIso8601String(),
      'endDate': now.toIso8601String(),
    };

    if (district != null && district != 'Select All District') {
      queryParameters['districtName'] = district;
    }
    if (zone != null && zone != 'Select All Zone') {
      queryParameters['officeName'] = zone;
      queryParameters['zone'] = zone;
    }
    if (camera != null && camera != 'Select All Camera') {
      queryParameters['cameraId'] = camera;
    }

    final response = await _apiClient.get<Map<String, dynamic>>(
      '/missing-certificates',
      queryParameters: queryParameters,
    );

    final respMap = response.data ?? {};
    return MissingCertificateModel.fromApiResponse(
      Map<String, dynamic>.from(respMap),
    );
  }

  Future<Map<String, dynamic>> getMissingCertificates({
    required String startDate,
    required String endDate,
  }) async {
    final response = await _apiClient.get<Map<String, dynamic>>(
      '/missing-certificates',
      queryParameters: {'startDate': startDate, 'endDate': endDate},
    );

    return response.data ?? {};
  }
}
