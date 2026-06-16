# Architecture Diagram - Dynamic RTA Dashboard

## Data Flow Architecture

```
┌─────────────────────────────────────────────────────────────────────────┐
│                         DynamicDashboardScreen                          │
│                    (UI Layer - dynamic_dashboard_screen.dart)           │
└─────────────────────────────────────────────────────────────────────────┘
                                    ▲
                                    │ watches
                                    │
                ┌───────────────────┼───────────────────┐
                │                   │                   │
                ▼                   ▼                   ▼
    ┌──────────────────┐  ┌──────────────────┐  ┌──────────────────┐
    │ dashboardConfig  │  │ filterOptions    │  │ dashboardNotifier│
    │ Provider         │  │ Provider         │  │ Provider         │
    │ (Async)          │  │ (Async)          │  │ (StateNotifier)  │
    └─────────┬────────┘  └────────┬─────────┘  └────────┬─────────┘
              │                     │                     │
              │                     │                     │
              └──────────┬──────────┴──────────┬──────────┘
                         │                     │
                         ▼                     ▼
              ┌──────────────────────────────────────────┐
              │   DashboardNotifier                      │
              │   (State Management)                     │
              │   dashboard_notifier_v2.dart            │
              │                                          │
              │  - Manage configuration                 │
              │  - Handle filter updates                │
              │  - Fetch metrics & charts               │
              │  - Auto-refresh logic                   │
              └────────────────┬─────────────────────────┘
                               │
                               ▼
              ┌──────────────────────────────────────────┐
              │   DashboardRepository                    │
              │   Data Access Layer                      │
              │   dashboard_repository.dart             │
              │                                          │
              │  - fetchDashboardConfig()               │
              │  - fetchFilterOptions()                 │
              │  - fetchMetrics()                       │
              │  - fetchCharts()                        │
              │  - fetchDistricts/Zones/Cameras()       │
              └────────────────┬─────────────────────────┘
                               │
                               ▼
              ┌──────────────────────────────────────────┐
              │   ApiClient                              │
              │   HTTP Layer with Mock Responses         │
              │   api_client.dart                       │
              │                                          │
              │  GET /dashboard/config                  │
              │  GET /dashboard/filters                 │
              │  GET /dashboard/metrics                 │
              │  GET /dashboard/charts                  │
              │  GET /dashboard/filters/...             │
              └────────────────┬─────────────────────────┘
                               │
                    ┌──────────┴──────────┐
                    │                     │
                    ▼                     ▼
           ┌──────────────────┐  ┌──────────────────┐
           │  Mock Data       │  │  Real Backend    │
           │  (Development)   │  │  (Production)    │
           └──────────────────┘  └──────────────────┘
```

---

## Component Structure

```
DynamicDashboardScreen
├── _buildFiltersSection()
│   └── _buildFilterField()
│       ├── _buildSingleSelectFilterField()
│       └── _buildMultiSelectFilterField()
├── _buildMetricsSection()
│   └── _buildMetricCard()
└── _buildChartsSection()
    └── _buildChartCard()
        └── _buildDynamicChart()
            ├── DoughnutSeries (SfCircularChart)
            ├── ColumnSeries (SfCartesianChart)
            └── LineSeries (SfCartesianChart)
```

---

## Filter Chain Flow

```
┌──────────────────┐
│  Select District │
└────────┬─────────┘
         │
         ▼
┌──────────────────────────────┐
│ districtOptionsProvider      │
│ - Fetch from API             │
│ - Cache results              │
└────────┬─────────────────────┘
         │
         ▼
┌──────────────────┐
│  Zones Provider  │
│  depends on:     │
│  selectedDistrict│
└────────┬─────────┘
         │
         ▼
┌──────────────────┐
│  Select Zone     │
└────────┬─────────┘
         │
         ▼
┌──────────────────────────────┐
│ cameraOptionsProvider        │
│ - Fetch based on zone        │
│ - Auto-refresh on change     │
└────────┬─────────────────────┘
         │
         ▼
┌──────────────────┐
│  Select Camera   │
└────────┬─────────┘
         │
         ▼
┌──────────────────┐
│ Apply Filters    │
│ Button           │
└────────┬─────────┘
         │
         ▼
┌──────────────────────────────┐
│ applyFilters() in notifier   │
│ - Apply selected filters     │
│ - Fetch new data with params │
│ - Update UI                  │
└──────────────────────────────┘
```

