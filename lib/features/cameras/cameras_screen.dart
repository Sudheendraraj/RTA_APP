import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/api_client.dart';
import '../../core/storage/secure_storage_service.dart';
import 'cameras_models.dart';
import 'cameras_repository.dart';

final camerasProvider = FutureProvider<List<CameraStatus>>((ref) async {
  final storage = SecureStorageService();
  final client = ApiClient(storage);
  return CamerasRepository(apiClient: client).fetchCameras();
});

class CamerasScreen extends ConsumerWidget {
  const CamerasScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCameras = ref.watch(camerasProvider);

    return Scaffold(
      body: asyncCameras.when(
        data: (cameras) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Camera Management',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width > 1000
                          ? 3
                          : 1,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 2.2,
                    ),
                    itemCount: cameras.length,
                    itemBuilder: (context, index) {
                      final camera = cameras[index];
                      final online = camera.status == 'Online';
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    camera.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Chip(
                                    label: Text(camera.status),
                                    backgroundColor: online
                                        ? Colors.green[100]
                                        : Colors.red[100],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text('Checkpost: ${camera.checkpost}'),
                              Text('Health: ${camera.health}%'),
                              Text('Last Active: ${camera.lastActive}'),
                              const Spacer(),
                              Row(
                                children: [
                                  FilledButton(
                                    onPressed: () {},
                                    child: const Text('View Details'),
                                  ),
                                  const SizedBox(width: 10),
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: Text(online ? 'Disable' : 'Enable'),
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
