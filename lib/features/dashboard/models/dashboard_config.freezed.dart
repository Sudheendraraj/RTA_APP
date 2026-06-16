// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DashboardConfig _$DashboardConfigFromJson(Map<String, dynamic> json) {
  return _DashboardConfig.fromJson(json);
}

/// @nodoc
mixin _$DashboardConfig {
  String get title => throw _privateConstructorUsedError;
  List<FilterConfig> get filters => throw _privateConstructorUsedError;
  List<MetricConfig> get metrics => throw _privateConstructorUsedError;
  List<ChartConfig> get charts => throw _privateConstructorUsedError;
  LayoutConfig get layout => throw _privateConstructorUsedError;
  RefreshConfig get refresh => throw _privateConstructorUsedError;

  /// Serializes this DashboardConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardConfigCopyWith<DashboardConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardConfigCopyWith<$Res> {
  factory $DashboardConfigCopyWith(
    DashboardConfig value,
    $Res Function(DashboardConfig) then,
  ) = _$DashboardConfigCopyWithImpl<$Res, DashboardConfig>;
  @useResult
  $Res call({
    String title,
    List<FilterConfig> filters,
    List<MetricConfig> metrics,
    List<ChartConfig> charts,
    LayoutConfig layout,
    RefreshConfig refresh,
  });

  $LayoutConfigCopyWith<$Res> get layout;
  $RefreshConfigCopyWith<$Res> get refresh;
}

