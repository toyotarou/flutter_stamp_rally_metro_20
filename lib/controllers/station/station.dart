import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/http/client.dart';
import '../../extensions/extensions.dart';
import '../../models/station_model.dart';
import '../../utilities/utilities.dart';

part 'station.freezed.dart';

part 'station.g.dart';

@freezed
class StationControllerState with _$StationControllerState {
  const factory StationControllerState({
    @Default(<StationModel>[]) List<StationModel> stationList,
    @Default(<int, StationModel>{}) Map<int, StationModel> stationMap,
  }) = _StationControllerState;
}

@Riverpod(keepAlive: true)
class StationController extends _$StationController {
  final Utility utility = Utility();

  ///
  @override
  StationControllerState build() => const StationControllerState();

//---------------------------------------------------------------//

  ///
  Future<StationControllerState> _fetchAllStationData() async {
    final HttpClient client = ref.read(httpClientProvider);

    try {
      // ignore: always_specify_types
      final dynamic value = await client.get(path: 'station');

      final List<StationModel> list = <StationModel>[];
      final Map<int, StationModel> map = <int, StationModel>{};

      // ignore: avoid_dynamic_calls
      for (int i = 0; i < value.length.toString().toInt(); i++) {
        // ignore: avoid_dynamic_calls
        final StationModel val = StationModel.fromJson(value[i] as Map<String, dynamic>);
        list.add(val);

        map[val.id] = val;
      }

      return state.copyWith(stationList: list, stationMap: map);
    } catch (e) {
      utility.showError('予期せぬエラーが発生しました');
      rethrow; // これにより呼び出し元でキャッチできる
    }
  }

  ///
  Future<void> getAllStation() async {
    try {
      final StationControllerState newState = await _fetchAllStationData();

      state = newState;
    } catch (_) {}
  }

//---------------------------------------------------------------//
}
