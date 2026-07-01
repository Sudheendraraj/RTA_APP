import 'dart:async';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/auth_notifier.dart';
import '../../core/network/api_client.dart';
import 'dashboard_repository.dart';
import 'models/missing_certificate_model.dart';

class MissingCertificatesParams {
  final String? district;
  final String? zone;
  final String? camera;
  final String? timeRange;

  const MissingCertificatesParams({
    this.district,
    this.zone,
    this.camera,
    this.timeRange,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MissingCertificatesParams &&
          runtimeType == other.runtimeType &&
          district == other.district &&
          zone == other.zone &&
          camera == other.camera &&
          timeRange == other.timeRange;

  @override
  int get hashCode =>
      district.hashCode ^ zone.hashCode ^ camera.hashCode ^ timeRange.hashCode;
}

final missingCertificatesProvider = FutureProvider.family<MissingCertificateModel, MissingCertificatesParams>((ref, params) async {
  final storage = ref.watch(authNotifierProvider.notifier).storage;
  final apiClient = ApiClient(storage);
  final repository = DashboardRepository(apiClient: apiClient);
  
  // Cache data for 5 minutes
  final link = ref.keepAlive();
  final timer = Timer(const Duration(minutes: 5), () {
    link.close();
  });
  
  ref.onDispose(() {
    timer.cancel();
  });

  try {
    return await repository.fetchMissingCertificates(
      district: params.district,
      zone: params.zone,
      camera: params.camera,
      timeRange: params.timeRange,
    );
  } on TimeoutException {
    throw 'Connection timed out. Please check your internet and try again.';
  } on SocketException {
    throw 'No internet connection. Please connect and try again.';
  } on ApiException catch (e) {
    if (e.code == 401 || e.code == 403) {
      throw 'Unauthorized access. Please login again.';
    } else if (e.code == 404) {
      throw 'Certificates data not found on the server.';
    } else if (e.code == 500) {
      throw 'Internal server error. Please try again later.';
    } else {
      throw 'Server error (${e.code}): ${e.message}';
    }
  } catch (e) {
    if (e.toString().contains('Empty response')) {
      throw 'No data received from server.';
    }
    throw 'An unexpected error occurred: $e';
  }
});
