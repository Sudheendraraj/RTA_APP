import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_data.freezed.dart';
part 'chart_data.g.dart';

@freezed
class DynamicChartData with _$DynamicChartData {
  const factory DynamicChartData({
    required String label,
    required num value,
    required String color,
  }) = _DynamicChartData;

  factory DynamicChartData.fromJson(Map<String, dynamic> json) =>
      _$DynamicChartDataFromJson(json);
}

@freezed
class ChartResponse with _$ChartResponse {
  const factory ChartResponse({
    required String title,
    required List<DynamicChartData> data,
    String? description,
  }) = _ChartResponse;

  factory ChartResponse.fromJson(Map<String, dynamic> json) =>
      _$ChartResponseFromJson(json);
}