---

## State Management Flow

```
┌─────────────────────────────────────────────────────────┐
│                DashboardState                           │
│                                                         │
│  config: DashboardConfig?                             │
│  filterOptions: FilterOptions?                        │
│  metrics: List<MetricValue>                           │
│  charts: List<ChartResponse>                          │
│  isLoading: bool                                      │
│  error: String?                                       │
│  lastUpdated: DateTime?                               │
└─────────────────────────────────────────────────────────┘
           ▲
           │
           │ managed by
           │
┌─────────────────────────────────────────────────────────┐
│              DashboardNotifier                          │
│                                                         │
│  _initializeDashboard()                                │
│    ├── fetchDashboardConfig()                          │
│    ├── fetchFilterOptions()                            │
│    ├── fetchAllMetrics()                               │
│    ├── fetchAllCharts()                                │
│    └── _startAutoRefresh()                             │
│                                                         │
│  fetchDashboardData()                                  │
│    ├── fetchAllMetrics()                               │
│    ├── fetchAllCharts()                                │
│    └── update lastUpdated                              │
│                                                         │
│  applyFilters()                                        │
│    ├── Build filter map                                │
│    ├── fetchAllMetrics(filters)                        │
│    ├── fetchAllCharts(filters)                         │
│    └── Update state                                    │
│                                                         │
│  _startAutoRefresh()                                   │
│    └── Timer.periodic() → fetchDashboardData()         │
└─────────────────────────────────────────────────────────┘
```

---

## Data Model Flow

```
Backend JSON Config
        │
        ▼
┌─────────────────────────────────────────┐
│   DashboardConfig                       │
│                                         │
│  ├── title                              │
│  ├── filters: List<FilterConfig>        │
│  ├── metrics: List<MetricConfig>        │
│  ├── charts: List<ChartConfig>          │
│  ├── layout: LayoutConfig               │
│  └── refresh: RefreshConfig             │
└────────────┬────────────────────────────┘
             │
    ┌────────┴────────┐
    │                 │
    ▼                 ▼
FilterOptions    Metrics API Response
    │                 │
    │                 ▼
    │         ┌──────────────────────┐
    │         │  List<MetricValue>   │
    │         │                      │
    │         │  ├── id              │
    │         │  ├── value           │
    │         │  ├── previousValue   │
    │         │  └── changePercentage│
    │         └──────────────────────┘
    │
    ▼
┌──────────────────────────┐
│  FilterOption            │
│                          │
│  ├── id                  │
│  ├── label               │
│  └── description         │
└──────────────────────────┘

Charts API Response
        │
        ▼
┌──────────────────────────┐
│  ChartResponse           │
│                          │
│  ├── title               │
│  ├── data                │
│  │   └── List<>          │
│  │       DynamicChartData│
│  │       ├── label       │
│  │       ├── value       │
│  │       └── color       │
│  └── description         │
└──────────────────────────┘
```

---

## UI Rendering Flow

```
DynamicDashboardScreen
        │
        ├──────────────────────────────────────┐
        │                                      │
        ▼                                      ▼
┌──────────────────────────┐      ┌──────────────────────┐
│  Fetch Filters Config    │      │  Fetch Dashboard     │
│  & Options               │      │  Data                │
└────────────┬─────────────┘      └──────────┬───────────┘
             │                               │
             ▼                               ▼
┌──────────────────────────────────────────────────────┐
│           Build Dynamic UI                           │
│                                                      │
│  1. Header (Title + Refresh Button)                 │
│  2. Filter Section                                  │
│     └─ For each FilterConfig:                       │
│        ├─ Fetch options                             │
│        └─ Render dropdown/multi-select              │
│  3. Apply Filters Button                            │
│  4. Metrics Section                                 │
│     └─ For each MetricConfig (sorted by order):     │
│        └─ Render metric card with color & icon      │
│  5. Charts Section                                  │
│     └─ For each ChartConfig (sorted by order):      │
│        ├─ Determine chart type                      │
│        └─ Render SfCircularChart/SfCartesianChart   │
│  6. Last Updated Timestamp                          │
└──────────────────────────────────────────────────────┘
```

