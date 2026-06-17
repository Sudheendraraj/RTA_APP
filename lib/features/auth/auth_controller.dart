// lib/features/auth/auth_controller.dart
import 'dart:async';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/storage/secure_storage_service.dart';
import 'auth_repository.dart';
import 'login_response_model.dart';
import 'auth_provider.dart';
import '../../core/network/api_client.dart';

class AuthState {
  const AuthState({this.user, this.isLoading = false, this.error});
  final LoginUser? user;
  final bool isLoading;
  final String? error;
}

class AuthController extends AsyncNotifier<AuthState> {
  late final AuthRepository _repo;
  late final SecureStorageService _storage;

  @override
  FutureOr<AuthState> build() {
    _repo = ref.read(authRepositoryProvider);
    _storage = ref.read(secureStorageProvider);
    _attemptAutoLogin();
    return const AuthState(user: null, isLoading: false);
  }

  Future<void> _attemptAutoLogin() async {
    final remember = await _storage.readRememberMe();
    final token = await _storage.readToken();
    final username = await _storage.readUsername();
    if (remember && token != null && username != null) {
      state = AsyncValue.data(AuthState(user: null, isLoading: false));
    }
  }

  Future<LoginUser> login({
    required String username,
    required String password,
    bool remember = false,
  }) async {
    state = AsyncValue.loading();
    try {
      final resp = await _repo.login(username: username, password: password);
      await _storage.writeRememberMe(remember);
      final user =
          resp.user ??
          LoginUser(username: username, name: username, role: 'User');
      state = AsyncValue.data(AuthState(user: user, isLoading: false));
      return user;
    } on TimeoutException catch (_) {
      state = AsyncValue.error('Request timed out', StackTrace.current);
      rethrow;
    } on SocketException catch (_) {
      state = AsyncValue.error('No internet connection', StackTrace.current);
      rethrow;
    } catch (e) {
      final msg = e is ApiException ? e.message : e.toString();
      state = AsyncValue.error(msg, StackTrace.current);
      rethrow;
    }
  }

  Future<void> logout() async {
    await _repo.logout();
    state = AsyncValue.data(AuthState(user: null, isLoading: false));
  }
}