/// @nodoc
class _$DashboardConfigCopyWithImpl<$Res, $Val extends DashboardConfig>
    implements $DashboardConfigCopyWith<$Res> {
  _$DashboardConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? filters = null,
    Object? metrics = null,
    Object? charts = null,
    Object? layout = null,
    Object? refresh = null,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            filters: null == filters
                ? _value.filters
                : filters // ignore: cast_nullable_to_non_nullable
                      as List<FilterConfig>,
            metrics: null == metrics
                ? _value.metrics
                : metrics // ignore: cast_nullable_to_non_nullable
                      as List<MetricConfig>,
            charts: null == charts
                ? _value.charts
                : charts // ignore: cast_nullable_to_non_nullable
                      as List<ChartConfig>,
            layout: null == layout
                ? _value.layout
                : layout // ignore: cast_nullable_to_non_nullable
                      as LayoutConfig,
            refresh: null == refresh
                ? _value.refresh
                : refresh // ignore: cast_nullable_to_non_nullable
                      as RefreshConfig,
          )
          as $Val,
    );
  }

  /// Create a copy of DashboardConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LayoutConfigCopyWith<$Res> get layout {
    return $LayoutConfigCopyWith<$Res>(_value.layout, (value) {
      return _then(_value.copyWith(layout: value) as $Val);
    });
  }

  /// Create a copy of DashboardConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RefreshConfigCopyWith<$Res> get refresh {
    return $RefreshConfigCopyWith<$Res>(_value.refresh, (value) {
      return _then(_value.copyWith(refresh: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardConfigImplCopyWith<$Res>
    implements $DashboardConfigCopyWith<$Res> {
  factory _$$DashboardConfigImplCopyWith(
    _$DashboardConfigImpl value,
    $Res Function(_$DashboardConfigImpl) then,
  ) = __$$DashboardConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    List<FilterConfig> filters,
    List<MetricConfig> metrics,
    List<ChartConfig> charts,
    LayoutConfig layout,
    RefreshConfig refresh,
  });

  @override
  $LayoutConfigCopyWith<$Res> get layout;
  @override
  $RefreshConfigCopyWith<$Res> get refresh;
}

/// @nodoc
class __$$DashboardConfigImplCopyWithImpl<$Res>
    extends _$DashboardConfigCopyWithImpl<$Res, _$DashboardConfigImpl>
    implements _$$DashboardConfigImplCopyWith<$Res> {
  __$$DashboardConfigImplCopyWithImpl(
    _$DashboardConfigImpl _value,
    $Res Function(_$DashboardConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? filters = null,
    Object? metrics = null,
    Object? charts = null,
    Object? layout = null,
    Object? refresh = null,
  }) {
    return _then(
      _$DashboardConfigImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        filters: null == filters
            ? _value._filters
            : filters // ignore: cast_nullable_to_non_nullable
                  as List<FilterConfig>,
        metrics: null == metrics
            ? _value._metrics
            : metrics // ignore: cast_nullable_to_non_nullable
                  as List<MetricConfig>,
        charts: null == charts
            ? _value._charts
            : charts // ignore: cast_nullable_to_non_nullable
                  as List<ChartConfig>,
        layout: null == layout
            ? _value.layout
            : layout // ignore: cast_nullable_to_non_nullable
                  as LayoutConfig,
        refresh: null == refresh
            ? _value.refresh
            : refresh // ignore: cast_nullable_to_non_nullable
                  as RefreshConfig,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardConfigImpl implements _DashboardConfig {
  const _$DashboardConfigImpl({
    required this.title,
    required final List<FilterConfig> filters,
    required final List<MetricConfig> metrics,
    required final List<ChartConfig> charts,
    required this.layout,
    required this.refresh,
  }) : _filters = filters,
       _metrics = metrics,
       _charts = charts;

  factory _$DashboardConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardConfigImplFromJson(json);

  @override
  final String title;
  final List<FilterConfig> _filters;
  @override
  List<FilterConfig> get filters {
    if (_filters is EqualUnmodifiableListView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filters);
  }

  final List<MetricConfig> _metrics;
  @override
  List<MetricConfig> get metrics {
    if (_metrics is EqualUnmodifiableListView) return _metrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_metrics);
  }

  final List<ChartConfig> _charts;
  @override
  List<ChartConfig> get charts {
    if (_charts is EqualUnmodifiableListView) return _charts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_charts);
  }

  @override
  final LayoutConfig layout;
  @override
  final RefreshConfig refresh;

  @override
  String toString() {
    return 'DashboardConfig(title: $title, filters: $filters, metrics: $metrics, charts: $charts, layout: $layout, refresh: $refresh)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardConfigImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._filters, _filters) &&
            const DeepCollectionEquality().equals(other._metrics, _metrics) &&
            const DeepCollectionEquality().equals(other._charts, _charts) &&
            (identical(other.layout, layout) || other.layout == layout) &&
            (identical(other.refresh, refresh) || other.refresh == refresh));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    const DeepCollectionEquality().hash(_filters),
    const DeepCollectionEquality().hash(_metrics),
    const DeepCollectionEquality().hash(_charts),
    layout,
    refresh,
  );

  /// Create a copy of DashboardConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardConfigImplCopyWith<_$DashboardConfigImpl> get copyWith =>
      __$$DashboardConfigImplCopyWithImpl<_$DashboardConfigImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardConfigImplToJson(this);
  }
}

abstract class _DashboardConfig implements DashboardConfig {
  const factory _DashboardConfig({
    required final String title,
    required final List<FilterConfig> filters,
    required final List<MetricConfig> metrics,
    required final List<ChartConfig> charts,
    required final LayoutConfig layout,
    required final RefreshConfig refresh,
  }) = _$DashboardConfigImpl;

  factory _DashboardConfig.fromJson(Map<String, dynamic> json) =
      _$DashboardConfigImpl.fromJson;

  @override
  String get title;
  @override
  List<FilterConfig> get filters;
  @override
  List<MetricConfig> get metrics;
  @override
  List<ChartConfig> get charts;
  @override
  LayoutConfig get layout;
  @override
  RefreshConfig get refresh;

  /// Create a copy of DashboardConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardConfigImplCopyWith<_$DashboardConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FilterConfig _$FilterConfigFromJson(Map<String, dynamic> json) {
  return _FilterConfig.fromJson(json);
}

/// @nodoc
mixin _$FilterConfig {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get hint => throw _privateConstructorUsedError;
  bool get isMultiSelect => throw _privateConstructorUsedError;
  bool get isRequired => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;

  /// Serializes this FilterConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FilterConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterConfigCopyWith<FilterConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterConfigCopyWith<$Res> {
  factory $FilterConfigCopyWith(
    FilterConfig value,
    $Res Function(FilterConfig) then,
  ) = _$FilterConfigCopyWithImpl<$Res, FilterConfig>;
  @useResult
  $Res call({
    String id,
    String label,
    String hint,
    bool isMultiSelect,
    bool isRequired,
    int order,
  });
}

/// @nodoc
class _$FilterConfigCopyWithImpl<$Res, $Val extends FilterConfig>
    implements $FilterConfigCopyWith<$Res> {
  _$FilterConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? hint = null,
    Object? isMultiSelect = null,
    Object? isRequired = null,
    Object? order = null,
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
            hint: null == hint
                ? _value.hint
                : hint // ignore: cast_nullable_to_non_nullable
                      as String,
            isMultiSelect: null == isMultiSelect
                ? _value.isMultiSelect
                : isMultiSelect // ignore: cast_nullable_to_non_nullable
                      as bool,
            isRequired: null == isRequired
                ? _value.isRequired
                : isRequired // ignore: cast_nullable_to_non_nullable
                      as bool,
            order: null == order
                ? _value.order
                : order // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FilterConfigImplCopyWith<$Res>
    implements $FilterConfigCopyWith<$Res> {
  factory _$$FilterConfigImplCopyWith(
    _$FilterConfigImpl value,
    $Res Function(_$FilterConfigImpl) then,
  ) = __$$FilterConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String label,
    String hint,
    bool isMultiSelect,
    bool isRequired,
    int order,
  });
}

