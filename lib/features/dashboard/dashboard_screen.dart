import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

import 'dart:async';
import '../../core/widgets/loading_overlay.dart';
import '../../core/widgets/responsive_scaffold.dart';
import 'dashboard_notifier.dart';
import 'dashboard_provider.dart';


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

  static const List<String> _timeRangeOptions = [
    'Select All Time Range',
    'Today',
    'This Week',
    'This Month',
    'This Year',
  ];

  String? _selectedDistrict = 'Select All District';
  String? _selectedZone = 'Select All Zone';
  String? _selectedCamera = 'Select All Camera';
  String? _selectedTimeRange = 'Today';

  static final _summaryMetrics = [
    _SummaryMetric('Fitness', 3537, 215, 10910),
    _SummaryMetric('Permit', 3700, 52, 0),
    _SummaryMetric('Road Tax', 2900, 852, 0),
    _SummaryMetric('Insurance', 11147, 4061, 0),
    _SummaryMetric('PUC', 4542, 1851, 1815),
  ];



  final ValueNotifier<bool> _isAtBottomNotifier = ValueNotifier<bool>(false);

  bool get _isAtBottom {
    return _scrollController.hasClients &&
        _scrollController.offset >=
            _scrollController.position.maxScrollExtent -
                (_scrollController.position.viewportDimension / 4);
  }

  Timer? _autoRefreshTimer;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScrollChanged);
    
    // Refresh on Dashboard Open
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshMissingCertificates();
    });

    // Auto Refresh every 5 minutes
    _autoRefreshTimer = Timer.periodic(const Duration(minutes: 2), (timer) {
      _refreshMissingCertificates();
    });
  }

  @override
  void dispose() {
    _autoRefreshTimer?.cancel();
    _scrollController.removeListener(_onScrollChanged);
    _scrollController.dispose();
    _isAtBottomNotifier.dispose();
    super.dispose();
  }

  void _refreshMissingCertificates() {
    if (!mounted) return;
    final state = ref.read(dashboardNotifierProvider);
    final cameraID = state.cameraLocationToId[_selectedCamera];
    final params = MissingCertificatesParams(
      district: _selectedDistrict,
      zone: _selectedZone,
      camera: cameraID,
      timeRange: _selectedTimeRange,
    );
    ref.invalidate(missingCertificatesProvider(params));
  }

  void _onScrollChanged() {
    if (!mounted) return;
    final currentlyAtBottom = _isAtBottom;
    if (_isAtBottomNotifier.value != currentlyAtBottom) {
      _isAtBottomNotifier.value = currentlyAtBottom;
    }
  }

  Future<void> _toggleScroll() async {
    if (!_scrollController.hasClients) return;

    final target = _isAtBottomNotifier.value
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
    
    ref.listen<DashboardState>(dashboardNotifierProvider, (previous, next) {
      if (next.error != null && next.error != previous?.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${next.error}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    });

    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 900;
    final isMobile = !isDesktop;
    
    final summaryColumnCount = isDesktop ? 4 : 1;
    final donutColumnCount = isDesktop ? 3 : 1;

    final cameraID = state.cameraLocationToId[_selectedCamera];
    final params = MissingCertificatesParams(
      district: _selectedDistrict,
      zone: _selectedZone,
      camera: cameraID,
      timeRange: _selectedTimeRange,
    );
    final missingCertificatesAsync = ref.watch(missingCertificatesProvider(params));

    return Scaffold(
      backgroundColor: const Color(0xFFF3F6F6),
      floatingActionButton: ValueListenableBuilder<bool>(
        valueListenable: _isAtBottomNotifier,
        builder: (context, isAtBottom, child) {
          return FloatingActionButton.extended(
            onPressed: _toggleScroll,
            backgroundColor: const Color(0xFF81D8B7),
            foregroundColor: const Color(0xFF0F5D55),
            icon: Icon(isAtBottom ? Icons.arrow_upward : Icons.arrow_downward),
            label: Text(isAtBottom ? 'Scroll Top' : 'Scroll Down'),
          );
        },
      ),
      body: LoadingOverlay(
        isLoading: state.isLoading,
        child: RefreshIndicator(
          onRefresh: () async {
            final camId = state.cameraLocationToId[_selectedCamera];
            final p = MissingCertificatesParams(
              district: _selectedDistrict,
              zone: _selectedZone,
              camera: camId,
            );
            ref.invalidate(missingCertificatesProvider(p));
            await ref.read(missingCertificatesProvider(p).future);
            await notifier.fetchDashboard(
              district: _selectedDistrict,
              zone: _selectedZone,
              camera: camId,
              timeRange: _selectedTimeRange,
            );
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // Top Horizontal Filter Bar
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isWide = constraints.maxWidth >= 950;
                    
                    final logo = InkWell(
                      onTap: () {
                        ref.read(sidebarCollapsedProvider.notifier).update((state) => !state);
                      },
                      child: Tooltip(
                        message: 'Toggle Sidebar',
                        child: Image.asset(
                          'assets/images/telangana_logo.png',
                          height: 35,
                          errorBuilder: (context, error, stackTrace) => const Icon(
                            Icons.account_balance,
                            color: Color(0xFF0F5D55),
                            size: 24,
                          ),
                        ),
                      ),
                    );

                    final districtDropdown = _buildDropdownField(
                      hint: _districtHint,
                      value: _selectedDistrict,
                      options: state.districts,
                      onChanged: (value) {
                        setState(() {
                          _selectedDistrict = value;
                          _selectedZone = 'Select All Zone';
                          _selectedCamera = 'Select All Camera';
                        });
                        if (value != null && value != 'Select All District') {
                          ref.read(dashboardNotifierProvider.notifier).fetchZonesForDistrict(value);
                        } else {
                          ref.read(dashboardNotifierProvider.notifier).resetZones();
                        }
                        ref.read(dashboardNotifierProvider.notifier).resetCameras();
                      },
                    );

                    final zoneDropdown = _buildDropdownField(
                      hint: _zoneHint,
                      value: _selectedZone,
                      options: state.zones,
                      onChanged: (value) {
                        setState(() {
                          _selectedZone = value;
                          _selectedCamera = 'Select All Camera';
                        });
                        if (value != null && value != 'Select All Zone') {
                          ref.read(dashboardNotifierProvider.notifier).fetchCamerasForZone(value);
                        } else {
                          ref.read(dashboardNotifierProvider.notifier).resetCameras();
                        }
                      },
                    );

                    final cameraDropdown = _buildDropdownField(
                      hint: _cameraHint,
                      value: _selectedCamera,
                      options: state.cameras,
                      onChanged: (value) => setState(() => _selectedCamera = value),
                    );

                    final timeRangeDropdown = _buildDropdownField(
                      hint: _timeRangeHint,
                      value: _selectedTimeRange,
                      options: _timeRangeOptions,
                      onChanged: (value) => setState(() => _selectedTimeRange = value),
                    );

                    final submitButton = OutlinedButton(
                      onPressed: () {
                        final cameraID = state.cameraLocationToId[_selectedCamera];
                        notifier.fetchDashboard(
                          district: _selectedDistrict,
                          zone: _selectedZone,
                          camera: cameraID,
                          timeRange: _selectedTimeRange,
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF0F5D55), width: 1.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          color: Color(0xFF0F5D55),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );

                    if (isWide) {
                      return Row(
                        children: [
                          logo,
                          const SizedBox(width: 16),
                          Expanded(child: districtDropdown),
                          const SizedBox(width: 12),
                          Expanded(child: zoneDropdown),
                          const SizedBox(width: 12),
                          Expanded(child: cameraDropdown),
                          const SizedBox(width: 12),
                          Expanded(child: timeRangeDropdown),
                          const SizedBox(width: 16),
                          submitButton,
                        ],
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              logo,
                              const SizedBox(width: 12),
                              const Text(
                                'VIEAS Telangana',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0F5D55),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          districtDropdown,
                          const SizedBox(height: 8),
                          zoneDropdown,
                          const SizedBox(height: 8),
                          cameraDropdown,
                          const SizedBox(height: 8),
                          timeRangeDropdown,
                          const SizedBox(height: 12),
                          submitButton,
                        ],
                      );
                    }
                  },
                ),
              ),
              
              Padding(
                padding: EdgeInsets.fromLTRB(
                  20,
                  24,
                  20,
                  20 + MediaQuery.of(context).padding.bottom + 96,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Grid of 4 Key Metrics Cards
                    GridView.count(
                      crossAxisCount: summaryColumnCount,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: isMobile ? 2.5 : 3.4,
                      children: [
                        _buildKeyMetricCard(
                          context,
                          title: 'Total No.of Vehicles',
                          value: missingCertificatesAsync.maybeWhen(
                            data: (data) => NumberFormat.decimalPattern().format(data.vehicleCount),
                            orElse: () => _getTotalVehicles(state.offenceData) > 0
                                ? _getTotalVehicles(state.offenceData).toString()
                                : (state.kpis?.totalVehiclesMonth.toString() ?? '66306'),
                          ),
                          icon: Icons.directions_car,
                          backgroundColor: const Color(0xFFE54A88),
                        ),
                        _buildKeyMetricCard(
                          context,
                          title: 'e-Challan',
                          value: state.eChallan,
                          icon: Icons.receipt_long,
                          backgroundColor: const Color(0xFF907BE5),
                        ),
                        _buildKeyMetricCard(
                          context,
                          title: 'Manual Challan',
                          value: state.manualChallan,
                          icon: Icons.payments,
                          backgroundColor: const Color(0xFF33C0E5),
                        ),
                        _buildKeyMetricCard(
                          context,
                          title: 'Vehicles Seized',
                          value: state.seizedVehicles,
                          icon: Icons.block,
                          backgroundColor: const Color(0xFFFFA63E),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    if (state.offenceTypes.isNotEmpty)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7FAFA),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFFDCECEC)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Live Offence Types',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0F5D55),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: state.offenceTypes
                                  .map(
                                    (offence) => Chip(
                                      label: Text(offence),
                                      backgroundColor: const Color(0xFFE8F4F3),
                                      side: BorderSide.none,
                                      labelStyle: const TextStyle(
                                        color: Color(0xFF0F5D55),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(height: 24),

                    // Row/Grid of 5 Circular Charts
                    GridView.count(
                      crossAxisCount: donutColumnCount,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: isDesktop ? 1.25 : 1.05,
                      children: _getSummaryMetrics(state.offenceData)
                          .map((metric) => _buildComplianceCard(metric))
                          .toList(),
                    ),
                    const SizedBox(height: 24),
                    
                    // Full-width Registration Card
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 1.5,
                      shadowColor: Colors.black12,
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
                              height: 220,
                              child: SfCircularChart(
                                legend: Legend(
                                  isVisible: true,
                                  overflowMode: LegendItemOverflowMode.wrap,
                                  position: LegendPosition.bottom,
                                  textStyle: const TextStyle(fontSize: 10),
                                ),
                                series: <DoughnutSeries<_ChartData, String>>[
                                  DoughnutSeries<_ChartData, String>(
                                    animationDuration: 0,
                                    dataSource: _getRegistrationData(state.offenceData),
                                    xValueMapper: (data, _) => data.label,
                                    yValueMapper: (data, _) => data.value,
                                    pointColorMapper: (data, _) => data.color,
                                    innerRadius: '65%',
                                    dataLabelSettings: const DataLabelSettings(
                                      isVisible: true,
                                      labelPosition: ChartDataLabelPosition.outside,
                                      textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Bottom Section (Vehicle Distribution and Revenue Generated)
                    if (isMobile) ...[
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 1.5,
                        shadowColor: Colors.black12,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Vehicle Distribution',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  _buildChartMenu(context, 'Vehicle Distribution'),
                                ],
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                height: 300,
                                child: missingCertificatesAsync.when(
                                  data: (data) {
                                    final chartData = [
                                      _ChartData('Fitness', data.fitnessCertificateNotFound, const Color(0xFF5CA0F2)),
                                      _ChartData('Insurance', data.insuranceCertificateNotFound, const Color(0xFF32353A)),
                                      _ChartData('Road Tax', data.roadTaxCertificateNotFound, const Color(0xFF90C25B)),
                                      _ChartData('Permit', data.permitCertificateNotFound, const Color(0xFFE28B5C)),
                                      _ChartData('Puc', data.pucCertificateNotFound, const Color(0xFF7A7BF2)),
                                      _ChartData('Registration', data.registrationCertificateNotFound, const Color(0xFFD64D81)),
                                      _ChartData('All Clear', data.allClearNotFound, const Color(0xFF2FA85C)),
                                      _ChartData('Missing Data', data.weightCertificateNotFound, const Color(0xFFE8D05C)),
                                    ];
                                    return SfCircularChart(
                                      legend: Legend(
                                        isVisible: true,
                                        overflowMode: LegendItemOverflowMode.wrap,
                                        position: LegendPosition.bottom,
                                        textStyle: const TextStyle(fontSize: 10),
                                      ),
                                      series: <DoughnutSeries<_ChartData, String>>[
                                        DoughnutSeries<_ChartData, String>(
                                          animationDuration: 0,
                                          dataSource: chartData,
                                          xValueMapper: (data, _) => data.label,
                                          yValueMapper: (data, _) => data.value,
                                          pointColorMapper: (data, _) => data.color,
                                          innerRadius: '60%',
                                          dataLabelSettings: const DataLabelSettings(
                                            isVisible: true,
                                            labelPosition: ChartDataLabelPosition.outside,
                                            textStyle: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                                          ),
                                          dataLabelMapper: (data, _) => '${data.label}: ${data.value.toInt()}',
                                        ),
                                      ],
                                    );
                                  },
                                  loading: () => const Center(
                                    child: CircularProgressIndicator(color: Color(0xFF0F5D55)),
                                  ),
                                  error: (err, stack) => Center(
                                    child: Text(
                                      'Error loading chart: $err',
                                      style: const TextStyle(color: Colors.red, fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 1.5,
                        shadowColor: Colors.black12,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Total Revenue Generated',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  _buildChartMenu(context, 'Total Revenue Generated'),
                                ],
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                height: 320,
                                child: SfCartesianChart(
                                  enableAxisAnimation: false,
                                  primaryXAxis: CategoryAxis(
                                    labelRotation: 45,
                                    majorGridLines: const MajorGridLines(width: 0),
                                  ),
                                  primaryYAxis: NumericAxis(
                                    title: AxisTitle(
                                      text: 'Revenue (₹)',
                                      textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                    ),
                                    numberFormat: NumberFormat.compact(),
                                    axisLine: const AxisLine(width: 0),
                                  ),
                                  tooltipBehavior: TooltipBehavior(enable: true),
                                   series: <ColumnSeries<_ChartData, String>>[
                                     ColumnSeries<_ChartData, String>(
                                       animationDuration: 0,
                                       dataSource: _getRevenueData(state.monthlyRevenue),
                                       xValueMapper: (data, _) => data.label,
                                      yValueMapper: (data, _) => data.value,
                                      pointColorMapper: (data, _) => data.color,
                                      dataLabelMapper: (data, _) => data.value > 0
                                          ? '₹${data.value.toStringAsFixed(2)}'
                                          : '₹0.00',
                                      dataLabelSettings: const DataLabelSettings(
                                        isVisible: true,
                                        showZeroValue: true,
                                        labelPosition: ChartDataLabelPosition.outside,
                                        textStyle: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ] else ...[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 1.5,
                              shadowColor: Colors.black12,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Vehicle Distribution',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        _buildChartMenu(context, 'Vehicle Distribution'),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    SizedBox(
                                      height: 360,
                                      child: missingCertificatesAsync.when(
                                        data: (data) {
                                          final chartData = [
                                            _ChartData('Fitness', data.fitnessCertificateNotFound, const Color(0xFF5CA0F2)),
                                            _ChartData('Insurance', data.insuranceCertificateNotFound, const Color(0xFF32353A)),
                                            _ChartData('Road Tax', data.roadTaxCertificateNotFound, const Color(0xFF90C25B)),
                                            _ChartData('Permit', data.permitCertificateNotFound, const Color(0xFFE28B5C)),
                                            _ChartData('Puc', data.pucCertificateNotFound, const Color(0xFF7A7BF2)),
                                            _ChartData('Registration', data.registrationCertificateNotFound, const Color(0xFFD64D81)),
                                            _ChartData('All Clear', data.allClearNotFound, const Color(0xFF2FA85C)),
                                            _ChartData('Missing Data', data.weightCertificateNotFound, const Color(0xFFE8D05C)),
                                          ];
                                          return SfCircularChart(
                                            legend: Legend(
                                              isVisible: true,
                                              overflowMode: LegendItemOverflowMode.wrap,
                                              position: LegendPosition.bottom,
                                              textStyle: const TextStyle(fontSize: 10),
                                            ),
                                            series: <DoughnutSeries<_ChartData, String>>[
                                              DoughnutSeries<_ChartData, String>(
                                                animationDuration: 0,
                                                dataSource: chartData,
                                                xValueMapper: (data, _) => data.label,
                                                yValueMapper: (data, _) => data.value,
                                                pointColorMapper: (data, _) => data.color,
                                                innerRadius: '60%',
                                                dataLabelSettings: const DataLabelSettings(
                                                  isVisible: true,
                                                  labelPosition: ChartDataLabelPosition.outside,
                                                  textStyle: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                                                ),
                                                dataLabelMapper: (data, _) => '${data.label}: ${data.value.toInt()}',
                                              ),
                                            ],
                                          );
                                        },
                                        loading: () => const Center(
                                          child: CircularProgressIndicator(color: Color(0xFF0F5D55)),
                                        ),
                                        error: (err, stack) => Center(
                                          child: Text(
                                            'Error loading chart: $err',
                                            style: const TextStyle(color: Colors.red, fontSize: 12),
                                          ),
                                        ),
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
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 1.5,
                              shadowColor: Colors.black12,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Total Revenue Generated',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        _buildChartMenu(context, 'Total Revenue Generated'),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    SizedBox(
                                      height: 360,
                                      child: SfCartesianChart(
                                        enableAxisAnimation: false,
                                        primaryXAxis: CategoryAxis(
                                          labelRotation: 45,
                                          majorGridLines: const MajorGridLines(width: 0),
                                        ),
                                        primaryYAxis: NumericAxis(
                                          title: AxisTitle(
                                            text: 'Revenue (₹)',
                                            textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                          ),
                                          numberFormat: NumberFormat.compact(),
                                          axisLine: const AxisLine(width: 0),
                                        ),
                                        tooltipBehavior: TooltipBehavior(enable: true),
                                         series: <ColumnSeries<_ChartData, String>>[
                                           ColumnSeries<_ChartData, String>(
                                             animationDuration: 0,
                                             dataSource: _getRevenueData(state.monthlyRevenue),
                                             xValueMapper: (data, _) => data.label,
                                            yValueMapper: (data, _) => data.value,
                                            pointColorMapper: (data, _) => data.color,
                                            dataLabelMapper: (data, _) => data.value > 0
                                                ? '₹${data.value.toStringAsFixed(2)}'
                                                : '₹0.00',
                                            dataLabelSettings: const DataLabelSettings(
                                              isVisible: true,
                                              showZeroValue: true,
                                              labelPosition: ChartDataLabelPosition.outside,
                                              textStyle: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
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
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

  static Widget _buildDropdownField({
    required String hint,
    required String? value,
    required List<String> options,
    required ValueChanged<String?> onChanged,
  }) {
    final String? safeValue = (value != null && options.contains(value))
        ? value
        : (options.isNotEmpty ? options.first : null);

    final keyString = '${hint}_${options.length}_$safeValue';
    return DropdownButtonFormField<String>(
      key: ValueKey(keyString),
      isExpanded: true,
      isDense: true,
      initialValue: safeValue,
      hint: Text(hint),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        filled: true,
        fillColor: const Color(0xFFF3F6F6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      items: options
          .map(
            (option) =>
                DropdownMenuItem<String>(value: option, child: Text(option, style: const TextStyle(fontSize: 13))),
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
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              icon,
              color: Colors.black87,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.0,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



  int _getTotalVehicles(Map<String, dynamic>? offenceData) {
    if (offenceData == null || offenceData.isEmpty) {
      return 0;
    }
    if (offenceData.containsKey('totalVehicles')) {
      return (offenceData['totalVehicles'] as num? ?? 0).toInt();
    }
    final reg = offenceData['REGISTRATION_CERTIFICATE'] as Map<String, dynamic>?;
    final found = (reg?['certificateFound'] as num? ?? 0).toInt();
    final expired = (reg?['certificateExpired'] as num? ?? 0).toInt();
    return found + expired;
  }

  List<_SummaryMetric> _getSummaryMetrics(Map<String, dynamic>? offenceData) {
    if (offenceData == null || offenceData.isEmpty) {
      return _summaryMetrics;
    }
    
    _SummaryMetric parseCertificate(String title, Map<String, dynamic>? cert) {
      final found = (cert?['certificateFound'] as num? ?? 0).toInt();
      final expired = (cert?['certificateExpired'] as num? ?? 0).toInt();
      final notFound = (cert?['certificateNotFound'] as num? ?? 0).toInt();
      return _SummaryMetric(title, found, expired, notFound);
    }

    return [
      parseCertificate('Fitness', offenceData['FITNESS_CERTIFICATE'] as Map<String, dynamic>?),
      parseCertificate('Permit', offenceData['PERMITTED_CERTIFICATE'] as Map<String, dynamic>?),
      parseCertificate('Road Tax', offenceData['ROAD_TAX_CERTIFICATE'] as Map<String, dynamic>?),
      parseCertificate('Insurance', offenceData['INSURANCE_CERTIFICATE'] as Map<String, dynamic>?),
      parseCertificate('PUC', offenceData['PUC_CERTIFICATE'] as Map<String, dynamic>?),
    ];
  }



  List<_ChartData> _getRegistrationData(Map<String, dynamic>? offenceData) {
    if (offenceData == null || offenceData.isEmpty) {
      return [
        _ChartData('Compliant', 15016, const Color(0xFF81D8B7)),
        _ChartData('Non-Compliant', 192, const Color(0xFFE289A3)),
        _ChartData('Registration Missing Data', 0, const Color(0xFFE5D57A)),
      ];
    }
    final reg = offenceData['REGISTRATION_CERTIFICATE'] as Map<String, dynamic>?;
    final found = (reg?['certificateFound'] as num? ?? 0).toInt();
    final expired = (reg?['certificateExpired'] as num? ?? 0).toInt();
    final notFound = (reg?['certificateNotFound'] as num? ?? 0).toInt();
    return [
      _ChartData('Compliant', found, const Color(0xFF81D8B7)),
      _ChartData('Non-Compliant', expired, const Color(0xFFE289A3)),
      _ChartData('Registration Missing Data', notFound, const Color(0xFFE5D57A)),
    ];
  }

  List<_ChartData> _getRevenueData(Map<String, double> monthlyRevenue) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    final colors = [
      const Color(0xFF7A7BF2),
      const Color(0xFF7A7BF2),
      const Color(0xFF7A7BF2),
      const Color(0xFF7A7BF2),
      const Color(0xFF7A7BF2),
      const Color(0xFFED5C7D),
      const Color(0xFF7A7BF2),
      const Color(0xFF7A7BF2),
      const Color(0xFF7A7BF2),
      const Color(0xFF7A7BF2),
      const Color(0xFF7A7BF2),
      const Color(0xFF7A7BF2),
    ];
    return List.generate(12, (index) {
      final m = months[index];
      final monthKey = (index + 1).toString();
      final val = monthlyRevenue[monthKey] ?? 0.0;
      return _ChartData(m, val, colors[index]);
    });
  }

  Widget _buildComplianceCard(_SummaryMetric metric) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 1.5,
      shadowColor: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              metric.title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 220,
              child: SfCircularChart(
                legend: Legend(
                  isVisible: true,
                  overflowMode: LegendItemOverflowMode.wrap,
                  position: LegendPosition.bottom,
                  textStyle: const TextStyle(fontSize: 10),
                  itemPadding: 4,
                ),
                series: <DoughnutSeries<_ChartData, String>>[
                  DoughnutSeries<_ChartData, String>(
                    animationDuration: 0,
                    dataSource: [
                      _ChartData('Compliant', metric.compliant, const Color(0xFF81D8B7)),
                      _ChartData('Non-Compliant', metric.nonCompliant, const Color(0xFFE289A3)),
                      _ChartData('${metric.title} Missing Data', metric.missing, const Color(0xFFE5D57A)),
                    ],
                    xValueMapper: (data, _) => data.label,
                    yValueMapper: (data, _) => data.value,
                    pointColorMapper: (data, _) => data.color,
                    innerRadius: '65%',
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      labelPosition: ChartDataLabelPosition.outside,
                      connectorLineSettings: ConnectorLineSettings(
                        type: ConnectorType.curve,
                        length: '10%',
                      ),
                      textStyle: TextStyle(
                        fontSize: 9, 
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChartMenu(BuildContext context, String chartTitle) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.menu, color: Color(0xFF666666), size: 20),
      tooltip: 'Chart context menu',
      onSelected: (value) {
        _exportChart(context, chartTitle, value);
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'fullscreen',
          child: Text('View in full screen', style: TextStyle(fontSize: 12)),
        ),
        const PopupMenuItem(
          value: 'png',
          child: Text('Download PNG image', style: TextStyle(fontSize: 12)),
        ),
        const PopupMenuItem(
          value: 'jpeg',
          child: Text('Download JPEG image', style: TextStyle(fontSize: 12)),
        ),
        const PopupMenuItem(
          value: 'pdf',
          child: Text('Download PDF document', style: TextStyle(fontSize: 12)),
        ),
        const PopupMenuItem(
          value: 'svg',
          child: Text('Download SVG vector image', style: TextStyle(fontSize: 12)),
        ),
      ],
    );
  }

  void _exportChart(BuildContext context, String title, String format) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Downloading $title as ${format.toUpperCase()}...'),
        duration: const Duration(seconds: 1),
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
