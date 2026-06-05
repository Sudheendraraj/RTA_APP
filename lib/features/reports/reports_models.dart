import 'package:freezed_annotation/freezed_annotation.dart';

part 'reports_models.freezed.dart';
part 'reports_models.g.dart';

@freezed
class ReportItem with _$ReportItem {
  const factory ReportItem({
    required String name,
    required String type,
    required int count,
  }) = _ReportItem;

  factory ReportItem.fromJson(Map<String, dynamic> json) =>
      _$ReportItemFromJson(json);
}
