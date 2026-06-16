# Implementation Guide - Dynamic RTA Application

## Step 1: Code Generation

First, generate all the freezed models:

```bash
cd c:\Users\jayen\Desktop\RTA_APP
flutter pub run build_runner build --delete-conflicting-outputs
```

This will generate:
- `dashboard_config.freezed.dart` and `dashboard_config.g.dart`
- `filter_options.freezed.dart` and `filter_options.g.dart`
- `chart_data.freezed.dart` and `chart_data.g.dart`
- `metric_value.freezed.dart` and `metric_value.g.dart`

## Step 2: Update Your Router

Update your `app_router.dart` to use the new DynamicDashboardScreen:

```dart
import 'package:rta_app/features/dashboard/screens/dynamic_dashboard_screen.dart';

GoRoute(
  path: '/dashboard',
  name: 'dashboard',
  builder: (context, state) => const DynamicDashboardScreen(),
),
```

## Step 3: Update Dependencies (if needed)

All required dependencies are already in `pubspec.yaml`:
- flutter_riverpod
- dio
- freezed_annotation
- json_annotation
- json_serializable
- build_runner
- freezed

## Step 4: Backend API Implementation

Your backend should implement these endpoints:

### 1. GET /dashboard/config
Returns the entire dashboard configuration

### 2. GET /dashboard/filters
Returns all available filter options

### 3. GET /dashboard/filters/districts
Returns list of districts

### 4. GET /dashboard/filters/zones?districtId={id}
Returns zones for a specific district

### 5. GET /dashboard/filters/cameras?zoneId={id}
Returns cameras for a specific zone

### 6. GET /dashboard/metrics
Returns all metrics with current values

### 7. GET /dashboard/charts
Returns all chart data

### 8. GET /dashboard/metrics/{id}
Returns specific metric value

### 9. GET /dashboard/charts/{id}
Returns specific chart data

## Step 5: Environment Configuration

Update your API base URL in `api_client.dart`:

```dart
class ApiClient {
  ApiClient(this._storage, {Dio? dio})
    : _dio = dio ?? Dio(BaseOptions(
        baseUrl: 'https://your-api.com/v1'  // Update this
      )) {
    // ...
  }
}
```

## Step 6: Feature Toggles (Optional)

To disable mock responses and use real API:

```dart
// In api_client.dart get() method
case '/dashboard/config':
  if (kDebugMode) {
    // Use mock for development
    return Response<T>(...);
  } else {
    // Use real API for production
    return await _dio.get(path, queryParameters: queryParameters);
  }
```

## Step 7: Custom Icon Mapping (if needed)

If you need more icons, update `_getIconData()` in `dynamic_dashboard_screen.dart`:

```dart
IconData _getIconData(String iconName) {
  switch (iconName) {
    case 'directions_car':
      return Icons.directions_car;
    case 'receipt_long':
      return Icons.receipt_long;
    case 'money_off':
      return Icons.money_off;
    case 'block':
      return Icons.block;
    case 'your_new_icon':
      return Icons.your_new_icon;  // Add here
    default:
      return Icons.dashboard;
  }
}
```

## Step 8: Color Handling

Colors in the configuration are in ARGB format:
```
"backgroundColor": "FF1E88E5"
//                 ^^ Alpha
//                   ^^^^^^ RGB (Hex)
```

The code automatically converts them:
```dart
Color(int.parse('0xFF${metricConfig.backgroundColor}'))
```

## Step 9: Testing

### Test with Mock Data
By default, the application uses mock responses. No backend needed for testing.

### Test with Real Backend
Update the API endpoints and base URL, then run the app normally.

### Test Filter Chains
1. Select a district
2. Zone dropdown should update
3. Select a zone
4. Camera dropdown should update
5. Click "Apply Filters"

## Step 10: Monitoring and Debugging

### Check Logs
Enable Dio logging for API calls:

```dart
class ApiClient {
  ApiClient(this._storage, {Dio? dio})
    : _dio = dio ?? Dio(BaseOptions(
        baseUrl: 'https://api.telangana.gov.in/v1'
      )) {
    _dio.interceptors.add(LoggingInterceptor()); // Add this
    // ...
  }
}

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST: ${options.method} ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('RESPONSE: ${response.statusCode}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('ERROR: ${err.message}');
    super.onError(err, handler);
  }
}
```

