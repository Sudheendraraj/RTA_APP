import 'package:freezed_annotation/freezed_annotation.dart';

part 'anpr_models.freezed.dart';
part 'anpr_models.g.dart';

@freezed
class AnprRecord with _$AnprRecord {
  const factory AnprRecord({
    required String plate,
    required String camera,
    required String checkpost,
    required String vehicleType,
    required String detectedAt,
    required double confidence,
    required String direction,
    required String vehicleImage,
    required String plateImage,
  }) = _AnprRecord;

  factory AnprRecord.fromJson(Map<String, dynamic> json) =>
      _$AnprRecordFromJson(json);
}
