# Quick Start Guide - Dynamic RTA Dashboard

## 5-Minute Setup

### Step 1: Code is Ready
✅ All models generated
✅ API layer implemented
✅ Dashboard screen created
✅ State management configured

### Step 2: Update Your Router (1 minute)

In your `lib/routes/app_router.dart`, import and add the route:

```dart
import 'package:rta_app/features/dashboard/screens/dynamic_dashboard_screen.dart';

// Add this route to your GoRouter
GoRoute(
  path: '/dashboard',
  name: 'dashboard',
  builder: (context, state) => const DynamicDashboardScreen(),
),
```

### Step 3: Test with Mock Data (instant)

Run the app - it works with built-in mock data:

```bash
flutter run
```

Navigate to `/dashboard` and you'll see:
- ✅ Dynamically loaded filters
- ✅ Metrics from mock API
- ✅ Charts rendering with data
- ✅ Filter chains working

### Step 4: Backend Implementation (your next step)

Implement these endpoints:

**GET /dashboard/config**
```json
{
  "title": "RTA Dashboard",
  "filters": [...],
  "metrics": [...],
  "charts": [...],
  "layout": {...},
  "refresh": {...}
}
```

**GET /dashboard/filters**
```json
{
  "districts": [{"id": "1", "label": "Nizamabad"}],
  "zones": [{"id": "1", "label": "North Zone"}],
  "cameras": [{"id": "1", "label": "Camera 1"}],
  "timeRanges": [{"id": "1", "label": "Today"}]
}
```

**GET /dashboard/metrics**
```json
[
  {"id": "totalVehicles", "value": 3537},
  {"id": "eChallan", "value": 152}
]
```

**GET /dashboard/charts**
```json
[
  {
    "title": "Vehicle Distribution",
    "data": [
      {"label": "Car", "value": 100, "color": "FF2196F3"}
    ]
  }
]
```

---

## Testing Scenarios

### Scenario 1: View Dashboard
1. Open app
2. Navigate to `/dashboard`
3. See all metrics and charts from mock data

### Scenario 2: Apply Filters
1. Select a district
2. Select a zone
3. Click "Apply Filters"
4. See updated metrics and charts

### Scenario 3: Auto-Refresh
1. Dashboard auto-refreshes every 30 seconds
2. Check "Last updated" timestamp at bottom
3. Manually refresh with "Refresh" button

---

## Important Files

### Core Files
- `lib/features/dashboard/screens/dynamic_dashboard_screen.dart` - Main UI
- `lib/features/dashboard/dashboard_notifier_v2.dart` - State management
- `lib/features/dashboard/repositories/dashboard_repository.dart` - API calls

### Configuration Files
- `lib/core/network/api_client.dart` - API client with endpoints

### Documentation
- `DYNAMIC_ARCHITECTURE.md` - Complete architecture
- `IMPLEMENTATION_GUIDE.md` - Detailed implementation
- `DYNAMIC_TRANSFORMATION_SUMMARY.md` - What was built

---

## Key Features Enabled

### 1. Dynamic Configuration
Everything in the dashboard is defined by backend config:
- No hardcoded UI
- No redeploy needed to change layout
- A/B testing ready

### 2. Filter Chaining
```
Select District → Zones update
Select Zone → Cameras update
Select Cameras → Apply filters
```

### 3. Real-Time Updates
- Auto-refresh every 30 seconds
- Manual refresh button
- Last updated timestamp

### 4. Responsive Design
- Works on desktop, tablet, mobile
- Layout columns configured per device type

### 5. Multiple Chart Types
- Doughnut charts
- Column charts
- Line charts
- Pie charts (easy to add)

---

## API Endpoints Summary

| Endpoint | Purpose | Mock? | Ready? |
|----------|---------|-------|--------|
| GET /dashboard/config | Configuration | ✅ | ✅ |
| GET /dashboard/filters | All filters | ✅ | ✅ |
| GET /dashboard/filters/districts | Districts | ✅ | ✅ |
| GET /dashboard/filters/zones | Zones | ✅ | ✅ |
| GET /dashboard/filters/cameras | Cameras | ✅ | ✅ |
| GET /dashboard/metrics | All metrics | ✅ | ✅ |
| GET /dashboard/charts | All charts | ✅ | ✅ |

---

## Example Backend Response

Here's what your backend `/dashboard/config` should return:

