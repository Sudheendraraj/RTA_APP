import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_options.freezed.dart';
part 'filter_options.g.dart';

@freezed
class FilterOptions with _$FilterOptions {
  const factory FilterOptions({
    required List<FilterOption> districts,
    required List<FilterOption> zones,
    required List<FilterOption> cameras,
    required List<FilterOption> timeRanges,
  }) = _FilterOptions;

  factory FilterOptions.fromJson(Map<String, dynamic> json) =>
      _$FilterOptionsFromJson(json);
}

@freezed
class FilterOption with _$FilterOption {
  const factory FilterOption({
    required String id,
    required String label,
    String? description,
  }) = _FilterOption;

  factory FilterOption.fromJson(Map<String, dynamic> json) =>
      _$FilterOptionFromJson(json);
}
