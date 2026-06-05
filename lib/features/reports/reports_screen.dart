import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/api_client.dart';
import '../../core/storage/secure_storage_service.dart';
import 'reports_models.dart';
import 'reports_repository.dart';

final reportsProvider = FutureProvider<List<ReportItem>>((ref) async {
  final storage = SecureStorageService();
  final client = ApiClient(storage);
  return ReportsRepository(apiClient: client).fetchReports();
});

class ReportsScreen extends ConsumerWidget {
  const ReportsScreen({super.key});

  String _exportText(String type) {
    return '$type export completed.';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncReports = ref.watch(reportsProvider);

    return Scaffold(
      body: asyncReports.when(
        data: (reports) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Reports',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 12,
                  children: [
                    FilledButton(
                      onPressed: () =>
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(_exportText('PDF'))),
                          ),
                      child: const Text('Export PDF'),
                    ),
                    FilledButton(
                      onPressed: () =>
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(_exportText('Excel'))),
                          ),
                      child: const Text('Export Excel'),
                    ),
                    FilledButton(
                      onPressed: () =>
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(_exportText('CSV'))),
                          ),
                      child: const Text('Export CSV'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.separated(
                    itemCount: reports.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final report = reports[index];
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(report.count.toString()),
                          ),
                          title: Text(report.name),
                          subtitle: Text('Type: ${report.type}'),
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