/// @nodoc
class __$$FilterConfigImplCopyWithImpl<$Res>
    extends _$FilterConfigCopyWithImpl<$Res, _$FilterConfigImpl>
    implements _$$FilterConfigImplCopyWith<$Res> {
  __$$FilterConfigImplCopyWithImpl(
    _$FilterConfigImpl _value,
    $Res Function(_$FilterConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? hint = null,
    Object? isMultiSelect = null,
    Object? isRequired = null,
    Object? order = null,
  }) {
    return _then(
      _$FilterConfigImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        hint: null == hint
            ? _value.hint
            : hint // ignore: cast_nullable_to_non_nullable
                  as String,
        isMultiSelect: null == isMultiSelect
            ? _value.isMultiSelect
            : isMultiSelect // ignore: cast_nullable_to_non_nullable
                  as bool,
        isRequired: null == isRequired
            ? _value.isRequired
            : isRequired // ignore: cast_nullable_to_non_nullable
                  as bool,
        order: null == order
            ? _value.order
            : order // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FilterConfigImpl implements _FilterConfig {
  const _$FilterConfigImpl({
    required this.id,
    required this.label,
    required this.hint,
    required this.isMultiSelect,
    required this.isRequired,
    required this.order,
  });

  factory _$FilterConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilterConfigImplFromJson(json);

  @override
  final String id;
  @override
  final String label;
  @override
  final String hint;
  @override
  final bool isMultiSelect;
  @override
  final bool isRequired;
  @override
  final int order;

  @override
  String toString() {
    return 'FilterConfig(id: $id, label: $label, hint: $hint, isMultiSelect: $isMultiSelect, isRequired: $isRequired, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterConfigImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.hint, hint) || other.hint == hint) &&
            (identical(other.isMultiSelect, isMultiSelect) ||
                other.isMultiSelect == isMultiSelect) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    label,
    hint,
    isMultiSelect,
    isRequired,
    order,
  );

  /// Create a copy of FilterConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterConfigImplCopyWith<_$FilterConfigImpl> get copyWith =>
      __$$FilterConfigImplCopyWithImpl<_$FilterConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FilterConfigImplToJson(this);
  }
}

abstract class _FilterConfig implements FilterConfig {
  const factory _FilterConfig({
    required final String id,
    required final String label,
    required final String hint,
    required final bool isMultiSelect,
    required final bool isRequired,
    required final int order,
  }) = _$FilterConfigImpl;

  factory _FilterConfig.fromJson(Map<String, dynamic> json) =
      _$FilterConfigImpl.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  String get hint;
  @override
  bool get isMultiSelect;
  @override
  bool get isRequired;
  @override
  int get order;

  /// Create a copy of FilterConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterConfigImplCopyWith<_$FilterConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MetricConfig _$MetricConfigFromJson(Map<String, dynamic> json) {
  return _MetricConfig.fromJson(json);
}

/// @nodoc
mixin _$MetricConfig {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get apiEndpoint => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get backgroundColor => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  bool get isVisible => throw _privateConstructorUsedError;

  /// Serializes this MetricConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MetricConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetricConfigCopyWith<MetricConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetricConfigCopyWith<$Res> {
  factory $MetricConfigCopyWith(
    MetricConfig value,
    $Res Function(MetricConfig) then,
  ) = _$MetricConfigCopyWithImpl<$Res, MetricConfig>;
  @useResult
  $Res call({
    String id,
    String title,
    String apiEndpoint,
    String icon,
    String backgroundColor,
    int order,
    bool isVisible,
  });
}

/// @nodoc
class _$MetricConfigCopyWithImpl<$Res, $Val extends MetricConfig>
    implements $MetricConfigCopyWith<$Res> {
  _$MetricConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetricConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? apiEndpoint = null,
    Object? icon = null,
    Object? backgroundColor = null,
    Object? order = null,
    Object? isVisible = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            apiEndpoint: null == apiEndpoint
                ? _value.apiEndpoint
                : apiEndpoint // ignore: cast_nullable_to_non_nullable
                      as String,
            icon: null == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as String,
            backgroundColor: null == backgroundColor
                ? _value.backgroundColor
                : backgroundColor // ignore: cast_nullable_to_non_nullable
                      as String,
            order: null == order
                ? _value.order
                : order // ignore: cast_nullable_to_non_nullable
                      as int,
            isVisible: null == isVisible
                ? _value.isVisible
                : isVisible // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MetricConfigImplCopyWith<$Res>
    implements $MetricConfigCopyWith<$Res> {
  factory _$$MetricConfigImplCopyWith(
    _$MetricConfigImpl value,
    $Res Function(_$MetricConfigImpl) then,
  ) = __$$MetricConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String apiEndpoint,
    String icon,
    String backgroundColor,
    int order,
    bool isVisible,
  });
}

