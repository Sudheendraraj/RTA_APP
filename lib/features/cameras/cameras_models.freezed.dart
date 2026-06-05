// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cameras_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CameraStatus _$CameraStatusFromJson(Map<String, dynamic> json) {
  return _CameraStatus.fromJson(json);
}

/// @nodoc
mixin _$CameraStatus {
  String get name => throw _privateConstructorUsedError;
  String get checkpost => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get health => throw _privateConstructorUsedError;
  String get lastActive => throw _privateConstructorUsedError;

  /// Serializes this CameraStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CameraStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CameraStatusCopyWith<CameraStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraStatusCopyWith<$Res> {
  factory $CameraStatusCopyWith(
    CameraStatus value,
    $Res Function(CameraStatus) then,
  ) = _$CameraStatusCopyWithImpl<$Res, CameraStatus>;
  @useResult
  $Res call({
    String name,
    String checkpost,
    String status,
    int health,
    String lastActive,
  });
}

/// @nodoc
class _$CameraStatusCopyWithImpl<$Res, $Val extends CameraStatus>
    implements $CameraStatusCopyWith<$Res> {
  _$CameraStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CameraStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? checkpost = null,
    Object? status = null,
    Object? health = null,
    Object? lastActive = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            checkpost: null == checkpost
                ? _value.checkpost
                : checkpost // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            health: null == health
                ? _value.health
                : health // ignore: cast_nullable_to_non_nullable
                      as int,
            lastActive: null == lastActive
                ? _value.lastActive
                : lastActive // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CameraStatusImplCopyWith<$Res>
    implements $CameraStatusCopyWith<$Res> {
  factory _$$CameraStatusImplCopyWith(
    _$CameraStatusImpl value,
    $Res Function(_$CameraStatusImpl) then,
  ) = __$$CameraStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String checkpost,
    String status,
    int health,
    String lastActive,
  });
}

/// @nodoc
class __$$CameraStatusImplCopyWithImpl<$Res>
    extends _$CameraStatusCopyWithImpl<$Res, _$CameraStatusImpl>
    implements _$$CameraStatusImplCopyWith<$Res> {
  __$$CameraStatusImplCopyWithImpl(
    _$CameraStatusImpl _value,
    $Res Function(_$CameraStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CameraStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? checkpost = null,
    Object? status = null,
    Object? health = null,
    Object? lastActive = null,
  }) {
    return _then(
      _$CameraStatusImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        checkpost: null == checkpost
            ? _value.checkpost
            : checkpost // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        health: null == health
            ? _value.health
            : health // ignore: cast_nullable_to_non_nullable
                  as int,
        lastActive: null == lastActive
            ? _value.lastActive
            : lastActive // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CameraStatusImpl implements _CameraStatus {
  const _$CameraStatusImpl({
    required this.name,
    required this.checkpost,
    required this.status,
    required this.health,
    required this.lastActive,
  });

  factory _$CameraStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$CameraStatusImplFromJson(json);

  @override
  final String name;
  @override
  final String checkpost;
  @override
  final String status;
  @override
  final int health;
  @override
  final String lastActive;

  @override
  String toString() {
    return 'CameraStatus(name: $name, checkpost: $checkpost, status: $status, health: $health, lastActive: $lastActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraStatusImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.checkpost, checkpost) ||
                other.checkpost == checkpost) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.health, health) || other.health == health) &&
            (identical(other.lastActive, lastActive) ||
                other.lastActive == lastActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, checkpost, status, health, lastActive);

  /// Create a copy of CameraStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraStatusImplCopyWith<_$CameraStatusImpl> get copyWith =>
      __$$CameraStatusImplCopyWithImpl<_$CameraStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CameraStatusImplToJson(this);
  }
}

abstract class _CameraStatus implements CameraStatus {
  const factory _CameraStatus({
    required final String name,
    required final String checkpost,
    required final String status,
    required final int health,
    required final String lastActive,
  }) = _$CameraStatusImpl;

  factory _CameraStatus.fromJson(Map<String, dynamic> json) =
      _$CameraStatusImpl.fromJson;

  @override
  String get name;
  @override
  String get checkpost;
  @override
  String get status;
  @override
  int get health;
  @override
  String get lastActive;

  /// Create a copy of CameraStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CameraStatusImplCopyWith<_$CameraStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
