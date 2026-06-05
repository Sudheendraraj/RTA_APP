import '../../core/network/api_client.dart';
import '../../core/storage/secure_storage_service.dart';
import 'auth_models.dart';

class AuthRepository {
  AuthRepository({
    required ApiClient apiClient,
    required SecureStorageService storage,
  }) : _apiClient = apiClient,
       _storage = storage;

  final ApiClient _apiClient;
  final SecureStorageService _storage;

  Future<AuthToken> login(
    String username,
    String password,
    bool rememberMe,
  ) async {
    final response = await _apiClient.post<Map<String, dynamic>>(
      '/login',
      data: {'username': username, 'password': password},
    );
    final data = response.data!;
    if (rememberMe) {
      await _storage.writeRememberMe(true);
    } else {
      await _storage.writeRememberMe(false);
    }
    return AuthToken.fromJson(data);
  }

  Future<void> logout() async {
    await _apiClient.post<void>('/logout');
    await _storage.deleteToken();
    await _storage.deleteRefreshToken();
  }
}
