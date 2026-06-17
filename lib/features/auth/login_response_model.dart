// lib/features/auth/login_response_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponse {
  LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    this.user,
  });

  @JsonKey(name: 'accessToken')
  final String accessToken;

  @JsonKey(name: 'refreshToken')
  final String refreshToken;

  final LoginUser? user;

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final normalized = <String, dynamic>{
      'accessToken': json['accessToken'] ?? json['access_token'] ?? json['token'] ?? '',
      'refreshToken': json['refreshToken'] ?? json['refresh_token'] ?? '',
    };

    final userJson = json['user'] is Map ? json['user'] : json;
    normalized['user'] = Map<String, dynamic>.from(userJson);

    return _$LoginResponseFromJson(normalized);
  }

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginUser {
  LoginUser({required this.username, required this.name, required this.role});

  final String username;
  final String name;
  final String role;

  factory LoginUser.fromJson(Map<String, dynamic> json) {
    final username = json['username'] ?? json['userName'] ?? '';
    final name = json['name'] ?? json['fullName'] ?? (username.isNotEmpty ? username : '');
    final role = json['role'] ?? json['userRole'] ?? '';
    return _$LoginUserFromJson(<String, dynamic>{
      'username': username,
      'name': name,
      'role': role,
    });
  }

  Map<String, dynamic> toJson() => _$LoginUserToJson(this);
}
