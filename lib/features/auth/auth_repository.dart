// lib/features/auth/auth_repository.dart
import 'login_response_model.dart';

abstract class AuthRepository {
  Future<LoginResponse> login({
    required String username,
    required String password,
  });
  Future<void> logout();
}
