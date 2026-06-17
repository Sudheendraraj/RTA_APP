// lib/features/auth/auth_repository_impl.dart
import '../../core/network/api_client.dart';
import '../../core/storage/secure_storage_service.dart';
import 'auth_repository.dart';
import 'login_response_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required ApiClient apiClient,
    required SecureStorageService storage,
  }) : _apiClient = apiClient,
       _storage = storage;

  final ApiClient _apiClient;
  final SecureStorageService _storage;

  @override
  Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    final response = await _apiClient.get<String>(
      '/auth/login',
      queryParameters: {'username': username, 'password': password},
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      final body = response.data ?? <String, dynamic>{};
      final message = body['message'] != null
          ? body['message'].toString()
          : 'Login failed with status ${response.statusCode}';
      throw ApiException(code: response.statusCode ?? 0, message: message);
    }

    final data = response.data ?? <String, dynamic>{};
    final loginResp = LoginResponse.fromJson(data);

    if (loginResp.accessToken.isEmpty) {
      throw ApiException(
        code: response.statusCode ?? 0,
        message: 'Login response did not include an access token.',
      );
    }

    final user =
        loginResp.user ??
        LoginUser(username: username, name: username, role: 'User');

    await _storage.writeToken(loginResp.accessToken);
    if (loginResp.refreshToken.isNotEmpty) {
      await _storage.writeRefreshToken(loginResp.refreshToken);
    }
    await _storage.writeUsername(username);

    return LoginResponse(
      accessToken: loginResp.accessToken,
      refreshToken: loginResp.refreshToken,
      user: user,
    );
  }

  @override
  Future<void> logout() async {
    try {
      await _apiClient.post('/auth/logout');
    } catch (_) {}
    await _storage.deleteToken();
    await _storage.deleteRefreshToken();
    await _storage.deleteUsername();
    await _storage.writeRememberMe(false);
  }
}
