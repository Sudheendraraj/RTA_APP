import 'package:freezed_annotation/freezed_annotation.dart';

part 'alerts_models.freezed.dart';
part 'alerts_models.g.dart';

@freezed
class AlertItem with _$AlertItem {
  const factory AlertItem({
    required String type,
    required String plate,
    required String detectedAt,
    required String status,
  }) = _AlertItem;

  factory AlertItem.fromJson(Map<String, dynamic> json) =>
      _$AlertItemFromJson(json);
}
