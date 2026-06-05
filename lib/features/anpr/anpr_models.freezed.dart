// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anpr_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AnprRecord _$AnprRecordFromJson(Map<String, dynamic> json) {
  return _AnprRecord.fromJson(json);
}

/// @nodoc
mixin _$AnprRecord {
  String get plate => throw _privateConstructorUsedError;
  String get camera => throw _privateConstructorUsedError;
  String get checkpost => throw _privateConstructorUsedError;
  String get vehicleType => throw _privateConstructorUsedError;
  String get detectedAt => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  String get direction => throw _privateConstructorUsedError;
  String get vehicleImage => throw _privateConstructorUsedError;
  String get plateImage => throw _privateConstructorUsedError;

  /// Serializes this AnprRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnprRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnprRecordCopyWith<AnprRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnprRecordCopyWith<$Res> {
  factory $AnprRecordCopyWith(
    AnprRecord value,
    $Res Function(AnprRecord) then,
  ) = _$AnprRecordCopyWithImpl<$Res, AnprRecord>;
  @useResult
  $Res call({
    String plate,
    String camera,
    String checkpost,
    String vehicleType,
    String detectedAt,
    double confidence,
    String direction,
    String vehicleImage,
    String plateImage,
  });
}

/// @nodoc
class _$AnprRecordCopyWithImpl<$Res, $Val extends AnprRecord>
    implements $AnprRecordCopyWith<$Res> {
  _$AnprRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnprRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plate = null,
    Object? camera = null,
    Object? checkpost = null,
    Object? vehicleType = null,
    Object? detectedAt = null,
    Object? confidence = null,
    Object? direction = null,
    Object? vehicleImage = null,
    Object? plateImage = null,
  }) {
    return _then(
      _value.copyWith(
            plate: null == plate
                ? _value.plate
                : plate // ignore: cast_nullable_to_non_nullable
                      as String,
            camera: null == camera
                ? _value.camera
                : camera // ignore: cast_nullable_to_non_nullable
                      as String,
            checkpost: null == checkpost
                ? _value.checkpost
                : checkpost // ignore: cast_nullable_to_non_nullable
                      as String,
            vehicleType: null == vehicleType
                ? _value.vehicleType
                : vehicleType // ignore: cast_nullable_to_non_nullable
                      as String,
            detectedAt: null == detectedAt
                ? _value.detectedAt
                : detectedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as double,
            direction: null == direction
                ? _value.direction
                : direction // ignore: cast_nullable_to_non_nullable
                      as String,
            vehicleImage: null == vehicleImage
                ? _value.vehicleImage
                : vehicleImage // ignore: cast_nullable_to_non_nullable
                      as String,
            plateImage: null == plateImage
                ? _value.plateImage
                : plateImage // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnprRecordImplCopyWith<$Res>
    implements $AnprRecordCopyWith<$Res> {
  factory _$$AnprRecordImplCopyWith(
    _$AnprRecordImpl value,
    $Res Function(_$AnprRecordImpl) then,
  ) = __$$AnprRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String plate,
    String camera,
    String checkpost,
    String vehicleType,
    String detectedAt,
    double confidence,
    String direction,
    String vehicleImage,
    String plateImage,
  });
}

/// @nodoc
class __$$AnprRecordImplCopyWithImpl<$Res>
    extends _$AnprRecordCopyWithImpl<$Res, _$AnprRecordImpl>
    implements _$$AnprRecordImplCopyWith<$Res> {
  __$$AnprRecordImplCopyWithImpl(
    _$AnprRecordImpl _value,
    $Res Function(_$AnprRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnprRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plate = null,
    Object? camera = null,
    Object? checkpost = null,
    Object? vehicleType = null,
    Object? detectedAt = null,
    Object? confidence = null,
    Object? direction = null,
    Object? vehicleImage = null,
    Object? plateImage = null,
  }) {
    return _then(
      _$AnprRecordImpl(
        plate: null == plate
            ? _value.plate
            : plate // ignore: cast_nullable_to_non_nullable
                  as String,
        camera: null == camera
            ? _value.camera
            : camera // ignore: cast_nullable_to_non_nullable
                  as String,
        checkpost: null == checkpost
            ? _value.checkpost
            : checkpost // ignore: cast_nullable_to_non_nullable
                  as String,
        vehicleType: null == vehicleType
            ? _value.vehicleType
            : vehicleType // ignore: cast_nullable_to_non_nullable
                  as String,
        detectedAt: null == detectedAt
            ? _value.detectedAt
            : detectedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as double,
        direction: null == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as String,
        vehicleImage: null == vehicleImage
            ? _value.vehicleImage
            : vehicleImage // ignore: cast_nullable_to_non_nullable
                  as String,
        plateImage: null == plateImage
            ? _value.plateImage
            : plateImage // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnprRecordImpl implements _AnprRecord {
  const _$AnprRecordImpl({
    required this.plate,
    required this.camera,
    required this.checkpost,
    required this.vehicleType,
    required this.detectedAt,
    required this.confidence,
    required this.direction,
    required this.vehicleImage,
    required this.plateImage,
  });

  factory _$AnprRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnprRecordImplFromJson(json);

  @override
  final String plate;
  @override
  final String camera;
  @override
  final String checkpost;
  @override
  final String vehicleType;
  @override
  final String detectedAt;
  @override
  final double confidence;
  @override
  final String direction;
  @override
  final String vehicleImage;
  @override
  final String plateImage;

  @override
  String toString() {
    return 'AnprRecord(plate: $plate, camera: $camera, checkpost: $checkpost, vehicleType: $vehicleType, detectedAt: $detectedAt, confidence: $confidence, direction: $direction, vehicleImage: $vehicleImage, plateImage: $plateImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnprRecordImpl &&
            (identical(other.plate, plate) || other.plate == plate) &&
            (identical(other.camera, camera) || other.camera == camera) &&
            (identical(other.checkpost, checkpost) ||
                other.checkpost == checkpost) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            (identical(other.detectedAt, detectedAt) ||
                other.detectedAt == detectedAt) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.vehicleImage, vehicleImage) ||
                other.vehicleImage == vehicleImage) &&
            (identical(other.plateImage, plateImage) ||
                other.plateImage == plateImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    plate,
    camera,
    checkpost,
    vehicleType,
    detectedAt,
    confidence,
    direction,
    vehicleImage,
    plateImage,
  );

  /// Create a copy of AnprRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnprRecordImplCopyWith<_$AnprRecordImpl> get copyWith =>
      __$$AnprRecordImplCopyWithImpl<_$AnprRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnprRecordImplToJson(this);
  }
}

abstract class _AnprRecord implements AnprRecord {
  const factory _AnprRecord({
    required final String plate,
    required final String camera,
    required final String checkpost,
    required final String vehicleType,
    required final String detectedAt,
    required final double confidence,
    required final String direction,
    required final String vehicleImage,
    required final String plateImage,
  }) = _$AnprRecordImpl;

  factory _AnprRecord.fromJson(Map<String, dynamic> json) =
      _$AnprRecordImpl.fromJson;

  @override
  String get plate;
  @override
  String get camera;
  @override
  String get checkpost;
  @override
  String get vehicleType;
  @override
  String get detectedAt;
  @override
  double get confidence;
  @override
  String get direction;
  @override
  String get vehicleImage;
  @override
  String get plateImage;

  /// Create a copy of AnprRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnprRecordImplCopyWith<_$AnprRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
