import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_classification_models.freezed.dart';
part 'vehicle_classification_models.g.dart';

@freezed
class VehicleCategory with _$VehicleCategory {
  const factory VehicleCategory({
    required String category,
    required int count,
    required double trend,
  }) = _VehicleCategory;

  factory VehicleCategory.fromJson(Map<String, dynamic> json) =>
      _$VehicleCategoryFromJson(json);
}
