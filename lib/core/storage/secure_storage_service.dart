class SecureStorageService {
  static final SecureStorageService _instance =
      SecureStorageService._internal();

  factory SecureStorageService() {
    return _instance;
  }

  SecureStorageService._internal();

  final Map<String, String> _storage = {};

  static const _tokenKey = 'jwt_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _rememberMeKey = 'remember_me';

  Future<void> writeToken(String value) async => _storage[_tokenKey] = value;
  Future<String?> readToken() async => _storage[_tokenKey];
  Future<void> deleteToken() async => _storage.remove(_tokenKey);

  Future<void> writeRefreshToken(String value) async =>
      _storage[_refreshTokenKey] = value;
  Future<String?> readRefreshToken() async => _storage[_refreshTokenKey];
  Future<void> deleteRefreshToken() async => _storage.remove(_refreshTokenKey);

  Future<void> writeRememberMe(bool value) async =>
      _storage[_rememberMeKey] = value.toString();
  Future<bool> readRememberMe() async {
    final value = _storage[_rememberMeKey];
    return value == 'true';
  }
}
