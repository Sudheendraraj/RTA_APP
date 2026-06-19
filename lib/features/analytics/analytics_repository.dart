import '../../core/network/api_client.dart';
import 'analytics_models.dart';

class AnalyticsRepository {
  AnalyticsRepository({required ApiClient apiClient});

  Future<List<TrafficSeries>> fetchHourlyTraffic() async {
    // Mocking response to avoid calling the removed /analytics API
    return const [
      TrafficSeries(label: '00:00', vehicles: 120),
      TrafficSeries(label: '04:00', vehicles: 80),
      TrafficSeries(label: '08:00', vehicles: 350),
      TrafficSeries(label: '12:00', vehicles: 500),
      TrafficSeries(label: '16:00', vehicles: 450),
      TrafficSeries(label: '20:00', vehicles: 300),
    ];
  }
}