```json
{
  "title": "RTA Dashboard",
  "filters": [
    {
      "id": "district",
      "label": "District",
      "hint": "Select District",
      "isMultiSelect": false,
      "isRequired": false,
      "order": 1
    },
    {
      "id": "zone",
      "label": "Zone",
      "hint": "Select Zone",
      "isMultiSelect": false,
      "isRequired": false,
      "order": 2
    },
    {
      "id": "camera",
      "label": "Camera",
      "hint": "Select Camera",
      "isMultiSelect": true,
      "isRequired": false,
      "order": 3
    },
    {
      "id": "timeRange",
      "label": "Time Range",
      "hint": "Select Time Range",
      "isMultiSelect": false,
      "isRequired": false,
      "order": 4
    }
  ],
  "metrics": [
    {
      "id": "totalVehicles",
      "title": "Total Vehicles",
      "apiEndpoint": "/dashboard/metrics/totalVehicles",
      "icon": "directions_car",
      "backgroundColor": "FF1E88E5",
      "order": 1,
      "isVisible": true
    },
    {
      "id": "eChallan",
      "title": "e-Challan",
      "apiEndpoint": "/dashboard/metrics/eChallan",
      "icon": "receipt_long",
      "backgroundColor": "FF7B1FA2",
      "order": 2,
      "isVisible": true
    },
    {
      "id": "manualChallan",
      "title": "Manual Challan",
      "apiEndpoint": "/dashboard/metrics/manualChallan",
      "icon": "money_off",
      "backgroundColor": "FF1565C0",
      "order": 3,
      "isVisible": true
    },
    {
      "id": "vehiclesSeized",
      "title": "Vehicles Seized",
      "apiEndpoint": "/dashboard/metrics/vehiclesSeized",
      "icon": "block",
      "backgroundColor": "FFFF6F00",
      "order": 4,
      "isVisible": true
    }
  ],
  "charts": [
    {
      "id": "registration",
      "title": "Registration",
      "type": "doughnut",
      "apiEndpoint": "/dashboard/charts/registration",
      "dataFields": ["label", "value", "color"],
      "isVisible": true,
      "order": 1
    },
    {
      "id": "vehicleDistribution",
      "title": "Vehicle Distribution",
      "type": "doughnut",
      "apiEndpoint": "/dashboard/charts/vehicleDistribution",
      "dataFields": ["label", "value", "color"],
      "isVisible": true,
      "order": 2
    },
    {
      "id": "totalRevenue",
      "title": "Total Revenue Generated",
      "type": "column",
      "apiEndpoint": "/dashboard/charts/totalRevenue",
      "dataFields": ["label", "value", "color"],
      "isVisible": true,
      "order": 3
    }
  ],
  "layout": {
    "filterColumnsDesktop": 4,
    "filterColumnsMobile": 1,
    "metricColumnsDesktop": 4,
    "metricColumnsMobile": 1,
    "chartColumnsDesktop": 2,
    "chartColumnsMobile": 1
  },
  "refresh": {
    "intervalSeconds": 30,
    "enableAutoRefresh": true,
    "enableRealTimeUpdates": true
  }
}
```

---

## Color Format

Colors use ARGB hex format:
```
"FF1E88E5"
 ^^      = Alpha (FF = fully opaque)
   ^^^^^^= RGB in hex (1E88E5 = blue)
```

Common colors:
- `FF1E88E5` - Blue
- `FF7B1FA2` - Purple
- `FF1565C0` - Dark Blue
- `FFFF6F00` - Orange
- `FF2196F3` - Light Blue
- `FF4CAF50` - Green

---

## Icon Names

Supported icons (from Material Icons):
- `directions_car` - Car icon
- `receipt_long` - Receipt icon
- `money_off` - Money icon
- `block` - Block icon
- `videocam` - Camera icon
- `dashboard` - Dashboard icon
- Any Material Icon name

To add more icons, update `_getIconData()` in `dynamic_dashboard_screen.dart`.

---

## Next: Switch to Real Backend

When backend is ready, update in `api_client.dart`:

```dart
class ApiClient {
  ApiClient(this._storage, {Dio? dio})
    : _dio = dio ?? Dio(BaseOptions(
      baseUrl: 'https://your-api-domain.com/api/v1'  // Change this
    )) {
```

Then in the `get()` method, replace mock responses:

```dart
// Instead of this:
case '/dashboard/config':
  return Response<T>(
    requestOptions: RequestOptions(path: path),
    data: _dashboardConfigResponse() as T,  // Mock
    statusCode: 200,
  );

// Do this:
case '/dashboard/config':
  return await _dio.get(path, queryParameters: queryParameters);
```

---

## Debugging

### Enable Logging
Add to `api_client.dart`:

```dart
_dio.interceptors.add(
  LoggingInterceptor(),
);
```

### Check State
In any widget with Riverpod:

```dart
final state = ref.watch(dashboardNotifierProvider);
print('Loading: ${state.isLoading}');
print('Error: ${state.error}');
print('Metrics: ${state.metrics}');
print('Charts: ${state.charts}');
```

### Force Refresh
```dart
final notifier = ref.watch(dashboardNotifierProvider.notifier);
notifier.fetchDashboardData();
```

---

## What's Next?

- [ ] Add backend endpoints
- [ ] Update API base URL
- [ ] Test filter chains
- [ ] Add error UI
- [ ] Implement caching
- [ ] Add analytics
- [ ] Performance test
- [ ] Mobile test

---

## Support

Refer to these files for detailed info:
1. **IMPLEMENTATION_GUIDE.md** - Step-by-step backend implementation
2. **DYNAMIC_ARCHITECTURE.md** - Full architecture details
3. **DYNAMIC_TRANSFORMATION_SUMMARY.md** - Summary of changes

---

**Your dynamic dashboard is ready!** 🚀

Now implement your backend endpoints and switch from mock to real data.
