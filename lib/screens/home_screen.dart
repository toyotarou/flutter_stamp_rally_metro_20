import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../controllers/app_params/app_params.dart';
import '../controllers/stamp_rally_metro_20/stamp_rally_metro_20.dart';
import '../controllers/station/station.dart';
import '../extensions/extensions.dart';
import '../models/stamp_rally_metro_20_model.dart';
import '../models/station_model.dart';
import '../utilities/tile_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<double> latList = <double>[];
  List<double> lngList = <double>[];

  double minLat = 0.0;
  double maxLat = 0.0;
  double minLng = 0.0;
  double maxLng = 0.0;

  final MapController mapController = MapController();

  double currentZoomEightTeen = 18;

  List<Marker> markerList = <Marker>[];

  bool isLoading = false;

  double? currentZoom;

  bool getBoundsZoomValue = false;

  ///
  @override
  void initState() {
    super.initState();

    ref.read(stampRallyMetro20ControllerProvider.notifier).getAllStampRallyMetro20();

    ref.read(stationControllerProvider.notifier).getAllStation();

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => isLoading = true);

      // ignore: always_specify_types
      Future.delayed(const Duration(seconds: 2), () {
        setDefaultBoundsMap();

        setState(() => isLoading = false);
      });
    });
  }

  ///
  @override
  Widget build(BuildContext context) {
    getNotReachTemple();

    makeMarker();

    return Scaffold(
      body: SafeArea(
        child: FlutterMap(
          mapController: mapController,
          options: MapOptions(
            initialCenter: const LatLng(35.718532, 139.586639),
            initialZoom: currentZoomEightTeen,
            onPositionChanged: (MapCamera position, bool isMoving) {
              if (isMoving) {
                ref.read(appParamsControllerProvider.notifier).setCurrentZoom(zoom: position.zoom);
              }
            },
          ),
          children: <Widget>[
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              tileProvider: CachedTileProvider(),
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(markers: markerList),
          ],
        ),
      ),
    );
  }

  ///
  void getNotReachTemple() {
    final List<double> latList = <double>[];
    final List<double> lngList = <double>[];

    final List<StampRallyMetro20Model> stampRallyMetro20List = ref.watch(stampRallyMetro20ControllerProvider
        .select((StampRallyMetro20ControllerState value) => value.stampRallyMetro20List));

    final Map<int, StationModel> stationMap =
        ref.watch(stationControllerProvider.select((StationControllerState value) => value.stationMap));

    for (final StampRallyMetro20Model element in stampRallyMetro20List) {
      final StationModel? station = stationMap[element.stationId];

      if (station != null) {
        latList.add(double.parse(station.lat));
        lngList.add(double.parse(station.lng));
      }
    }

    if (latList.isNotEmpty && lngList.isNotEmpty) {
      minLat = latList.reduce(min);
      maxLat = latList.reduce(max);
      minLng = lngList.reduce(min);
      maxLng = lngList.reduce(max);
    }
  }

  ///
  void makeMarker() {
    final List<StampRallyMetro20Model> stampRallyMetro20List = ref.watch(stampRallyMetro20ControllerProvider
        .select((StampRallyMetro20ControllerState value) => value.stampRallyMetro20List));

    final Map<int, StationModel> stationMap =
        ref.watch(stationControllerProvider.select((StationControllerState value) => value.stationMap));

    for (final StampRallyMetro20Model element in stampRallyMetro20List) {
      final StationModel? station = stationMap[element.stationId];

      if (station != null) {
        markerList.add(Marker(
          point: LatLng(station.lat.toDouble(), station.lng.toDouble()),
          width: 40,
          height: 40,
          child: CircleAvatar(
            backgroundColor: (element.getDate.isNotEmpty)
                ? Colors.pinkAccent.withOpacity(0.5)
                : Colors.orangeAccent.withOpacity(0.5),
            child: Text(
              station.stationName,
              style: const TextStyle(fontSize: 10, color: Colors.black),
            ),
          ),
        ));
      }
    }
  }

  ///
  void setDefaultBoundsMap() {
    final int currentPaddingIndex =
        ref.watch(appParamsControllerProvider.select((AppParamsControllerState value) => value.currentPaddingIndex));

    final LatLngBounds bounds = LatLngBounds.fromPoints(<LatLng>[LatLng(minLat, maxLng), LatLng(maxLat, minLng)]);

    final CameraFit cameraFit = CameraFit.bounds(bounds: bounds, padding: EdgeInsets.all(currentPaddingIndex * 10));

    mapController.fitCamera(cameraFit);

    /// これは残しておく
    // final LatLng newCenter = mapController.camera.center;

    final double newZoom = mapController.camera.zoom;

    setState(() => currentZoom = newZoom);

    ref.read(appParamsControllerProvider.notifier).setCurrentZoom(zoom: newZoom);

    getBoundsZoomValue = true;
  }
}
