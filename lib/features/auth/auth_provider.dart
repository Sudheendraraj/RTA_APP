// lib/features/auth/auth_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/storage/secure_storage_service.dart';
import '../../core/network/api_client.dart';
import 'auth_repository_impl.dart';
import 'auth_repository.dart';
import 'auth_controller.dart';

final secureStorageProvider = Provider<SecureStorageService>(
  (ref) => SecureStorageService(),
);

final apiClientProvider = Provider<ApiClient>((ref) {
  final storage = ref.read(secureStorageProvider);
  return ApiClient(storage);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final client = ref.read(apiClientProvider);
  final storage = ref.read(secureStorageProvider);
  return AuthRepositoryImpl(apiClient: client, storage: storage);
});

final authControllerProvider = AsyncNotifierProvider<AuthController, AuthState>(
  AuthController.new,
);
