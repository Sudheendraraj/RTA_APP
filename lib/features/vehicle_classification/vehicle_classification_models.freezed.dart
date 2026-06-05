// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_classification_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VehicleCategory _$VehicleCategoryFromJson(Map<String, dynamic> json) {
  return _VehicleCategory.fromJson(json);
}

/// @nodoc
mixin _$VehicleCategory {
  String get category => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  double get trend => throw _privateConstructorUsedError;

  /// Serializes this VehicleCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleCategoryCopyWith<VehicleCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleCategoryCopyWith<$Res> {
  factory $VehicleCategoryCopyWith(
    VehicleCategory value,
    $Res Function(VehicleCategory) then,
  ) = _$VehicleCategoryCopyWithImpl<$Res, VehicleCategory>;
  @useResult
  $Res call({String category, int count, double trend});
}

/// @nodoc
class _$VehicleCategoryCopyWithImpl<$Res, $Val extends VehicleCategory>
    implements $VehicleCategoryCopyWith<$Res> {
  _$VehicleCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? count = null,
    Object? trend = null,
  }) {
    return _then(
      _value.copyWith(
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
            trend: null == trend
                ? _value.trend
                : trend // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VehicleCategoryImplCopyWith<$Res>
    implements $VehicleCategoryCopyWith<$Res> {
  factory _$$VehicleCategoryImplCopyWith(
    _$VehicleCategoryImpl value,
    $Res Function(_$VehicleCategoryImpl) then,
  ) = __$$VehicleCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String category, int count, double trend});
}

/// @nodoc
class __$$VehicleCategoryImplCopyWithImpl<$Res>
    extends _$VehicleCategoryCopyWithImpl<$Res, _$VehicleCategoryImpl>
    implements _$$VehicleCategoryImplCopyWith<$Res> {
  __$$VehicleCategoryImplCopyWithImpl(
    _$VehicleCategoryImpl _value,
    $Res Function(_$VehicleCategoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VehicleCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? count = null,
    Object? trend = null,
  }) {
    return _then(
      _$VehicleCategoryImpl(
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
        trend: null == trend
            ? _value.trend
            : trend // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleCategoryImpl implements _VehicleCategory {
  const _$VehicleCategoryImpl({
    required this.category,
    required this.count,
    required this.trend,
  });

  factory _$VehicleCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleCategoryImplFromJson(json);

  @override
  final String category;
  @override
  final int count;
  @override
  final double trend;

  @override
  String toString() {
    return 'VehicleCategory(category: $category, count: $count, trend: $trend)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleCategoryImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.trend, trend) || other.trend == trend));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, category, count, trend);

  /// Create a copy of VehicleCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleCategoryImplCopyWith<_$VehicleCategoryImpl> get copyWith =>
      __$$VehicleCategoryImplCopyWithImpl<_$VehicleCategoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleCategoryImplToJson(this);
  }
}

abstract class _VehicleCategory implements VehicleCategory {
  const factory _VehicleCategory({
    required final String category,
    required final int count,
    required final double trend,
  }) = _$VehicleCategoryImpl;

  factory _VehicleCategory.fromJson(Map<String, dynamic> json) =
      _$VehicleCategoryImpl.fromJson;

  @override
  String get category;
  @override
  int get count;
  @override
  double get trend;

  /// Create a copy of VehicleCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleCategoryImplCopyWith<_$VehicleCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
