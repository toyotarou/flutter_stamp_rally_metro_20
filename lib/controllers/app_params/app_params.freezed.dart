// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppParamsControllerState {
  double get currentZoom => throw _privateConstructorUsedError;
  int get currentPaddingIndex => throw _privateConstructorUsedError;

  /// Create a copy of AppParamsControllerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppParamsControllerStateCopyWith<AppParamsControllerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppParamsControllerStateCopyWith<$Res> {
  factory $AppParamsControllerStateCopyWith(AppParamsControllerState value,
          $Res Function(AppParamsControllerState) then) =
      _$AppParamsControllerStateCopyWithImpl<$Res, AppParamsControllerState>;
  @useResult
  $Res call({double currentZoom, int currentPaddingIndex});
}

/// @nodoc
class _$AppParamsControllerStateCopyWithImpl<$Res,
        $Val extends AppParamsControllerState>
    implements $AppParamsControllerStateCopyWith<$Res> {
  _$AppParamsControllerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppParamsControllerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentZoom = null,
    Object? currentPaddingIndex = null,
  }) {
    return _then(_value.copyWith(
      currentZoom: null == currentZoom
          ? _value.currentZoom
          : currentZoom // ignore: cast_nullable_to_non_nullable
              as double,
      currentPaddingIndex: null == currentPaddingIndex
          ? _value.currentPaddingIndex
          : currentPaddingIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppParamsControllerStateImplCopyWith<$Res>
    implements $AppParamsControllerStateCopyWith<$Res> {
  factory _$$AppParamsControllerStateImplCopyWith(
          _$AppParamsControllerStateImpl value,
          $Res Function(_$AppParamsControllerStateImpl) then) =
      __$$AppParamsControllerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double currentZoom, int currentPaddingIndex});
}

/// @nodoc
class __$$AppParamsControllerStateImplCopyWithImpl<$Res>
    extends _$AppParamsControllerStateCopyWithImpl<$Res,
        _$AppParamsControllerStateImpl>
    implements _$$AppParamsControllerStateImplCopyWith<$Res> {
  __$$AppParamsControllerStateImplCopyWithImpl(
      _$AppParamsControllerStateImpl _value,
      $Res Function(_$AppParamsControllerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppParamsControllerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentZoom = null,
    Object? currentPaddingIndex = null,
  }) {
    return _then(_$AppParamsControllerStateImpl(
      currentZoom: null == currentZoom
          ? _value.currentZoom
          : currentZoom // ignore: cast_nullable_to_non_nullable
              as double,
      currentPaddingIndex: null == currentPaddingIndex
          ? _value.currentPaddingIndex
          : currentPaddingIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AppParamsControllerStateImpl implements _AppParamsControllerState {
  const _$AppParamsControllerStateImpl(
      {this.currentZoom = 0, this.currentPaddingIndex = 5});

  @override
  @JsonKey()
  final double currentZoom;
  @override
  @JsonKey()
  final int currentPaddingIndex;

  @override
  String toString() {
    return 'AppParamsControllerState(currentZoom: $currentZoom, currentPaddingIndex: $currentPaddingIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppParamsControllerStateImpl &&
            (identical(other.currentZoom, currentZoom) ||
                other.currentZoom == currentZoom) &&
            (identical(other.currentPaddingIndex, currentPaddingIndex) ||
                other.currentPaddingIndex == currentPaddingIndex));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, currentZoom, currentPaddingIndex);

  /// Create a copy of AppParamsControllerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppParamsControllerStateImplCopyWith<_$AppParamsControllerStateImpl>
      get copyWith => __$$AppParamsControllerStateImplCopyWithImpl<
          _$AppParamsControllerStateImpl>(this, _$identity);
}

abstract class _AppParamsControllerState implements AppParamsControllerState {
  const factory _AppParamsControllerState(
      {final double currentZoom,
      final int currentPaddingIndex}) = _$AppParamsControllerStateImpl;

  @override
  double get currentZoom;
  @override
  int get currentPaddingIndex;

  /// Create a copy of AppParamsControllerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppParamsControllerStateImplCopyWith<_$AppParamsControllerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