/// @nodoc
class __$$MetricConfigImplCopyWithImpl<$Res>
    extends _$MetricConfigCopyWithImpl<$Res, _$MetricConfigImpl>
    implements _$$MetricConfigImplCopyWith<$Res> {
  __$$MetricConfigImplCopyWithImpl(
    _$MetricConfigImpl _value,
    $Res Function(_$MetricConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MetricConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? apiEndpoint = null,
    Object? icon = null,
    Object? backgroundColor = null,
    Object? order = null,
    Object? isVisible = null,
  }) {
    return _then(
      _$MetricConfigImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        apiEndpoint: null == apiEndpoint
            ? _value.apiEndpoint
            : apiEndpoint // ignore: cast_nullable_to_non_nullable
                  as String,
        icon: null == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as String,
        backgroundColor: null == backgroundColor
            ? _value.backgroundColor
            : backgroundColor // ignore: cast_nullable_to_non_nullable
                  as String,
        order: null == order
            ? _value.order
            : order // ignore: cast_nullable_to_non_nullable
                  as int,
        isVisible: null == isVisible
            ? _value.isVisible
            : isVisible // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MetricConfigImpl implements _MetricConfig {
  const _$MetricConfigImpl({
    required this.id,
    required this.title,
    required this.apiEndpoint,
    required this.icon,
    required this.backgroundColor,
    required this.order,
    required this.isVisible,
  });

  factory _$MetricConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetricConfigImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String apiEndpoint;
  @override
  final String icon;
  @override
  final String backgroundColor;
  @override
  final int order;
  @override
  final bool isVisible;

  @override
  String toString() {
    return 'MetricConfig(id: $id, title: $title, apiEndpoint: $apiEndpoint, icon: $icon, backgroundColor: $backgroundColor, order: $order, isVisible: $isVisible)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetricConfigImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.apiEndpoint, apiEndpoint) ||
                other.apiEndpoint == apiEndpoint) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    apiEndpoint,
    icon,
    backgroundColor,
    order,
    isVisible,
  );

  /// Create a copy of MetricConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetricConfigImplCopyWith<_$MetricConfigImpl> get copyWith =>
      __$$MetricConfigImplCopyWithImpl<_$MetricConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetricConfigImplToJson(this);
  }
}

abstract class _MetricConfig implements MetricConfig {
  const factory _MetricConfig({
    required final String id,
    required final String title,
    required final String apiEndpoint,
    required final String icon,
    required final String backgroundColor,
    required final int order,
    required final bool isVisible,
  }) = _$MetricConfigImpl;

  factory _MetricConfig.fromJson(Map<String, dynamic> json) =
      _$MetricConfigImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get apiEndpoint;
  @override
  String get icon;
  @override
  String get backgroundColor;
  @override
  int get order;
  @override
  bool get isVisible;

  /// Create a copy of MetricConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetricConfigImplCopyWith<_$MetricConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChartConfig _$ChartConfigFromJson(Map<String, dynamic> json) {
  return _ChartConfig.fromJson(json);
}

/// @nodoc
mixin _$ChartConfig {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // 'doughnut', 'column', 'line', 'pie'
  String get apiEndpoint => throw _privateConstructorUsedError;
  List<String> get dataFields => throw _privateConstructorUsedError;
  bool get isVisible => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;

  /// Serializes this ChartConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChartConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChartConfigCopyWith<ChartConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartConfigCopyWith<$Res> {
  factory $ChartConfigCopyWith(
    ChartConfig value,
    $Res Function(ChartConfig) then,
  ) = _$ChartConfigCopyWithImpl<$Res, ChartConfig>;
  @useResult
  $Res call({
    String id,
    String title,
    String type,
    String apiEndpoint,
    List<String> dataFields,
    bool isVisible,
    int order,
  });
}

