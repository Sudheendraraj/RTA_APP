// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DynamicChartData _$DynamicChartDataFromJson(Map<String, dynamic> json) {
  return _DynamicChartData.fromJson(json);
}

/// @nodoc
mixin _$DynamicChartData {
  String get label => throw _privateConstructorUsedError;
  num get value => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;

  /// Serializes this DynamicChartData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DynamicChartData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DynamicChartDataCopyWith<DynamicChartData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DynamicChartDataCopyWith<$Res> {
  factory $DynamicChartDataCopyWith(
    DynamicChartData value,
    $Res Function(DynamicChartData) then,
  ) = _$DynamicChartDataCopyWithImpl<$Res, DynamicChartData>;
  @useResult
  $Res call({String label, num value, String color});
}

/// @nodoc
class _$DynamicChartDataCopyWithImpl<$Res, $Val extends DynamicChartData>
    implements $DynamicChartDataCopyWith<$Res> {
  _$DynamicChartDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DynamicChartData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? color = null,
  }) {
    return _then(
      _value.copyWith(
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as num,
            color: null == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DynamicChartDataImplCopyWith<$Res>
    implements $DynamicChartDataCopyWith<$Res> {
  factory _$$DynamicChartDataImplCopyWith(
    _$DynamicChartDataImpl value,
    $Res Function(_$DynamicChartDataImpl) then,
  ) = __$$DynamicChartDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, num value, String color});
}

/// @nodoc
class __$$DynamicChartDataImplCopyWithImpl<$Res>
    extends _$DynamicChartDataCopyWithImpl<$Res, _$DynamicChartDataImpl>
    implements _$$DynamicChartDataImplCopyWith<$Res> {
  __$$DynamicChartDataImplCopyWithImpl(
    _$DynamicChartDataImpl _value,
    $Res Function(_$DynamicChartDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DynamicChartData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? color = null,
  }) {
    return _then(
      _$DynamicChartDataImpl(
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as num,
        color: null == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DynamicChartDataImpl implements _DynamicChartData {
  const _$DynamicChartDataImpl({
    required this.label,
    required this.value,
    required this.color,
  });

  factory _$DynamicChartDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DynamicChartDataImplFromJson(json);

  @override
  final String label;
  @override
  final num value;
  @override
  final String color;

  @override
  String toString() {
    return 'DynamicChartData(label: $label, value: $value, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DynamicChartDataImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, value, color);

  /// Create a copy of DynamicChartData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DynamicChartDataImplCopyWith<_$DynamicChartDataImpl> get copyWith =>
      __$$DynamicChartDataImplCopyWithImpl<_$DynamicChartDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DynamicChartDataImplToJson(this);
  }
}

abstract class _DynamicChartData implements DynamicChartData {
  const factory _DynamicChartData({
    required final String label,
    required final num value,
    required final String color,
  }) = _$DynamicChartDataImpl;

  factory _DynamicChartData.fromJson(Map<String, dynamic> json) =
      _$DynamicChartDataImpl.fromJson;

  @override
  String get label;
  @override
  num get value;
  @override
  String get color;

  /// Create a copy of DynamicChartData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DynamicChartDataImplCopyWith<_$DynamicChartDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChartResponse _$ChartResponseFromJson(Map<String, dynamic> json) {
  return _ChartResponse.fromJson(json);
}

/// @nodoc
mixin _$ChartResponse {
  String get title => throw _privateConstructorUsedError;
  List<DynamicChartData> get data => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this ChartResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChartResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChartResponseCopyWith<ChartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartResponseCopyWith<$Res> {
  factory $ChartResponseCopyWith(
    ChartResponse value,
    $Res Function(ChartResponse) then,
  ) = _$ChartResponseCopyWithImpl<$Res, ChartResponse>;
  @useResult
  $Res call({String title, List<DynamicChartData> data, String? description});
}

/// @nodoc
class _$ChartResponseCopyWithImpl<$Res, $Val extends ChartResponse>
    implements $ChartResponseCopyWith<$Res> {
  _$ChartResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChartResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? data = null,
    Object? description = freezed,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as List<DynamicChartData>,
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
abstract class _$$ChartResponseImplCopyWith<$Res>
    implements $ChartResponseCopyWith<$Res> {
  factory _$$ChartResponseImplCopyWith(
    _$ChartResponseImpl value,
    $Res Function(_$ChartResponseImpl) then,
  ) = __$$ChartResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<DynamicChartData> data, String? description});
}

/// @nodoc
class __$$ChartResponseImplCopyWithImpl<$Res>
    extends _$ChartResponseCopyWithImpl<$Res, _$ChartResponseImpl>
    implements _$$ChartResponseImplCopyWith<$Res> {
  __$$ChartResponseImplCopyWithImpl(
    _$ChartResponseImpl _value,
    $Res Function(_$ChartResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChartResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? data = null,
    Object? description = freezed,
  }) {
    return _then(
      _$ChartResponseImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<DynamicChartData>,
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
class _$ChartResponseImpl implements _ChartResponse {
  const _$ChartResponseImpl({
    required this.title,
    required final List<DynamicChartData> data,
    this.description,
  }) : _data = data;

  factory _$ChartResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChartResponseImplFromJson(json);

  @override
  final String title;
  final List<DynamicChartData> _data;
  @override
  List<DynamicChartData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final String? description;

  @override
  String toString() {
    return 'ChartResponse(title: $title, data: $data, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartResponseImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    const DeepCollectionEquality().hash(_data),
    description,
  );

  /// Create a copy of ChartResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartResponseImplCopyWith<_$ChartResponseImpl> get copyWith =>
      __$$ChartResponseImplCopyWithImpl<_$ChartResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChartResponseImplToJson(this);
  }
}

abstract class _ChartResponse implements ChartResponse {
  const factory _ChartResponse({
    required final String title,
    required final List<DynamicChartData> data,
    final String? description,
  }) = _$ChartResponseImpl;

  factory _ChartResponse.fromJson(Map<String, dynamic> json) =
      _$ChartResponseImpl.fromJson;

  @override
  String get title;
  @override
  List<DynamicChartData> get data;
  @override
  String? get description;

  /// Create a copy of ChartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChartResponseImplCopyWith<_$ChartResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
