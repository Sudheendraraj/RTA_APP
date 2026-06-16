import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../core/widgets/loading_overlay.dart';
import 'dashboard_notifier.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  final ScrollController _scrollController = ScrollController();

  static const _districtHint = 'Select All District';
  static const _zoneHint = 'Select All Zone';
  static const _cameraHint = 'Select All Camera';
  static const _timeRangeHint = 'Select All Time Range';

  static const List<String> _districtOptions = [
    'Select All District',
    'Nizamabad',
    'Adilabad',
    'Sangareddy',
    'Kamareddy',
    'Nirmal',
    'Komaram Bheem Asifabad',
    'Jogulamba Gadwal',
    'Narayanpet',
    'Nalgonda',
    'Suryapet',
    'Khammam',
    'Bhadradri Kothagudem',
    'Jayashankar Bhupalpally',
    'Mulugu',
    'Peddapalli',
    'Karimnagar',
    'Mancherial',
    'Vikarabad',
    'Rangareddy',
    'Medchal Malkajgiri',
    'Mahbubnagar',
    'Jagtial',
    'Siddipet',
    'Jangaon',
    'Hanamkonda',
    'Yadadri Bhuvanagiri',

  ];

  static const List<String> _timeRangeOptions = [
    'Select All Time Range',
    'Today',
    'This Week',
    'This Month',
    'This Year',
  ];

  String? _selectedDistrict = _districtOptions.first;
  String? _selectedTimeRange = _timeRangeOptions.first;

  static final _summaryMetrics = [
    _SummaryMetric('Fitness', 3537, 215, 10910),
    _SummaryMetric('Permit', 3700, 52, 0),
    _SummaryMetric('Road Tax', 2900, 852, 0),
    _SummaryMetric('Insurance', 11147, 4061, 0),
    _SummaryMetric('PUC', 4542, 1851, 1815),
  ];

  static final _vehicleDistributionData = [
    _ChartData('Fitness', 215, Colors.lightGreen),
    _ChartData('Insurance', 4061, Colors.grey.shade800),
    _ChartData('Road Tax', 852, Colors.green),
    _ChartData('Permit', 52, Colors.blueAccent),
    _ChartData('PUC', 1851, Colors.purpleAccent),
    _ChartData('All Clear', 3740, Colors.green.shade300),
    _ChartData('Registration', 192, Colors.yellow.shade700),
    _ChartData('Missing Data', 10910, Colors.amberAccent),
  ];

  static final _revenueSeries = [
    _ChartData('Jan', 0, Colors.transparent),
    _ChartData('Feb', 0, Colors.transparent),
    _ChartData('Mar', 0, Colors.transparent),
    _ChartData('Apr', 20888, Colors.deepOrange),
    _ChartData('May', 4597, Colors.blueAccent),
    _ChartData('Jun', 0, Colors.transparent),
    _ChartData('Jul', 0, Colors.transparent),
    _ChartData('Aug', 0, Colors.transparent),
    _ChartData('Sep', 0, Colors.transparent),
    _ChartData('Oct', 0, Colors.transparent),
    _ChartData('Nov', 0, Colors.transparent),
    _ChartData('Dec', 0, Colors.transparent),
  ];

  bool get _isAtBottom {
    return _scrollController.hasClients &&
        _scrollController.offset >=
            _scrollController.position.maxScrollExtent -
                (_scrollController.position.viewportDimension / 4);
  }

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
    final state = ref.watch(dashboardNotifierProvider);
    final notifier = ref.watch(dashboardNotifierProvider.notifier);
    final screenWidth = MediaQuery.of(context).size.width;
    final filterColumnCount = screenWidth > 1100 ? 4 : 1;
    final summaryColumnCount = screenWidth > 1400
        ? 4
        : screenWidth > 1000
        ? 2
        : 1;
    final donutColumnCount = screenWidth > 1600
        ? 5
        : screenWidth > 1200
        ? 3
        : 1;

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _toggleScroll,
        icon: Icon(_isAtBottom ? Icons.arrow_upward : Icons.arrow_downward),
        label: Text(_isAtBottom ? 'Scroll Top' : 'Scroll Down'),
      ),
      body: LoadingOverlay(
        isLoading: state.isLoading,
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Dashboard',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                  ),
                  FilledButton.icon(
                    icon: const Icon(Icons.refresh),
                    label: const Text('Refresh'),
                    onPressed: notifier.fetchDashboard,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              GridView.count(
                crossAxisCount: filterColumnCount,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 4.5,
                children: [
                  _buildDropdownField(
                    hint: _districtHint,
                    value: _selectedDistrict,
                    options: _districtOptions,
                    onChanged: (value) =>
                        setState(() => _selectedDistrict = value),
                  ),
                  _buildFilterField(context, _zoneHint),
                  _buildFilterField(context, _cameraHint),
                  _buildDropdownField(
                    hint: _timeRangeHint,
                    value: _selectedTimeRange,
                    options: _timeRangeOptions,
                    onChanged: (value) =>
                        setState(() => _selectedTimeRange = value),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: FilledButton(
                  onPressed: notifier.fetchDashboard,
                  child: const Text('Submit'),
                ),
              ),
              const SizedBox(height: 24),
              GridView.count(
                crossAxisCount: summaryColumnCount,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 3.2,
                children: [
                  _buildKeyMetricCard(
                    context,
                    title: 'Total No.of Vehicles',
                    value: state.kpis?.totalVehiclesMonth.toString() ?? '0',
                    icon: Icons.directions_car,
                    backgroundColor: Colors.pink.shade400,
                  ),
                  _buildKeyMetricCard(
                    context,
                    title: 'e-Challan',
                    value: '0',
                    icon: Icons.receipt_long,
                    backgroundColor: Colors.deepPurple.shade400,
                  ),
                  _buildKeyMetricCard(
                    context,
                    title: 'Manual Challan',
                    value: '0',
                    icon: Icons.money_off,
                    backgroundColor: Colors.blue.shade400,
                  ),
                  _buildKeyMetricCard(
                    context,
                    title: 'Vehicles Seized',
                    value: '0',
                    icon: Icons.block,
                    backgroundColor: Colors.orange.shade400,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              GridView.count(
                crossAxisCount: donutColumnCount,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1.1,
                children: _summaryMetrics
                    .map((metric) => _buildComplianceCard(metric))
                    .toList(),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Registration',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 320,
                        child: SfCircularChart(
                          legend: Legend(
                            isVisible: true,
                            overflowMode: LegendItemOverflowMode.wrap,
                            position: LegendPosition.bottom,
                          ),
                          series: <DoughnutSeries<_ChartData, String>>[
                            DoughnutSeries<_ChartData, String>(
                              animationDuration: 0,
                              dataSource: [
                                _ChartData('Compliant', 15016, Colors.teal),
                                _ChartData('Non-Compliant', 192, Colors.pink),
                                _ChartData('Missing Data', 0, Colors.yellow),
                              ],
                              xValueMapper: (data, _) => data.label,
                              yValueMapper: (data, _) => data.value,
                              pointColorMapper: (data, _) => data.color,
                              dataLabelSettings: const DataLabelSettings(
                                isVisible: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 6,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Vehicle Distribution',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 360,
                              child: SfCircularChart(
                                legend: Legend(
                                  isVisible: true,
                                  overflowMode: LegendItemOverflowMode.wrap,
                                  position: LegendPosition.bottom,
                                ),
                                series: <DoughnutSeries<_ChartData, String>>[
                                  DoughnutSeries<_ChartData, String>(
                                    animationDuration: 0,
                                    dataSource: _vehicleDistributionData,
                                    xValueMapper: (data, _) => data.label,
                                    yValueMapper: (data, _) => data.value,
                                    pointColorMapper: (data, _) => data.color,
                                    dataLabelSettings: const DataLabelSettings(
                                      isVisible: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 4,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Total Revenue Generated',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 360,
                              child: SfCartesianChart(
                                enableAxisAnimation: false,
                                primaryXAxis: CategoryAxis(
                                  labelRotation: 45,
                                  majorGridLines: const MajorGridLines(
                                    width: 0,
                                  ),
                                ),
                                primaryYAxis: NumericAxis(
                                  labelFormat: '₹{value}',
                                ),
                                tooltipBehavior: TooltipBehavior(enable: true),
                                series: <ColumnSeries<_ChartData, String>>[
                                  ColumnSeries<_ChartData, String>(
                                    animationDuration: 0,
                                    dataSource: _revenueSeries,
                                    xValueMapper: (data, _) => data.label,
                                    yValueMapper: (data, _) => data.value,
                                    pointColorMapper: (data, _) => data.color,
                                    dataLabelSettings: const DataLabelSettings(
                                      isVisible: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildFilterField(BuildContext context, String hint) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        suffixIcon: const Icon(Icons.keyboard_arrow_down),
      ),
    );
  }

  static Widget _buildDropdownField({
    required String hint,
    required String? value,
    required List<String> options,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      hint: Text(hint),
      decoration: InputDecoration(
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
      onChanged: onChanged,
    );
  }

  static Widget _buildKeyMetricCard(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required Color backgroundColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(height: 16),
          Text(
            value,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _buildComplianceCard(_SummaryMetric metric) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              metric.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: SfCircularChart(
                legend: Legend(
                  isVisible: true,
                  overflowMode: LegendItemOverflowMode.wrap,
                  position: LegendPosition.bottom,
                ),
                series: <DoughnutSeries<_ChartData, String>>[
                  DoughnutSeries<_ChartData, String>(
                    animationDuration: 0,
                    dataSource: [
                      _ChartData('Compliant', metric.compliant, Colors.green),
                      _ChartData(
                        'Non-Compliant',
                        metric.nonCompliant,
                        Colors.pink,
                      ),
                      _ChartData('Missing Data', metric.missing, Colors.yellow),
                    ],
                    xValueMapper: (data, _) => data.label,
                    yValueMapper: (data, _) => data.value,
                    pointColorMapper: (data, _) => data.color,
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryMetric {
  const _SummaryMetric(
    this.title,
    this.compliant,
    this.nonCompliant,
    this.missing,
  );

  final String title;
  final int compliant;
  final int nonCompliant;
  final int missing;
}

class _ChartData {
  const _ChartData(this.label, this.value, this.color);

  final String label;
  final num value;
  final Color color;
}