---

## API Response Structure

### Configuration Response
```
GET /dashboard/config → DashboardConfig
{
  title: string
  filters: FilterConfig[]
  metrics: MetricConfig[]
  charts: ChartConfig[]
  layout: LayoutConfig
  refresh: RefreshConfig
}
```

### Filter Options Response
```
GET /dashboard/filters → FilterOptions
{
  districts: FilterOption[]
  zones: FilterOption[]
  cameras: FilterOption[]
  timeRanges: FilterOption[]
}
```

### Metrics Response
```
GET /dashboard/metrics → MetricValue[]
[
  {
    id: string
    value: number
    previousValue?: number
    changePercentage?: number
  }
]
```

### Charts Response
```
GET /dashboard/charts → ChartResponse[]
[
  {
    title: string
    data: DynamicChartData[]
    description?: string
  }
]

DynamicChartData:
{
  label: string
  value: number
  color: string (hex format: AARRGGBB)
}
```

---

## Responsive Layout Logic

```
screenWidth > 1100  → filterColumnsDesktop = 4
screenWidth < 1100  → filterColumnsMobile = 1

screenWidth > 1400  → summaryColumnsDesktop = 4
screenWidth > 1000  → summaryColumnsDesktop = 2
screenWidth < 1000  → summaryColumnsMobile = 1

screenWidth > 1600  → chartColumnsDesktop = 5
screenWidth > 1200  → chartColumnsDesktop = 3
screenWidth < 1200  → chartColumnsMobile = 1
```

---

## Auto-Refresh Flow

```
Dashboard Initialized
        │
        ▼
Read RefreshConfig from backend
        │
        ├─ enableAutoRefresh = true?
        │   └─ YES
        │       └─ _startAutoRefresh()
        │           └─ Timer.periodic(intervalSeconds)
        │               └─ fetchDashboardData()
        │                   ├─ Fetch metrics
        │                   ├─ Fetch charts
        │                   └─ Update UI
        │
        └─ NO → Manual refresh only via button
```

---

## Error Handling Flow

```
API Call
    │
    ├─ Success → Update state with data
    │
    └─ Failure
        │
        ├─ DioException → Catch & format
        │
        ├─ Set error message in state
        │
        └─ UI Shows error
            │
            └─ User can retry
```

---

## Deployment Architecture

```
Development
├── Mock API responses in ApiClient
├── No backend required
└── Used for initial testing

Production
├── Update API baseUrl in ApiClient
├── Comment out mock responses
├── Use real Dio calls
├── All data from backend
└── Dynamic configuration from server
```

---

## Key Integration Points

1. **Router** → DynamicDashboardScreen
2. **AuthNotifier** → Token management
3. **Riverpod** → State & dependency management
4. **Dio** → HTTP client
5. **Syncfusion** → Chart rendering
6. **Flutter Material** → UI components

---

## Performance Optimizations

```
┌─────────────────────────────────────────┐
│  Performance Strategies                 │
├─────────────────────────────────────────┤
│ 1. Lazy Loading                         │
│    └─ Charts render only when visible   │
│                                         │
│ 2. Caching                              │
│    └─ Cache config for 5 minutes        │
│                                         │
│ 3. Debouncing                           │
│    └─ Debounce filter changes           │
│                                         │
│ 4. Pagination                           │
│    └─ Load metrics/charts in pages      │
│                                         │
│ 5. Compression                          │
│    └─ GZIP API responses                │
└─────────────────────────────────────────┘
```

This architecture ensures:
- ✅ Fully dynamic & configurable
- ✅ Type-safe with Freezed
- ✅ Reactive with Riverpod
- ✅ Responsive design
- ✅ Real-time updates
- ✅ Error handling
- ✅ Performance optimized
