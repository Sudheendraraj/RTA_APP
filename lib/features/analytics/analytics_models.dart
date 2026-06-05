import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_models.freezed.dart';
part 'analytics_models.g.dart';

@freezed
class TrafficSeries with _$TrafficSeries {
  const factory TrafficSeries({required String label, required int vehicles}) =
      _TrafficSeries;

  factory TrafficSeries.fromJson(Map<String, dynamic> json) =>
      _$TrafficSeriesFromJson(json);
}
