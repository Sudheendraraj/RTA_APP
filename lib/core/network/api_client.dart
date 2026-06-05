import 'dart:async';

import 'package:dio/dio.dart';

import '../storage/secure_storage_service.dart';

class ApiClient {
  ApiClient(this._storage, {Dio? dio})
    : _dio =
          dio ?? Dio(BaseOptions(baseUrl: 'https://api.telangana.gov.in/v1')) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _storage.readToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            final success = await _refreshToken();
            if (success) {
              final requestOptions = error.requestOptions;
              final newToken = await _storage.readToken();
              if (newToken != null) {
                requestOptions.headers['Authorization'] = 'Bearer $newToken';
                final response = await _dio.fetch(requestOptions);
                return handler.resolve(response);
              }
            }
          }
          return handler.next(error);
        },
      ),
    );
  }

  final Dio _dio;
  final SecureStorageService _storage;

  Future<bool> _refreshToken() async {
    final refreshToken = await _storage.readRefreshToken();
    if (refreshToken == null) return false;
    await Future.delayed(const Duration(milliseconds: 600));
    final updatedToken = 'refreshed-${DateTime.now().millisecondsSinceEpoch}';
    await _storage.writeToken(updatedToken);
    return true;
  }

  Future<Response<T>> post<T>(String path, {Map<String, dynamic>? data}) async {
    try {
      if (path == '/login') {
        final payload = data ?? <String, dynamic>{};
        return Response<T>(
          requestOptions: RequestOptions(path: path),
          data: await _mockLogin(payload) as T,
          statusCode: 200,
        );
      }
      if (path == '/logout') {
        await Future.delayed(const Duration(milliseconds: 300));
        return Response<T>(
          requestOptions: RequestOptions(path: path),
          data: null,
          statusCode: 204,
        );
      }
      return await _dio.post(path, data: data);
    } on DioException catch (error) {
      throw NetworkException.fromDio(error);
    }
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      switch (path) {
        case '/dashboard':
          return Response<T>(
            requestOptions: RequestOptions(path: path),
            data: _dashboardResponse() as T,
            statusCode: 200,
          );
        case '/vehicles':
          return Response<T>(
            requestOptions: RequestOptions(path: path),
            data: _vehiclesResponse() as T,
            statusCode: 200,
          );
        case '/vehicle-classification':
          return Response<T>(
            requestOptions: RequestOptions(path: path),
            data: _classificationResponse() as T,
            statusCode: 200,
          );
        case '/anpr-records':
          return Response<T>(
            requestOptions: RequestOptions(path: path),
            data: _anprRecordsResponse() as T,
            statusCode: 200,
          );
        case '/cameras':
          return Response<T>(
            requestOptions: RequestOptions(path: path),
            data: _camerasResponse() as T,
            statusCode: 200,
          );
        case '/alerts':
          return Response<T>(
            requestOptions: RequestOptions(path: path),
            data: _alertsResponse() as T,
            statusCode: 200,
          );
        case '/reports':
          return Response<T>(
            requestOptions: RequestOptions(path: path),
            data: _reportsResponse() as T,
            statusCode: 200,
          );
        case '/analytics':
          return Response<T>(
            requestOptions: RequestOptions(path: path),
            data: _analyticsResponse() as T,
            statusCode: 200,
          );
        default:
          return await _dio.get(path, queryParameters: queryParameters);
      }
    } on DioException catch (error) {
      throw NetworkException.fromDio(error);
    }
  }

  Future<Map<String, dynamic>> _mockLogin(Map<String, dynamic> payload) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final username = payload['username']?.toString().toLowerCase() ?? '';
    final password = payload['password']?.toString() ?? '';
    final role = _roleForUsername(username);

    if (password != 'password123' || role == null) {
      throw NetworkException('Invalid username or password.');
    }

    final token = 'jwt-token-${DateTime.now().millisecondsSinceEpoch}';
    final refreshToken =
        'refresh-token-${DateTime.now().millisecondsSinceEpoch}';
    await _storage.writeToken(token);
    await _storage.writeRefreshToken(refreshToken);

    return {
      'accessToken': token,
      'refreshToken': refreshToken,
      'user': {
        'username': username,
        'name': username.replaceAll('_', ' ').toUpperCase(),
        'role': role,
      },
    };
  }

  String? _roleForUsername(String username) {
    if (username.contains('super')) return 'Super Admin';
    if (username.contains('admin')) return 'RTA Administrator';
    if (username.contains('enforce')) return 'Enforcement Officer';
    if (username.contains('check')) return 'Checkpost Officer';
    if (username.contains('supervisor')) return 'Supervisor';
    return null;
  }

  Map<String, dynamic> _dashboardResponse() {
    return {
      'kpis': {
        'today': 1284,
        'week': 8462,
        'month': 35612,
        'blacklisted': 54,
        'violations': 172,
        'activeCameras': 36,
        'offlineCameras': 5,
        'checkposts': 18,
      },
      'classification': _classificationResponse(),
      'analytics': _analyticsResponse(),
    };
  }

  List<Map<String, dynamic>> _vehiclesResponse() {
    return List.generate(12, (index) {
      return {
        'plate': 'TS${1000 + index}AB${(index + 1).toString().padLeft(2, '0')}',
        'vehicleType': [
          'Car',
          'SUV',
          'Bus',
          'Truck',
          'Auto Rickshaw',
        ][index % 5],
        'camera': 'North Checkpost ${index % 3 + 1}',
        'checkpost': 'Checkpost ${index % 4 + 1}',
        'detectedAt': DateTime.now()
            .subtract(Duration(minutes: index * 10))
            .toIso8601String(),
        'confidence': 0.78 + (index * 0.02),
        'direction': index % 2 == 0 ? 'Northbound' : 'Southbound',
        'vehicleImage': 'assets/images/revanth.png',
        'plateImage': 'assets/images/ponnam.png',
      };
    });
  }

  List<Map<String, dynamic>> _classificationResponse() {
    return [
      {'category': 'Two Wheeler', 'count': 2040, 'trend': 3.2},
      {'category': 'Car', 'count': 7420, 'trend': 1.8},
      {'category': 'SUV', 'count': 3408, 'trend': 2.4},
      {'category': 'Bus', 'count': 810, 'trend': 0.9},
      {'category': 'Truck', 'count': 1250, 'trend': 1.1},
      {'category': 'Mini Truck', 'count': 604, 'trend': 2.0},
      {'category': 'Tractor', 'count': 222, 'trend': 0.6},
      {'category': 'Auto Rickshaw', 'count': 1564, 'trend': 1.3},
      {'category': 'Heavy Commercial Vehicle', 'count': 462, 'trend': 0.5},
    ];
  }

  List<Map<String, dynamic>> _anprRecordsResponse() {
    return List.generate(10, (index) {
      return {
        'plate': 'TS${1100 + index}XY${(index + 7).toString().padLeft(2, '0')}',
        'camera': 'East Checkpost ${index % 3 + 1}',
        'checkpost': 'Checkpost ${index % 5 + 1}',
        'vehicleType': [
          'Car',
          'SUV',
          'Truck',
          'Bus',
          'Auto Rickshaw',
        ][index % 5],
        'detectedAt': DateTime.now()
            .subtract(Duration(hours: index * 2))
            .toIso8601String(),
        'confidence': 0.74 + (index * 0.02),
        'direction': index.isOdd ? 'Eastbound' : 'Westbound',
        'vehicleImage': 'assets/images/revanth.png',
        'plateImage': 'assets/images/ponnam.png',
      };
    });
  }

  List<Map<String, dynamic>> _camerasResponse() {
    return List.generate(8, (index) {
      final online = index % 4 != 0;
      return {
        'name': 'Camera ${index + 1}',
        'checkpost': 'Checkpost ${index % 3 + 1}',
        'status': online ? 'Online' : 'Offline',
        'health': online ? 96 : 54,
        'lastActive': DateTime.now()
            .subtract(Duration(minutes: index * 7))
            .toIso8601String(),
      };
    });
  }

  List<Map<String, dynamic>> _alertsResponse() {
    return [
      {
        'type': 'Blacklisted Vehicle',
        'plate': 'TS23AB1234',
        'detectedAt': DateTime.now()
            .subtract(const Duration(minutes: 9))
            .toIso8601String(),
        'status': 'Open',
      },
      {
        'type': 'Permit Violation',
        'plate': 'TS10CD5678',
        'detectedAt': DateTime.now()
            .subtract(const Duration(hours: 1))
            .toIso8601String(),
        'status': 'Investigating',
      },
      {
        'type': 'Expired Documents',
        'plate': 'TS15EF9012',
        'detectedAt': DateTime.now()
            .subtract(const Duration(hours: 2, minutes: 20))
            .toIso8601String(),
        'status': 'Resolved',
      },
    ];
  }

  List<Map<String, dynamic>> _reportsResponse() {
    return [
      {'name': 'Daily Summary', 'type': 'Daily', 'count': 1284},
      {'name': 'Weekly Summary', 'type': 'Weekly', 'count': 8462},
      {'name': 'Monthly Summary', 'type': 'Monthly', 'count': 35612},
      {'name': 'Vehicle Category Report', 'type': 'Category', 'count': 9},
      {'name': 'Checkpost Report', 'type': 'Checkpost', 'count': 18},
      {'name': 'Violation Report', 'type': 'Violation', 'count': 172},
    ];
  }

  List<Map<String, dynamic>> _analyticsResponse() {
    return List.generate(24, (index) {
      return {
        'hour': '${index.toString().padLeft(2, '0')}:00',
        'vehicles': 120 + (index * 10) % 160,
      };
    });
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
