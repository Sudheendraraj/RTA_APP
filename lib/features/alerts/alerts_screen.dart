import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/api_client.dart';
import '../../core/storage/secure_storage_service.dart';
import 'alerts_models.dart';
import 'alerts_repository.dart';

final alertsProvider = FutureProvider<List<AlertItem>>((ref) async {
  final storage = SecureStorageService();
  final client = ApiClient(storage);
  return AlertsRepository(apiClient: client).fetchAlerts();
});

class AlertsScreen extends ConsumerWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncAlerts = ref.watch(alertsProvider);

    return Scaffold(
      body: asyncAlerts.when(
        data: (alerts) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Alerts',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    itemCount: alerts.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final alert = alerts[index];
                      return Card(
                        child: ListTile(
                          leading: Icon(
                            alert.status == 'Open'
                                ? Icons.priority_high
                                : Icons.info,
                            color: alert.status == 'Open'
                                ? Colors.red
                                : Colors.blue,
                          ),
                          title: Text(
                            alert.type,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Vehicle: ${alert.plate}'),
                              Text('Detected: ${alert.detectedAt}'),
                            ],
                          ),
                          trailing: Chip(label: Text(alert.status)),
                        ),
                      );
                    },
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
