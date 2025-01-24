// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'station.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StationControllerState {
  List<StationModel> get stationList => throw _privateConstructorUsedError;
  Map<int, StationModel> get stationMap => throw _privateConstructorUsedError;

  /// Create a copy of StationControllerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StationControllerStateCopyWith<StationControllerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationControllerStateCopyWith<$Res> {
  factory $StationControllerStateCopyWith(StationControllerState value,
          $Res Function(StationControllerState) then) =
      _$StationControllerStateCopyWithImpl<$Res, StationControllerState>;
  @useResult
  $Res call(
      {List<StationModel> stationList, Map<int, StationModel> stationMap});
}

/// @nodoc
class _$StationControllerStateCopyWithImpl<$Res,
        $Val extends StationControllerState>
    implements $StationControllerStateCopyWith<$Res> {
  _$StationControllerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StationControllerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationList = null,
    Object? stationMap = null,
  }) {
    return _then(_value.copyWith(
      stationList: null == stationList
          ? _value.stationList
          : stationList // ignore: cast_nullable_to_non_nullable
              as List<StationModel>,
      stationMap: null == stationMap
          ? _value.stationMap
          : stationMap // ignore: cast_nullable_to_non_nullable
              as Map<int, StationModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StationControllerStateImplCopyWith<$Res>
    implements $StationControllerStateCopyWith<$Res> {
  factory _$$StationControllerStateImplCopyWith(
          _$StationControllerStateImpl value,
          $Res Function(_$StationControllerStateImpl) then) =
      __$$StationControllerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<StationModel> stationList, Map<int, StationModel> stationMap});
}

/// @nodoc
class __$$StationControllerStateImplCopyWithImpl<$Res>
    extends _$StationControllerStateCopyWithImpl<$Res,
        _$StationControllerStateImpl>
    implements _$$StationControllerStateImplCopyWith<$Res> {
  __$$StationControllerStateImplCopyWithImpl(
      _$StationControllerStateImpl _value,
      $Res Function(_$StationControllerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StationControllerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationList = null,
    Object? stationMap = null,
  }) {
    return _then(_$StationControllerStateImpl(
      stationList: null == stationList
          ? _value._stationList
          : stationList // ignore: cast_nullable_to_non_nullable
              as List<StationModel>,
      stationMap: null == stationMap
          ? _value._stationMap
          : stationMap // ignore: cast_nullable_to_non_nullable
              as Map<int, StationModel>,
    ));
  }
}

/// @nodoc

class _$StationControllerStateImpl implements _StationControllerState {
  const _$StationControllerStateImpl(
      {final List<StationModel> stationList = const <StationModel>[],
      final Map<int, StationModel> stationMap = const <int, StationModel>{}})
      : _stationList = stationList,
        _stationMap = stationMap;

  final List<StationModel> _stationList;
  @override
  @JsonKey()
  List<StationModel> get stationList {
    if (_stationList is EqualUnmodifiableListView) return _stationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stationList);
  }

  final Map<int, StationModel> _stationMap;
  @override
  @JsonKey()
  Map<int, StationModel> get stationMap {
    if (_stationMap is EqualUnmodifiableMapView) return _stationMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_stationMap);
  }

  @override
  String toString() {
    return 'StationControllerState(stationList: $stationList, stationMap: $stationMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationControllerStateImpl &&
            const DeepCollectionEquality()
                .equals(other._stationList, _stationList) &&
            const DeepCollectionEquality()
                .equals(other._stationMap, _stationMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_stationList),
      const DeepCollectionEquality().hash(_stationMap));

  /// Create a copy of StationControllerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StationControllerStateImplCopyWith<_$StationControllerStateImpl>
      get copyWith => __$$StationControllerStateImplCopyWithImpl<
          _$StationControllerStateImpl>(this, _$identity);
}

abstract class _StationControllerState implements StationControllerState {
  const factory _StationControllerState(
      {final List<StationModel> stationList,
      final Map<int, StationModel> stationMap}) = _$StationControllerStateImpl;

  @override
  List<StationModel> get stationList;
  @override
  Map<int, StationModel> get stationMap;

  /// Create a copy of StationControllerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StationControllerStateImplCopyWith<_$StationControllerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
