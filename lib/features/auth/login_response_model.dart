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
      'accessToken': json['accessToken'] ?? json['access_token'] ?? '',
      'refreshToken': json['refreshToken'] ?? json['refresh_token'] ?? '',
    };

    final userJson = json['user'];
    if (userJson is Map<String, dynamic>) {
      normalized['user'] = userJson;
    } else if (userJson is Map) {
      normalized['user'] = Map<String, dynamic>.from(userJson);
    }

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
    return _$LoginUserFromJson(<String, dynamic>{
      'username': json['username'] ?? json['userName'] ?? '',
      'name': json['name'] ?? json['fullName'] ?? '',
      'role': json['role'] ?? json['userRole'] ?? '',
    });
  }

  Map<String, dynamic> toJson() => _$LoginUserToJson(this);
}
