import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/api_client.dart';
import '../../core/storage/secure_storage_service.dart';
import '../../core/widgets/loading_overlay.dart';
import 'vehicle_monitoring_models.dart';
import 'vehicle_monitoring_repository.dart';

final vehicleMonitoringProvider =
    StateNotifierProvider<VehicleMonitoringNotifier, VehicleMonitoringState>((
      ref,
    ) {
      final storage = SecureStorageService();
      final apiClient = ApiClient(storage);
      return VehicleMonitoringNotifier(
        repository: VehicleMonitoringRepository(apiClient: apiClient),
      );
    });

class VehicleMonitoringState {
  VehicleMonitoringState({
    this.detections = const [],
    this.isLoading = false,
    this.error,
    this.searchText = '',
    this.checkpostFilter = '',
    this.vehicleTypeFilter = '',
  });

  final List<VehicleDetection> detections;
  final bool isLoading;
  final String? error;
  final String searchText;
  final String checkpostFilter;
  final String vehicleTypeFilter;
}

class VehicleMonitoringNotifier extends StateNotifier<VehicleMonitoringState> {
  VehicleMonitoringNotifier({required this.repository})
    : super(VehicleMonitoringState()) {
    fetchDetections();
    _startAutoRefresh();
  }

  final VehicleMonitoringRepository repository;
  Timer? _refreshTimer;

  Future<void> fetchDetections() async {
    state = VehicleMonitoringState(
      isLoading: true,
      detections: state.detections,
    );
    try {
      final results = await repository.fetchDetections();
      state = VehicleMonitoringState(detections: results, isLoading: false);
    } catch (error) {
      state = VehicleMonitoringState(error: error.toString(), isLoading: false);
    }
  }

  void updateSearch(String value) {
    state = VehicleMonitoringState(
      detections: state.detections,
      searchText: value,
      checkpostFilter: state.checkpostFilter,
      vehicleTypeFilter: state.vehicleTypeFilter,
    );
  }

  void updateFilters(String checkpost, String vehicleType) {
    state = VehicleMonitoringState(
      detections: state.detections,
      searchText: state.searchText,
      checkpostFilter: checkpost,
      vehicleTypeFilter: vehicleType,
    );
  }

  void _startAutoRefresh() {
    _refreshTimer = Timer.periodic(
      const Duration(seconds: 15),
      (_) => fetchDetections(),
    );
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }
}

class VehicleMonitoringScreen extends ConsumerWidget {
  const VehicleMonitoringScreen({super.key, this.isLiveFeed = false});

  final bool isLiveFeed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget buildImage(String src, {double? width, double? height, BoxFit? fit}) {
      if (src.startsWith('assets/')) {
        return Image.asset(
          src,
          width: width,
          height: height,
          fit: fit ?? BoxFit.cover,
        );
      }
      return Image.network(
        src,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          width: width,
          height: height,
          color: Colors.grey.shade200,
          child: const Icon(Icons.directions_car, color: Colors.grey, size: 36),
        ),
      );
    }
    final state = ref.watch(vehicleMonitoringProvider);
    final notifier = ref.watch(vehicleMonitoringProvider.notifier);
    final filtered = state.detections.where((detection) {
      final matchesPlate =
          state.searchText.isEmpty ||
          detection.plate.toLowerCase().contains(
            state.searchText.toLowerCase(),
          );
      final matchesCheckpost =
          state.checkpostFilter.isEmpty ||
          detection.checkpost.contains(state.checkpostFilter);
      final matchesType =
          state.vehicleTypeFilter.isEmpty ||
          detection.vehicleType.contains(state.vehicleTypeFilter);
      return matchesPlate && matchesCheckpost && matchesType;
    }).toList();

    return Scaffold(
      body: LoadingOverlay(
        isLoading: state.isLoading,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isLiveFeed ? 'Live Vehicle Feed' : 'Vehicle Monitoring',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  SizedBox(
                    width: 280,
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Vehicle Number',
                        prefixIcon: Icon(Icons.directions_car),
                      ),
                      onChanged: notifier.updateSearch,
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Checkpost',
                        prefixIcon: Icon(Icons.location_on),
                      ),
                      onChanged: (value) => notifier.updateFilters(
                        value,
                        state.vehicleTypeFilter,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Vehicle Type',
                        prefixIcon: Icon(Icons.tag),
                      ),
                      onChanged: (value) =>
                          notifier.updateFilters(state.checkpostFilter, value),
                    ),
                  ),
                  FilledButton.icon(
                    icon: const Icon(Icons.refresh),
                    label: const Text('Refresh'),
                    onPressed: notifier.fetchDetections,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: filtered.isEmpty
                    ? const Center(
                        child: Text('No vehicle detections match the filters.'),
                      )
                    : ListView.builder(
                        itemCount: filtered.length,
                        itemBuilder: (context, index) {
                          final item = filtered[index];
                          return Card(
                            margin: const EdgeInsets.only(bottom: 16),
                            child: ListTile(
                              isThreeLine: true,
                              leading: SizedBox(
                                width: 110,
                                height: 70,
                                child: buildImage(
                                  item.vehicleImage,
                                  width: 110,
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                item.plate,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${item.vehicleType} • ${item.direction}',
                                  ),
                                  Text(
                                    'Checkpost: ${item.checkpost} • Camera: ${item.camera}',
                                  ),
                                  Text(
                                    'Confidence: ${(item.confidence * 100).toStringAsFixed(1)}% • ${item.detectedAt}',
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.open_in_new),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(item.plate),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            buildImage(
                                              item.vehicleImage,
                                              width: double.infinity,
                                              height: 140,
                                              fit: BoxFit.cover,
                                            ),
                                            const SizedBox(height: 12),
                                            buildImage(
                                              item.plateImage,
                                              width: double.infinity,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          FilledButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                            child: const Text('Close'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
