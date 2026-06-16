// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FilterOptions _$FilterOptionsFromJson(Map<String, dynamic> json) {
  return _FilterOptions.fromJson(json);
}

/// @nodoc
mixin _$FilterOptions {
  List<FilterOption> get districts => throw _privateConstructorUsedError;
  List<FilterOption> get zones => throw _privateConstructorUsedError;
  List<FilterOption> get cameras => throw _privateConstructorUsedError;
  List<FilterOption> get timeRanges => throw _privateConstructorUsedError;

  /// Serializes this FilterOptions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FilterOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterOptionsCopyWith<FilterOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterOptionsCopyWith<$Res> {
  factory $FilterOptionsCopyWith(
    FilterOptions value,
    $Res Function(FilterOptions) then,
  ) = _$FilterOptionsCopyWithImpl<$Res, FilterOptions>;
  @useResult
  $Res call({
    List<FilterOption> districts,
    List<FilterOption> zones,
    List<FilterOption> cameras,
    List<FilterOption> timeRanges,
  });
}

/// @nodoc
class _$FilterOptionsCopyWithImpl<$Res, $Val extends FilterOptions>
    implements $FilterOptionsCopyWith<$Res> {
  _$FilterOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? districts = null,
    Object? zones = null,
    Object? cameras = null,
    Object? timeRanges = null,
  }) {
    return _then(
      _value.copyWith(
            districts: null == districts
                ? _value.districts
                : districts // ignore: cast_nullable_to_non_nullable
                      as List<FilterOption>,
            zones: null == zones
                ? _value.zones
                : zones // ignore: cast_nullable_to_non_nullable
                      as List<FilterOption>,
            cameras: null == cameras
                ? _value.cameras
                : cameras // ignore: cast_nullable_to_non_nullable
                      as List<FilterOption>,
            timeRanges: null == timeRanges
                ? _value.timeRanges
                : timeRanges // ignore: cast_nullable_to_non_nullable
                      as List<FilterOption>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FilterOptionsImplCopyWith<$Res>
    implements $FilterOptionsCopyWith<$Res> {
  factory _$$FilterOptionsImplCopyWith(
    _$FilterOptionsImpl value,
    $Res Function(_$FilterOptionsImpl) then,
  ) = __$$FilterOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<FilterOption> districts,
    List<FilterOption> zones,
    List<FilterOption> cameras,
    List<FilterOption> timeRanges,
  });
}

/// @nodoc
class __$$FilterOptionsImplCopyWithImpl<$Res>
    extends _$FilterOptionsCopyWithImpl<$Res, _$FilterOptionsImpl>
    implements _$$FilterOptionsImplCopyWith<$Res> {
  __$$FilterOptionsImplCopyWithImpl(
    _$FilterOptionsImpl _value,
    $Res Function(_$FilterOptionsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? districts = null,
    Object? zones = null,
    Object? cameras = null,
    Object? timeRanges = null,
  }) {
    return _then(
      _$FilterOptionsImpl(
        districts: null == districts
            ? _value._districts
            : districts // ignore: cast_nullable_to_non_nullable
                  as List<FilterOption>,
        zones: null == zones
            ? _value._zones
            : zones // ignore: cast_nullable_to_non_nullable
                  as List<FilterOption>,
        cameras: null == cameras
            ? _value._cameras
            : cameras // ignore: cast_nullable_to_non_nullable
                  as List<FilterOption>,
        timeRanges: null == timeRanges
            ? _value._timeRanges
            : timeRanges // ignore: cast_nullable_to_non_nullable
                  as List<FilterOption>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FilterOptionsImpl implements _FilterOptions {
  const _$FilterOptionsImpl({
    required final List<FilterOption> districts,
    required final List<FilterOption> zones,
    required final List<FilterOption> cameras,
    required final List<FilterOption> timeRanges,
  }) : _districts = districts,
       _zones = zones,
       _cameras = cameras,
       _timeRanges = timeRanges;

  factory _$FilterOptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilterOptionsImplFromJson(json);

  final List<FilterOption> _districts;
  @override
  List<FilterOption> get districts {
    if (_districts is EqualUnmodifiableListView) return _districts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_districts);
  }

  final List<FilterOption> _zones;
  @override
  List<FilterOption> get zones {
    if (_zones is EqualUnmodifiableListView) return _zones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_zones);
  }

  final List<FilterOption> _cameras;
  @override
  List<FilterOption> get cameras {
    if (_cameras is EqualUnmodifiableListView) return _cameras;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cameras);
  }

  final List<FilterOption> _timeRanges;
  @override
  List<FilterOption> get timeRanges {
    if (_timeRanges is EqualUnmodifiableListView) return _timeRanges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timeRanges);
  }

  @override
  String toString() {
    return 'FilterOptions(districts: $districts, zones: $zones, cameras: $cameras, timeRanges: $timeRanges)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterOptionsImpl &&
            const DeepCollectionEquality().equals(
              other._districts,
              _districts,
            ) &&
            const DeepCollectionEquality().equals(other._zones, _zones) &&
            const DeepCollectionEquality().equals(other._cameras, _cameras) &&
            const DeepCollectionEquality().equals(
              other._timeRanges,
              _timeRanges,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_districts),
    const DeepCollectionEquality().hash(_zones),
    const DeepCollectionEquality().hash(_cameras),
    const DeepCollectionEquality().hash(_timeRanges),
  );

  /// Create a copy of FilterOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterOptionsImplCopyWith<_$FilterOptionsImpl> get copyWith =>
      __$$FilterOptionsImplCopyWithImpl<_$FilterOptionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FilterOptionsImplToJson(this);
  }
}