### Monitor State Changes
Use Riverpod DevTools:

```bash
flutter pub add dev:riverpod_generator
flutter pub add dev:riverpod_cli
```

## Step 11: Performance Optimization

### 1. Lazy Loading
Charts are only built when needed. Data fetching is on-demand.

### 2. Caching
Implement caching in DashboardRepository:

```dart
class DashboardRepository {
  Map<String, dynamic> _cache = {};
  DateTime? _lastCacheUpdate;

  Future<DashboardConfig> fetchDashboardConfig() async {
    final cached = _cache['config'];
    if (cached != null && _isCacheValid()) {
      return cached;
    }
    
    final config = await _fetchFromApi('/dashboard/config');
    _cache['config'] = config;
    _lastCacheUpdate = DateTime.now();
    return config;
  }

  bool _isCacheValid() {
    if (_lastCacheUpdate == null) return false;
    return DateTime.now().difference(_lastCacheUpdate!).inMinutes < 5;
  }
}
```

### 3. Pagination
For large metric/chart lists, add pagination:

```dart
Future<List<MetricValue>> fetchAllMetrics({
  Map<String, dynamic>? filters,
  int page = 1,
  int pageSize = 10,
}) async {
  // Implementation with pagination
}
```

## Step 12: Error Handling

The dashboard gracefully handles errors:

```dart
// Show error in UI
Text('Error: ${state.error}')

// Retry logic
FilledButton(
  onPressed: () => notifier.fetchDashboardData(),
  child: const Text('Retry'),
)
```

## Step 13: Adding New Filter Types

To add a new filter type (e.g., "Status"):

1. **Backend**: Add to FilterOptions response
```json
"statuses": [
  {"id": "1", "label": "Active"},
  {"id": "2", "label": "Inactive"}
]
```

2. **Model**: Add to FilterOptions (auto-handled by freezed)

3. **Dashboard Config**: Add filter config
```json
{
  "id": "status",
  "label": "Status",
  "hint": "Select Status",
  "isMultiSelect": false,
  "order": 5
}
```

4. **UI**: Will automatically render since it's data-driven!

## Step 14: Adding New Metrics

To add a new metric (e.g., "Active Cameras"):

1. **Backend**: Add metric config and endpoint
```json
{
  "id": "activeCameras",
  "title": "Active Cameras",
  "apiEndpoint": "/dashboard/metrics/activeCameras",
  "icon": "videocam",
  "backgroundColor": "FF4CAF50",
  "order": 5,
  "isVisible": true
}
```

2. **Add mock response** in api_client.dart:
```dart
case '/dashboard/metrics/activeCameras':
  return Response<T>(
    requestOptions: RequestOptions(path: path),
    data: MetricValue(id: 'activeCameras', value: 36),
    statusCode: 200,
  );
```

3. **Icon mapping** (if not already mapped):
```dart
case 'videocam':
  return Icons.videocam;
```

Done! The new metric appears automatically.

## Step 15: WebSocket Integration (Future)

For real-time updates without polling:

```dart
class RealtimeService {
  late WebSocketChannel _channel;

  void connect() {
    _channel = WebSocketChannel.connect(
      Uri.parse('wss://api.telangana.gov.in/v1/dashboard/stream'),
    );
    
    _channel.stream.listen((event) {
      // Update metrics in real-time
      notifier.updateMetric(jsonDecode(event));
    });
  }

  void dispose() {
    _channel.sink.close();
  }
}
```

## Troubleshooting

### Issue: Models not generating
**Solution**: 
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Issue: API returns 401 Unauthorized
**Solution**: Check token refresh logic in ApiClient interceptor

### Issue: Charts not displaying
**Solution**: Verify chart data has at least one item and colors are valid hex values

### Issue: Filters not updating
**Solution**: Ensure filter IDs match between config and filter options response

## Production Checklist

- [ ] Implement all backend endpoints
- [ ] Update API base URL for production
- [ ] Remove mock responses (or keep behind feature flag)
- [ ] Add proper error handling and user feedback
- [ ] Implement caching strategy
- [ ] Add analytics/logging
- [ ] Test with real data
- [ ] Performance test with large datasets
- [ ] Mobile responsiveness testing
- [ ] Security audit (auth, data validation)
- [ ] Implement pagination for large lists
