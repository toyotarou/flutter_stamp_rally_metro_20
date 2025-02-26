import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_params/app_params.dart';
import 'stamp_rally_metro_20/stamp_rally_metro_20.dart';
import 'station/station.dart';

mixin ControllersMixin<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  //==========================================//

  AppParamsControllerState get appParamState => ref.watch(appParamsControllerProvider);

  AppParamsController get appParamNotifier => ref.read(appParamsControllerProvider.notifier);

//==========================================//

  StampRallyMetro20ControllerState get stampRallyMetro20ControllerState =>
      ref.watch(stampRallyMetro20ControllerProvider);

  StampRallyMetro20Controller get stampRallyMetro20ControllerNotifier =>
      ref.read(stampRallyMetro20ControllerProvider.notifier);

//==========================================//

  StationControllerState get stationControllerState => ref.watch(stationControllerProvider);

  StationController get stationControllerNotifier => ref.read(stationControllerProvider.notifier);

//==========================================//
}