abstract class _FilterOptions implements FilterOptions {
  const factory _FilterOptions({
    required final List<FilterOption> districts,
    required final List<FilterOption> zones,
    required final List<FilterOption> cameras,
    required final List<FilterOption> timeRanges,
  }) = _$FilterOptionsImpl;

  factory _FilterOptions.fromJson(Map<String, dynamic> json) =
      _$FilterOptionsImpl.fromJson;

  @override
  List<FilterOption> get districts;
  @override
  List<FilterOption> get zones;
  @override
  List<FilterOption> get cameras;
  @override
  List<FilterOption> get timeRanges;

  /// Create a copy of FilterOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterOptionsImplCopyWith<_$FilterOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FilterOption _$FilterOptionFromJson(Map<String, dynamic> json) {
  return _FilterOption.fromJson(json);
}

/// @nodoc
mixin _$FilterOption {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this FilterOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FilterOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterOptionCopyWith<FilterOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterOptionCopyWith<$Res> {
  factory $FilterOptionCopyWith(
    FilterOption value,
    $Res Function(FilterOption) then,
  ) = _$FilterOptionCopyWithImpl<$Res, FilterOption>;
  @useResult
  $Res call({String id, String label, String? description});
}

/// @nodoc
class _$FilterOptionCopyWithImpl<$Res, $Val extends FilterOption>
    implements $FilterOptionCopyWith<$Res> {
  _$FilterOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? description = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FilterOptionImplCopyWith<$Res>
    implements $FilterOptionCopyWith<$Res> {
  factory _$$FilterOptionImplCopyWith(
    _$FilterOptionImpl value,
    $Res Function(_$FilterOptionImpl) then,
  ) = __$$FilterOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String label, String? description});
}

/// @nodoc
class __$$FilterOptionImplCopyWithImpl<$Res>
    extends _$FilterOptionCopyWithImpl<$Res, _$FilterOptionImpl>
    implements _$$FilterOptionImplCopyWith<$Res> {
  __$$FilterOptionImplCopyWithImpl(
    _$FilterOptionImpl _value,
    $Res Function(_$FilterOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? description = freezed,
  }) {
    return _then(
      _$FilterOptionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FilterOptionImpl implements _FilterOption {
  const _$FilterOptionImpl({
    required this.id,
    required this.label,
    this.description,
  });

  factory _$FilterOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilterOptionImplFromJson(json);

  @override
  final String id;
  @override
  final String label;
  @override
  final String? description;

  @override
  String toString() {
    return 'FilterOption(id: $id, label: $label, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterOptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, label, description);

  /// Create a copy of FilterOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterOptionImplCopyWith<_$FilterOptionImpl> get copyWith =>
      __$$FilterOptionImplCopyWithImpl<_$FilterOptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FilterOptionImplToJson(this);
  }
}

abstract class _FilterOption implements FilterOption {
  const factory _FilterOption({
    required final String id,
    required final String label,
    final String? description,
  }) = _$FilterOptionImpl;

  factory _FilterOption.fromJson(Map<String, dynamic> json) =
      _$FilterOptionImpl.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  String? get description;

  /// Create a copy of FilterOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterOptionImplCopyWith<_$FilterOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
