import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_params.freezed.dart';

part 'app_params.g.dart';

@freezed
class AppParamsControllerState with _$AppParamsControllerState {
  const factory AppParamsControllerState({
    @Default(0) double currentZoom,
    @Default(5) int currentPaddingIndex,
  }) = _AppParamsControllerState;
}

@Riverpod(keepAlive: true)
class AppParamsController extends _$AppParamsController {
  ///
  @override
  AppParamsControllerState build() => const AppParamsControllerState();

  ///
  void setCurrentZoom({required double zoom}) => state = state.copyWith(currentZoom: zoom);
}
