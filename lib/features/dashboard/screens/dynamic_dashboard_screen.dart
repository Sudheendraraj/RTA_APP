import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/widgets/loading_overlay.dart';
import '../dashboard_notifier_v2.dart';
import '../models/dashboard_config.dart';
import '../models/chart_data.dart';
import '../models/filter_options.dart';
import '../models/metric_value.dart';

class DynamicDashboardScreen extends ConsumerStatefulWidget {
  const DynamicDashboardScreen({super.key});

  @override
  ConsumerState<DynamicDashboardScreen> createState() =>
      _DynamicDashboardScreenState();
}

class _DynamicDashboardScreenState
    extends ConsumerState<DynamicDashboardScreen> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, String?> _selectedFilters = {};
  final Map<String, List<String>> _selectedMultiFilters = {};

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScrollChanged);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollChanged);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScrollChanged() {
    if (!mounted) return;
    setState(() {});
  }

  bool get _isAtBottom {
    return _scrollController.hasClients &&
        _scrollController.offset >=
            _scrollController.position.maxScrollExtent -
                (_scrollController.position.viewportDimension / 4);
  }

  Future<void> _toggleScroll() async {
    if (!_scrollController.hasClients) return;

    final target = _isAtBottom
        ? 0.0
        : _scrollController.position.maxScrollExtent;
    await _scrollController.animateTo(
      target,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final configAsync = ref.watch(dashboardConfigProvider);
    final filterOptionsAsync = ref.watch(dashboardFilterOptionsProvider);
    final notifier = ref.watch(dashboardNotifierProvider.notifier);
    final state = ref.watch(dashboardNotifierProvider);

    return configAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, stack) =>
          Scaffold(body: Center(child: Text('Error: $error'))),
      data: (config) => filterOptionsAsync.when(
        loading: () =>
            const Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (error, stack) =>
            Scaffold(body: Center(child: Text('Error: $error'))),
        data: (filterOptions) {
          final screenWidth = MediaQuery.of(context).size.width;
          final isMobile = screenWidth < 600;

          return Scaffold(
            floatingActionButton: FloatingActionButton.extended(
              onPressed: _toggleScroll,
              icon: Icon(
                _isAtBottom ? Icons.arrow_upward : Icons.arrow_downward,
              ),
              label: Text(_isAtBottom ? 'Scroll Top' : 'Scroll Down'),
            ),
            body: LoadingOverlay(
              isLoading: state.isLoading,
              child: SingleChildScrollView(
                controller: _scrollController,
                padding: EdgeInsets.fromLTRB(
                  20,
                  20,
                  20,
                  20 + MediaQuery.of(context).padding.bottom + 96,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dashboard Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          config.title,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        FilledButton.icon(
                          icon: const Icon(Icons.refresh),
                          label: const Text('Refresh'),
                          onPressed: () => notifier.fetchDashboardData(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Dynamic Filters Section
                    _buildFiltersSection(
                      config,
                      filterOptions,
                      screenWidth,
                      isMobile,
                      notifier,
                    ),
                    const SizedBox(height: 12),

                    // Submit Filters Button
                    Align(
                      alignment: Alignment.centerRight,
                      child: FilledButton(
                        onPressed: () => notifier.applyFilters(
                          district: _selectedFilters['district'],
                          zone: _selectedFilters['zone'],
                          cameras: _selectedMultiFilters['camera'],
                          timeRange: _selectedFilters['timeRange'],
                        ),
                        child: const Text('Apply Filters'),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Dynamic Metrics Section
                    _buildMetricsSection(config, state, screenWidth, isMobile),
                    const SizedBox(height: 24),

                    // Dynamic Charts Section
                    _buildChartsSection(config, state, screenWidth, isMobile),
                    const SizedBox(height: 24),

                    // Last Updated
                    if (state.lastUpdated != null)
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'Last updated: ${state.lastUpdated!.toString().split('.')[0]}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFiltersSection(
    DashboardConfig config,
    FilterOptions filterOptions,
    double screenWidth,
    bool isMobile,
    DashboardNotifier notifier,
  ) {
    final filterColumnCount = isMobile ? 1 : config.layout.filterColumnsDesktop;

    // Sort filters by order
    final sortedFilters = [...config.filters]
      ..sort((a, b) => a.order.compareTo(b.order));

    return GridView.count(
      crossAxisCount: filterColumnCount,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 4.5,
      children: sortedFilters.map((filterConfig) {
        final options = _getFilterOptionsForConfig(filterConfig, filterOptions);
        return _buildFilterField(filterConfig, options);
      }).toList(),
    );
  }

  Widget _buildFilterField(FilterConfig filterConfig, List<String> options) {
    if (filterConfig.isMultiSelect) {
      return _buildMultiSelectFilterField(filterConfig, options);
    } else {
      return _buildSingleSelectFilterField(filterConfig, options);
    }
  }

  Widget _buildSingleSelectFilterField(
    FilterConfig filterConfig,
    List<String> options,
  ) {
    return DropdownButtonFormField<String>(
      initialValue: _selectedFilters[filterConfig.id],
      hint: Text(filterConfig.hint),
      decoration: InputDecoration(
        label: Text(filterConfig.label),
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      items: options
          .map(
            (option) =>
                DropdownMenuItem<String>(value: option, child: Text(option)),
          )
          .toList(),
      onChanged: (value) {
        setState(() => _selectedFilters[filterConfig.id] = value);
      },
    );
  }

  Widget _buildMultiSelectFilterField(
    FilterConfig filterConfig,
    List<String> options,
  ) {
    final selectedValues = _selectedMultiFilters[filterConfig.id] ?? [];

    return InputDecorator(
      decoration: InputDecoration(
        label: Text(filterConfig.label),
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      child: Wrap(
        spacing: 8,
        children: [
          ...selectedValues.map(
            (value) => Chip(
              label: Text(value),
              onDeleted: () {
                setState(() {
                  selectedValues.remove(value);
                  _selectedMultiFilters[filterConfig.id] = selectedValues;
                });
              },
            ),
          ),
          DropdownButton<String>(
            hint: const Text('+ Add'),
            items: options
                .where((opt) => !selectedValues.contains(opt))
                .map(
                  (option) =>
                      DropdownMenuItem(value: option, child: Text(option)),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  selectedValues.add(value);
                  _selectedMultiFilters[filterConfig.id] = selectedValues;
                });
              }
            },
          ),
        ],
      ),
    );
  }

  List<String> _getFilterOptionsForConfig(
    FilterConfig filterConfig,
    FilterOptions filterOptions,
  ) {
    switch (filterConfig.id) {
      case 'district':
        return filterOptions.districts.map((d) => d.label).toList();
      case 'zone':
        return filterOptions.zones.map((z) => z.label).toList();
      case 'camera':
        return filterOptions.cameras.map((c) => c.label).toList();
      case 'timeRange':
        return filterOptions.timeRanges.map((t) => t.label).toList();
      default:
        return [];
    }
  }

  Widget _buildMetricsSection(
    DashboardConfig config,
    DashboardState state,
    double screenWidth,
    bool isMobile,
  ) {
    final visibleMetrics = config.metrics.where((m) => m.isVisible).toList();
    if (visibleMetrics.isEmpty) return const SizedBox.shrink();

    final columnCount = isMobile ? 1 : config.layout.metricColumnsDesktop;
    final sortedMetrics = [...visibleMetrics]
      ..sort((a, b) => a.order.compareTo(b.order));

    return GridView.count(
      crossAxisCount: columnCount,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: isMobile ? 2.0 : 3.2,
      children: sortedMetrics.map((metricConfig) {
        final metricValue = state.metrics
            .firstWhere(
              (m) => m.id == metricConfig.id,
              orElse: () => MetricValue(id: metricConfig.id, value: 0),
            )
            .value;

        return _buildMetricCard(metricConfig, metricValue);
      }).toList(),
    );
  }

  Widget _buildMetricCard(MetricConfig metricConfig, num metricValue) {
    final color = Color(int.parse('0xFF${metricConfig.backgroundColor}'));

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(_getIconData(metricConfig.icon), color: Colors.white, size: 28),
          const SizedBox(height: 16),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              metricValue.toString(),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            metricConfig.title,
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildChartsSection(
    DashboardConfig config,
    DashboardState state,
    double screenWidth,
    bool isMobile,
  ) {
    final visibleCharts = config.charts.where((c) => c.isVisible).toList();
    if (visibleCharts.isEmpty) return const SizedBox.shrink();

    final sortedCharts = [...visibleCharts]
      ..sort((a, b) => a.order.compareTo(b.order));

    return Column(
      children: sortedCharts.map((chartConfig) {
        final chartData = state.charts
            .firstWhere(
              (c) => c.title == chartConfig.title,
              orElse: () => ChartResponse(title: chartConfig.title, data: []),
            )
            .data;

        return _buildChartCard(chartConfig, chartData, screenWidth, isMobile);
      }).toList(),
    );
  }

  Widget _buildChartCard(
    ChartConfig chartConfig,
    List<DynamicChartData> chartData,
    double screenWidth,
    bool isMobile,
  ) {
<<<<<<< HEAD
    final chartHeight = isMobile
        ? math.max(300, screenWidth * 0.64).toDouble()
        : 360.0;
=======
    final chartHeight = isMobile ? math.max(300.0, screenWidth * 0.64) : 360.0;
>>>>>>> 3d06e800406bab33b55a0c80e9cc4808efec4301
    final cardPadding = isMobile ? 14.0 : 20.0;
    final titleStyle = TextStyle(
      fontSize: isMobile ? 16 : 18,
      fontWeight: FontWeight.bold,
    );

    return Card(
      child: Padding(
        padding: EdgeInsets.all(cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(chartConfig.title, style: titleStyle),
            SizedBox(height: isMobile ? 12 : 16),
            SizedBox(
              height: chartHeight,
              child: _buildDynamicChart(chartConfig.type, chartData, isMobile),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDynamicChart(
    String chartType,
    List<DynamicChartData> data,
    bool isMobile,
  ) {
    if (data.isEmpty) {
      return const Center(child: Text('No data available'));
    }

    switch (chartType) {
      case 'doughnut':
      case 'pie':
        return SfCircularChart(
          legend: Legend(
            isVisible: true,
            overflowMode: LegendItemOverflowMode.wrap,
            position: LegendPosition.bottom,
<<<<<<< HEAD
            iconHeight: isMobile ? 12.0 : 16.0,
            iconWidth: isMobile ? 12.0 : 16.0,
=======
            iconHeight: isMobile ? 12 : 16,
            iconWidth: isMobile ? 12 : 16,
>>>>>>> 3d06e800406bab33b55a0c80e9cc4808efec4301
            itemPadding: 8.0,
            textStyle: TextStyle(fontSize: isMobile ? 11 : 12),
          ),
          margin: EdgeInsets.zero,
          series: <DoughnutSeries<DynamicChartData, String>>[
            DoughnutSeries<DynamicChartData, String>(
              animationDuration: 0,
              dataSource: data,
              xValueMapper: (data, _) => data.label,
              yValueMapper: (data, _) => data.value,
              pointColorMapper: (data, _) =>
                  Color(int.parse('0xFF${data.color}')),
              dataLabelSettings: const DataLabelSettings(isVisible: true),
            ),
          ],
        );
      case 'column':
        return SfCartesianChart(
          margin: const EdgeInsets.all(8),
          enableAxisAnimation: false,
          primaryXAxis: CategoryAxis(
            labelRotation: 45,
            majorGridLines: const MajorGridLines(width: 0),
            labelAlignment: LabelAlignment.center,
            labelIntersectAction: AxisLabelIntersectAction.multipleRows,
          ),
          primaryYAxis: NumericAxis(
            labelFormat: '₹{value}',
            axisLine: const AxisLine(width: 0),
          ),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ColumnSeries<DynamicChartData, String>>[
            ColumnSeries<DynamicChartData, String>(
              animationDuration: 0,
              dataSource: data,
              xValueMapper: (data, _) => data.label,
              yValueMapper: (data, _) => data.value,
              pointColorMapper: (data, _) =>
                  Color(int.parse('0xFF${data.color}')),
              dataLabelSettings: const DataLabelSettings(isVisible: true),
            ),
          ],
        );
      case 'line':
        return SfCartesianChart(
          margin: const EdgeInsets.all(8),
          primaryXAxis: CategoryAxis(
            labelRotation: 45,
            majorGridLines: const MajorGridLines(width: 0),
            labelAlignment: LabelAlignment.center,
            labelIntersectAction: AxisLabelIntersectAction.multipleRows,
          ),
          primaryYAxis: NumericAxis(
            labelFormat: '{value}',
            axisLine: const AxisLine(width: 0),
          ),
          series: <LineSeries<DynamicChartData, String>>[
            LineSeries<DynamicChartData, String>(
              animationDuration: 0,
              dataSource: data,
              xValueMapper: (data, _) => data.label,
              yValueMapper: (data, _) => data.value,
              pointColorMapper: (data, _) =>
                  Color(int.parse('0xFF${data.color}')),
            ),
          ],
        );
      default:
        return const Center(child: Text('Unknown chart type'));
    }
  }

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
      default:
        return Icons.dashboard;
    }
  }
}
