// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      user: LoginUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'user': instance.user,
    };

LoginUser _$LoginUserFromJson(Map<String, dynamic> json) => LoginUser(
  username: json['username'] as String,
  name: json['name'] as String,
  role: json['role'] as String,
);

Map<String, dynamic> _$LoginUserToJson(LoginUser instance) => <String, dynamic>{
  'username': instance.username,
  'name': instance.name,
  'role': instance.role,
};
