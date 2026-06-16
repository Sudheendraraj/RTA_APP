# Dynamic RTA Application Architecture

## Overview

The RTA application has been transformed into a fully dynamic, server-driven application. All UI elements, data sources, and configurations are now loaded from the backend, making it highly flexible and maintainable.

## Key Features

### 1. **Dynamic Configuration** 
- Dashboard layout and widgets are configured from the backend
- No hardcoded UI elements - everything is data-driven
- Easy to add/remove/modify features without code changes

### 2. **Server-Driven Filters**
- Filter options (districts, zones, cameras, time ranges) are loaded from API
- Supports hierarchical filters (district → zone → camera)
- Both single-select and multi-select filter types

### 3. **Dynamic Metrics**
- Metrics are configurable via backend
- Each metric has icon, color, and API endpoint defined
- Real-time value updates

### 4. **Flexible Charts**
- Supports multiple chart types: doughnut, column, line, pie
- Chart data is fetched from dedicated endpoints
- Color and label customization from backend

### 5. **Real-Time Updates**
- Auto-refresh configuration from backend
- Optional real-time WebSocket support
- Configurable refresh intervals

### 6. **Responsive Design**
- Dynamic layout columns for desktop/mobile
- Grid-based responsive UI
- Auto-scaling components

## Project Structure

```
lib/
├── features/
│   └── dashboard/
│       ├── models/
│       │   ├── dashboard_config.dart      # Configuration models (freezed)
│       │   ├── filter_options.dart        # Filter model
│       │   ├── chart_data.dart           # Chart data model
│       │   └── metric_value.dart         # Metric value model
│       ├── repositories/
│       │   └── dashboard_repository.dart # API calls abstraction
│       ├── screens/
│       │   └── dynamic_dashboard_screen.dart # Main dashboard UI
│       └── dashboard_notifier_v2.dart    # State management
└── core/
    └── network/
        └── api_client.dart               # HTTP client with mock responses
```

## API Endpoints Required

### 1. **Dashboard Configuration**
```
GET /dashboard/config
Response:
{
  "title": "RTA Dashboard",
  "filters": [...],
  "metrics": [...],
  "charts": [...],
  "layout": {...},
  "refresh": {...}
}
```

### 2. **Filter Options**
```
GET /dashboard/filters
GET /dashboard/filters/districts
GET /dashboard/filters/zones?districtId={id}
GET /dashboard/filters/cameras?zoneId={id}
```

### 3. **Metrics**
```
GET /dashboard/metrics
GET /dashboard/metrics/{metricId}?filters=...
```

### 4. **Charts**
```
GET /dashboard/charts
GET /dashboard/charts/{chartId}?filters=...
```

## Models

### DashboardConfig
Defines the entire dashboard structure:
- Filters configuration
- Metrics to display
- Charts to render
- Layout columns for responsive design
- Auto-refresh settings

### FilterOptions
Contains all available filter options:
- Districts
- Zones
- Cameras
- Time ranges

### MetricValue
Represents a single metric:
- ID, current value, previous value
- Change percentage for trend indication

### ChartResponse
Contains chart data:
- Title
- Data points with labels, values, colors
- Optional description

## State Management (Riverpod)

### Providers

1. **dashboardConfigProvider** - Fetches dashboard configuration
2. **dashboardFilterOptionsProvider** - Fetches all filter options
3. **dashboardMetricsProvider** - Fetches all metrics
4. **dashboardChartsProvider** - Fetches all charts
5. **districtOptionsProvider** - Fetches districts
6. **zoneOptionsProvider** - Fetches zones (depends on selected district)
7. **cameraOptionsProvider** - Fetches cameras (depends on selected zone)
8. **dashboardNotifierProvider** - Main state notifier for dashboard

### Filter State Providers

- `selectedDistrictProvider` - Currently selected district
- `selectedZoneProvider` - Currently selected zone
- `selectedCameraProvider` - Currently selected cameras (multi-select)
- `selectedTimeRangeProvider` - Currently selected time range

## Usage

### Import the Dynamic Dashboard
```dart
import 'package:rta_app/features/dashboard/screens/dynamic_dashboard_screen.dart';

// In your router or navigation
DynamicDashboardScreen()
```

### Applying Filters
```dart
final notifier = ref.watch(dashboardNotifierProvider.notifier);
await notifier.applyFilters(
  district: 'Nizamabad',
  zone: 'North Zone',
  cameras: ['North Checkpost 1', 'North Checkpost 2'],
  timeRange: 'This Month',
);
```

### Manual Refresh
```dart
final notifier = ref.watch(dashboardNotifierProvider.notifier);
notifier.fetchDashboardData();
```

## Backend Configuration Example

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
      "title": "Total No.of Vehicles",
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

## Benefits

1. **Maintainability** - Change dashboard without redeploying app
2. **Scalability** - Add new metrics/charts/filters dynamically
3. **A/B Testing** - Serve different configurations to different users
4. **Real-time Updates** - No app release needed for data updates
5. **Responsive** - Automatically adapts to screen sizes
6. **Type-Safe** - Freezed models with code generation

## Next Steps

1. **Implement Backend Endpoints**
   - Create REST API endpoints matching the configuration
   - Use mock data for development

2. **Add WebSocket Support** (Optional)
   - For real-time metric updates
   - Reduces polling overhead

3. **Add User Preferences**
   - Let users customize dashboard widgets
   - Save preferences to backend

4. **Add Analytics**
   - Track user interactions
   - Monitor dashboard usage

## Code Generation

Run build_runner to generate freezed models:

```bash
flutter pub run build_runner build
```

For watch mode:
```bash
flutter pub run build_runner watch
```

## Testing

The application includes mock API responses for development. To switch to real backend:

```dart
// In api_client.dart, comment out mock responses
// and uncomment the actual dio calls:
return await _dio.get(path, queryParameters: queryParameters);
```

## Performance Optimization

- Charts use `animationDuration: 0` for instant rendering
- Pagination support for large datasets (ready to implement)
- Caching layer for frequently accessed data (ready to implement)
- Lazy loading of non-visible widgets (ready to implement)
