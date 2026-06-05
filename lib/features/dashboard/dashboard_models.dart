import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_models.freezed.dart';
part 'dashboard_models.g.dart';

@freezed
class KpiSummary with _$KpiSummary {
  const factory KpiSummary({
    required int totalVehiclesToday,
    required int totalVehiclesWeek,
    required int totalVehiclesMonth,
    required int blacklistedVehicles,
    required int violationsDetected,
    required int activeCameras,
    required int offlineCameras,
    required int totalCheckposts,
  }) = _KpiSummary;

  factory KpiSummary.fromJson(Map<String, dynamic> json) =>
      _$KpiSummaryFromJson(json);
}

@freezed
class AnalyticsSeries with _$AnalyticsSeries {
  const factory AnalyticsSeries({required String label, required int value}) =
      _AnalyticsSeries;

  factory AnalyticsSeries.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsSeriesFromJson(json);
}
