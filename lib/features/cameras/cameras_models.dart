import 'package:freezed_annotation/freezed_annotation.dart';

part 'cameras_models.freezed.dart';
part 'cameras_models.g.dart';

@freezed
class CameraStatus with _$CameraStatus {
  const factory CameraStatus({
    required String name,
    required String checkpost,
    required String status,
    required int health,
    required String lastActive,
  }) = _CameraStatus;

  factory CameraStatus.fromJson(Map<String, dynamic> json) =>
      _$CameraStatusFromJson(json);
}
