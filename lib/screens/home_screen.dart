import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../controllers/controllers_mixin.dart';
import '../extensions/extensions.dart';
import '../models/stamp_rally_metro_20_model.dart';
import '../models/station_model.dart';
import '../utilities/tile_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with ControllersMixin<HomeScreen> {
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

    stampRallyMetro20ControllerNotifier.getAllStampRallyMetro20();

    stationControllerNotifier.getAllStation();

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
    makeMinMaxLatLng();

    makeMarker();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter: const LatLng(35.718532, 139.586639),
                initialZoom: currentZoomEightTeen,
                onPositionChanged: (MapCamera position, bool isMoving) {
                  if (isMoving) {
                    appParamNotifier.setCurrentZoom(zoom: position.zoom);
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
            if (isLoading) ...<Widget>[const Center(child: CircularProgressIndicator())],
          ],
        ),
      ),
    );
  }

  ///
  void makeMinMaxLatLng() {
    final List<double> latList = <double>[];
    final List<double> lngList = <double>[];

    for (final StampRallyMetro20Model element in stampRallyMetro20ControllerState.stampRallyMetro20List) {
      final StationModel? station = stationControllerState.stationMap[element.stationId];

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

    final Map<int, bool> map = <int, bool>{};

    for (final StampRallyMetro20Model element in stampRallyMetro20ControllerState.stampRallyMetro20List) {
      map[element.stationId] = false;

      final StationModel? station = stationControllerState.stationMap[element.stationId];

      if (station != null) {
        final String? stamp = appParamState.stationStampMap[element.stationId];

        final bool? flag = appParamState.stationStampFlagMap[element.stationId];

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

    // ignore: always_specify_types
    Future(() => appParamNotifier.setStationStampFlagMap(map: map));
  }

  ///
  void setDefaultBoundsMap() {
    final LatLngBounds bounds = LatLngBounds.fromPoints(<LatLng>[LatLng(minLat, maxLng), LatLng(maxLat, minLng)]);

    final CameraFit cameraFit =
        CameraFit.bounds(bounds: bounds, padding: EdgeInsets.all(appParamState.currentPaddingIndex * 10));

    mapController.fitCamera(cameraFit);

    /// これは残しておく
    // final LatLng newCenter = mapController.camera.center;

    final double newZoom = mapController.camera.zoom;

    setState(() => currentZoom = newZoom);

    appParamNotifier.setCurrentZoom(zoom: newZoom);

    getBoundsZoomValue = true;
  }
}
