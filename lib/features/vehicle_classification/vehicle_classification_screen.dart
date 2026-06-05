import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../core/network/api_client.dart';
import '../../core/storage/secure_storage_service.dart';
import 'vehicle_classification_models.dart';
import 'vehicle_classification_repository.dart';

final vehicleClassificationProvider = FutureProvider<List<VehicleCategory>>((
  ref,
) async {
  final storage = SecureStorageService();
  final client = ApiClient(storage);
  return VehicleClassificationRepository(
    apiClient: client,
  ).fetchVehicleCategories();
});

class VehicleClassificationScreen extends ConsumerWidget {
  const VehicleClassificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(vehicleClassificationProvider);

    return Scaffold(
      body: state.when(
        data: (items) {
          final total = items.fold<int>(0, (prev, item) => prev + item.count);
          return Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Vehicle Classification',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 300,
                    child: SfCircularChart(
                      legend: Legend(
                        isVisible: true,
                        overflowMode: LegendItemOverflowMode.wrap,
                      ),
                      series: <PieSeries<VehicleCategory, String>>[
                        PieSeries<VehicleCategory, String>(
                          animationDuration: 0,
                          dataSource: items,
                          xValueMapper: (data, _) => data.category,
                          yValueMapper: (data, _) => data.count,
                          dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: items.map((item) {
                      final percentage = total > 0
                          ? (item.count / total * 100).toStringAsFixed(1)
                          : '0.0';
                      return SizedBox(
                        width: 260,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.category,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '${item.count} vehicles',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '$percentage% of total',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Trend ${item.trend > 0 ? '+' : ''}${item.trend.toStringAsFixed(1)}%',
                                  style: const TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text(error.toString())),
      ),
    );
  }
}
