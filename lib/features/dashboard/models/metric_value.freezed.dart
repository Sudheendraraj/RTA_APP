// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metric_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MetricValue _$MetricValueFromJson(Map<String, dynamic> json) {
  return _MetricValue.fromJson(json);
}

/// @nodoc
mixin _$MetricValue {
  String get id => throw _privateConstructorUsedError;
  num get value => throw _privateConstructorUsedError;
  num? get previousValue => throw _privateConstructorUsedError;
  num? get changePercentage => throw _privateConstructorUsedError;

  /// Serializes this MetricValue to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MetricValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetricValueCopyWith<MetricValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetricValueCopyWith<$Res> {
  factory $MetricValueCopyWith(
    MetricValue value,
    $Res Function(MetricValue) then,
  ) = _$MetricValueCopyWithImpl<$Res, MetricValue>;
  @useResult
  $Res call({String id, num value, num? previousValue, num? changePercentage});
}

/// @nodoc
class _$MetricValueCopyWithImpl<$Res, $Val extends MetricValue>
    implements $MetricValueCopyWith<$Res> {
  _$MetricValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetricValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? value = null,
    Object? previousValue = freezed,
    Object? changePercentage = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as num,
            previousValue: freezed == previousValue
                ? _value.previousValue
                : previousValue // ignore: cast_nullable_to_non_nullable
                      as num?,
            changePercentage: freezed == changePercentage
                ? _value.changePercentage
                : changePercentage // ignore: cast_nullable_to_non_nullable
                      as num?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MetricValueImplCopyWith<$Res>
    implements $MetricValueCopyWith<$Res> {
  factory _$$MetricValueImplCopyWith(
    _$MetricValueImpl value,
    $Res Function(_$MetricValueImpl) then,
  ) = __$$MetricValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, num value, num? previousValue, num? changePercentage});
}

/// @nodoc
class __$$MetricValueImplCopyWithImpl<$Res>
    extends _$MetricValueCopyWithImpl<$Res, _$MetricValueImpl>
    implements _$$MetricValueImplCopyWith<$Res> {
  __$$MetricValueImplCopyWithImpl(
    _$MetricValueImpl _value,
    $Res Function(_$MetricValueImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MetricValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? value = null,
    Object? previousValue = freezed,
    Object? changePercentage = freezed,
  }) {
    return _then(
      _$MetricValueImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as num,
        previousValue: freezed == previousValue
            ? _value.previousValue
            : previousValue // ignore: cast_nullable_to_non_nullable
                  as num?,
        changePercentage: freezed == changePercentage
            ? _value.changePercentage
            : changePercentage // ignore: cast_nullable_to_non_nullable
                  as num?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MetricValueImpl implements _MetricValue {
  const _$MetricValueImpl({
    required this.id,
    required this.value,
    this.previousValue,
    this.changePercentage,
  });

  factory _$MetricValueImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetricValueImplFromJson(json);

  @override
  final String id;
  @override
  final num value;
  @override
  final num? previousValue;
  @override
  final num? changePercentage;

  @override
  String toString() {
    return 'MetricValue(id: $id, value: $value, previousValue: $previousValue, changePercentage: $changePercentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetricValueImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.previousValue, previousValue) ||
                other.previousValue == previousValue) &&
            (identical(other.changePercentage, changePercentage) ||
                other.changePercentage == changePercentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, value, previousValue, changePercentage);

  /// Create a copy of MetricValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetricValueImplCopyWith<_$MetricValueImpl> get copyWith =>
      __$$MetricValueImplCopyWithImpl<_$MetricValueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetricValueImplToJson(this);
  }
}

abstract class _MetricValue implements MetricValue {
  const factory _MetricValue({
    required final String id,
    required final num value,
    final num? previousValue,
    final num? changePercentage,
  }) = _$MetricValueImpl;

  factory _MetricValue.fromJson(Map<String, dynamic> json) =
      _$MetricValueImpl.fromJson;

  @override
  String get id;
  @override
  num get value;
  @override
  num? get previousValue;
  @override
  num? get changePercentage;

  /// Create a copy of MetricValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetricValueImplCopyWith<_$MetricValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
