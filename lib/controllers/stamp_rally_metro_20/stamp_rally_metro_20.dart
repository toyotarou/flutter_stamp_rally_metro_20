import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/http/client.dart';
import '../../../utilities/utilities.dart';
import '../../extensions/extensions.dart';
import '../../models/stamp_rally_metro_20_model.dart';

part 'stamp_rally_metro_20.freezed.dart';

part 'stamp_rally_metro_20.g.dart';

@freezed
class StampRallyMetro20ControllerState with _$StampRallyMetro20ControllerState {
  const factory StampRallyMetro20ControllerState({
    @Default(<StampRallyMetro20Model>[]) List<StampRallyMetro20Model> stampRallyMetro20List,
    @Default(<String, StampRallyMetro20Model>{}) Map<String, StampRallyMetro20Model> stampRallyMetro20Map,
  }) = _StampRallyMetro20ControllerState;
}

@Riverpod(keepAlive: true)
class StampRallyMetro20Controller extends _$StampRallyMetro20Controller {
  final Utility utility = Utility();

  ///
  @override
  StampRallyMetro20ControllerState build() => const StampRallyMetro20ControllerState();

  //---------------------------------------------------------------//

  ///
  Future<StampRallyMetro20ControllerState> _fetchAllStampRallyMetro20Data() async {
    final HttpClient client = ref.read(httpClientProvider);

    try {
      // ignore: always_specify_types
      final dynamic value = await client.get(path: 'stampRallyMetro20');

      final List<StampRallyMetro20Model> list = <StampRallyMetro20Model>[];
      final Map<String, StampRallyMetro20Model> map = <String, StampRallyMetro20Model>{};

      // ignore: avoid_dynamic_calls
      for (int i = 0; i < value.length.toString().toInt(); i++) {
        // ignore: avoid_dynamic_calls
        final StampRallyMetro20Model val = StampRallyMetro20Model.fromJson(value[i] as Map<String, dynamic>);
        list.add(val);

        map[val.stationName] = val;
      }

      return state.copyWith(stampRallyMetro20List: list, stampRallyMetro20Map: map);
    } catch (e) {
      utility.showError('予期せぬエラーが発生しました');
      rethrow; // これにより呼び出し元でキャッチできる
    }
  }

  ///
  Future<void> getAllStampRallyMetro20() async {
    try {
      final StampRallyMetro20ControllerState newState = await _fetchAllStampRallyMetro20Data();

      state = newState;
    } catch (_) {}
  }

//---------------------------------------------------------------//
}