/// @nodoc
class _$ChartConfigCopyWithImpl<$Res, $Val extends ChartConfig>
    implements $ChartConfigCopyWith<$Res> {
  _$ChartConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChartConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? apiEndpoint = null,
    Object? dataFields = null,
    Object? isVisible = null,
    Object? order = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            apiEndpoint: null == apiEndpoint
                ? _value.apiEndpoint
                : apiEndpoint // ignore: cast_nullable_to_non_nullable
                      as String,
            dataFields: null == dataFields
                ? _value.dataFields
                : dataFields // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            isVisible: null == isVisible
                ? _value.isVisible
                : isVisible // ignore: cast_nullable_to_non_nullable
                      as bool,
            order: null == order
                ? _value.order
                : order // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChartConfigImplCopyWith<$Res>
    implements $ChartConfigCopyWith<$Res> {
  factory _$$ChartConfigImplCopyWith(
    _$ChartConfigImpl value,
    $Res Function(_$ChartConfigImpl) then,
  ) = __$$ChartConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String type,
    String apiEndpoint,
    List<String> dataFields,
    bool isVisible,
    int order,
  });
}

/// @nodoc
class __$$ChartConfigImplCopyWithImpl<$Res>
    extends _$ChartConfigCopyWithImpl<$Res, _$ChartConfigImpl>
    implements _$$ChartConfigImplCopyWith<$Res> {
  __$$ChartConfigImplCopyWithImpl(
    _$ChartConfigImpl _value,
    $Res Function(_$ChartConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChartConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? apiEndpoint = null,
    Object? dataFields = null,
    Object? isVisible = null,
    Object? order = null,
  }) {
    return _then(
      _$ChartConfigImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        apiEndpoint: null == apiEndpoint
            ? _value.apiEndpoint
            : apiEndpoint // ignore: cast_nullable_to_non_nullable
                  as String,
        dataFields: null == dataFields
            ? _value._dataFields
            : dataFields // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        isVisible: null == isVisible
            ? _value.isVisible
            : isVisible // ignore: cast_nullable_to_non_nullable
                  as bool,
        order: null == order
            ? _value.order
            : order // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChartConfigImpl implements _ChartConfig {
  const _$ChartConfigImpl({
    required this.id,
    required this.title,
    required this.type,
    required this.apiEndpoint,
    required final List<String> dataFields,
    required this.isVisible,
    required this.order,
  }) : _dataFields = dataFields;

  factory _$ChartConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChartConfigImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String type;
  // 'doughnut', 'column', 'line', 'pie'
  @override
  final String apiEndpoint;
  final List<String> _dataFields;
  @override
  List<String> get dataFields {
    if (_dataFields is EqualUnmodifiableListView) return _dataFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataFields);
  }

  @override
  final bool isVisible;
  @override
  final int order;

  @override
  String toString() {
    return 'ChartConfig(id: $id, title: $title, type: $type, apiEndpoint: $apiEndpoint, dataFields: $dataFields, isVisible: $isVisible, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartConfigImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.apiEndpoint, apiEndpoint) ||
                other.apiEndpoint == apiEndpoint) &&
            const DeepCollectionEquality().equals(
              other._dataFields,
              _dataFields,
            ) &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    type,
    apiEndpoint,
    const DeepCollectionEquality().hash(_dataFields),
    isVisible,
    order,
  );

  /// Create a copy of ChartConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartConfigImplCopyWith<_$ChartConfigImpl> get copyWith =>
      __$$ChartConfigImplCopyWithImpl<_$ChartConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChartConfigImplToJson(this);
  }
}

abstract class _ChartConfig implements ChartConfig {
  const factory _ChartConfig({
    required final String id,
    required final String title,
    required final String type,
    required final String apiEndpoint,
    required final List<String> dataFields,
    required final bool isVisible,
    required final int order,
  }) = _$ChartConfigImpl;

  factory _ChartConfig.fromJson(Map<String, dynamic> json) =
      _$ChartConfigImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get type; // 'doughnut', 'column', 'line', 'pie'
  @override
  String get apiEndpoint;
  @override
  List<String> get dataFields;
  @override
  bool get isVisible;
  @override
  int get order;

