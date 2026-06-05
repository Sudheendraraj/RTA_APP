import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../core/network/api_client.dart';
import '../../core/storage/secure_storage_service.dart';
import 'analytics_models.dart';
import 'analytics_repository.dart';

final analyticsProvider = FutureProvider<List<TrafficSeries>>((ref) async {
  final storage = SecureStorageService();
  final apiClient = ApiClient(storage);
  return AnalyticsRepository(apiClient: apiClient).fetchHourlyTraffic();
});

class AnalyticsScreen extends ConsumerWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(analyticsProvider);

    return Scaffold(
      body: asyncData.when(
        data: (series) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Analytics',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Hourly Traffic',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                height: 320,
                                child: SfCartesianChart(
                                  enableAxisAnimation: false,
                                  primaryXAxis: CategoryAxis(),
                                  tooltipBehavior: TooltipBehavior(
                                    enable: true,
                                  ),
                                  series: <ColumnSeries<TrafficSeries, String>>[
                                    ColumnSeries<TrafficSeries, String>(
                                      animationDuration: 0,
                                      dataSource: series,
                                      xValueMapper: (item, _) => item.label,
                                      yValueMapper: (item, _) => item.vehicles,
                                      dataLabelSettings:
                                          const DataLabelSettings(
                                            isVisible: true,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Traffic Summary',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 14),
                              Text(
                                'Peak Hour: ${series.reduce((a, b) => a.vehicles > b.vehicles ? a : b).label}',
                              ),
                              Text(
                                'Total detections: ${series.fold<int>(0, (sum, item) => sum + item.vehicles)}',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text(error.toString())),
      ),
    );
  }
}
