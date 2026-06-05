// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reports_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ReportItem _$ReportItemFromJson(Map<String, dynamic> json) {
  return _ReportItem.fromJson(json);
}

/// @nodoc
mixin _$ReportItem {
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  /// Serializes this ReportItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReportItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportItemCopyWith<ReportItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportItemCopyWith<$Res> {
  factory $ReportItemCopyWith(
    ReportItem value,
    $Res Function(ReportItem) then,
  ) = _$ReportItemCopyWithImpl<$Res, ReportItem>;
  @useResult
  $Res call({String name, String type, int count});
}

/// @nodoc
class _$ReportItemCopyWithImpl<$Res, $Val extends ReportItem>
    implements $ReportItemCopyWith<$Res> {
  _$ReportItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? type = null, Object? count = null}) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReportItemImplCopyWith<$Res>
    implements $ReportItemCopyWith<$Res> {
  factory _$$ReportItemImplCopyWith(
    _$ReportItemImpl value,
    $Res Function(_$ReportItemImpl) then,
  ) = __$$ReportItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String type, int count});
}

/// @nodoc
class __$$ReportItemImplCopyWithImpl<$Res>
    extends _$ReportItemCopyWithImpl<$Res, _$ReportItemImpl>
    implements _$$ReportItemImplCopyWith<$Res> {
  __$$ReportItemImplCopyWithImpl(
    _$ReportItemImpl _value,
    $Res Function(_$ReportItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReportItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? type = null, Object? count = null}) {
    return _then(
      _$ReportItemImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportItemImpl implements _ReportItem {
  const _$ReportItemImpl({
    required this.name,
    required this.type,
    required this.count,
  });

  factory _$ReportItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportItemImplFromJson(json);

  @override
  final String name;
  @override
  final String type;
  @override
  final int count;

  @override
  String toString() {
    return 'ReportItem(name: $name, type: $type, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportItemImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, type, count);

  /// Create a copy of ReportItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportItemImplCopyWith<_$ReportItemImpl> get copyWith =>
      __$$ReportItemImplCopyWithImpl<_$ReportItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportItemImplToJson(this);
  }
}

abstract class _ReportItem implements ReportItem {
  const factory _ReportItem({
    required final String name,
    required final String type,
    required final int count,
  }) = _$ReportItemImpl;

  factory _ReportItem.fromJson(Map<String, dynamic> json) =
      _$ReportItemImpl.fromJson;

  @override
  String get name;
  @override
  String get type;
  @override
  int get count;

  /// Create a copy of ReportItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportItemImplCopyWith<_$ReportItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
