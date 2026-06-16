import 'package:freezed_annotation/freezed_annotation.dart';

part 'metric_value.freezed.dart';
part 'metric_value.g.dart';

@freezed
class MetricValue with _$MetricValue {
  const factory MetricValue({
    required String id,
    required num value,
    num? previousValue,
    num? changePercentage,
  }) = _MetricValue;

  factory MetricValue.fromJson(Map<String, dynamic> json) =>
      _$MetricValueFromJson(json);
}
