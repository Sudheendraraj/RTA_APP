import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/api_client.dart';
import '../../core/storage/secure_storage_service.dart';
import 'anpr_models.dart';
import 'anpr_repository.dart';

final anprRecordsProvider = FutureProvider<List<AnprRecord>>((ref) async {
  final storage = SecureStorageService();
  final client = ApiClient(storage);
  return AnprRepository(apiClient: client).fetchRecords();
});

class AnprRecordsScreen extends ConsumerWidget {
  const AnprRecordsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordsAsync = ref.watch(anprRecordsProvider);

    return Scaffold(
      body: recordsAsync.when(
        data: (records) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ANPR Records',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    itemCount: records.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final record = records[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.camera_alt, size: 24),
                                  const SizedBox(width: 8),
                                  Text(
                                    record.plate,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  Chip(label: Text(record.vehicleType)),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Wrap(
                                runSpacing: 8,
                                spacing: 16,
                                children: [
                                  Text('Camera: ${record.camera}'),
                                  Text('Checkpost: ${record.checkpost}'),
                                  Text('Direction: ${record.direction}'),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Detected at: ${record.detectedAt}',
                                    ),
                                  ),
                                  Text(
                                    'Confidence: ${(record.confidence * 100).toStringAsFixed(1)}%',
                                  ),
                                ],
                              ),
                            ],
                          ),
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
