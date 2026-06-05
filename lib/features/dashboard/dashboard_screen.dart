import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../core/widgets/kpi_card.dart';
import '../../core/widgets/loading_overlay.dart';
import 'dashboard_notifier.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardNotifierProvider);
    final notifier = ref.watch(dashboardNotifierProvider.notifier);

    return Scaffold(
      body: LoadingOverlay(
        isLoading: state.isLoading,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Dashboard',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                  ),
                  FilledButton.icon(
                    icon: const Icon(Icons.refresh),
                    label: const Text('Refresh'),
                    onPressed: notifier.fetchDashboard,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (state.error != null)
                Text(
                  state.error!,
                  style: const TextStyle(color: Colors.redAccent),
                ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (state.kpis != null)
                        GridView.count(
                          crossAxisCount:
                              MediaQuery.of(context).size.width > 1000 ? 4 : 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          childAspectRatio: 3.2,
                          children: [
                            KpiCard(
                              label: 'Total Vehicles Today',
                              value: state.kpis!.totalVehiclesToday.toString(),
                            ),
                            KpiCard(
                              label: 'Total Vehicles This Week',
                              value: state.kpis!.totalVehiclesWeek.toString(),
                            ),
                            KpiCard(
                              label: 'Total Vehicles This Month',
                              value: state.kpis!.totalVehiclesMonth.toString(),
                            ),
                            KpiCard(
                              label: 'Blacklisted Vehicles',
                              value: state.kpis!.blacklistedVehicles.toString(),
                              accent: true,
                            ),
                            KpiCard(
                              label: 'Violations Detected',
                              value: state.kpis!.violationsDetected.toString(),
                            ),
                            KpiCard(
                              label: 'Active Cameras',
                              value: state.kpis!.activeCameras.toString(),
                            ),
                            KpiCard(
                              label: 'Offline Cameras',
                              value: state.kpis!.offlineCameras.toString(),
                            ),
                            KpiCard(
                              label: 'Total Checkposts',
                              value: state.kpis!.totalCheckposts.toString(),
                            ),
                          ],
                        )
                      else
                        const Center(child: Text('Loading KPIs...')),
                      const SizedBox(height: 24),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Hourly Traffic Analysis',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 12),
                              SizedBox(
                                height: 320,
                                child: SfCartesianChart(
                                  enableAxisAnimation: false,
                                  primaryXAxis: CategoryAxis(),
                                  tooltipBehavior: TooltipBehavior(
                                    enable: true,
                                  ),
                                  series: <LineSeries<dynamic, String>>[
                                    LineSeries<dynamic, String>(
                                      animationDuration: 0,
                                      dataSource: state.analyticsSeries,
                                      xValueMapper: (item, _) => item.label,
                                      yValueMapper: (item, _) => item.value,
                                      markerSettings: const MarkerSettings(
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