  /// Create a copy of ChartConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChartConfigImplCopyWith<_$ChartConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LayoutConfig _$LayoutConfigFromJson(Map<String, dynamic> json) {
  return _LayoutConfig.fromJson(json);
}

/// @nodoc
mixin _$LayoutConfig {
  int get filterColumnsDesktop => throw _privateConstructorUsedError;
  int get filterColumnsMobile => throw _privateConstructorUsedError;
  int get metricColumnsDesktop => throw _privateConstructorUsedError;
  int get metricColumnsMobile => throw _privateConstructorUsedError;
  int get chartColumnsDesktop => throw _privateConstructorUsedError;
  int get chartColumnsMobile => throw _privateConstructorUsedError;

  /// Serializes this LayoutConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LayoutConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LayoutConfigCopyWith<LayoutConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LayoutConfigCopyWith<$Res> {
  factory $LayoutConfigCopyWith(
    LayoutConfig value,
    $Res Function(LayoutConfig) then,
  ) = _$LayoutConfigCopyWithImpl<$Res, LayoutConfig>;
  @useResult
  $Res call({
    int filterColumnsDesktop,
    int filterColumnsMobile,
    int metricColumnsDesktop,
    int metricColumnsMobile,
    int chartColumnsDesktop,
    int chartColumnsMobile,
  });
}

