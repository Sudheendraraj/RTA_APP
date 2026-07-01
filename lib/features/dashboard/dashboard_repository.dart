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

  Map<String, String>? _getDateRange(String? timeRange) {
    if (timeRange == 'Select All Time Range') {
      return null;
    }

    final now = DateTime.now();
    DateTime start;
    DateTime end = now;

    if (timeRange == 'This Week') {
      final weekday = now.weekday;
      final monday = now.subtract(Duration(days: weekday - 1));
      start = DateTime(monday.year, monday.month, monday.day);
    } else if (timeRange == 'This Month') {
      start = DateTime(now.year, now.month, 1);
    } else if (timeRange == 'This Year') {
      start = DateTime(now.year, 1, 1);
    } else {
      // 'Today' or default
      start = DateTime(now.year, now.month, now.day);
    }

    String two(int n) => n >= 10 ? '$n' : '0$n';
    String format(DateTime dt) =>
        '${dt.year}-${two(dt.month)}-${two(dt.day)}T${two(dt.hour)}:${two(dt.minute)}:${two(dt.second)}';

    return {
      'startDate': format(start),
      'endDate': format(end),
    };
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

    final range = _getDateRange(timeRange);
    if (range != null) {
      body['startDate'] = range['startDate'];
      body['endDate'] = range['endDate'];
    }

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
    String? timeRange,
  }) async {
    final queryParameters = <String, dynamic>{};
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

    final range = _getDateRange(timeRange ?? 'Today');
    if (range != null) {
      queryParameters['startDate'] = range['startDate'];
      queryParameters['endDate'] = range['endDate'];
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

  Future<Map<String, String>> fetchChallanCounts({
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
    final range = _getDateRange(timeRange);
    if (range != null) {
      body['startDate'] = range['startDate'];
      body['endDate'] = range['endDate'];
    }

    try {
      final response = await _apiClient.post<Map<String, dynamic>>(
        '/rta/getChallansGroupCount',
        data: body,
      );
      final list = response.data?['data'] as List<dynamic>? ?? [];
      int raise = 0;
      int collect = 0;
      int seize = 0;
      for (final item in list) {
        if (item is Map) {
          final type = item['challanType']?.toString();
          final count = (item['count'] as num? ?? 0).toInt();
          if (type == 'RAISE') raise = count;
          if (type == 'COLLECT') collect = count;
          if (type == 'SEIZE') seize = count;
        }
      }
      return {
        'eChallan': raise.toString(),
        'manualChallan': collect.toString(),
        'seizedVehicles': seize.toString(),
      };
    } catch (e) {
      debugPrint('Error fetchChallanCounts: $e');
      return {
        'eChallan': '0',
        'manualChallan': '0',
        'seizedVehicles': '0',
      };
    }
  }

  Future<Map<String, double>> fetchMonthlyRevenue(int year) async {
    try {
      final response = await _apiClient.get<Map<String, dynamic>>(
        '/budget/revenue/monthly/$year',
      );
      final data = response.data?['data'] as Map<String, dynamic>? ?? {};
      final Map<String, double> revenue = {};
      data.forEach((key, val) {
        revenue[key] = (val as num? ?? 0.0).toDouble();
      });
      return revenue;
    } catch (e) {
      debugPrint('Error fetchMonthlyRevenue: $e');
      return {};
    }
  }
}
