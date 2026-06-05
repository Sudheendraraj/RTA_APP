// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TrafficSeries _$TrafficSeriesFromJson(Map<String, dynamic> json) {
  return _TrafficSeries.fromJson(json);
}

/// @nodoc
mixin _$TrafficSeries {
  String get label => throw _privateConstructorUsedError;
  int get vehicles => throw _privateConstructorUsedError;

  /// Serializes this TrafficSeries to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrafficSeries
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrafficSeriesCopyWith<TrafficSeries> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrafficSeriesCopyWith<$Res> {
  factory $TrafficSeriesCopyWith(
    TrafficSeries value,
    $Res Function(TrafficSeries) then,
  ) = _$TrafficSeriesCopyWithImpl<$Res, TrafficSeries>;
  @useResult
  $Res call({String label, int vehicles});
}

/// @nodoc
class _$TrafficSeriesCopyWithImpl<$Res, $Val extends TrafficSeries>
    implements $TrafficSeriesCopyWith<$Res> {
  _$TrafficSeriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrafficSeries
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? label = null, Object? vehicles = null}) {
    return _then(
      _value.copyWith(
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            vehicles: null == vehicles
                ? _value.vehicles
                : vehicles // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TrafficSeriesImplCopyWith<$Res>
    implements $TrafficSeriesCopyWith<$Res> {
  factory _$$TrafficSeriesImplCopyWith(
    _$TrafficSeriesImpl value,
    $Res Function(_$TrafficSeriesImpl) then,
  ) = __$$TrafficSeriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, int vehicles});
}

/// @nodoc
class __$$TrafficSeriesImplCopyWithImpl<$Res>
    extends _$TrafficSeriesCopyWithImpl<$Res, _$TrafficSeriesImpl>
    implements _$$TrafficSeriesImplCopyWith<$Res> {
  __$$TrafficSeriesImplCopyWithImpl(
    _$TrafficSeriesImpl _value,
    $Res Function(_$TrafficSeriesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TrafficSeries
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? label = null, Object? vehicles = null}) {
    return _then(
      _$TrafficSeriesImpl(
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        vehicles: null == vehicles
            ? _value.vehicles
            : vehicles // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TrafficSeriesImpl implements _TrafficSeries {
  const _$TrafficSeriesImpl({required this.label, required this.vehicles});

  factory _$TrafficSeriesImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrafficSeriesImplFromJson(json);

  @override
  final String label;
  @override
  final int vehicles;

  @override
  String toString() {
    return 'TrafficSeries(label: $label, vehicles: $vehicles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrafficSeriesImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.vehicles, vehicles) ||
                other.vehicles == vehicles));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, vehicles);

  /// Create a copy of TrafficSeries
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrafficSeriesImplCopyWith<_$TrafficSeriesImpl> get copyWith =>
      __$$TrafficSeriesImplCopyWithImpl<_$TrafficSeriesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrafficSeriesImplToJson(this);
  }
}

abstract class _TrafficSeries implements TrafficSeries {
  const factory _TrafficSeries({
    required final String label,
    required final int vehicles,
  }) = _$TrafficSeriesImpl;

  factory _TrafficSeries.fromJson(Map<String, dynamic> json) =
      _$TrafficSeriesImpl.fromJson;

  @override
  String get label;
  @override
  int get vehicles;

  /// Create a copy of TrafficSeries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrafficSeriesImplCopyWith<_$TrafficSeriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