/// @nodoc
class _$LayoutConfigCopyWithImpl<$Res, $Val extends LayoutConfig>
    implements $LayoutConfigCopyWith<$Res> {
  _$LayoutConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LayoutConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterColumnsDesktop = null,
    Object? filterColumnsMobile = null,
    Object? metricColumnsDesktop = null,
    Object? metricColumnsMobile = null,
    Object? chartColumnsDesktop = null,
    Object? chartColumnsMobile = null,
  }) {
    return _then(
      _value.copyWith(
            filterColumnsDesktop: null == filterColumnsDesktop
                ? _value.filterColumnsDesktop
                : filterColumnsDesktop // ignore: cast_nullable_to_non_nullable
                      as int,
            filterColumnsMobile: null == filterColumnsMobile
                ? _value.filterColumnsMobile
                : filterColumnsMobile // ignore: cast_nullable_to_non_nullable
                      as int,
            metricColumnsDesktop: null == metricColumnsDesktop
                ? _value.metricColumnsDesktop
                : metricColumnsDesktop // ignore: cast_nullable_to_non_nullable
                      as int,
            metricColumnsMobile: null == metricColumnsMobile
                ? _value.metricColumnsMobile
                : metricColumnsMobile // ignore: cast_nullable_to_non_nullable
                      as int,
            chartColumnsDesktop: null == chartColumnsDesktop
                ? _value.chartColumnsDesktop
                : chartColumnsDesktop // ignore: cast_nullable_to_non_nullable
                      as int,
            chartColumnsMobile: null == chartColumnsMobile
                ? _value.chartColumnsMobile
                : chartColumnsMobile // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LayoutConfigImplCopyWith<$Res>
    implements $LayoutConfigCopyWith<$Res> {
  factory _$$LayoutConfigImplCopyWith(
    _$LayoutConfigImpl value,
    $Res Function(_$LayoutConfigImpl) then,
  ) = __$$LayoutConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int filterColumnsDesktop,
    int filterColumnsMobile,
    int metricColumnsDesktop,
    int metricColumnsMobile,
    int chartColumnsDesktop,
    int chartColumnsMobile,
  });
}

/// @nodoc
class __$$LayoutConfigImplCopyWithImpl<$Res>
    extends _$LayoutConfigCopyWithImpl<$Res, _$LayoutConfigImpl>
    implements _$$LayoutConfigImplCopyWith<$Res> {
  __$$LayoutConfigImplCopyWithImpl(
    _$LayoutConfigImpl _value,
    $Res Function(_$LayoutConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LayoutConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterColumnsDesktop = null,
    Object? filterColumnsMobile = null,
    Object? metricColumnsDesktop = null,
    Object? metricColumnsMobile = null,
    Object? chartColumnsDesktop = null,
    Object? chartColumnsMobile = null,
  }) {
    return _then(
      _$LayoutConfigImpl(
        filterColumnsDesktop: null == filterColumnsDesktop
            ? _value.filterColumnsDesktop
            : filterColumnsDesktop // ignore: cast_nullable_to_non_nullable
                  as int,
        filterColumnsMobile: null == filterColumnsMobile
            ? _value.filterColumnsMobile
            : filterColumnsMobile // ignore: cast_nullable_to_non_nullable
                  as int,
        metricColumnsDesktop: null == metricColumnsDesktop
            ? _value.metricColumnsDesktop
            : metricColumnsDesktop // ignore: cast_nullable_to_non_nullable
                  as int,
        metricColumnsMobile: null == metricColumnsMobile
            ? _value.metricColumnsMobile
            : metricColumnsMobile // ignore: cast_nullable_to_non_nullable
                  as int,
        chartColumnsDesktop: null == chartColumnsDesktop
            ? _value.chartColumnsDesktop
            : chartColumnsDesktop // ignore: cast_nullable_to_non_nullable
                  as int,
        chartColumnsMobile: null == chartColumnsMobile
            ? _value.chartColumnsMobile
            : chartColumnsMobile // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LayoutConfigImpl implements _LayoutConfig {
  const _$LayoutConfigImpl({
    required this.filterColumnsDesktop,
    required this.filterColumnsMobile,
    required this.metricColumnsDesktop,
    required this.metricColumnsMobile,
    required this.chartColumnsDesktop,
    required this.chartColumnsMobile,
  });

  factory _$LayoutConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$LayoutConfigImplFromJson(json);

  @override
  final int filterColumnsDesktop;
  @override
  final int filterColumnsMobile;
  @override
  final int metricColumnsDesktop;
  @override
  final int metricColumnsMobile;
  @override
  final int chartColumnsDesktop;
  @override
  final int chartColumnsMobile;

  @override
  String toString() {
    return 'LayoutConfig(filterColumnsDesktop: $filterColumnsDesktop, filterColumnsMobile: $filterColumnsMobile, metricColumnsDesktop: $metricColumnsDesktop, metricColumnsMobile: $metricColumnsMobile, chartColumnsDesktop: $chartColumnsDesktop, chartColumnsMobile: $chartColumnsMobile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LayoutConfigImpl &&
            (identical(other.filterColumnsDesktop, filterColumnsDesktop) ||
                other.filterColumnsDesktop == filterColumnsDesktop) &&
            (identical(other.filterColumnsMobile, filterColumnsMobile) ||
                other.filterColumnsMobile == filterColumnsMobile) &&
            (identical(other.metricColumnsDesktop, metricColumnsDesktop) ||
                other.metricColumnsDesktop == metricColumnsDesktop) &&
            (identical(other.metricColumnsMobile, metricColumnsMobile) ||
                other.metricColumnsMobile == metricColumnsMobile) &&
            (identical(other.chartColumnsDesktop, chartColumnsDesktop) ||
                other.chartColumnsDesktop == chartColumnsDesktop) &&
            (identical(other.chartColumnsMobile, chartColumnsMobile) ||
                other.chartColumnsMobile == chartColumnsMobile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    filterColumnsDesktop,
    filterColumnsMobile,
    metricColumnsDesktop,
    metricColumnsMobile,
    chartColumnsDesktop,
    chartColumnsMobile,
  );

  /// Create a copy of LayoutConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LayoutConfigImplCopyWith<_$LayoutConfigImpl> get copyWith =>
      __$$LayoutConfigImplCopyWithImpl<_$LayoutConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LayoutConfigImplToJson(this);
  }
}

abstract class _LayoutConfig implements LayoutConfig {
  const factory _LayoutConfig({
    required final int filterColumnsDesktop,
    required final int filterColumnsMobile,
    required final int metricColumnsDesktop,
    required final int metricColumnsMobile,
    required final int chartColumnsDesktop,
    required final int chartColumnsMobile,
  }) = _$LayoutConfigImpl;

  factory _LayoutConfig.fromJson(Map<String, dynamic> json) =
      _$LayoutConfigImpl.fromJson;

  @override
  int get filterColumnsDesktop;
  @override
  int get filterColumnsMobile;
  @override
  int get metricColumnsDesktop;
  @override
  int get metricColumnsMobile;
  @override
  int get chartColumnsDesktop;
  @override
  int get chartColumnsMobile;

  /// Create a copy of LayoutConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LayoutConfigImplCopyWith<_$LayoutConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RefreshConfig _$RefreshConfigFromJson(Map<String, dynamic> json) {
  return _RefreshConfig.fromJson(json);
}

/// @nodoc
mixin _$RefreshConfig {
  int get intervalSeconds => throw _privateConstructorUsedError;
  bool get enableAutoRefresh => throw _privateConstructorUsedError;
  bool get enableRealTimeUpdates => throw _privateConstructorUsedError;

  /// Serializes this RefreshConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefreshConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshConfigCopyWith<RefreshConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshConfigCopyWith<$Res> {
  factory $RefreshConfigCopyWith(
    RefreshConfig value,
    $Res Function(RefreshConfig) then,
  ) = _$RefreshConfigCopyWithImpl<$Res, RefreshConfig>;
  @useResult
  $Res call({
    int intervalSeconds,
    bool enableAutoRefresh,
    bool enableRealTimeUpdates,
  });
}

/// @nodoc
class _$RefreshConfigCopyWithImpl<$Res, $Val extends RefreshConfig>
    implements $RefreshConfigCopyWith<$Res> {
  _$RefreshConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intervalSeconds = null,
    Object? enableAutoRefresh = null,
    Object? enableRealTimeUpdates = null,
  }) {
    return _then(
      _value.copyWith(
            intervalSeconds: null == intervalSeconds
                ? _value.intervalSeconds
                : intervalSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            enableAutoRefresh: null == enableAutoRefresh
                ? _value.enableAutoRefresh
                : enableAutoRefresh // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableRealTimeUpdates: null == enableRealTimeUpdates
                ? _value.enableRealTimeUpdates
                : enableRealTimeUpdates // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RefreshConfigImplCopyWith<$Res>
    implements $RefreshConfigCopyWith<$Res> {
  factory _$$RefreshConfigImplCopyWith(
    _$RefreshConfigImpl value,
    $Res Function(_$RefreshConfigImpl) then,
  ) = __$$RefreshConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int intervalSeconds,
    bool enableAutoRefresh,
    bool enableRealTimeUpdates,
  });
}

/// @nodoc
class __$$RefreshConfigImplCopyWithImpl<$Res>
    extends _$RefreshConfigCopyWithImpl<$Res, _$RefreshConfigImpl>
    implements _$$RefreshConfigImplCopyWith<$Res> {
  __$$RefreshConfigImplCopyWithImpl(
    _$RefreshConfigImpl _value,
    $Res Function(_$RefreshConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RefreshConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intervalSeconds = null,
    Object? enableAutoRefresh = null,
    Object? enableRealTimeUpdates = null,
  }) {
    return _then(
      _$RefreshConfigImpl(
        intervalSeconds: null == intervalSeconds
            ? _value.intervalSeconds
            : intervalSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        enableAutoRefresh: null == enableAutoRefresh
            ? _value.enableAutoRefresh
            : enableAutoRefresh // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableRealTimeUpdates: null == enableRealTimeUpdates
            ? _value.enableRealTimeUpdates
            : enableRealTimeUpdates // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RefreshConfigImpl implements _RefreshConfig {
  const _$RefreshConfigImpl({
    required this.intervalSeconds,
    required this.enableAutoRefresh,
    required this.enableRealTimeUpdates,
  });

  factory _$RefreshConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefreshConfigImplFromJson(json);

  @override
  final int intervalSeconds;
  @override
  final bool enableAutoRefresh;
  @override
  final bool enableRealTimeUpdates;

  @override
  String toString() {
    return 'RefreshConfig(intervalSeconds: $intervalSeconds, enableAutoRefresh: $enableAutoRefresh, enableRealTimeUpdates: $enableRealTimeUpdates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshConfigImpl &&
            (identical(other.intervalSeconds, intervalSeconds) ||
                other.intervalSeconds == intervalSeconds) &&
            (identical(other.enableAutoRefresh, enableAutoRefresh) ||
                other.enableAutoRefresh == enableAutoRefresh) &&
            (identical(other.enableRealTimeUpdates, enableRealTimeUpdates) ||
                other.enableRealTimeUpdates == enableRealTimeUpdates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    intervalSeconds,
    enableAutoRefresh,
    enableRealTimeUpdates,
  );

  /// Create a copy of RefreshConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshConfigImplCopyWith<_$RefreshConfigImpl> get copyWith =>
      __$$RefreshConfigImplCopyWithImpl<_$RefreshConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefreshConfigImplToJson(this);
  }
}

abstract class _RefreshConfig implements RefreshConfig {
  const factory _RefreshConfig({
    required final int intervalSeconds,
    required final bool enableAutoRefresh,
    required final bool enableRealTimeUpdates,
  }) = _$RefreshConfigImpl;

  factory _RefreshConfig.fromJson(Map<String, dynamic> json) =
      _$RefreshConfigImpl.fromJson;

  @override
  int get intervalSeconds;
  @override
  bool get enableAutoRefresh;
  @override
  bool get enableRealTimeUpdates;

  /// Create a copy of RefreshConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshConfigImplCopyWith<_$RefreshConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
