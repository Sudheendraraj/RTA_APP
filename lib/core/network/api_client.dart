// Replaced long mock responses with production-ready ApiClient using Dio
import 'dart:io';
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../storage/secure_storage_service.dart';

class ApiException implements Exception {
  ApiException({required this.code, required this.message});
  final int code;
  final String message;
  @override
  String toString() => 'ApiException($code): $message';
}

class ApiClient {
  ApiClient._(this._storage)
    : _dio = Dio(
        BaseOptions(
          baseUrl: 'https://tgrta-anpr.in/api',
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          sendTimeout: const Duration(seconds: 15),
          responseType: ResponseType.json,
        ),
      ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          try {
            final token = await _storage.readToken();
            if (token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          } catch (_) {}
          if (kDebugMode) debugPrint('→ ${options.method} ${options.uri}');
          handler.next(options);
        },
        onResponse: (response, handler) {
          if (kDebugMode) {
            debugPrint(
              '← ${response.statusCode} ${response.requestOptions.path}',
            );
          }
          handler.next(response);
        },
        onError: (err, handler) async {
          if (kDebugMode) debugPrint('‼ ${err.type} ${err.message}');
          handler.next(err);
        },
      ),
    );
  }

  final Dio _dio;
  final SecureStorageService _storage;

  static ApiClient? _instance;
  factory ApiClient(SecureStorageService storage) {
    _instance ??= ApiClient._(storage);
    return _instance!;
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.get<T>(path, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  Future<Response<T>> post<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  Exception _mapDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return TimeoutException('Request timed out');
    }
    if (e.error is SocketException) {
      return SocketException('No internet connection');
    }
    final code = e.response?.statusCode ?? 0;
    String message = 'Network error';
    if (e.response?.data is Map && e.response?.data['message'] != null) {
      message = e.response!.data['message'].toString();
    } else if (e.message != null) {
      message = e.message.toString();
    }
    return ApiException(code: code, message: message);
  }
}

class NetworkException implements Exception {
  NetworkException(this.message);

  final String message;

  factory NetworkException.fromDio(DioException error) {
    final message =
        error.response?.data?.toString() ??
        error.message ??
        'Unknown network error';
    return NetworkException(message);
  }

  @override
  String toString() => 'NetworkException: $message';
}
