import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/api_client.dart';
import '../../core/storage/secure_storage_service.dart';
import '../auth/auth_models.dart';
import 'auth_repository.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((
  ref,
) {
  final storage = SecureStorageService();
  final apiClient = ApiClient(storage);
  final repository = AuthRepository(apiClient: apiClient, storage: storage);
  return AuthNotifier(repository: repository, storage: storage);
});

class AuthState {
  AuthState({this.user, this.token, this.isAuthenticated = false});

  final AuthUser? user;
  final AuthToken? token;
  final bool isAuthenticated;
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier({required this.repository, required this.storage})
    : super(AuthState()) {
    _initialize();
  }

  final AuthRepository repository;
  final SecureStorageService storage;
  final _authChanges = StreamController<void>.broadcast();

  Stream<void> get authChangeStream => _authChanges.stream;

  Future<void> _initialize() async {
    final remember = await storage.readRememberMe();
    final token = await storage.readToken();
    if (remember && token != null) {
      state = AuthState(
        isAuthenticated: true,
        token: AuthToken(accessToken: token, refreshToken: ''),
      );
      _authChanges.add(null);
    }
  }

  Future<void> login(String username, String password, bool rememberMe) async {
    final token = await repository.login(username, password, rememberMe);
    final user = AuthUser(
      username: username,
      name: username.toUpperCase(),
      role: username.contains('super')
          ? 'Super Admin'
          : username.contains('admin')
          ? 'RTA Administrator'
          : username.contains('enforce')
          ? 'Enforcement Officer'
          : username.contains('check')
          ? 'Checkpost Officer'
          : 'Supervisor',
    );
    state = AuthState(user: user, token: token, isAuthenticated: true);
    _authChanges.add(null);
  }

  Future<void> logout() async {
    await repository.logout();
    state = AuthState();
    _authChanges.add(null);
  }
}
