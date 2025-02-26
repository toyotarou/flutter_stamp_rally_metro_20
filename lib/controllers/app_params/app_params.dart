import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_params.freezed.dart';

part 'app_params.g.dart';

@freezed
class AppParamsControllerState with _$AppParamsControllerState {
  const factory AppParamsControllerState({
    @Default(0) double currentZoom,
    @Default(5) int currentPaddingIndex,
    @Default({}) Map<int, String> stationStampMap,
    @Default({}) Map<int, bool> stationStampFlagMap,
  }) = _AppParamsControllerState;
}

@Riverpod(keepAlive: true)
class AppParamsController extends _$AppParamsController {
  ///
  @override
  AppParamsControllerState build() {
    var map = <int, String>{
      5960: 'metro_stamp_20_hanzoumon.png',
      5941: 'metro_stamp_20_higashiikebukuro.png',
      5866: 'metro_stamp_20_hounanchou.png',
      5826: 'metro_stamp_20_kanda.png',
      5905: 'metro_stamp_20_kasai.png',
      5829: 'metro_stamp_20_kyoubashi.png',
      5929: 'metro_stamp_20_meijijinguumae_chiyoda.png',
      6003: 'metro_stamp_20_meijijinguumae_fukutoshin.png',
      5909: 'metro_stamp_20_myouden.png',
      5841: 'metro_stamp_20_myougadani.png',
      5922: 'metro_stamp_20_nijuubashimae.png',
      5972: 'metro_stamp_20_oujikamiya.png',
      5885: 'metro_stamp_20_roppongi.png',
      5986: 'metro_stamp_20_shirokanetakanawa.png',
      5965: 'metro_stamp_20_suitenguumae.png',
      5891: 'metro_stamp_20_takadanobaba.png',
      5896: 'metro_stamp_20_takebashi.png',
      5953: 'metro_stamp_20_toyosu.png',
      5871: 'metro_stamp_20_ueno.png',
      5919: 'metro_stamp_20_yushima.png',
    };

    return AppParamsControllerState(stationStampMap: map);
  }

  ///
  void setCurrentZoom({required double zoom}) => state = state.copyWith(currentZoom: zoom);

  ///
  void setStationStampFlagMap({required Map<int, bool> map}) => state = state.copyWith(stationStampFlagMap: map);

  ///
  void setStationStampFlag({required int id, required bool flag}) {
    var map = {...state.stationStampFlagMap};
    map[id] = flag;
    state = state.copyWith(stationStampFlagMap: map);
  }
}
